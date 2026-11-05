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
    float4 m_42 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 m_40 [[user(locn4)]];
    float4 m_36 [[user(locn5)]];
    float4 m_44 [[user(locn7)]];
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
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_24.x;
    float _62 = in.m_24.y;
    float _64 = in.m_24.z;
    float _66 = in.m_24.w;
    float _68 = as_type<float>(int(gl_VertexIndex));
    bool _72 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _74 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _76 = _72 || _74;
    bool _78 = isnan(8.0);
    bool _80 = _76 || _78;
    float _82 = in.m_29.x;
    float _84 = in.m_29.y;
    float _86 = in.m_29.z;
    float _88 = in.m_31.x;
    float _90 = in.m_31.y;
    float _92 = 0.0;
    if (!_80)
    {
        float _94 = 0.5 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _92 = _94;
    }
    float _96 = _92;
    float _98 = in.m_31.z;
    bool _100 = _60 > 2.0;
    float _102 = _62 * _62;
    bool _104 = _64 > 2.0;
    float _106 = in.m_29.w;
    float _108 = float(as_type<int>(_68));
    out.m_34.z = (*spvDescriptorSet0.vp_c4)._m0[0].z;
    out.m_34.w = (*spvDescriptorSet0.vp_c4)._m0[0].w;
    bool _110 = _96 < _108;
    bool _112 = !_80;
    bool _114 = _110 && _112;
    float _116 = _84 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _118 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[0].x, _84);
    float _120 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[0].y, _84);
    float _122 = _84 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _124 = _60;
    float _126 = _64;
    if (_100)
    {
        float _128 = _60 + (-10.0);
        _124 = _128;
    }
    float _130 = _124;
    float _132 = _84 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _134 = _84 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _136 = _66 * _66;
    if (_104)
    {
        float _138 = _64 + (-10.0);
        _126 = _138;
    }
    float _140 = _126;
    float _142 = fma(_130, _130, _102);
    float _144 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[13].x, _116);
    float _146 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[11].x, _132);
    float _148 = fma(_140, _140, _136);
    out.m_36.x = _88;
    float _150 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[10].x, _122);
    float _152 = fma(_86, (*spvDescriptorSet0.vp_c3)._m0[13].z, _144);
    float _154 = _118 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _156 = sqrt(_148);
    float _158 = fma(_86, (*spvDescriptorSet0.vp_c3)._m0[11].z, _146);
    float _160 = fma(_86, (*spvDescriptorSet0.vp_c3)._m0[10].z, _150);
    float _162 = _152 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.m_36.y = _90;
    float _164 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[12].x, _134);
    float _166 = _120 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _168 = sqrt(_142);
    float _170 = fma(_86, (*spvDescriptorSet0.vp_c3)._m0[12].z, _164);
    float _172 = _100 ? (-1.0) : 1.0;
    float _174 = _160 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _176 = fma(_130, (*spvDescriptorSet0.vp_c4)._m0[0].x, _82);
    float _178 = fma(_130, (*spvDescriptorSet0.vp_c4)._m0[0].y, _82);
    float _180 = _170 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    out.m_36.z = _98;
    float _182 = fma(_176, (*spvDescriptorSet0.vp_c3)._m0[13].x, _154);
    float _184 = _158 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _186 = fma(_178, (*spvDescriptorSet0.vp_c3)._m0[13].x, _166);
    float _188 = 1.0 / _162;
    float _190 = _178;
    if (!_114)
    {
        _190 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _192 = _190;
    float _194 = _192;
    if (_114)
    {
        float _196 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _194 = _196;
    }
    float _198 = _194;
    out.gl_Position.x = _174;
    out.gl_Position.y = _184;
    out.gl_Position.z = _180;
    out.gl_Position.w = _162;
    float _200 = -_168;
    float _202 = _200 + 1.0;
    float _204 = _104 ? (-1.0) : 1.0;
    float _206 = -_156;
    float _208 = _206 + 1.0;
    float _210 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _212 = _172 * _202;
    float _214 = _62 * _140;
    float _216 = _204 * _208;
    float _218 = -_198;
    float _220 = _218 + _108;
    float _222 = _212 * _66;
    float _224 = -_214;
    float _226 = fma(_66, _130, _224);
    float _228 = _174 * _188;
    float _230 = _184 * _188;
    float _232 = _216 * _130;
    float _234 = _66 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _236 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[0].x, _86);
    float _238 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[0].y, _86);
    float _240 = -_232;
    float _242 = fma(_212, _140, _240);
    float _244 = -_222;
    float _246 = fma(_216, _62, _244);
    float _248 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[15].x, _234);
    float _250 = _220 * _210;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = _242 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _256 = fma(_236, (*spvDescriptorSet0.vp_c3)._m0[13].z, _182);
    float _258 = fma(_238, (*spvDescriptorSet0.vp_c3)._m0[13].z, _186);
    float _260 = fma(_228, 0.5, 0.5);
    float _262 = fma(_246, (*spvDescriptorSet0.vp_c3)._m0[15].x, _254);
    float _264 = fma(_230, -0.5, 0.5);
    float _266 = fma(_216, (*spvDescriptorSet0.vp_c3)._m0[15].z, _248);
    float _268 = _252 * _106;
    float _270 = _256 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _272 = _258 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _274 = fma(_226, (*spvDescriptorSet0.vp_c3)._m0[15].z, _262);
    out.m_38.x = _260;
    out.m_38.y = _264;
    out.m_40.z = _266;
    out.m_42.x = _268;
    out.m_44.w = _270;
    out.m_46.w = _272;
    out.m_40.x = _274;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_24.x;
    float _62 = in.m_24.y;
    float _64 = in.m_24.z;
    float _66 = in.m_24.w;
    float _68 = as_type<float>(int(gl_VertexIndex));
    bool _72 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _74 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _76 = _72 || _74;
    bool _78 = isnan(8.0);
    bool _80 = _76 || _78;
    float _82 = in.m_29.x;
    float _84 = in.m_29.y;
    float _86 = in.m_29.z;
    float _88 = in.m_31.x;
    float _90 = in.m_31.y;
    float _92 = 0.0;
    if (!_80)
    {
        float _94 = 0.5 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _92 = _94;
    }
    float _96 = _92;
    float _98 = in.m_31.z;
    bool _100 = _60 > 2.0;
    float _102 = _62 * _62;
    bool _104 = _64 > 2.0;
    float _106 = in.m_29.w;
    float _108 = float(as_type<int>(_68));
    out.m_34.z = (*spvDescriptorSet0.vp_c4)._m0[0].z;
    out.m_34.w = (*spvDescriptorSet0.vp_c4)._m0[0].w;
    bool _110 = _96 < _108;
    bool _112 = !_80;
    bool _114 = _110 && _112;
    float _116 = _84 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _118 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[0].x, _84);
    float _120 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[0].y, _84);
    float _122 = _84 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _124 = _60;
    float _126 = _64;
    if (_100)
    {
        float _128 = _60 + (-10.0);
        _124 = _128;
    }
    float _130 = _124;
    float _132 = _84 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _134 = _84 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _136 = _66 * _66;
    if (_104)
    {
        float _138 = _64 + (-10.0);
        _126 = _138;
    }
    float _140 = _126;
    float _142 = fma(_130, _130, _102);
    float _144 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[13].x, _116);
    float _146 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[11].x, _132);
    float _148 = fma(_140, _140, _136);
    out.m_36.x = _88;
    float _150 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[10].x, _122);
    float _152 = fma(_86, (*spvDescriptorSet0.vp_c3)._m0[13].z, _144);
    float _154 = _118 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _156 = sqrt(_148);
    float _158 = fma(_86, (*spvDescriptorSet0.vp_c3)._m0[11].z, _146);
    float _160 = fma(_86, (*spvDescriptorSet0.vp_c3)._m0[10].z, _150);
    float _162 = _152 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.m_36.y = _90;
    float _164 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[12].x, _134);
    float _166 = _120 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _168 = sqrt(_142);
    float _170 = fma(_86, (*spvDescriptorSet0.vp_c3)._m0[12].z, _164);
    float _172 = _100 ? (-1.0) : 1.0;
    float _174 = _160 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _176 = fma(_130, (*spvDescriptorSet0.vp_c4)._m0[0].x, _82);
    float _178 = fma(_130, (*spvDescriptorSet0.vp_c4)._m0[0].y, _82);
    float _180 = _170 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    out.m_36.z = _98;
    float _182 = fma(_176, (*spvDescriptorSet0.vp_c3)._m0[13].x, _154);
    float _184 = _158 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _186 = fma(_178, (*spvDescriptorSet0.vp_c3)._m0[13].x, _166);
    float _188 = 1.0 / _162;
    float _190 = _178;
    if (!_114)
    {
        _190 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _192 = _190;
    float _194 = _192;
    if (_114)
    {
        float _196 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _194 = _196;
    }
    float _198 = _194;
    out.gl_Position.x = _174;
    out.gl_Position.y = _184;
    out.gl_Position.z = _180;
    out.gl_Position.w = _162;
    float _200 = -_168;
    float _202 = _200 + 1.0;
    float _204 = _104 ? (-1.0) : 1.0;
    float _206 = -_156;
    float _208 = _206 + 1.0;
    float _210 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _212 = _172 * _202;
    float _214 = _62 * _140;
    float _216 = _204 * _208;
    float _218 = -_198;
    float _220 = _218 + _108;
    float _222 = _212 * _66;
    float _224 = -_214;
    float _226 = fma(_66, _130, _224);
    float _228 = _174 * _188;
    float _230 = _184 * _188;
    float _232 = _216 * _130;
    float _234 = _66 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _236 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[0].x, _86);
    float _238 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[0].y, _86);
    float _240 = -_232;
    float _242 = fma(_212, _140, _240);
    float _244 = -_222;
    float _246 = fma(_216, _62, _244);
    float _248 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[15].x, _234);
    float _250 = _220 * _210;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = _242 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _256 = fma(_236, (*spvDescriptorSet0.vp_c3)._m0[13].z, _182);
    float _258 = fma(_238, (*spvDescriptorSet0.vp_c3)._m0[13].z, _186);
    float _260 = fma(_228, 0.5, 0.5);
    float _262 = fma(_246, (*spvDescriptorSet0.vp_c3)._m0[15].x, _254);
    float _264 = fma(_230, -0.5, 0.5);
    float _266 = fma(_216, (*spvDescriptorSet0.vp_c3)._m0[15].z, _248);
    float _268 = _252 * _106;
    float _270 = _256 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _272 = _258 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _274 = fma(_226, (*spvDescriptorSet0.vp_c3)._m0[15].z, _262);
    out.m_38.x = _260;
    out.m_38.y = _264;
    out.m_40.z = _266;
    out.m_42.x = _268;
    out.m_44.w = _270;
    out.m_46.w = _272;
    out.m_40.x = _274;
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
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_24.x;
    float _62 = in.m_24.y;
    float _64 = in.m_24.z;
    float _66 = in.m_24.w;
    float _68 = as_type<float>(int(gl_VertexIndex));
    bool _72 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _74 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _76 = _72 || _74;
    bool _78 = isnan(8.0);
    bool _80 = _76 || _78;
    float _82 = in.m_29.x;
    float _84 = in.m_29.y;
    float _86 = in.m_29.z;
    float _88 = in.m_31.x;
    float _90 = in.m_31.y;
    float _92 = 0.0;
    if (!_80)
    {
        float _94 = 0.5 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _92 = _94;
    }
    float _96 = _92;
    float _98 = in.m_31.z;
    bool _100 = _60 > 2.0;
    float _102 = _62 * _62;
    bool _104 = _64 > 2.0;
    float _106 = in.m_29.w;
    float _108 = float(as_type<int>(_68));
    out.m_34.z = (*spvDescriptorSet0.vp_c4)._m0[0].z;
    out.m_34.w = (*spvDescriptorSet0.vp_c4)._m0[0].w;
    bool _110 = _96 < _108;
    bool _112 = !_80;
    bool _114 = _110 && _112;
    float _116 = _84 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _118 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[0].x, _84);
    float _120 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[0].y, _84);
    float _122 = _84 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _124 = _60;
    float _126 = _64;
    if (_100)
    {
        float _128 = _60 + (-10.0);
        _124 = _128;
    }
    float _130 = _124;
    float _132 = _84 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _134 = _84 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _136 = _66 * _66;
    if (_104)
    {
        float _138 = _64 + (-10.0);
        _126 = _138;
    }
    float _140 = _126;
    float _142 = fma(_130, _130, _102);
    float _144 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[13].x, _116);
    float _146 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[11].x, _132);
    float _148 = fma(_140, _140, _136);
    out.m_36.x = _88;
    float _150 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[10].x, _122);
    float _152 = fma(_86, (*spvDescriptorSet0.vp_c3)._m0[13].z, _144);
    float _154 = _118 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _156 = sqrt(_148);
    float _158 = fma(_86, (*spvDescriptorSet0.vp_c3)._m0[11].z, _146);
    float _160 = fma(_86, (*spvDescriptorSet0.vp_c3)._m0[10].z, _150);
    float _162 = _152 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.m_36.y = _90;
    float _164 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[12].x, _134);
    float _166 = _120 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _168 = sqrt(_142);
    float _170 = fma(_86, (*spvDescriptorSet0.vp_c3)._m0[12].z, _164);
    float _172 = _100 ? (-1.0) : 1.0;
    float _174 = _160 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _176 = fma(_130, (*spvDescriptorSet0.vp_c4)._m0[0].x, _82);
    float _178 = fma(_130, (*spvDescriptorSet0.vp_c4)._m0[0].y, _82);
    float _180 = _170 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    out.m_36.z = _98;
    float _182 = fma(_176, (*spvDescriptorSet0.vp_c3)._m0[13].x, _154);
    float _184 = _158 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _186 = fma(_178, (*spvDescriptorSet0.vp_c3)._m0[13].x, _166);
    float _188 = 1.0 / _162;
    float _190 = _178;
    if (!_114)
    {
        _190 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _192 = _190;
    float _194 = _192;
    if (_114)
    {
        float _196 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _194 = _196;
    }
    float _198 = _194;
    out.gl_Position.x = _174;
    out.gl_Position.y = _184;
    out.gl_Position.z = _180;
    out.gl_Position.w = _162;
    float _200 = -_168;
    float _202 = _200 + 1.0;
    float _204 = _104 ? (-1.0) : 1.0;
    float _206 = -_156;
    float _208 = _206 + 1.0;
    float _210 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _212 = _172 * _202;
    float _214 = _62 * _140;
    float _216 = _204 * _208;
    float _218 = -_198;
    float _220 = _218 + _108;
    float _222 = _212 * _66;
    float _224 = -_214;
    float _226 = fma(_66, _130, _224);
    float _228 = _174 * _188;
    float _230 = _184 * _188;
    float _232 = _216 * _130;
    float _234 = _66 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _236 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[0].x, _86);
    float _238 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[0].y, _86);
    float _240 = -_232;
    float _242 = fma(_212, _140, _240);
    float _244 = -_222;
    float _246 = fma(_216, _62, _244);
    float _248 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[15].x, _234);
    float _250 = _220 * _210;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = _242 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _256 = fma(_236, (*spvDescriptorSet0.vp_c3)._m0[13].z, _182);
    float _258 = fma(_238, (*spvDescriptorSet0.vp_c3)._m0[13].z, _186);
    float _260 = fma(_228, 0.5, 0.5);
    float _262 = fma(_246, (*spvDescriptorSet0.vp_c3)._m0[15].x, _254);
    float _264 = fma(_230, -0.5, 0.5);
    float _266 = fma(_216, (*spvDescriptorSet0.vp_c3)._m0[15].z, _248);
    float _268 = _252 * _106;
    float _270 = _256 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _272 = _258 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _274 = fma(_226, (*spvDescriptorSet0.vp_c3)._m0[15].z, _262);
    out.m_38.x = _260;
    out.m_38.y = _264;
    out.m_40.z = _266;
    out.m_42.x = _268;
    out.m_44.w = _270;
    out.m_46.w = _272;
    out.m_40.x = _274;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

