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
    float4 m_34 [[user(locn0)]];
    float4 m_32 [[user(locn1)]];
    float4 m_36 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
    float4 m_38 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_29 [[attribute(0)]];
    float4 m_24 [[attribute(2)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = in.m_24.x;
    float _56 = in.m_24.y;
    float _58 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _60 = as_type<float>(int(gl_VertexIndex));
    bool _64 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _66 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _68 = _64 || _66;
    bool _70 = isnan(8.0);
    bool _72 = _68 || _70;
    float _74 = in.m_29.x;
    float _76 = in.m_29.y;
    float _78 = in.m_29.z;
    float _80 = in.m_29.w;
    out.m_32.z = (*spvDescriptorSet0.vp_c4)._m0[0].z;
    out.m_32.w = (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _82 = 0.0;
    if (!_72)
    {
        float _84 = 0.5 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _82 = _84;
    }
    float _86 = _82;
    bool _88 = _54 > 2.0;
    float _90 = _56 * _56;
    float _92 = float(as_type<int>(_60));
    float _94 = _76 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    bool _96 = _86 < _92;
    bool _98 = !_72;
    bool _100 = _96 && _98;
    float _102 = _76 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _104 = _76 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _106 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[13].x, _94);
    float _108 = _54;
    float _110 = _74;
    if (_88)
    {
        float _112 = _54 + (-10.0);
        _108 = _112;
    }
    float _114 = _108;
    float _116 = fma(_56, (*spvDescriptorSet0.vp_c4)._m0[0].x, _76);
    float _118 = fma(_56, (*spvDescriptorSet0.vp_c4)._m0[0].y, _76);
    float _120 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[13].z, _106);
    float _122 = fma(_114, _114, _90);
    float _124 = _76 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _126 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[10].x, _102);
    float _128 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[11].x, _104);
    float _130 = sqrt(_122);
    float _132 = fma(_114, (*spvDescriptorSet0.vp_c4)._m0[0].x, _74);
    float _134 = fma(_114, (*spvDescriptorSet0.vp_c4)._m0[0].y, _74);
    float _136 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[12].x, _124);
    float _138 = _88 ? (-1.0) : 1.0;
    float _140 = _116 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    if (!_100)
    {
        _110 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _142 = _110;
    float _144 = _142;
    if (_100)
    {
        float _146 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _144 = _146;
    }
    float _148 = _144;
    float _150 = _118 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _152 = _120 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _154 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[11].z, _128);
    float _156 = -_148;
    float _158 = _156 + _92;
    float _160 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[10].z, _126);
    float _162 = 1.0 / _152;
    float _164 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[12].z, _136);
    float _166 = fma(_132, (*spvDescriptorSet0.vp_c3)._m0[13].x, _140);
    float _168 = -_130;
    float _170 = _168 + 1.0;
    float _172 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[13].x, _150);
    float _174 = _160 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _176 = _158 * _58;
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = _138 * _170;
    float _182 = _178 * _80;
    float _184 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[0].x, _78);
    float _186 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[0].y, _78);
    float _188 = _154 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _190 = fma(_184, (*spvDescriptorSet0.vp_c3)._m0[13].z, _166);
    float _192 = _174 * _162;
    float _194 = _188 * _162;
    float _196 = fma(_186, (*spvDescriptorSet0.vp_c3)._m0[13].z, _172);
    float _198 = _164 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _200 = fma(_192, 0.5, 0.5);
    float _202 = fma(_194, -0.5, 0.5);
    float _204 = _190 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _206 = _196 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.gl_Position.x = _174;
    out.gl_Position.y = _188;
    out.gl_Position.z = _198;
    out.gl_Position.w = _152;
    out.m_34.x = _200;
    out.m_34.y = _202;
    out.m_36.x = _182;
    out.m_38.w = _204;
    out.m_40.w = _206;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = in.m_24.x;
    float _56 = in.m_24.y;
    float _58 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _60 = as_type<float>(int(gl_VertexIndex));
    bool _64 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _66 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _68 = _64 || _66;
    bool _70 = isnan(8.0);
    bool _72 = _68 || _70;
    float _74 = in.m_29.x;
    float _76 = in.m_29.y;
    float _78 = in.m_29.z;
    float _80 = in.m_29.w;
    out.m_32.z = (*spvDescriptorSet0.vp_c4)._m0[0].z;
    out.m_32.w = (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _82 = 0.0;
    if (!_72)
    {
        float _84 = 0.5 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _82 = _84;
    }
    float _86 = _82;
    bool _88 = _54 > 2.0;
    float _90 = _56 * _56;
    float _92 = float(as_type<int>(_60));
    float _94 = _76 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    bool _96 = _86 < _92;
    bool _98 = !_72;
    bool _100 = _96 && _98;
    float _102 = _76 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _104 = _76 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _106 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[13].x, _94);
    float _108 = _54;
    float _110 = _74;
    if (_88)
    {
        float _112 = _54 + (-10.0);
        _108 = _112;
    }
    float _114 = _108;
    float _116 = fma(_56, (*spvDescriptorSet0.vp_c4)._m0[0].x, _76);
    float _118 = fma(_56, (*spvDescriptorSet0.vp_c4)._m0[0].y, _76);
    float _120 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[13].z, _106);
    float _122 = fma(_114, _114, _90);
    float _124 = _76 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _126 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[10].x, _102);
    float _128 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[11].x, _104);
    float _130 = sqrt(_122);
    float _132 = fma(_114, (*spvDescriptorSet0.vp_c4)._m0[0].x, _74);
    float _134 = fma(_114, (*spvDescriptorSet0.vp_c4)._m0[0].y, _74);
    float _136 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[12].x, _124);
    float _138 = _88 ? (-1.0) : 1.0;
    float _140 = _116 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    if (!_100)
    {
        _110 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _142 = _110;
    float _144 = _142;
    if (_100)
    {
        float _146 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _144 = _146;
    }
    float _148 = _144;
    float _150 = _118 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _152 = _120 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _154 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[11].z, _128);
    float _156 = -_148;
    float _158 = _156 + _92;
    float _160 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[10].z, _126);
    float _162 = 1.0 / _152;
    float _164 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[12].z, _136);
    float _166 = fma(_132, (*spvDescriptorSet0.vp_c3)._m0[13].x, _140);
    float _168 = -_130;
    float _170 = _168 + 1.0;
    float _172 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[13].x, _150);
    float _174 = _160 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _176 = _158 * _58;
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = _138 * _170;
    float _182 = _178 * _80;
    float _184 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[0].x, _78);
    float _186 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[0].y, _78);
    float _188 = _154 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _190 = fma(_184, (*spvDescriptorSet0.vp_c3)._m0[13].z, _166);
    float _192 = _174 * _162;
    float _194 = _188 * _162;
    float _196 = fma(_186, (*spvDescriptorSet0.vp_c3)._m0[13].z, _172);
    float _198 = _164 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _200 = fma(_192, 0.5, 0.5);
    float _202 = fma(_194, -0.5, 0.5);
    float _204 = _190 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _206 = _196 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.gl_Position.x = _174;
    out.gl_Position.y = _188;
    out.gl_Position.z = _198;
    out.gl_Position.w = _152;
    out.m_34.x = _200;
    out.m_34.y = _202;
    out.m_36.x = _182;
    out.m_38.w = _204;
    out.m_40.w = _206;
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
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = in.m_24.x;
    float _56 = in.m_24.y;
    float _58 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _60 = as_type<float>(int(gl_VertexIndex));
    bool _64 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _66 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _68 = _64 || _66;
    bool _70 = isnan(8.0);
    bool _72 = _68 || _70;
    float _74 = in.m_29.x;
    float _76 = in.m_29.y;
    float _78 = in.m_29.z;
    float _80 = in.m_29.w;
    out.m_32.z = (*spvDescriptorSet0.vp_c4)._m0[0].z;
    out.m_32.w = (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _82 = 0.0;
    if (!_72)
    {
        float _84 = 0.5 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _82 = _84;
    }
    float _86 = _82;
    bool _88 = _54 > 2.0;
    float _90 = _56 * _56;
    float _92 = float(as_type<int>(_60));
    float _94 = _76 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    bool _96 = _86 < _92;
    bool _98 = !_72;
    bool _100 = _96 && _98;
    float _102 = _76 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _104 = _76 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _106 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[13].x, _94);
    float _108 = _54;
    float _110 = _74;
    if (_88)
    {
        float _112 = _54 + (-10.0);
        _108 = _112;
    }
    float _114 = _108;
    float _116 = fma(_56, (*spvDescriptorSet0.vp_c4)._m0[0].x, _76);
    float _118 = fma(_56, (*spvDescriptorSet0.vp_c4)._m0[0].y, _76);
    float _120 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[13].z, _106);
    float _122 = fma(_114, _114, _90);
    float _124 = _76 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _126 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[10].x, _102);
    float _128 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[11].x, _104);
    float _130 = sqrt(_122);
    float _132 = fma(_114, (*spvDescriptorSet0.vp_c4)._m0[0].x, _74);
    float _134 = fma(_114, (*spvDescriptorSet0.vp_c4)._m0[0].y, _74);
    float _136 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[12].x, _124);
    float _138 = _88 ? (-1.0) : 1.0;
    float _140 = _116 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    if (!_100)
    {
        _110 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _142 = _110;
    float _144 = _142;
    if (_100)
    {
        float _146 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _144 = _146;
    }
    float _148 = _144;
    float _150 = _118 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _152 = _120 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _154 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[11].z, _128);
    float _156 = -_148;
    float _158 = _156 + _92;
    float _160 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[10].z, _126);
    float _162 = 1.0 / _152;
    float _164 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[12].z, _136);
    float _166 = fma(_132, (*spvDescriptorSet0.vp_c3)._m0[13].x, _140);
    float _168 = -_130;
    float _170 = _168 + 1.0;
    float _172 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[13].x, _150);
    float _174 = _160 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _176 = _158 * _58;
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = _138 * _170;
    float _182 = _178 * _80;
    float _184 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[0].x, _78);
    float _186 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[0].y, _78);
    float _188 = _154 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _190 = fma(_184, (*spvDescriptorSet0.vp_c3)._m0[13].z, _166);
    float _192 = _174 * _162;
    float _194 = _188 * _162;
    float _196 = fma(_186, (*spvDescriptorSet0.vp_c3)._m0[13].z, _172);
    float _198 = _164 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _200 = fma(_192, 0.5, 0.5);
    float _202 = fma(_194, -0.5, 0.5);
    float _204 = _190 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _206 = _196 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.gl_Position.x = _174;
    out.gl_Position.y = _188;
    out.gl_Position.z = _198;
    out.gl_Position.w = _152;
    out.m_34.x = _200;
    out.m_34.y = _202;
    out.m_36.x = _182;
    out.m_38.w = _204;
    out.m_40.w = _206;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_32.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_32.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_32.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_32.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

