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
    constant _16* vp_c4 [[id(1)]];
};

struct main0_out
{
    float4 m_34 [[user(locn1)]];
    float4 m_38 [[user(locn3)]];
    float4 m_36 [[user(locn4)]];
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
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _62 = in.m_29.w;
    float _64 = in.m_31.y;
    float _66 = in.m_31.z;
    bool _70 = _56 > 2.0;
    float _72 = _58 * _58;
    bool _74 = _52 > 2.0;
    float _76 = _54 * _54;
    float _78 = _74 ? (-1.0) : 1.0;
    float _80 = _70 ? (-1.0) : 1.0;
    float _82 = _56;
    float _84 = _52;
    if (_70)
    {
        float _86 = _56 + (-10.0);
        _82 = _86;
    }
    float _88 = _82;
    if (_74)
    {
        float _90 = _52 + (-10.0);
        _84 = _90;
    }
    float _92 = _84;
    float _94 = fma(_88, _88, _72);
    float _96 = _88 * _54;
    float _98 = fma(_92, _92, _76);
    float _100 = -_96;
    float _102 = fma(_92, _58, _100);
    float _104 = sqrt(_94);
    float _106 = sqrt(_98);
    float _108 = -_104;
    float _110 = _108 + 1.0;
    float _112 = _80 * _110;
    float _114 = -_106;
    float _116 = _114 + 1.0;
    float _118 = _78 * _116;
    float _120 = _92 * _112;
    float _122 = _118 * _58;
    float _124 = -_120;
    float _126 = fma(_118, _88, _124);
    float _128 = _102 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _130 = _58 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _132 = -_122;
    float _134 = fma(_112, _54, _132);
    float _136 = _126 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _138 = fma(_88, (*spvDescriptorSet0.vp_c3)._m0[15].x, _130);
    float _140 = -_128;
    float _142 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[14].z, _140);
    float _144 = -_136;
    float _146 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[14].y, _144);
    float _148 = in.m_29.x;
    float _150 = in.m_29.y;
    float _152 = in.m_29.z;
    float _154 = _134 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _156 = _142 * _142;
    float _158 = fma(_112, (*spvDescriptorSet0.vp_c3)._m0[15].z, _138);
    float _160 = -_154;
    float _162 = fma(_126, (*spvDescriptorSet0.vp_c3)._m0[14].x, _160);
    float _164 = fma(_146, _146, _156);
    int _167 = as_type<int>(_60) & 1;
    float _169 = in.m_31.x;
    float _171 = fma(_162, _162, _164);
    float _173 = float(_167);
    out.m_34.x = _62;
    float _175 = rsqrt(_171);
    float _177 = _173 + (-0.5);
    out.m_36.y = _64;
    out.m_36.z = _66;
    float _179 = _150 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    out.m_38.z = _158;
    float _181 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[12].x, _179);
    float _183 = _175 * _177;
    float _185 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[12].z, _181);
    float _187 = _126 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    out.m_36.x = _169;
    float _189 = _183 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _191 = _185 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _193 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[15].x, _187);
    float _195 = _191 * _189;
    float _197 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[15].z, _193);
    float _199 = fma(_142, _195, _150);
    float _201 = fma(_146, _195, _148);
    float _203 = fma(_162, _195, _152);
    out.m_38.x = _197;
    float _205 = _199 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _207 = _199 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _209 = _199 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _211 = _199 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _213 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[10].x, _205);
    float _215 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[11].x, _207);
    float _217 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[12].x, _209);
    float _219 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[13].x, _211);
    float _221 = fma(_203, (*spvDescriptorSet0.vp_c3)._m0[10].z, _213);
    float _223 = fma(_203, (*spvDescriptorSet0.vp_c3)._m0[11].z, _215);
    float _225 = fma(_203, (*spvDescriptorSet0.vp_c3)._m0[12].z, _217);
    float _227 = fma(_203, (*spvDescriptorSet0.vp_c3)._m0[13].z, _219);
    float _229 = _221 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _231 = _223 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _233 = _225 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _235 = _227 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.gl_Position.x = _229;
    out.gl_Position.y = _231;
    out.gl_Position.z = _233;
    out.gl_Position.w = _235;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _62 = in.m_29.w;
    float _64 = in.m_31.y;
    float _66 = in.m_31.z;
    bool _70 = _56 > 2.0;
    float _72 = _58 * _58;
    bool _74 = _52 > 2.0;
    float _76 = _54 * _54;
    float _78 = _74 ? (-1.0) : 1.0;
    float _80 = _70 ? (-1.0) : 1.0;
    float _82 = _56;
    float _84 = _52;
    if (_70)
    {
        float _86 = _56 + (-10.0);
        _82 = _86;
    }
    float _88 = _82;
    if (_74)
    {
        float _90 = _52 + (-10.0);
        _84 = _90;
    }
    float _92 = _84;
    float _94 = fma(_88, _88, _72);
    float _96 = _88 * _54;
    float _98 = fma(_92, _92, _76);
    float _100 = -_96;
    float _102 = fma(_92, _58, _100);
    float _104 = sqrt(_94);
    float _106 = sqrt(_98);
    float _108 = -_104;
    float _110 = _108 + 1.0;
    float _112 = _80 * _110;
    float _114 = -_106;
    float _116 = _114 + 1.0;
    float _118 = _78 * _116;
    float _120 = _92 * _112;
    float _122 = _118 * _58;
    float _124 = -_120;
    float _126 = fma(_118, _88, _124);
    float _128 = _102 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _130 = _58 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _132 = -_122;
    float _134 = fma(_112, _54, _132);
    float _136 = _126 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _138 = fma(_88, (*spvDescriptorSet0.vp_c3)._m0[15].x, _130);
    float _140 = -_128;
    float _142 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[14].z, _140);
    float _144 = -_136;
    float _146 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[14].y, _144);
    float _148 = in.m_29.x;
    float _150 = in.m_29.y;
    float _152 = in.m_29.z;
    float _154 = _134 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _156 = _142 * _142;
    float _158 = fma(_112, (*spvDescriptorSet0.vp_c3)._m0[15].z, _138);
    float _160 = -_154;
    float _162 = fma(_126, (*spvDescriptorSet0.vp_c3)._m0[14].x, _160);
    float _164 = fma(_146, _146, _156);
    int _167 = as_type<int>(_60) & 1;
    float _169 = in.m_31.x;
    float _171 = fma(_162, _162, _164);
    float _173 = float(_167);
    out.m_34.x = _62;
    float _175 = rsqrt(_171);
    float _177 = _173 + (-0.5);
    out.m_36.y = _64;
    out.m_36.z = _66;
    float _179 = _150 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    out.m_38.z = _158;
    float _181 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[12].x, _179);
    float _183 = _175 * _177;
    float _185 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[12].z, _181);
    float _187 = _126 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    out.m_36.x = _169;
    float _189 = _183 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _191 = _185 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _193 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[15].x, _187);
    float _195 = _191 * _189;
    float _197 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[15].z, _193);
    float _199 = fma(_142, _195, _150);
    float _201 = fma(_146, _195, _148);
    float _203 = fma(_162, _195, _152);
    out.m_38.x = _197;
    float _205 = _199 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _207 = _199 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _209 = _199 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _211 = _199 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _213 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[10].x, _205);
    float _215 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[11].x, _207);
    float _217 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[12].x, _209);
    float _219 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[13].x, _211);
    float _221 = fma(_203, (*spvDescriptorSet0.vp_c3)._m0[10].z, _213);
    float _223 = fma(_203, (*spvDescriptorSet0.vp_c3)._m0[11].z, _215);
    float _225 = fma(_203, (*spvDescriptorSet0.vp_c3)._m0[12].z, _217);
    float _227 = fma(_203, (*spvDescriptorSet0.vp_c3)._m0[13].z, _219);
    float _229 = _221 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _231 = _223 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _233 = _225 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _235 = _227 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.gl_Position.x = _229;
    out.gl_Position.y = _231;
    out.gl_Position.z = _233;
    out.gl_Position.w = _235;
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
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _62 = in.m_29.w;
    float _64 = in.m_31.y;
    float _66 = in.m_31.z;
    bool _70 = _56 > 2.0;
    float _72 = _58 * _58;
    bool _74 = _52 > 2.0;
    float _76 = _54 * _54;
    float _78 = _74 ? (-1.0) : 1.0;
    float _80 = _70 ? (-1.0) : 1.0;
    float _82 = _56;
    float _84 = _52;
    if (_70)
    {
        float _86 = _56 + (-10.0);
        _82 = _86;
    }
    float _88 = _82;
    if (_74)
    {
        float _90 = _52 + (-10.0);
        _84 = _90;
    }
    float _92 = _84;
    float _94 = fma(_88, _88, _72);
    float _96 = _88 * _54;
    float _98 = fma(_92, _92, _76);
    float _100 = -_96;
    float _102 = fma(_92, _58, _100);
    float _104 = sqrt(_94);
    float _106 = sqrt(_98);
    float _108 = -_104;
    float _110 = _108 + 1.0;
    float _112 = _80 * _110;
    float _114 = -_106;
    float _116 = _114 + 1.0;
    float _118 = _78 * _116;
    float _120 = _92 * _112;
    float _122 = _118 * _58;
    float _124 = -_120;
    float _126 = fma(_118, _88, _124);
    float _128 = _102 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _130 = _58 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _132 = -_122;
    float _134 = fma(_112, _54, _132);
    float _136 = _126 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _138 = fma(_88, (*spvDescriptorSet0.vp_c3)._m0[15].x, _130);
    float _140 = -_128;
    float _142 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[14].z, _140);
    float _144 = -_136;
    float _146 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[14].y, _144);
    float _148 = in.m_29.x;
    float _150 = in.m_29.y;
    float _152 = in.m_29.z;
    float _154 = _134 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _156 = _142 * _142;
    float _158 = fma(_112, (*spvDescriptorSet0.vp_c3)._m0[15].z, _138);
    float _160 = -_154;
    float _162 = fma(_126, (*spvDescriptorSet0.vp_c3)._m0[14].x, _160);
    float _164 = fma(_146, _146, _156);
    int _167 = as_type<int>(_60) & 1;
    float _169 = in.m_31.x;
    float _171 = fma(_162, _162, _164);
    float _173 = float(_167);
    out.m_34.x = _62;
    float _175 = rsqrt(_171);
    float _177 = _173 + (-0.5);
    out.m_36.y = _64;
    out.m_36.z = _66;
    float _179 = _150 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    out.m_38.z = _158;
    float _181 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[12].x, _179);
    float _183 = _175 * _177;
    float _185 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[12].z, _181);
    float _187 = _126 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    out.m_36.x = _169;
    float _189 = _183 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _191 = _185 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _193 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[15].x, _187);
    float _195 = _191 * _189;
    float _197 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[15].z, _193);
    float _199 = fma(_142, _195, _150);
    float _201 = fma(_146, _195, _148);
    float _203 = fma(_162, _195, _152);
    out.m_38.x = _197;
    float _205 = _199 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _207 = _199 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _209 = _199 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _211 = _199 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _213 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[10].x, _205);
    float _215 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[11].x, _207);
    float _217 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[12].x, _209);
    float _219 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[13].x, _211);
    float _221 = fma(_203, (*spvDescriptorSet0.vp_c3)._m0[10].z, _213);
    float _223 = fma(_203, (*spvDescriptorSet0.vp_c3)._m0[11].z, _215);
    float _225 = fma(_203, (*spvDescriptorSet0.vp_c3)._m0[12].z, _217);
    float _227 = fma(_203, (*spvDescriptorSet0.vp_c3)._m0[13].z, _219);
    float _229 = _221 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _231 = _223 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _233 = _225 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _235 = _227 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.gl_Position.x = _229;
    out.gl_Position.y = _231;
    out.gl_Position.z = _233;
    out.gl_Position.w = _235;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

