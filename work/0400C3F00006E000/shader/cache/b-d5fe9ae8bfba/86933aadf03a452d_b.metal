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
    float4 m_46 [[user(locn0)]];
    float4 m_40 [[user(locn1)]];
    float4 m_36 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 m_34 [[user(locn4)]];
    float4 m_38 [[user(locn5)]];
    float4 m_42 [[user(locn7)]];
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _70 = in.m_29.w;
    float _72 = in.m_31.x;
    float _74 = in.m_31.y;
    float _76 = in.m_31.z;
    bool _80 = _64 > 2.0;
    float _82 = _66 * _66;
    bool _84 = _60 > 2.0;
    float _86 = _62 * _62;
    float _88 = _84 ? (-1.0) : 1.0;
    float _90 = _80 ? (-1.0) : 1.0;
    float _92 = _64;
    float _94 = _60;
    if (_80)
    {
        float _96 = _64 + (-10.0);
        _92 = _96;
    }
    float _98 = _92;
    if (_84)
    {
        float _100 = _60 + (-10.0);
        _94 = _100;
    }
    float _102 = _94;
    float _104 = fma(_98, _98, _82);
    float _106 = _98 * _62;
    float _108 = fma(_102, _102, _86);
    float _110 = sqrt(_104);
    float _112 = sqrt(_108);
    float _114 = -_110;
    float _116 = _114 + 1.0;
    float _118 = _90 * _116;
    float _120 = -_112;
    float _122 = _120 + 1.0;
    float _124 = _88 * _122;
    float _126 = _102 * _118;
    float _128 = -_106;
    float _130 = fma(_102, _66, _128);
    float _132 = _124 * _66;
    float _134 = -_126;
    float _136 = fma(_124, _98, _134);
    float _138 = _130 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _140 = _66 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _142 = -_132;
    float _144 = fma(_118, _62, _142);
    float _146 = _136 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _148 = in.m_29.x;
    float _150 = in.m_29.y;
    float _152 = in.m_29.z;
    float _154 = fma(_98, (*spvDescriptorSet0.vp_c3)._m0[15].x, _140);
    float _156 = -_138;
    float _158 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[14].z, _156);
    float _160 = -_146;
    float _162 = fma(_130, (*spvDescriptorSet0.vp_c3)._m0[14].y, _160);
    float _164 = _144 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    int _167 = as_type<int>(_68) & 1;
    float _169 = _158 * _158;
    float _171 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[15].z, _154);
    float _173 = -_164;
    float _175 = fma(_136, (*spvDescriptorSet0.vp_c3)._m0[14].x, _173);
    float _177 = float(_167);
    float _179 = fma(_162, _162, _169);
    float _181 = _136 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    out.m_34.z = _171;
    float _183 = fma(_175, _175, _179);
    float _185 = _177 + (-0.5);
    float _187 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[15].x, _181);
    out.m_36.x = _70;
    float _189 = rsqrt(_183);
    float _191 = fma(_130, (*spvDescriptorSet0.vp_c3)._m0[15].z, _187);
    out.m_38.x = _72;
    float _193 = _150 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    out.m_38.y = _74;
    float _195 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[12].x, _193);
    out.m_38.z = _76;
    float _197 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[12].z, _195);
    out.m_34.x = _191;
    float _199 = _189 * _185;
    float _201 = _197 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _203 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[0].x, _150);
    float _205 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[0].y, _150);
    float _207 = _199 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _209 = _203 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _211 = _205 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _213 = _201 * _207;
    float _215 = fma(_102, (*spvDescriptorSet0.vp_c4)._m0[0].x, _148);
    float _217 = fma(_102, (*spvDescriptorSet0.vp_c4)._m0[0].y, _148);
    float _219 = _201 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _221 = fma(_158, _213, _150);
    float _223 = fma(_162, _213, _148);
    float _225 = fma(_175, _213, _152);
    float _227 = fma(_217, (*spvDescriptorSet0.vp_c3)._m0[13].x, _211);
    float _229 = _221 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _231 = fma(_215, (*spvDescriptorSet0.vp_c3)._m0[13].x, _209);
    float _233 = fma(_124, (*spvDescriptorSet0.vp_c4)._m0[0].x, _152);
    float _235 = fma(_124, (*spvDescriptorSet0.vp_c4)._m0[0].y, _152);
    float _237 = fma(_223, (*spvDescriptorSet0.vp_c3)._m0[13].x, _229);
    float _239 = _221 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _241 = precise::min(_219, (*spvDescriptorSet0.vp_c4)._m0[2].w);
    float _243 = fma(_235, (*spvDescriptorSet0.vp_c3)._m0[13].z, _227);
    float _245 = fma(_225, (*spvDescriptorSet0.vp_c3)._m0[13].z, _237);
    float _247 = fma(_233, (*spvDescriptorSet0.vp_c3)._m0[13].z, _231);
    float _249 = _221 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _251 = fma(_223, (*spvDescriptorSet0.vp_c3)._m0[11].x, _239);
    float _253 = _245 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _255 = _221 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _257 = fma(_223, (*spvDescriptorSet0.vp_c3)._m0[10].x, _249);
    float _259 = fma(_225, (*spvDescriptorSet0.vp_c3)._m0[11].z, _251);
    float _261 = 1.0 / _253;
    float _263 = _241 + 1.0;
    float _265 = fma(_225, (*spvDescriptorSet0.vp_c3)._m0[10].z, _257);
    float _267 = fma(_223, (*spvDescriptorSet0.vp_c3)._m0[12].x, _255);
    float _269 = _259 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _271 = _263 * (*spvDescriptorSet0.vp_c4)._m0[0].z;
    float _273 = _265 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _275 = _263 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _277 = fma(_225, (*spvDescriptorSet0.vp_c3)._m0[12].z, _267);
    float _279 = _247 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _281 = _243 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.m_40.z = _271;
    out.m_40.w = _275;
    float _283 = _277 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _285 = _273 * _261;
    float _287 = _269 * _261;
    out.m_42.w = _279;
    float _289 = fma(_285, 0.5, 0.5);
    float _291 = fma(_287, -0.5, 0.5);
    out.m_44.w = _281;
    out.gl_Position.x = _273;
    out.gl_Position.y = _269;
    out.gl_Position.z = _283;
    out.gl_Position.w = _253;
    out.m_46.x = _289;
    out.m_46.y = _291;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _70 = in.m_29.w;
    float _72 = in.m_31.x;
    float _74 = in.m_31.y;
    float _76 = in.m_31.z;
    bool _80 = _64 > 2.0;
    float _82 = _66 * _66;
    bool _84 = _60 > 2.0;
    float _86 = _62 * _62;
    float _88 = _84 ? (-1.0) : 1.0;
    float _90 = _80 ? (-1.0) : 1.0;
    float _92 = _64;
    float _94 = _60;
    if (_80)
    {
        float _96 = _64 + (-10.0);
        _92 = _96;
    }
    float _98 = _92;
    if (_84)
    {
        float _100 = _60 + (-10.0);
        _94 = _100;
    }
    float _102 = _94;
    float _104 = fma(_98, _98, _82);
    float _106 = _98 * _62;
    float _108 = fma(_102, _102, _86);
    float _110 = sqrt(_104);
    float _112 = sqrt(_108);
    float _114 = -_110;
    float _116 = _114 + 1.0;
    float _118 = _90 * _116;
    float _120 = -_112;
    float _122 = _120 + 1.0;
    float _124 = _88 * _122;
    float _126 = _102 * _118;
    float _128 = -_106;
    float _130 = fma(_102, _66, _128);
    float _132 = _124 * _66;
    float _134 = -_126;
    float _136 = fma(_124, _98, _134);
    float _138 = _130 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _140 = _66 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _142 = -_132;
    float _144 = fma(_118, _62, _142);
    float _146 = _136 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _148 = in.m_29.x;
    float _150 = in.m_29.y;
    float _152 = in.m_29.z;
    float _154 = fma(_98, (*spvDescriptorSet0.vp_c3)._m0[15].x, _140);
    float _156 = -_138;
    float _158 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[14].z, _156);
    float _160 = -_146;
    float _162 = fma(_130, (*spvDescriptorSet0.vp_c3)._m0[14].y, _160);
    float _164 = _144 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    int _167 = as_type<int>(_68) & 1;
    float _169 = _158 * _158;
    float _171 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[15].z, _154);
    float _173 = -_164;
    float _175 = fma(_136, (*spvDescriptorSet0.vp_c3)._m0[14].x, _173);
    float _177 = float(_167);
    float _179 = fma(_162, _162, _169);
    float _181 = _136 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    out.m_34.z = _171;
    float _183 = fma(_175, _175, _179);
    float _185 = _177 + (-0.5);
    float _187 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[15].x, _181);
    out.m_36.x = _70;
    float _189 = rsqrt(_183);
    float _191 = fma(_130, (*spvDescriptorSet0.vp_c3)._m0[15].z, _187);
    out.m_38.x = _72;
    float _193 = _150 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    out.m_38.y = _74;
    float _195 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[12].x, _193);
    out.m_38.z = _76;
    float _197 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[12].z, _195);
    out.m_34.x = _191;
    float _199 = _189 * _185;
    float _201 = _197 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _203 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[0].x, _150);
    float _205 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[0].y, _150);
    float _207 = _199 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _209 = _203 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _211 = _205 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _213 = _201 * _207;
    float _215 = fma(_102, (*spvDescriptorSet0.vp_c4)._m0[0].x, _148);
    float _217 = fma(_102, (*spvDescriptorSet0.vp_c4)._m0[0].y, _148);
    float _219 = _201 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _221 = fma(_158, _213, _150);
    float _223 = fma(_162, _213, _148);
    float _225 = fma(_175, _213, _152);
    float _227 = fma(_217, (*spvDescriptorSet0.vp_c3)._m0[13].x, _211);
    float _229 = _221 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _231 = fma(_215, (*spvDescriptorSet0.vp_c3)._m0[13].x, _209);
    float _233 = fma(_124, (*spvDescriptorSet0.vp_c4)._m0[0].x, _152);
    float _235 = fma(_124, (*spvDescriptorSet0.vp_c4)._m0[0].y, _152);
    float _237 = fma(_223, (*spvDescriptorSet0.vp_c3)._m0[13].x, _229);
    float _239 = _221 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _241 = precise::min(_219, (*spvDescriptorSet0.vp_c4)._m0[2].w);
    float _243 = fma(_235, (*spvDescriptorSet0.vp_c3)._m0[13].z, _227);
    float _245 = fma(_225, (*spvDescriptorSet0.vp_c3)._m0[13].z, _237);
    float _247 = fma(_233, (*spvDescriptorSet0.vp_c3)._m0[13].z, _231);
    float _249 = _221 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _251 = fma(_223, (*spvDescriptorSet0.vp_c3)._m0[11].x, _239);
    float _253 = _245 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _255 = _221 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _257 = fma(_223, (*spvDescriptorSet0.vp_c3)._m0[10].x, _249);
    float _259 = fma(_225, (*spvDescriptorSet0.vp_c3)._m0[11].z, _251);
    float _261 = 1.0 / _253;
    float _263 = _241 + 1.0;
    float _265 = fma(_225, (*spvDescriptorSet0.vp_c3)._m0[10].z, _257);
    float _267 = fma(_223, (*spvDescriptorSet0.vp_c3)._m0[12].x, _255);
    float _269 = _259 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _271 = _263 * (*spvDescriptorSet0.vp_c4)._m0[0].z;
    float _273 = _265 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _275 = _263 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _277 = fma(_225, (*spvDescriptorSet0.vp_c3)._m0[12].z, _267);
    float _279 = _247 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _281 = _243 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.m_40.z = _271;
    out.m_40.w = _275;
    float _283 = _277 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _285 = _273 * _261;
    float _287 = _269 * _261;
    out.m_42.w = _279;
    float _289 = fma(_285, 0.5, 0.5);
    float _291 = fma(_287, -0.5, 0.5);
    out.m_44.w = _281;
    out.gl_Position.x = _273;
    out.gl_Position.y = _269;
    out.gl_Position.z = _283;
    out.gl_Position.w = _253;
    out.m_46.x = _289;
    out.m_46.y = _291;
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _70 = in.m_29.w;
    float _72 = in.m_31.x;
    float _74 = in.m_31.y;
    float _76 = in.m_31.z;
    bool _80 = _64 > 2.0;
    float _82 = _66 * _66;
    bool _84 = _60 > 2.0;
    float _86 = _62 * _62;
    float _88 = _84 ? (-1.0) : 1.0;
    float _90 = _80 ? (-1.0) : 1.0;
    float _92 = _64;
    float _94 = _60;
    if (_80)
    {
        float _96 = _64 + (-10.0);
        _92 = _96;
    }
    float _98 = _92;
    if (_84)
    {
        float _100 = _60 + (-10.0);
        _94 = _100;
    }
    float _102 = _94;
    float _104 = fma(_98, _98, _82);
    float _106 = _98 * _62;
    float _108 = fma(_102, _102, _86);
    float _110 = sqrt(_104);
    float _112 = sqrt(_108);
    float _114 = -_110;
    float _116 = _114 + 1.0;
    float _118 = _90 * _116;
    float _120 = -_112;
    float _122 = _120 + 1.0;
    float _124 = _88 * _122;
    float _126 = _102 * _118;
    float _128 = -_106;
    float _130 = fma(_102, _66, _128);
    float _132 = _124 * _66;
    float _134 = -_126;
    float _136 = fma(_124, _98, _134);
    float _138 = _130 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _140 = _66 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _142 = -_132;
    float _144 = fma(_118, _62, _142);
    float _146 = _136 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _148 = in.m_29.x;
    float _150 = in.m_29.y;
    float _152 = in.m_29.z;
    float _154 = fma(_98, (*spvDescriptorSet0.vp_c3)._m0[15].x, _140);
    float _156 = -_138;
    float _158 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[14].z, _156);
    float _160 = -_146;
    float _162 = fma(_130, (*spvDescriptorSet0.vp_c3)._m0[14].y, _160);
    float _164 = _144 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    int _167 = as_type<int>(_68) & 1;
    float _169 = _158 * _158;
    float _171 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[15].z, _154);
    float _173 = -_164;
    float _175 = fma(_136, (*spvDescriptorSet0.vp_c3)._m0[14].x, _173);
    float _177 = float(_167);
    float _179 = fma(_162, _162, _169);
    float _181 = _136 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    out.m_34.z = _171;
    float _183 = fma(_175, _175, _179);
    float _185 = _177 + (-0.5);
    float _187 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[15].x, _181);
    out.m_36.x = _70;
    float _189 = rsqrt(_183);
    float _191 = fma(_130, (*spvDescriptorSet0.vp_c3)._m0[15].z, _187);
    out.m_38.x = _72;
    float _193 = _150 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    out.m_38.y = _74;
    float _195 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[12].x, _193);
    out.m_38.z = _76;
    float _197 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[12].z, _195);
    out.m_34.x = _191;
    float _199 = _189 * _185;
    float _201 = _197 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _203 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[0].x, _150);
    float _205 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[0].y, _150);
    float _207 = _199 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _209 = _203 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _211 = _205 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _213 = _201 * _207;
    float _215 = fma(_102, (*spvDescriptorSet0.vp_c4)._m0[0].x, _148);
    float _217 = fma(_102, (*spvDescriptorSet0.vp_c4)._m0[0].y, _148);
    float _219 = _201 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _221 = fma(_158, _213, _150);
    float _223 = fma(_162, _213, _148);
    float _225 = fma(_175, _213, _152);
    float _227 = fma(_217, (*spvDescriptorSet0.vp_c3)._m0[13].x, _211);
    float _229 = _221 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _231 = fma(_215, (*spvDescriptorSet0.vp_c3)._m0[13].x, _209);
    float _233 = fma(_124, (*spvDescriptorSet0.vp_c4)._m0[0].x, _152);
    float _235 = fma(_124, (*spvDescriptorSet0.vp_c4)._m0[0].y, _152);
    float _237 = fma(_223, (*spvDescriptorSet0.vp_c3)._m0[13].x, _229);
    float _239 = _221 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _241 = precise::min(_219, (*spvDescriptorSet0.vp_c4)._m0[2].w);
    float _243 = fma(_235, (*spvDescriptorSet0.vp_c3)._m0[13].z, _227);
    float _245 = fma(_225, (*spvDescriptorSet0.vp_c3)._m0[13].z, _237);
    float _247 = fma(_233, (*spvDescriptorSet0.vp_c3)._m0[13].z, _231);
    float _249 = _221 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _251 = fma(_223, (*spvDescriptorSet0.vp_c3)._m0[11].x, _239);
    float _253 = _245 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _255 = _221 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _257 = fma(_223, (*spvDescriptorSet0.vp_c3)._m0[10].x, _249);
    float _259 = fma(_225, (*spvDescriptorSet0.vp_c3)._m0[11].z, _251);
    float _261 = 1.0 / _253;
    float _263 = _241 + 1.0;
    float _265 = fma(_225, (*spvDescriptorSet0.vp_c3)._m0[10].z, _257);
    float _267 = fma(_223, (*spvDescriptorSet0.vp_c3)._m0[12].x, _255);
    float _269 = _259 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _271 = _263 * (*spvDescriptorSet0.vp_c4)._m0[0].z;
    float _273 = _265 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _275 = _263 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _277 = fma(_225, (*spvDescriptorSet0.vp_c3)._m0[12].z, _267);
    float _279 = _247 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _281 = _243 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.m_40.z = _271;
    out.m_40.w = _275;
    float _283 = _277 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _285 = _273 * _261;
    float _287 = _269 * _261;
    out.m_42.w = _279;
    float _289 = fma(_285, 0.5, 0.5);
    float _291 = fma(_287, -0.5, 0.5);
    out.m_44.w = _281;
    out.gl_Position.x = _273;
    out.gl_Position.y = _269;
    out.gl_Position.z = _283;
    out.gl_Position.w = _253;
    out.m_46.x = _289;
    out.m_46.y = _291;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

