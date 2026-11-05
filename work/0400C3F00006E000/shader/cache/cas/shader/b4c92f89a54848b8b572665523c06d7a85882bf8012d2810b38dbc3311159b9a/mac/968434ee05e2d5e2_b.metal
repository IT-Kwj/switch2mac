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
    float4 m_38 [[user(locn1)]];
    float4 m_36 [[user(locn3)]];
    float4 m_34 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_29 [[attribute(0)]];
    float4 m_31 [[attribute(1)]];
    float4 m_24 [[attribute(2)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _52 = in.m_24.x;
    float _54 = in.m_24.y;
    float _56 = in.m_24.z;
    float _58 = in.m_24.w;
    float _60 = as_type<float>(int(gl_VertexIndex));
    bool _64 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _66 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _68 = _64 || _66;
    bool _70 = isnan(8.0);
    bool _72 = _68 || _70;
    float _74 = in.m_29.x;
    float _76 = in.m_29.y;
    float _78 = in.m_29.z;
    float _80 = in.m_31.y;
    float _82 = in.m_31.x;
    float _84 = 0.0;
    if (!_72)
    {
        _84 = (*spvDescriptorSet0.vp_c4)._m0[1].y;
    }
    float _86 = _84;
    float _88 = in.m_29.w;
    float _90 = _86;
    if (!_72)
    {
        float _92 = _86 * 0.5;
        _90 = _92;
    }
    float _94 = _90;
    bool _96 = _56 > 2.0;
    float _98 = _58 * _58;
    bool _100 = _52 > 2.0;
    float _102 = in.m_31.z;
    float _104 = float(as_type<int>(_60));
    bool _106 = _94 < _104;
    bool _108 = !_72;
    bool _110 = _106 && _108;
    float _112 = _76 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _114 = _76 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _116 = _76 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _118 = _76 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _120 = _56;
    float _122 = _52;
    float _124 = _76;
    if (_96)
    {
        float _126 = _56 + (-10.0);
        _120 = _126;
    }
    float _128 = _120;
    float _130 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[10].x, _112);
    if (_100)
    {
        float _132 = _52 + (-10.0);
        _122 = _132;
    }
    float _134 = _122;
    float _136 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[11].x, _114);
    float _138 = fma(_128, _128, _98);
    float _140 = _54 * _54;
    float _142 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[12].x, _116);
    float _144 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[13].x, _118);
    float _146 = sqrt(_138);
    float _148 = fma(_134, _134, _140);
    if (!_110)
    {
        _124 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _150 = _124;
    float _152 = _150;
    if (_110)
    {
        float _154 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _152 = _154;
    }
    float _156 = _152;
    float _158 = _100 ? (-1.0) : 1.0;
    out.m_34.y = _80;
    float _160 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[10].z, _130);
    float _162 = -_156;
    float _164 = _162 + _104;
    float _166 = sqrt(_148);
    float _168 = _96 ? (-1.0) : 1.0;
    float _170 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[11].z, _136);
    out.m_34.x = _82;
    float _172 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[12].z, _142);
    float _174 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[13].z, _144);
    float _176 = _170 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _178 = -_146;
    float _180 = _178 + 1.0;
    float _182 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _184 = _172 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _186 = _160 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _188 = _168 * _180;
    float _190 = _58 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _192 = _174 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.m_34.z = _102;
    float _194 = -_166;
    float _196 = _194 + 1.0;
    float _198 = fma(_128, (*spvDescriptorSet0.vp_c3)._m0[15].x, _190);
    out.gl_Position.x = _186;
    out.gl_Position.y = _176;
    out.gl_Position.z = _184;
    out.gl_Position.w = _192;
    float _200 = _158 * _196;
    float _202 = _188 * _134;
    float _204 = fma(_188, (*spvDescriptorSet0.vp_c3)._m0[15].z, _198);
    float _206 = _200 * _58;
    float _208 = -_202;
    float _210 = fma(_200, _128, _208);
    float _212 = _54 * _128;
    float _214 = _164 * _182;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = -_206;
    float _220 = fma(_188, _54, _218);
    float _222 = _210 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _224 = -_212;
    float _226 = fma(_58, _134, _224);
    float _228 = _216 * _88;
    out.m_36.z = _204;
    float _230 = fma(_220, (*spvDescriptorSet0.vp_c3)._m0[15].x, _222);
    out.m_38.x = _228;
    float _232 = fma(_226, (*spvDescriptorSet0.vp_c3)._m0[15].z, _230);
    out.m_36.x = _232;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _52 = in.m_24.x;
    float _54 = in.m_24.y;
    float _56 = in.m_24.z;
    float _58 = in.m_24.w;
    float _60 = as_type<float>(int(gl_VertexIndex));
    bool _64 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _66 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _68 = _64 || _66;
    bool _70 = isnan(8.0);
    bool _72 = _68 || _70;
    float _74 = in.m_29.x;
    float _76 = in.m_29.y;
    float _78 = in.m_29.z;
    float _80 = in.m_31.y;
    float _82 = in.m_31.x;
    float _84 = 0.0;
    if (!_72)
    {
        _84 = (*spvDescriptorSet0.vp_c4)._m0[1].y;
    }
    float _86 = _84;
    float _88 = in.m_29.w;
    float _90 = _86;
    if (!_72)
    {
        float _92 = _86 * 0.5;
        _90 = _92;
    }
    float _94 = _90;
    bool _96 = _56 > 2.0;
    float _98 = _58 * _58;
    bool _100 = _52 > 2.0;
    float _102 = in.m_31.z;
    float _104 = float(as_type<int>(_60));
    bool _106 = _94 < _104;
    bool _108 = !_72;
    bool _110 = _106 && _108;
    float _112 = _76 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _114 = _76 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _116 = _76 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _118 = _76 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _120 = _56;
    float _122 = _52;
    float _124 = _76;
    if (_96)
    {
        float _126 = _56 + (-10.0);
        _120 = _126;
    }
    float _128 = _120;
    float _130 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[10].x, _112);
    if (_100)
    {
        float _132 = _52 + (-10.0);
        _122 = _132;
    }
    float _134 = _122;
    float _136 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[11].x, _114);
    float _138 = fma(_128, _128, _98);
    float _140 = _54 * _54;
    float _142 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[12].x, _116);
    float _144 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[13].x, _118);
    float _146 = sqrt(_138);
    float _148 = fma(_134, _134, _140);
    if (!_110)
    {
        _124 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _150 = _124;
    float _152 = _150;
    if (_110)
    {
        float _154 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _152 = _154;
    }
    float _156 = _152;
    float _158 = _100 ? (-1.0) : 1.0;
    out.m_34.y = _80;
    float _160 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[10].z, _130);
    float _162 = -_156;
    float _164 = _162 + _104;
    float _166 = sqrt(_148);
    float _168 = _96 ? (-1.0) : 1.0;
    float _170 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[11].z, _136);
    out.m_34.x = _82;
    float _172 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[12].z, _142);
    float _174 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[13].z, _144);
    float _176 = _170 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _178 = -_146;
    float _180 = _178 + 1.0;
    float _182 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _184 = _172 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _186 = _160 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _188 = _168 * _180;
    float _190 = _58 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _192 = _174 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.m_34.z = _102;
    float _194 = -_166;
    float _196 = _194 + 1.0;
    float _198 = fma(_128, (*spvDescriptorSet0.vp_c3)._m0[15].x, _190);
    out.gl_Position.x = _186;
    out.gl_Position.y = _176;
    out.gl_Position.z = _184;
    out.gl_Position.w = _192;
    float _200 = _158 * _196;
    float _202 = _188 * _134;
    float _204 = fma(_188, (*spvDescriptorSet0.vp_c3)._m0[15].z, _198);
    float _206 = _200 * _58;
    float _208 = -_202;
    float _210 = fma(_200, _128, _208);
    float _212 = _54 * _128;
    float _214 = _164 * _182;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = -_206;
    float _220 = fma(_188, _54, _218);
    float _222 = _210 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _224 = -_212;
    float _226 = fma(_58, _134, _224);
    float _228 = _216 * _88;
    out.m_36.z = _204;
    float _230 = fma(_220, (*spvDescriptorSet0.vp_c3)._m0[15].x, _222);
    out.m_38.x = _228;
    float _232 = fma(_226, (*spvDescriptorSet0.vp_c3)._m0[15].z, _230);
    out.m_36.x = _232;
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
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _52 = in.m_24.x;
    float _54 = in.m_24.y;
    float _56 = in.m_24.z;
    float _58 = in.m_24.w;
    float _60 = as_type<float>(int(gl_VertexIndex));
    bool _64 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _66 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _68 = _64 || _66;
    bool _70 = isnan(8.0);
    bool _72 = _68 || _70;
    float _74 = in.m_29.x;
    float _76 = in.m_29.y;
    float _78 = in.m_29.z;
    float _80 = in.m_31.y;
    float _82 = in.m_31.x;
    float _84 = 0.0;
    if (!_72)
    {
        _84 = (*spvDescriptorSet0.vp_c4)._m0[1].y;
    }
    float _86 = _84;
    float _88 = in.m_29.w;
    float _90 = _86;
    if (!_72)
    {
        float _92 = _86 * 0.5;
        _90 = _92;
    }
    float _94 = _90;
    bool _96 = _56 > 2.0;
    float _98 = _58 * _58;
    bool _100 = _52 > 2.0;
    float _102 = in.m_31.z;
    float _104 = float(as_type<int>(_60));
    bool _106 = _94 < _104;
    bool _108 = !_72;
    bool _110 = _106 && _108;
    float _112 = _76 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _114 = _76 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _116 = _76 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _118 = _76 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _120 = _56;
    float _122 = _52;
    float _124 = _76;
    if (_96)
    {
        float _126 = _56 + (-10.0);
        _120 = _126;
    }
    float _128 = _120;
    float _130 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[10].x, _112);
    if (_100)
    {
        float _132 = _52 + (-10.0);
        _122 = _132;
    }
    float _134 = _122;
    float _136 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[11].x, _114);
    float _138 = fma(_128, _128, _98);
    float _140 = _54 * _54;
    float _142 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[12].x, _116);
    float _144 = fma(_74, (*spvDescriptorSet0.vp_c3)._m0[13].x, _118);
    float _146 = sqrt(_138);
    float _148 = fma(_134, _134, _140);
    if (!_110)
    {
        _124 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _150 = _124;
    float _152 = _150;
    if (_110)
    {
        float _154 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _152 = _154;
    }
    float _156 = _152;
    float _158 = _100 ? (-1.0) : 1.0;
    out.m_34.y = _80;
    float _160 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[10].z, _130);
    float _162 = -_156;
    float _164 = _162 + _104;
    float _166 = sqrt(_148);
    float _168 = _96 ? (-1.0) : 1.0;
    float _170 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[11].z, _136);
    out.m_34.x = _82;
    float _172 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[12].z, _142);
    float _174 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[13].z, _144);
    float _176 = _170 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _178 = -_146;
    float _180 = _178 + 1.0;
    float _182 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _184 = _172 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _186 = _160 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _188 = _168 * _180;
    float _190 = _58 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _192 = _174 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.m_34.z = _102;
    float _194 = -_166;
    float _196 = _194 + 1.0;
    float _198 = fma(_128, (*spvDescriptorSet0.vp_c3)._m0[15].x, _190);
    out.gl_Position.x = _186;
    out.gl_Position.y = _176;
    out.gl_Position.z = _184;
    out.gl_Position.w = _192;
    float _200 = _158 * _196;
    float _202 = _188 * _134;
    float _204 = fma(_188, (*spvDescriptorSet0.vp_c3)._m0[15].z, _198);
    float _206 = _200 * _58;
    float _208 = -_202;
    float _210 = fma(_200, _128, _208);
    float _212 = _54 * _128;
    float _214 = _164 * _182;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = -_206;
    float _220 = fma(_188, _54, _218);
    float _222 = _210 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _224 = -_212;
    float _226 = fma(_58, _134, _224);
    float _228 = _216 * _88;
    out.m_36.z = _204;
    float _230 = fma(_220, (*spvDescriptorSet0.vp_c3)._m0[15].x, _222);
    out.m_38.x = _228;
    float _232 = fma(_226, (*spvDescriptorSet0.vp_c3)._m0[15].z, _230);
    out.m_36.x = _232;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

