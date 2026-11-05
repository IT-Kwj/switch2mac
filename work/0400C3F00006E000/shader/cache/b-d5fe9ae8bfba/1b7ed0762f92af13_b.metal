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
    float4 m_30 [[user(locn1)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_27 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_30 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _44 = as_type<float>(int(gl_VertexIndex));
    float _46 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _48 = in.m_27.x;
    float _50 = in.m_27.y;
    float _52 = in.m_27.z;
    bool _56 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _58 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _60 = _56 || _58;
    bool _62 = isnan(8.0);
    bool _64 = _60 || _62;
    float _66 = in.m_27.w;
    float _68 = 0.0;
    if (!_64)
    {
        _68 = (*spvDescriptorSet0.vp_c4)._m0[1].y;
    }
    float _70 = _68;
    float _72 = _70;
    if (!_64)
    {
        float _74 = _70 * 0.5;
        _72 = _74;
    }
    float _76 = _72;
    float _78 = float(as_type<int>(_44));
    bool _80 = _76 < _78;
    bool _82 = !_64;
    bool _84 = _80 && _82;
    float _86 = _50 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _88 = _50 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _90 = fma(_48, (*spvDescriptorSet0.vp_c3)._m0[11].x, _86);
    float _92 = fma(_48, (*spvDescriptorSet0.vp_c3)._m0[12].x, _88);
    float _94 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[12].z, _92);
    float _96 = _76;
    if (!_84)
    {
        _96 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _98 = _96;
    float _100 = _98;
    if (_84)
    {
        float _102 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _100 = _102;
    }
    float _104 = _100;
    float _106 = _50 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _108 = _50 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _110 = -_104;
    float _112 = _110 + _78;
    float _114 = fma(_48, (*spvDescriptorSet0.vp_c3)._m0[10].x, _106);
    float _116 = fma(_48, (*spvDescriptorSet0.vp_c3)._m0[13].x, _108);
    float _118 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[11].z, _90);
    float _120 = _112 * _46;
    float _122 = precise::clamp(_120, 0.0, 1.0);
    float _124 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[10].z, _114);
    float _126 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[13].z, _116);
    float _128 = _118 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _130 = _94 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _132 = _124 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _134 = _126 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _136 = _122 * _66;
    out.gl_Position.x = _132;
    out.gl_Position.y = _128;
    out.gl_Position.z = _130;
    out.gl_Position.w = _134;
    out.m_30.x = _136;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_30 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _44 = as_type<float>(int(gl_VertexIndex));
    float _46 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _48 = in.m_27.x;
    float _50 = in.m_27.y;
    float _52 = in.m_27.z;
    bool _56 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _58 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _60 = _56 || _58;
    bool _62 = isnan(8.0);
    bool _64 = _60 || _62;
    float _66 = in.m_27.w;
    float _68 = 0.0;
    if (!_64)
    {
        _68 = (*spvDescriptorSet0.vp_c4)._m0[1].y;
    }
    float _70 = _68;
    float _72 = _70;
    if (!_64)
    {
        float _74 = _70 * 0.5;
        _72 = _74;
    }
    float _76 = _72;
    float _78 = float(as_type<int>(_44));
    bool _80 = _76 < _78;
    bool _82 = !_64;
    bool _84 = _80 && _82;
    float _86 = _50 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _88 = _50 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _90 = fma(_48, (*spvDescriptorSet0.vp_c3)._m0[11].x, _86);
    float _92 = fma(_48, (*spvDescriptorSet0.vp_c3)._m0[12].x, _88);
    float _94 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[12].z, _92);
    float _96 = _76;
    if (!_84)
    {
        _96 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _98 = _96;
    float _100 = _98;
    if (_84)
    {
        float _102 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _100 = _102;
    }
    float _104 = _100;
    float _106 = _50 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _108 = _50 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _110 = -_104;
    float _112 = _110 + _78;
    float _114 = fma(_48, (*spvDescriptorSet0.vp_c3)._m0[10].x, _106);
    float _116 = fma(_48, (*spvDescriptorSet0.vp_c3)._m0[13].x, _108);
    float _118 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[11].z, _90);
    float _120 = _112 * _46;
    float _122 = precise::clamp(_120, 0.0, 1.0);
    float _124 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[10].z, _114);
    float _126 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[13].z, _116);
    float _128 = _118 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _130 = _94 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _132 = _124 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _134 = _126 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _136 = _122 * _66;
    out.gl_Position.x = _132;
    out.gl_Position.y = _128;
    out.gl_Position.z = _130;
    out.gl_Position.w = _134;
    out.m_30.x = _136;
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
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _44 = as_type<float>(int(gl_VertexIndex));
    float _46 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _48 = in.m_27.x;
    float _50 = in.m_27.y;
    float _52 = in.m_27.z;
    bool _56 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _58 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _60 = _56 || _58;
    bool _62 = isnan(8.0);
    bool _64 = _60 || _62;
    float _66 = in.m_27.w;
    float _68 = 0.0;
    if (!_64)
    {
        _68 = (*spvDescriptorSet0.vp_c4)._m0[1].y;
    }
    float _70 = _68;
    float _72 = _70;
    if (!_64)
    {
        float _74 = _70 * 0.5;
        _72 = _74;
    }
    float _76 = _72;
    float _78 = float(as_type<int>(_44));
    bool _80 = _76 < _78;
    bool _82 = !_64;
    bool _84 = _80 && _82;
    float _86 = _50 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _88 = _50 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _90 = fma(_48, (*spvDescriptorSet0.vp_c3)._m0[11].x, _86);
    float _92 = fma(_48, (*spvDescriptorSet0.vp_c3)._m0[12].x, _88);
    float _94 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[12].z, _92);
    float _96 = _76;
    if (!_84)
    {
        _96 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _98 = _96;
    float _100 = _98;
    if (_84)
    {
        float _102 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _100 = _102;
    }
    float _104 = _100;
    float _106 = _50 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _108 = _50 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _110 = -_104;
    float _112 = _110 + _78;
    float _114 = fma(_48, (*spvDescriptorSet0.vp_c3)._m0[10].x, _106);
    float _116 = fma(_48, (*spvDescriptorSet0.vp_c3)._m0[13].x, _108);
    float _118 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[11].z, _90);
    float _120 = _112 * _46;
    float _122 = precise::clamp(_120, 0.0, 1.0);
    float _124 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[10].z, _114);
    float _126 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[13].z, _116);
    float _128 = _118 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _130 = _94 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _132 = _124 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _134 = _126 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _136 = _122 * _66;
    out.gl_Position.x = _132;
    out.gl_Position.y = _128;
    out.gl_Position.z = _130;
    out.gl_Position.w = _134;
    out.m_30.x = _136;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_30.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_30.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_30.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_30.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

