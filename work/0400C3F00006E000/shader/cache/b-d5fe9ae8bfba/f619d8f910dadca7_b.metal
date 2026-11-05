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
    float4 m_40 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
    float4 m_32 [[user(locn2)]];
    float4 m_38 [[user(locn3)]];
    float4 m_34 [[user(locn6)]];
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
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = in.m_24.x;
    float _56 = in.m_24.y;
    float _58 = in.m_24.z;
    float _60 = in.m_24.w;
    float _62 = as_type<float>(int(gl_VertexIndex));
    float _64 = in.m_29.w;
    bool _68 = _58 > 2.0;
    float _70 = _60 * _60;
    bool _72 = _54 > 2.0;
    float _74 = _56 * _56;
    float _76 = _72 ? (-1.0) : 1.0;
    float _78 = _68 ? (-1.0) : 1.0;
    float _80 = _58;
    float _82 = _54;
    if (_68)
    {
        float _84 = _58 + (-10.0);
        _80 = _84;
    }
    float _86 = _80;
    if (_72)
    {
        float _88 = _54 + (-10.0);
        _82 = _88;
    }
    float _90 = _82;
    float _92 = fma(_86, _86, _70);
    float _94 = fma(_90, _90, _74);
    float _96 = sqrt(_92);
    float _98 = sqrt(_94);
    float _100 = -_96;
    float _102 = _100 + 1.0;
    float _104 = _78 * _102;
    float _106 = _86 * _56;
    float _108 = -_98;
    float _110 = _108 + 1.0;
    float _112 = -_106;
    float _114 = fma(_90, _60, _112);
    float _116 = _76 * _110;
    float _118 = _90 * _104;
    float _120 = _114 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _122 = _116 * _60;
    float _124 = -_118;
    float _126 = fma(_116, _86, _124);
    float _128 = -_122;
    float _130 = fma(_104, _56, _128);
    float _132 = _126 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _134 = in.m_29.x;
    float _136 = in.m_29.y;
    float _138 = in.m_29.z;
    float _140 = -_120;
    float _142 = fma(_130, (*spvDescriptorSet0.vp_c3)._m0[14].z, _140);
    float _144 = -_132;
    float _146 = fma(_114, (*spvDescriptorSet0.vp_c3)._m0[14].y, _144);
    float _148 = _130 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    out.m_32.x = _64;
    float _150 = _142 * _142;
    float _152 = -_148;
    float _154 = fma(_126, (*spvDescriptorSet0.vp_c3)._m0[14].x, _152);
    int _157 = as_type<int>(_62) & 1;
    float _159 = fma(_146, _146, _150);
    float _161 = float(_157);
    float _163 = fma(_154, _154, _159);
    float _165 = _161 + (-0.5);
    float _167 = rsqrt(_163);
    float _169 = _136 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _171 = fma(_56, (*spvDescriptorSet0.vp_c4)._m0[0].x, _136);
    float _173 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[12].x, _169);
    float _175 = _171 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _177 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[12].z, _173);
    float _179 = _167 * _165;
    float _181 = _177 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _183 = fma(_56, (*spvDescriptorSet0.vp_c4)._m0[0].y, _136);
    float _185 = fma(_90, (*spvDescriptorSet0.vp_c4)._m0[0].x, _134);
    float _187 = _179 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _189 = _183 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _191 = fma(_185, (*spvDescriptorSet0.vp_c3)._m0[13].x, _175);
    float _193 = _181 * _187;
    float _195 = _181 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _197 = fma(_142, _193, _136);
    float _199 = fma(_146, _193, _134);
    float _201 = fma(_154, _193, _138);
    float _203 = fma(_90, (*spvDescriptorSet0.vp_c4)._m0[0].y, _134);
    float _205 = _197 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _207 = fma(_116, (*spvDescriptorSet0.vp_c4)._m0[0].x, _138);
    float _209 = precise::min(_195, (*spvDescriptorSet0.vp_c4)._m0[2].w);
    float _211 = fma(_203, (*spvDescriptorSet0.vp_c3)._m0[13].x, _189);
    float _213 = fma(_199, (*spvDescriptorSet0.vp_c3)._m0[13].x, _205);
    float _215 = fma(_207, (*spvDescriptorSet0.vp_c3)._m0[13].z, _191);
    float _217 = _197 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _219 = _197 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _221 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[13].z, _213);
    float _223 = _197 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _225 = fma(_199, (*spvDescriptorSet0.vp_c3)._m0[10].x, _217);
    float _227 = fma(_199, (*spvDescriptorSet0.vp_c3)._m0[11].x, _219);
    float _229 = _221 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _231 = fma(_199, (*spvDescriptorSet0.vp_c3)._m0[12].x, _223);
    float _233 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[10].z, _225);
    float _235 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[11].z, _227);
    float _237 = 1.0 / _229;
    float _239 = fma(_116, (*spvDescriptorSet0.vp_c4)._m0[0].y, _138);
    float _241 = _233 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _243 = _235 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _245 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[12].z, _231);
    float _247 = fma(_239, (*spvDescriptorSet0.vp_c3)._m0[13].z, _211);
    float _249 = _209 + 1.0;
    float _251 = _215 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _253 = _245 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _255 = _247 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _257 = _249 * (*spvDescriptorSet0.vp_c4)._m0[0].z;
    float _259 = _249 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_34.w = _251;
    float _261 = _241 * _237;
    float _263 = _243 * _237;
    out.m_36.z = _257;
    out.m_36.w = _259;
    float _265 = fma(_261, 0.5, 0.5);
    float _267 = fma(_263, -0.5, 0.5);
    out.m_38.w = _255;
    out.gl_Position.x = _241;
    out.gl_Position.y = _243;
    out.gl_Position.z = _253;
    out.gl_Position.w = _229;
    out.m_40.x = _265;
    out.m_40.y = _267;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = in.m_24.x;
    float _56 = in.m_24.y;
    float _58 = in.m_24.z;
    float _60 = in.m_24.w;
    float _62 = as_type<float>(int(gl_VertexIndex));
    float _64 = in.m_29.w;
    bool _68 = _58 > 2.0;
    float _70 = _60 * _60;
    bool _72 = _54 > 2.0;
    float _74 = _56 * _56;
    float _76 = _72 ? (-1.0) : 1.0;
    float _78 = _68 ? (-1.0) : 1.0;
    float _80 = _58;
    float _82 = _54;
    if (_68)
    {
        float _84 = _58 + (-10.0);
        _80 = _84;
    }
    float _86 = _80;
    if (_72)
    {
        float _88 = _54 + (-10.0);
        _82 = _88;
    }
    float _90 = _82;
    float _92 = fma(_86, _86, _70);
    float _94 = fma(_90, _90, _74);
    float _96 = sqrt(_92);
    float _98 = sqrt(_94);
    float _100 = -_96;
    float _102 = _100 + 1.0;
    float _104 = _78 * _102;
    float _106 = _86 * _56;
    float _108 = -_98;
    float _110 = _108 + 1.0;
    float _112 = -_106;
    float _114 = fma(_90, _60, _112);
    float _116 = _76 * _110;
    float _118 = _90 * _104;
    float _120 = _114 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _122 = _116 * _60;
    float _124 = -_118;
    float _126 = fma(_116, _86, _124);
    float _128 = -_122;
    float _130 = fma(_104, _56, _128);
    float _132 = _126 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _134 = in.m_29.x;
    float _136 = in.m_29.y;
    float _138 = in.m_29.z;
    float _140 = -_120;
    float _142 = fma(_130, (*spvDescriptorSet0.vp_c3)._m0[14].z, _140);
    float _144 = -_132;
    float _146 = fma(_114, (*spvDescriptorSet0.vp_c3)._m0[14].y, _144);
    float _148 = _130 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    out.m_32.x = _64;
    float _150 = _142 * _142;
    float _152 = -_148;
    float _154 = fma(_126, (*spvDescriptorSet0.vp_c3)._m0[14].x, _152);
    int _157 = as_type<int>(_62) & 1;
    float _159 = fma(_146, _146, _150);
    float _161 = float(_157);
    float _163 = fma(_154, _154, _159);
    float _165 = _161 + (-0.5);
    float _167 = rsqrt(_163);
    float _169 = _136 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _171 = fma(_56, (*spvDescriptorSet0.vp_c4)._m0[0].x, _136);
    float _173 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[12].x, _169);
    float _175 = _171 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _177 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[12].z, _173);
    float _179 = _167 * _165;
    float _181 = _177 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _183 = fma(_56, (*spvDescriptorSet0.vp_c4)._m0[0].y, _136);
    float _185 = fma(_90, (*spvDescriptorSet0.vp_c4)._m0[0].x, _134);
    float _187 = _179 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _189 = _183 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _191 = fma(_185, (*spvDescriptorSet0.vp_c3)._m0[13].x, _175);
    float _193 = _181 * _187;
    float _195 = _181 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _197 = fma(_142, _193, _136);
    float _199 = fma(_146, _193, _134);
    float _201 = fma(_154, _193, _138);
    float _203 = fma(_90, (*spvDescriptorSet0.vp_c4)._m0[0].y, _134);
    float _205 = _197 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _207 = fma(_116, (*spvDescriptorSet0.vp_c4)._m0[0].x, _138);
    float _209 = precise::min(_195, (*spvDescriptorSet0.vp_c4)._m0[2].w);
    float _211 = fma(_203, (*spvDescriptorSet0.vp_c3)._m0[13].x, _189);
    float _213 = fma(_199, (*spvDescriptorSet0.vp_c3)._m0[13].x, _205);
    float _215 = fma(_207, (*spvDescriptorSet0.vp_c3)._m0[13].z, _191);
    float _217 = _197 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _219 = _197 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _221 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[13].z, _213);
    float _223 = _197 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _225 = fma(_199, (*spvDescriptorSet0.vp_c3)._m0[10].x, _217);
    float _227 = fma(_199, (*spvDescriptorSet0.vp_c3)._m0[11].x, _219);
    float _229 = _221 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _231 = fma(_199, (*spvDescriptorSet0.vp_c3)._m0[12].x, _223);
    float _233 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[10].z, _225);
    float _235 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[11].z, _227);
    float _237 = 1.0 / _229;
    float _239 = fma(_116, (*spvDescriptorSet0.vp_c4)._m0[0].y, _138);
    float _241 = _233 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _243 = _235 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _245 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[12].z, _231);
    float _247 = fma(_239, (*spvDescriptorSet0.vp_c3)._m0[13].z, _211);
    float _249 = _209 + 1.0;
    float _251 = _215 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _253 = _245 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _255 = _247 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _257 = _249 * (*spvDescriptorSet0.vp_c4)._m0[0].z;
    float _259 = _249 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_34.w = _251;
    float _261 = _241 * _237;
    float _263 = _243 * _237;
    out.m_36.z = _257;
    out.m_36.w = _259;
    float _265 = fma(_261, 0.5, 0.5);
    float _267 = fma(_263, -0.5, 0.5);
    out.m_38.w = _255;
    out.gl_Position.x = _241;
    out.gl_Position.y = _243;
    out.gl_Position.z = _253;
    out.gl_Position.w = _229;
    out.m_40.x = _265;
    out.m_40.y = _267;
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
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = in.m_24.x;
    float _56 = in.m_24.y;
    float _58 = in.m_24.z;
    float _60 = in.m_24.w;
    float _62 = as_type<float>(int(gl_VertexIndex));
    float _64 = in.m_29.w;
    bool _68 = _58 > 2.0;
    float _70 = _60 * _60;
    bool _72 = _54 > 2.0;
    float _74 = _56 * _56;
    float _76 = _72 ? (-1.0) : 1.0;
    float _78 = _68 ? (-1.0) : 1.0;
    float _80 = _58;
    float _82 = _54;
    if (_68)
    {
        float _84 = _58 + (-10.0);
        _80 = _84;
    }
    float _86 = _80;
    if (_72)
    {
        float _88 = _54 + (-10.0);
        _82 = _88;
    }
    float _90 = _82;
    float _92 = fma(_86, _86, _70);
    float _94 = fma(_90, _90, _74);
    float _96 = sqrt(_92);
    float _98 = sqrt(_94);
    float _100 = -_96;
    float _102 = _100 + 1.0;
    float _104 = _78 * _102;
    float _106 = _86 * _56;
    float _108 = -_98;
    float _110 = _108 + 1.0;
    float _112 = -_106;
    float _114 = fma(_90, _60, _112);
    float _116 = _76 * _110;
    float _118 = _90 * _104;
    float _120 = _114 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _122 = _116 * _60;
    float _124 = -_118;
    float _126 = fma(_116, _86, _124);
    float _128 = -_122;
    float _130 = fma(_104, _56, _128);
    float _132 = _126 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _134 = in.m_29.x;
    float _136 = in.m_29.y;
    float _138 = in.m_29.z;
    float _140 = -_120;
    float _142 = fma(_130, (*spvDescriptorSet0.vp_c3)._m0[14].z, _140);
    float _144 = -_132;
    float _146 = fma(_114, (*spvDescriptorSet0.vp_c3)._m0[14].y, _144);
    float _148 = _130 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    out.m_32.x = _64;
    float _150 = _142 * _142;
    float _152 = -_148;
    float _154 = fma(_126, (*spvDescriptorSet0.vp_c3)._m0[14].x, _152);
    int _157 = as_type<int>(_62) & 1;
    float _159 = fma(_146, _146, _150);
    float _161 = float(_157);
    float _163 = fma(_154, _154, _159);
    float _165 = _161 + (-0.5);
    float _167 = rsqrt(_163);
    float _169 = _136 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _171 = fma(_56, (*spvDescriptorSet0.vp_c4)._m0[0].x, _136);
    float _173 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[12].x, _169);
    float _175 = _171 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _177 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[12].z, _173);
    float _179 = _167 * _165;
    float _181 = _177 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _183 = fma(_56, (*spvDescriptorSet0.vp_c4)._m0[0].y, _136);
    float _185 = fma(_90, (*spvDescriptorSet0.vp_c4)._m0[0].x, _134);
    float _187 = _179 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _189 = _183 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _191 = fma(_185, (*spvDescriptorSet0.vp_c3)._m0[13].x, _175);
    float _193 = _181 * _187;
    float _195 = _181 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _197 = fma(_142, _193, _136);
    float _199 = fma(_146, _193, _134);
    float _201 = fma(_154, _193, _138);
    float _203 = fma(_90, (*spvDescriptorSet0.vp_c4)._m0[0].y, _134);
    float _205 = _197 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _207 = fma(_116, (*spvDescriptorSet0.vp_c4)._m0[0].x, _138);
    float _209 = precise::min(_195, (*spvDescriptorSet0.vp_c4)._m0[2].w);
    float _211 = fma(_203, (*spvDescriptorSet0.vp_c3)._m0[13].x, _189);
    float _213 = fma(_199, (*spvDescriptorSet0.vp_c3)._m0[13].x, _205);
    float _215 = fma(_207, (*spvDescriptorSet0.vp_c3)._m0[13].z, _191);
    float _217 = _197 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _219 = _197 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _221 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[13].z, _213);
    float _223 = _197 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _225 = fma(_199, (*spvDescriptorSet0.vp_c3)._m0[10].x, _217);
    float _227 = fma(_199, (*spvDescriptorSet0.vp_c3)._m0[11].x, _219);
    float _229 = _221 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _231 = fma(_199, (*spvDescriptorSet0.vp_c3)._m0[12].x, _223);
    float _233 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[10].z, _225);
    float _235 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[11].z, _227);
    float _237 = 1.0 / _229;
    float _239 = fma(_116, (*spvDescriptorSet0.vp_c4)._m0[0].y, _138);
    float _241 = _233 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _243 = _235 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _245 = fma(_201, (*spvDescriptorSet0.vp_c3)._m0[12].z, _231);
    float _247 = fma(_239, (*spvDescriptorSet0.vp_c3)._m0[13].z, _211);
    float _249 = _209 + 1.0;
    float _251 = _215 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _253 = _245 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _255 = _247 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _257 = _249 * (*spvDescriptorSet0.vp_c4)._m0[0].z;
    float _259 = _249 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_34.w = _251;
    float _261 = _241 * _237;
    float _263 = _243 * _237;
    out.m_36.z = _257;
    out.m_36.w = _259;
    float _265 = fma(_261, 0.5, 0.5);
    float _267 = fma(_263, -0.5, 0.5);
    out.m_38.w = _255;
    out.gl_Position.x = _241;
    out.gl_Position.y = _243;
    out.gl_Position.z = _253;
    out.gl_Position.w = _229;
    out.m_40.x = _265;
    out.m_40.y = _267;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_32.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_32.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_32.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_32.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

