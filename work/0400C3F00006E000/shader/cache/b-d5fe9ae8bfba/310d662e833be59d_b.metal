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
    float4 m_44 [[user(locn0)]];
    float4 m_40 [[user(locn1)]];
    float4 m_34 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
    float4 m_36 [[user(locn4)]];
    float4 m_38 [[user(locn6)]];
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_24.x;
    float _60 = in.m_24.y;
    float _62 = in.m_24.z;
    float _64 = in.m_24.w;
    float _66 = as_type<float>(int(gl_VertexIndex));
    float _68 = in.m_29.w;
    float _70 = in.m_31.x;
    float _72 = in.m_31.y;
    bool _76 = _62 > 2.0;
    float _78 = _64 * _64;
    bool _80 = _58 > 2.0;
    float _82 = _60 * _60;
    float _84 = _80 ? (-1.0) : 1.0;
    float _86 = _76 ? (-1.0) : 1.0;
    float _88 = _62;
    float _90 = _58;
    if (_76)
    {
        float _92 = _62 + (-10.0);
        _88 = _92;
    }
    float _94 = _88;
    if (_80)
    {
        float _96 = _58 + (-10.0);
        _90 = _96;
    }
    float _98 = _90;
    float _100 = fma(_94, _94, _78);
    float _102 = fma(_98, _98, _82);
    float _104 = sqrt(_100);
    float _106 = sqrt(_102);
    float _108 = -_104;
    float _110 = _108 + 1.0;
    float _112 = _86 * _110;
    float _114 = _94 * _60;
    float _116 = -_106;
    float _118 = _116 + 1.0;
    float _120 = -_114;
    float _122 = fma(_98, _64, _120);
    float _124 = _84 * _118;
    float _126 = _98 * _112;
    float _128 = _122 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _130 = _124 * _64;
    float _132 = -_126;
    float _134 = fma(_124, _94, _132);
    float _136 = -_130;
    float _138 = fma(_112, _60, _136);
    float _140 = _134 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _142 = in.m_29.x;
    float _144 = in.m_29.y;
    float _146 = in.m_29.z;
    float _148 = -_128;
    float _150 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[14].z, _148);
    float _152 = -_140;
    float _154 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[14].y, _152);
    float _156 = _138 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    out.m_34.x = _68;
    float _158 = _150 * _150;
    float _160 = -_156;
    float _162 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[14].x, _160);
    int _165 = as_type<int>(_66) & 1;
    float _167 = fma(_154, _154, _158);
    out.m_36.x = _70;
    float _169 = float(_165);
    float _171 = fma(_162, _162, _167);
    out.m_36.y = _72;
    float _173 = _169 + (-0.5);
    float _175 = rsqrt(_171);
    float _177 = _144 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _179 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].x, _144);
    float _181 = fma(_142, (*spvDescriptorSet0.vp_c3)._m0[12].x, _177);
    float _183 = _179 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _185 = fma(_146, (*spvDescriptorSet0.vp_c3)._m0[12].z, _181);
    float _187 = _175 * _173;
    float _189 = _185 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _191 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].y, _144);
    float _193 = fma(_98, (*spvDescriptorSet0.vp_c4)._m0[0].x, _142);
    float _195 = _187 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _197 = _191 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _199 = fma(_193, (*spvDescriptorSet0.vp_c3)._m0[13].x, _183);
    float _201 = _189 * _195;
    float _203 = _189 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _205 = fma(_150, _201, _144);
    float _207 = fma(_154, _201, _142);
    float _209 = fma(_162, _201, _146);
    float _211 = fma(_98, (*spvDescriptorSet0.vp_c4)._m0[0].y, _142);
    float _213 = _205 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _215 = fma(_124, (*spvDescriptorSet0.vp_c4)._m0[0].x, _146);
    float _217 = precise::min(_203, (*spvDescriptorSet0.vp_c4)._m0[2].w);
    float _219 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[13].x, _197);
    float _221 = fma(_207, (*spvDescriptorSet0.vp_c3)._m0[13].x, _213);
    float _223 = fma(_215, (*spvDescriptorSet0.vp_c3)._m0[13].z, _199);
    float _225 = _205 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _227 = _205 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _229 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[13].z, _221);
    float _231 = _205 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _233 = fma(_207, (*spvDescriptorSet0.vp_c3)._m0[10].x, _225);
    float _235 = fma(_207, (*spvDescriptorSet0.vp_c3)._m0[11].x, _227);
    float _237 = _229 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _239 = fma(_207, (*spvDescriptorSet0.vp_c3)._m0[12].x, _231);
    float _241 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[10].z, _233);
    float _243 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[11].z, _235);
    float _245 = 1.0 / _237;
    float _247 = fma(_124, (*spvDescriptorSet0.vp_c4)._m0[0].y, _146);
    float _249 = _241 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _251 = _243 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _253 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[12].z, _239);
    float _255 = fma(_247, (*spvDescriptorSet0.vp_c3)._m0[13].z, _219);
    float _257 = _217 + 1.0;
    float _259 = _223 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _261 = _253 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _263 = _255 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _265 = _257 * (*spvDescriptorSet0.vp_c4)._m0[0].z;
    float _267 = _257 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_38.w = _259;
    float _269 = _249 * _245;
    float _271 = _251 * _245;
    out.m_40.z = _265;
    out.m_40.w = _267;
    float _273 = fma(_269, 0.5, 0.5);
    float _275 = fma(_271, -0.5, 0.5);
    out.m_42.w = _263;
    out.gl_Position.x = _249;
    out.gl_Position.y = _251;
    out.gl_Position.z = _261;
    out.gl_Position.w = _237;
    out.m_44.x = _273;
    out.m_44.y = _275;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_24.x;
    float _60 = in.m_24.y;
    float _62 = in.m_24.z;
    float _64 = in.m_24.w;
    float _66 = as_type<float>(int(gl_VertexIndex));
    float _68 = in.m_29.w;
    float _70 = in.m_31.x;
    float _72 = in.m_31.y;
    bool _76 = _62 > 2.0;
    float _78 = _64 * _64;
    bool _80 = _58 > 2.0;
    float _82 = _60 * _60;
    float _84 = _80 ? (-1.0) : 1.0;
    float _86 = _76 ? (-1.0) : 1.0;
    float _88 = _62;
    float _90 = _58;
    if (_76)
    {
        float _92 = _62 + (-10.0);
        _88 = _92;
    }
    float _94 = _88;
    if (_80)
    {
        float _96 = _58 + (-10.0);
        _90 = _96;
    }
    float _98 = _90;
    float _100 = fma(_94, _94, _78);
    float _102 = fma(_98, _98, _82);
    float _104 = sqrt(_100);
    float _106 = sqrt(_102);
    float _108 = -_104;
    float _110 = _108 + 1.0;
    float _112 = _86 * _110;
    float _114 = _94 * _60;
    float _116 = -_106;
    float _118 = _116 + 1.0;
    float _120 = -_114;
    float _122 = fma(_98, _64, _120);
    float _124 = _84 * _118;
    float _126 = _98 * _112;
    float _128 = _122 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _130 = _124 * _64;
    float _132 = -_126;
    float _134 = fma(_124, _94, _132);
    float _136 = -_130;
    float _138 = fma(_112, _60, _136);
    float _140 = _134 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _142 = in.m_29.x;
    float _144 = in.m_29.y;
    float _146 = in.m_29.z;
    float _148 = -_128;
    float _150 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[14].z, _148);
    float _152 = -_140;
    float _154 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[14].y, _152);
    float _156 = _138 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    out.m_34.x = _68;
    float _158 = _150 * _150;
    float _160 = -_156;
    float _162 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[14].x, _160);
    int _165 = as_type<int>(_66) & 1;
    float _167 = fma(_154, _154, _158);
    out.m_36.x = _70;
    float _169 = float(_165);
    float _171 = fma(_162, _162, _167);
    out.m_36.y = _72;
    float _173 = _169 + (-0.5);
    float _175 = rsqrt(_171);
    float _177 = _144 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _179 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].x, _144);
    float _181 = fma(_142, (*spvDescriptorSet0.vp_c3)._m0[12].x, _177);
    float _183 = _179 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _185 = fma(_146, (*spvDescriptorSet0.vp_c3)._m0[12].z, _181);
    float _187 = _175 * _173;
    float _189 = _185 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _191 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].y, _144);
    float _193 = fma(_98, (*spvDescriptorSet0.vp_c4)._m0[0].x, _142);
    float _195 = _187 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _197 = _191 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _199 = fma(_193, (*spvDescriptorSet0.vp_c3)._m0[13].x, _183);
    float _201 = _189 * _195;
    float _203 = _189 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _205 = fma(_150, _201, _144);
    float _207 = fma(_154, _201, _142);
    float _209 = fma(_162, _201, _146);
    float _211 = fma(_98, (*spvDescriptorSet0.vp_c4)._m0[0].y, _142);
    float _213 = _205 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _215 = fma(_124, (*spvDescriptorSet0.vp_c4)._m0[0].x, _146);
    float _217 = precise::min(_203, (*spvDescriptorSet0.vp_c4)._m0[2].w);
    float _219 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[13].x, _197);
    float _221 = fma(_207, (*spvDescriptorSet0.vp_c3)._m0[13].x, _213);
    float _223 = fma(_215, (*spvDescriptorSet0.vp_c3)._m0[13].z, _199);
    float _225 = _205 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _227 = _205 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _229 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[13].z, _221);
    float _231 = _205 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _233 = fma(_207, (*spvDescriptorSet0.vp_c3)._m0[10].x, _225);
    float _235 = fma(_207, (*spvDescriptorSet0.vp_c3)._m0[11].x, _227);
    float _237 = _229 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _239 = fma(_207, (*spvDescriptorSet0.vp_c3)._m0[12].x, _231);
    float _241 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[10].z, _233);
    float _243 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[11].z, _235);
    float _245 = 1.0 / _237;
    float _247 = fma(_124, (*spvDescriptorSet0.vp_c4)._m0[0].y, _146);
    float _249 = _241 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _251 = _243 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _253 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[12].z, _239);
    float _255 = fma(_247, (*spvDescriptorSet0.vp_c3)._m0[13].z, _219);
    float _257 = _217 + 1.0;
    float _259 = _223 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _261 = _253 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _263 = _255 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _265 = _257 * (*spvDescriptorSet0.vp_c4)._m0[0].z;
    float _267 = _257 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_38.w = _259;
    float _269 = _249 * _245;
    float _271 = _251 * _245;
    out.m_40.z = _265;
    out.m_40.w = _267;
    float _273 = fma(_269, 0.5, 0.5);
    float _275 = fma(_271, -0.5, 0.5);
    out.m_42.w = _263;
    out.gl_Position.x = _249;
    out.gl_Position.y = _251;
    out.gl_Position.z = _261;
    out.gl_Position.w = _237;
    out.m_44.x = _273;
    out.m_44.y = _275;
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_24.x;
    float _60 = in.m_24.y;
    float _62 = in.m_24.z;
    float _64 = in.m_24.w;
    float _66 = as_type<float>(int(gl_VertexIndex));
    float _68 = in.m_29.w;
    float _70 = in.m_31.x;
    float _72 = in.m_31.y;
    bool _76 = _62 > 2.0;
    float _78 = _64 * _64;
    bool _80 = _58 > 2.0;
    float _82 = _60 * _60;
    float _84 = _80 ? (-1.0) : 1.0;
    float _86 = _76 ? (-1.0) : 1.0;
    float _88 = _62;
    float _90 = _58;
    if (_76)
    {
        float _92 = _62 + (-10.0);
        _88 = _92;
    }
    float _94 = _88;
    if (_80)
    {
        float _96 = _58 + (-10.0);
        _90 = _96;
    }
    float _98 = _90;
    float _100 = fma(_94, _94, _78);
    float _102 = fma(_98, _98, _82);
    float _104 = sqrt(_100);
    float _106 = sqrt(_102);
    float _108 = -_104;
    float _110 = _108 + 1.0;
    float _112 = _86 * _110;
    float _114 = _94 * _60;
    float _116 = -_106;
    float _118 = _116 + 1.0;
    float _120 = -_114;
    float _122 = fma(_98, _64, _120);
    float _124 = _84 * _118;
    float _126 = _98 * _112;
    float _128 = _122 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _130 = _124 * _64;
    float _132 = -_126;
    float _134 = fma(_124, _94, _132);
    float _136 = -_130;
    float _138 = fma(_112, _60, _136);
    float _140 = _134 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _142 = in.m_29.x;
    float _144 = in.m_29.y;
    float _146 = in.m_29.z;
    float _148 = -_128;
    float _150 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[14].z, _148);
    float _152 = -_140;
    float _154 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[14].y, _152);
    float _156 = _138 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    out.m_34.x = _68;
    float _158 = _150 * _150;
    float _160 = -_156;
    float _162 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[14].x, _160);
    int _165 = as_type<int>(_66) & 1;
    float _167 = fma(_154, _154, _158);
    out.m_36.x = _70;
    float _169 = float(_165);
    float _171 = fma(_162, _162, _167);
    out.m_36.y = _72;
    float _173 = _169 + (-0.5);
    float _175 = rsqrt(_171);
    float _177 = _144 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _179 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].x, _144);
    float _181 = fma(_142, (*spvDescriptorSet0.vp_c3)._m0[12].x, _177);
    float _183 = _179 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _185 = fma(_146, (*spvDescriptorSet0.vp_c3)._m0[12].z, _181);
    float _187 = _175 * _173;
    float _189 = _185 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _191 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].y, _144);
    float _193 = fma(_98, (*spvDescriptorSet0.vp_c4)._m0[0].x, _142);
    float _195 = _187 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _197 = _191 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _199 = fma(_193, (*spvDescriptorSet0.vp_c3)._m0[13].x, _183);
    float _201 = _189 * _195;
    float _203 = _189 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _205 = fma(_150, _201, _144);
    float _207 = fma(_154, _201, _142);
    float _209 = fma(_162, _201, _146);
    float _211 = fma(_98, (*spvDescriptorSet0.vp_c4)._m0[0].y, _142);
    float _213 = _205 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _215 = fma(_124, (*spvDescriptorSet0.vp_c4)._m0[0].x, _146);
    float _217 = precise::min(_203, (*spvDescriptorSet0.vp_c4)._m0[2].w);
    float _219 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[13].x, _197);
    float _221 = fma(_207, (*spvDescriptorSet0.vp_c3)._m0[13].x, _213);
    float _223 = fma(_215, (*spvDescriptorSet0.vp_c3)._m0[13].z, _199);
    float _225 = _205 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _227 = _205 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _229 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[13].z, _221);
    float _231 = _205 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _233 = fma(_207, (*spvDescriptorSet0.vp_c3)._m0[10].x, _225);
    float _235 = fma(_207, (*spvDescriptorSet0.vp_c3)._m0[11].x, _227);
    float _237 = _229 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _239 = fma(_207, (*spvDescriptorSet0.vp_c3)._m0[12].x, _231);
    float _241 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[10].z, _233);
    float _243 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[11].z, _235);
    float _245 = 1.0 / _237;
    float _247 = fma(_124, (*spvDescriptorSet0.vp_c4)._m0[0].y, _146);
    float _249 = _241 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _251 = _243 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _253 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[12].z, _239);
    float _255 = fma(_247, (*spvDescriptorSet0.vp_c3)._m0[13].z, _219);
    float _257 = _217 + 1.0;
    float _259 = _223 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _261 = _253 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _263 = _255 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _265 = _257 * (*spvDescriptorSet0.vp_c4)._m0[0].z;
    float _267 = _257 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_38.w = _259;
    float _269 = _249 * _245;
    float _271 = _251 * _245;
    out.m_40.z = _265;
    out.m_40.w = _267;
    float _273 = fma(_269, 0.5, 0.5);
    float _275 = fma(_271, -0.5, 0.5);
    out.m_42.w = _263;
    out.gl_Position.x = _249;
    out.gl_Position.y = _251;
    out.gl_Position.z = _261;
    out.gl_Position.w = _237;
    out.m_44.x = _273;
    out.m_44.y = _275;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

