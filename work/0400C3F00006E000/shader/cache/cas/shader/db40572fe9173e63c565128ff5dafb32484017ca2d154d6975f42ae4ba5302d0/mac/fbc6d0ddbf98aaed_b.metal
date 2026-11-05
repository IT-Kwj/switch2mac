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
    float4 m_38 [[user(locn0)]];
    float4 m_34 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 m_36 [[user(locn4)]];
    float4 m_42 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_31 [[attribute(0)]];
    float4 m_29 [[attribute(1)]];
    float4 m_24 [[attribute(2)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_24.x;
    float _60 = in.m_24.y;
    float _62 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _64 = as_type<float>(int(gl_VertexIndex));
    bool _68 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _70 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _72 = _68 || _70;
    bool _74 = isnan(8.0);
    bool _76 = _72 || _74;
    float _78 = in.m_29.z;
    float _80 = in.m_31.x;
    float _82 = in.m_31.y;
    float _84 = in.m_31.z;
    float _86 = in.m_29.x;
    float _88 = 0.0;
    if (!_76)
    {
        float _90 = 0.5 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _88 = _90;
    }
    float _92 = _88;
    float _94 = in.m_29.y;
    bool _96 = _58 > 2.0;
    float _98 = _60 * _60;
    float _100 = in.m_31.w;
    float _102 = float(as_type<int>(_64));
    out.m_34.z = (*spvDescriptorSet0.vp_c4)._m0[0].z;
    out.m_34.w = (*spvDescriptorSet0.vp_c4)._m0[0].w;
    bool _104 = _92 < _102;
    bool _106 = !_76;
    bool _108 = _104 && _106;
    out.m_36.z = _78;
    float _110 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].x, _82);
    float _112 = _58;
    float _114 = _80;
    if (_96)
    {
        float _116 = _58 + (-10.0);
        _112 = _116;
    }
    float _118 = _112;
    float _120 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].y, _82);
    out.m_36.x = _86;
    float _122 = fma(_118, _118, _98);
    float _124 = _82 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _126 = _110 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    out.m_36.y = _94;
    float _128 = sqrt(_122);
    float _130 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[13].x, _124);
    float _132 = _120 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _134 = _82 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _136 = fma(_84, (*spvDescriptorSet0.vp_c3)._m0[13].z, _130);
    float _138 = _82 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _140 = _82 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _142 = _136 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _144 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[10].x, _134);
    float _146 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[11].x, _138);
    float _148 = fma(_118, (*spvDescriptorSet0.vp_c4)._m0[0].x, _80);
    float _150 = fma(_118, (*spvDescriptorSet0.vp_c4)._m0[0].y, _80);
    float _152 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[12].x, _140);
    float _154 = 1.0 / _142;
    float _156 = _96 ? (-1.0) : 1.0;
    float _158 = -_128;
    float _160 = _158 + 1.0;
    if (!_108)
    {
        _114 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _162 = _114;
    float _164 = _162;
    if (_108)
    {
        float _166 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _164 = _166;
    }
    float _168 = _164;
    float _170 = fma(_84, (*spvDescriptorSet0.vp_c3)._m0[11].z, _146);
    float _172 = _156 * _160;
    float _174 = fma(_84, (*spvDescriptorSet0.vp_c3)._m0[12].z, _152);
    float _176 = -_168;
    float _178 = _176 + _102;
    float _180 = fma(_84, (*spvDescriptorSet0.vp_c3)._m0[10].z, _144);
    float _182 = fma(_172, (*spvDescriptorSet0.vp_c4)._m0[0].x, _84);
    float _184 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[13].x, _126);
    float _186 = fma(_172, (*spvDescriptorSet0.vp_c4)._m0[0].y, _84);
    float _188 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[13].x, _132);
    float _190 = _180 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _192 = _170 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _194 = fma(_182, (*spvDescriptorSet0.vp_c3)._m0[13].z, _184);
    float _196 = _178 * _62;
    float _198 = precise::clamp(_196, 0.0, 1.0);
    float _200 = _190 * _154;
    float _202 = _192 * _154;
    float _204 = fma(_186, (*spvDescriptorSet0.vp_c3)._m0[13].z, _188);
    float _206 = _174 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _208 = fma(_200, 0.5, 0.5);
    float _210 = fma(_202, -0.5, 0.5);
    float _212 = _198 * _100;
    float _214 = _194 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _216 = _204 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.gl_Position.x = _190;
    out.gl_Position.y = _192;
    out.gl_Position.z = _206;
    out.gl_Position.w = _142;
    out.m_38.x = _208;
    out.m_38.y = _210;
    out.m_40.x = _212;
    out.m_42.w = _214;
    out.m_44.w = _216;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_24.x;
    float _60 = in.m_24.y;
    float _62 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _64 = as_type<float>(int(gl_VertexIndex));
    bool _68 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _70 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _72 = _68 || _70;
    bool _74 = isnan(8.0);
    bool _76 = _72 || _74;
    float _78 = in.m_29.z;
    float _80 = in.m_31.x;
    float _82 = in.m_31.y;
    float _84 = in.m_31.z;
    float _86 = in.m_29.x;
    float _88 = 0.0;
    if (!_76)
    {
        float _90 = 0.5 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _88 = _90;
    }
    float _92 = _88;
    float _94 = in.m_29.y;
    bool _96 = _58 > 2.0;
    float _98 = _60 * _60;
    float _100 = in.m_31.w;
    float _102 = float(as_type<int>(_64));
    out.m_34.z = (*spvDescriptorSet0.vp_c4)._m0[0].z;
    out.m_34.w = (*spvDescriptorSet0.vp_c4)._m0[0].w;
    bool _104 = _92 < _102;
    bool _106 = !_76;
    bool _108 = _104 && _106;
    out.m_36.z = _78;
    float _110 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].x, _82);
    float _112 = _58;
    float _114 = _80;
    if (_96)
    {
        float _116 = _58 + (-10.0);
        _112 = _116;
    }
    float _118 = _112;
    float _120 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].y, _82);
    out.m_36.x = _86;
    float _122 = fma(_118, _118, _98);
    float _124 = _82 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _126 = _110 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    out.m_36.y = _94;
    float _128 = sqrt(_122);
    float _130 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[13].x, _124);
    float _132 = _120 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _134 = _82 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _136 = fma(_84, (*spvDescriptorSet0.vp_c3)._m0[13].z, _130);
    float _138 = _82 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _140 = _82 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _142 = _136 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _144 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[10].x, _134);
    float _146 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[11].x, _138);
    float _148 = fma(_118, (*spvDescriptorSet0.vp_c4)._m0[0].x, _80);
    float _150 = fma(_118, (*spvDescriptorSet0.vp_c4)._m0[0].y, _80);
    float _152 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[12].x, _140);
    float _154 = 1.0 / _142;
    float _156 = _96 ? (-1.0) : 1.0;
    float _158 = -_128;
    float _160 = _158 + 1.0;
    if (!_108)
    {
        _114 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _162 = _114;
    float _164 = _162;
    if (_108)
    {
        float _166 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _164 = _166;
    }
    float _168 = _164;
    float _170 = fma(_84, (*spvDescriptorSet0.vp_c3)._m0[11].z, _146);
    float _172 = _156 * _160;
    float _174 = fma(_84, (*spvDescriptorSet0.vp_c3)._m0[12].z, _152);
    float _176 = -_168;
    float _178 = _176 + _102;
    float _180 = fma(_84, (*spvDescriptorSet0.vp_c3)._m0[10].z, _144);
    float _182 = fma(_172, (*spvDescriptorSet0.vp_c4)._m0[0].x, _84);
    float _184 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[13].x, _126);
    float _186 = fma(_172, (*spvDescriptorSet0.vp_c4)._m0[0].y, _84);
    float _188 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[13].x, _132);
    float _190 = _180 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _192 = _170 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _194 = fma(_182, (*spvDescriptorSet0.vp_c3)._m0[13].z, _184);
    float _196 = _178 * _62;
    float _198 = precise::clamp(_196, 0.0, 1.0);
    float _200 = _190 * _154;
    float _202 = _192 * _154;
    float _204 = fma(_186, (*spvDescriptorSet0.vp_c3)._m0[13].z, _188);
    float _206 = _174 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _208 = fma(_200, 0.5, 0.5);
    float _210 = fma(_202, -0.5, 0.5);
    float _212 = _198 * _100;
    float _214 = _194 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _216 = _204 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.gl_Position.x = _190;
    out.gl_Position.y = _192;
    out.gl_Position.z = _206;
    out.gl_Position.w = _142;
    out.m_38.x = _208;
    out.m_38.y = _210;
    out.m_40.x = _212;
    out.m_42.w = _214;
    out.m_44.w = _216;
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
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_24.x;
    float _60 = in.m_24.y;
    float _62 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _64 = as_type<float>(int(gl_VertexIndex));
    bool _68 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _70 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _72 = _68 || _70;
    bool _74 = isnan(8.0);
    bool _76 = _72 || _74;
    float _78 = in.m_29.z;
    float _80 = in.m_31.x;
    float _82 = in.m_31.y;
    float _84 = in.m_31.z;
    float _86 = in.m_29.x;
    float _88 = 0.0;
    if (!_76)
    {
        float _90 = 0.5 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _88 = _90;
    }
    float _92 = _88;
    float _94 = in.m_29.y;
    bool _96 = _58 > 2.0;
    float _98 = _60 * _60;
    float _100 = in.m_31.w;
    float _102 = float(as_type<int>(_64));
    out.m_34.z = (*spvDescriptorSet0.vp_c4)._m0[0].z;
    out.m_34.w = (*spvDescriptorSet0.vp_c4)._m0[0].w;
    bool _104 = _92 < _102;
    bool _106 = !_76;
    bool _108 = _104 && _106;
    out.m_36.z = _78;
    float _110 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].x, _82);
    float _112 = _58;
    float _114 = _80;
    if (_96)
    {
        float _116 = _58 + (-10.0);
        _112 = _116;
    }
    float _118 = _112;
    float _120 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].y, _82);
    out.m_36.x = _86;
    float _122 = fma(_118, _118, _98);
    float _124 = _82 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _126 = _110 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    out.m_36.y = _94;
    float _128 = sqrt(_122);
    float _130 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[13].x, _124);
    float _132 = _120 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _134 = _82 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _136 = fma(_84, (*spvDescriptorSet0.vp_c3)._m0[13].z, _130);
    float _138 = _82 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _140 = _82 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _142 = _136 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _144 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[10].x, _134);
    float _146 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[11].x, _138);
    float _148 = fma(_118, (*spvDescriptorSet0.vp_c4)._m0[0].x, _80);
    float _150 = fma(_118, (*spvDescriptorSet0.vp_c4)._m0[0].y, _80);
    float _152 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[12].x, _140);
    float _154 = 1.0 / _142;
    float _156 = _96 ? (-1.0) : 1.0;
    float _158 = -_128;
    float _160 = _158 + 1.0;
    if (!_108)
    {
        _114 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _162 = _114;
    float _164 = _162;
    if (_108)
    {
        float _166 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _164 = _166;
    }
    float _168 = _164;
    float _170 = fma(_84, (*spvDescriptorSet0.vp_c3)._m0[11].z, _146);
    float _172 = _156 * _160;
    float _174 = fma(_84, (*spvDescriptorSet0.vp_c3)._m0[12].z, _152);
    float _176 = -_168;
    float _178 = _176 + _102;
    float _180 = fma(_84, (*spvDescriptorSet0.vp_c3)._m0[10].z, _144);
    float _182 = fma(_172, (*spvDescriptorSet0.vp_c4)._m0[0].x, _84);
    float _184 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[13].x, _126);
    float _186 = fma(_172, (*spvDescriptorSet0.vp_c4)._m0[0].y, _84);
    float _188 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[13].x, _132);
    float _190 = _180 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _192 = _170 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _194 = fma(_182, (*spvDescriptorSet0.vp_c3)._m0[13].z, _184);
    float _196 = _178 * _62;
    float _198 = precise::clamp(_196, 0.0, 1.0);
    float _200 = _190 * _154;
    float _202 = _192 * _154;
    float _204 = fma(_186, (*spvDescriptorSet0.vp_c3)._m0[13].z, _188);
    float _206 = _174 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _208 = fma(_200, 0.5, 0.5);
    float _210 = fma(_202, -0.5, 0.5);
    float _212 = _198 * _100;
    float _214 = _194 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _216 = _204 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.gl_Position.x = _190;
    out.gl_Position.y = _192;
    out.gl_Position.z = _206;
    out.gl_Position.w = _142;
    out.m_38.x = _208;
    out.m_38.y = _210;
    out.m_40.x = _212;
    out.m_42.w = _214;
    out.m_44.w = _216;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

