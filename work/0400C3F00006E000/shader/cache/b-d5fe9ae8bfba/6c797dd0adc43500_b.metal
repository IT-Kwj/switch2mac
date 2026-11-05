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
    float _74 = in.m_31.z;
    bool _78 = _62 > 2.0;
    float _80 = _64 * _64;
    bool _82 = _58 > 2.0;
    float _84 = _60 * _60;
    float _86 = _82 ? (-1.0) : 1.0;
    float _88 = _78 ? (-1.0) : 1.0;
    float _90 = _62;
    float _92 = _58;
    if (_78)
    {
        float _94 = _62 + (-10.0);
        _90 = _94;
    }
    float _96 = _90;
    if (_82)
    {
        float _98 = _58 + (-10.0);
        _92 = _98;
    }
    float _100 = _92;
    float _102 = fma(_96, _96, _80);
    float _104 = fma(_100, _100, _84);
    float _106 = sqrt(_102);
    float _108 = sqrt(_104);
    float _110 = -_106;
    float _112 = _110 + 1.0;
    float _114 = _88 * _112;
    float _116 = _96 * _60;
    float _118 = -_108;
    float _120 = _118 + 1.0;
    float _122 = -_116;
    float _124 = fma(_100, _64, _122);
    float _126 = _86 * _120;
    float _128 = _100 * _114;
    float _130 = _124 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _132 = _126 * _64;
    float _134 = -_128;
    float _136 = fma(_126, _96, _134);
    float _138 = -_132;
    float _140 = fma(_114, _60, _138);
    float _142 = _136 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _144 = in.m_29.x;
    float _146 = in.m_29.y;
    float _148 = in.m_29.z;
    float _150 = -_130;
    float _152 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[14].z, _150);
    float _154 = -_142;
    float _156 = fma(_124, (*spvDescriptorSet0.vp_c3)._m0[14].y, _154);
    float _158 = _140 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    out.m_34.x = _68;
    float _160 = _152 * _152;
    float _162 = -_158;
    float _164 = fma(_136, (*spvDescriptorSet0.vp_c3)._m0[14].x, _162);
    int _167 = as_type<int>(_66) & 1;
    float _169 = fma(_156, _156, _160);
    out.m_36.x = _70;
    float _171 = float(_167);
    float _173 = fma(_164, _164, _169);
    out.m_36.y = _72;
    float _175 = _171 + (-0.5);
    out.m_36.z = _74;
    float _177 = rsqrt(_173);
    float _179 = _146 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _181 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].x, _146);
    float _183 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[12].x, _179);
    float _185 = _181 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _187 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[12].z, _183);
    float _189 = _177 * _175;
    float _191 = _187 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _193 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].y, _146);
    float _195 = fma(_100, (*spvDescriptorSet0.vp_c4)._m0[0].x, _144);
    float _197 = _189 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _199 = _193 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _201 = fma(_195, (*spvDescriptorSet0.vp_c3)._m0[13].x, _185);
    float _203 = _191 * _197;
    float _205 = _191 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _207 = fma(_152, _203, _146);
    float _209 = fma(_156, _203, _144);
    float _211 = fma(_164, _203, _148);
    float _213 = fma(_100, (*spvDescriptorSet0.vp_c4)._m0[0].y, _144);
    float _215 = _207 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _217 = fma(_126, (*spvDescriptorSet0.vp_c4)._m0[0].x, _148);
    float _219 = precise::min(_205, (*spvDescriptorSet0.vp_c4)._m0[2].w);
    float _221 = fma(_213, (*spvDescriptorSet0.vp_c3)._m0[13].x, _199);
    float _223 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[13].x, _215);
    float _225 = fma(_217, (*spvDescriptorSet0.vp_c3)._m0[13].z, _201);
    float _227 = _207 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _229 = _207 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _231 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[13].z, _223);
    float _233 = _207 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _235 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[10].x, _227);
    float _237 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[11].x, _229);
    float _239 = _231 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _241 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[12].x, _233);
    float _243 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[10].z, _235);
    float _245 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[11].z, _237);
    float _247 = 1.0 / _239;
    float _249 = fma(_126, (*spvDescriptorSet0.vp_c4)._m0[0].y, _148);
    float _251 = _243 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _253 = _245 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _255 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[12].z, _241);
    float _257 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[13].z, _221);
    float _259 = _219 + 1.0;
    float _261 = _225 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _263 = _255 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _265 = _257 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _267 = _259 * (*spvDescriptorSet0.vp_c4)._m0[0].z;
    float _269 = _259 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_38.w = _261;
    float _271 = _251 * _247;
    float _273 = _253 * _247;
    out.m_40.z = _267;
    out.m_40.w = _269;
    float _275 = fma(_271, 0.5, 0.5);
    float _277 = fma(_273, -0.5, 0.5);
    out.m_42.w = _265;
    out.gl_Position.x = _251;
    out.gl_Position.y = _253;
    out.gl_Position.z = _263;
    out.gl_Position.w = _239;
    out.m_44.x = _275;
    out.m_44.y = _277;
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
    float _74 = in.m_31.z;
    bool _78 = _62 > 2.0;
    float _80 = _64 * _64;
    bool _82 = _58 > 2.0;
    float _84 = _60 * _60;
    float _86 = _82 ? (-1.0) : 1.0;
    float _88 = _78 ? (-1.0) : 1.0;
    float _90 = _62;
    float _92 = _58;
    if (_78)
    {
        float _94 = _62 + (-10.0);
        _90 = _94;
    }
    float _96 = _90;
    if (_82)
    {
        float _98 = _58 + (-10.0);
        _92 = _98;
    }
    float _100 = _92;
    float _102 = fma(_96, _96, _80);
    float _104 = fma(_100, _100, _84);
    float _106 = sqrt(_102);
    float _108 = sqrt(_104);
    float _110 = -_106;
    float _112 = _110 + 1.0;
    float _114 = _88 * _112;
    float _116 = _96 * _60;
    float _118 = -_108;
    float _120 = _118 + 1.0;
    float _122 = -_116;
    float _124 = fma(_100, _64, _122);
    float _126 = _86 * _120;
    float _128 = _100 * _114;
    float _130 = _124 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _132 = _126 * _64;
    float _134 = -_128;
    float _136 = fma(_126, _96, _134);
    float _138 = -_132;
    float _140 = fma(_114, _60, _138);
    float _142 = _136 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _144 = in.m_29.x;
    float _146 = in.m_29.y;
    float _148 = in.m_29.z;
    float _150 = -_130;
    float _152 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[14].z, _150);
    float _154 = -_142;
    float _156 = fma(_124, (*spvDescriptorSet0.vp_c3)._m0[14].y, _154);
    float _158 = _140 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    out.m_34.x = _68;
    float _160 = _152 * _152;
    float _162 = -_158;
    float _164 = fma(_136, (*spvDescriptorSet0.vp_c3)._m0[14].x, _162);
    int _167 = as_type<int>(_66) & 1;
    float _169 = fma(_156, _156, _160);
    out.m_36.x = _70;
    float _171 = float(_167);
    float _173 = fma(_164, _164, _169);
    out.m_36.y = _72;
    float _175 = _171 + (-0.5);
    out.m_36.z = _74;
    float _177 = rsqrt(_173);
    float _179 = _146 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _181 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].x, _146);
    float _183 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[12].x, _179);
    float _185 = _181 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _187 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[12].z, _183);
    float _189 = _177 * _175;
    float _191 = _187 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _193 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].y, _146);
    float _195 = fma(_100, (*spvDescriptorSet0.vp_c4)._m0[0].x, _144);
    float _197 = _189 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _199 = _193 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _201 = fma(_195, (*spvDescriptorSet0.vp_c3)._m0[13].x, _185);
    float _203 = _191 * _197;
    float _205 = _191 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _207 = fma(_152, _203, _146);
    float _209 = fma(_156, _203, _144);
    float _211 = fma(_164, _203, _148);
    float _213 = fma(_100, (*spvDescriptorSet0.vp_c4)._m0[0].y, _144);
    float _215 = _207 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _217 = fma(_126, (*spvDescriptorSet0.vp_c4)._m0[0].x, _148);
    float _219 = precise::min(_205, (*spvDescriptorSet0.vp_c4)._m0[2].w);
    float _221 = fma(_213, (*spvDescriptorSet0.vp_c3)._m0[13].x, _199);
    float _223 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[13].x, _215);
    float _225 = fma(_217, (*spvDescriptorSet0.vp_c3)._m0[13].z, _201);
    float _227 = _207 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _229 = _207 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _231 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[13].z, _223);
    float _233 = _207 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _235 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[10].x, _227);
    float _237 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[11].x, _229);
    float _239 = _231 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _241 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[12].x, _233);
    float _243 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[10].z, _235);
    float _245 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[11].z, _237);
    float _247 = 1.0 / _239;
    float _249 = fma(_126, (*spvDescriptorSet0.vp_c4)._m0[0].y, _148);
    float _251 = _243 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _253 = _245 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _255 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[12].z, _241);
    float _257 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[13].z, _221);
    float _259 = _219 + 1.0;
    float _261 = _225 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _263 = _255 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _265 = _257 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _267 = _259 * (*spvDescriptorSet0.vp_c4)._m0[0].z;
    float _269 = _259 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_38.w = _261;
    float _271 = _251 * _247;
    float _273 = _253 * _247;
    out.m_40.z = _267;
    out.m_40.w = _269;
    float _275 = fma(_271, 0.5, 0.5);
    float _277 = fma(_273, -0.5, 0.5);
    out.m_42.w = _265;
    out.gl_Position.x = _251;
    out.gl_Position.y = _253;
    out.gl_Position.z = _263;
    out.gl_Position.w = _239;
    out.m_44.x = _275;
    out.m_44.y = _277;
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
    float _74 = in.m_31.z;
    bool _78 = _62 > 2.0;
    float _80 = _64 * _64;
    bool _82 = _58 > 2.0;
    float _84 = _60 * _60;
    float _86 = _82 ? (-1.0) : 1.0;
    float _88 = _78 ? (-1.0) : 1.0;
    float _90 = _62;
    float _92 = _58;
    if (_78)
    {
        float _94 = _62 + (-10.0);
        _90 = _94;
    }
    float _96 = _90;
    if (_82)
    {
        float _98 = _58 + (-10.0);
        _92 = _98;
    }
    float _100 = _92;
    float _102 = fma(_96, _96, _80);
    float _104 = fma(_100, _100, _84);
    float _106 = sqrt(_102);
    float _108 = sqrt(_104);
    float _110 = -_106;
    float _112 = _110 + 1.0;
    float _114 = _88 * _112;
    float _116 = _96 * _60;
    float _118 = -_108;
    float _120 = _118 + 1.0;
    float _122 = -_116;
    float _124 = fma(_100, _64, _122);
    float _126 = _86 * _120;
    float _128 = _100 * _114;
    float _130 = _124 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _132 = _126 * _64;
    float _134 = -_128;
    float _136 = fma(_126, _96, _134);
    float _138 = -_132;
    float _140 = fma(_114, _60, _138);
    float _142 = _136 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _144 = in.m_29.x;
    float _146 = in.m_29.y;
    float _148 = in.m_29.z;
    float _150 = -_130;
    float _152 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[14].z, _150);
    float _154 = -_142;
    float _156 = fma(_124, (*spvDescriptorSet0.vp_c3)._m0[14].y, _154);
    float _158 = _140 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    out.m_34.x = _68;
    float _160 = _152 * _152;
    float _162 = -_158;
    float _164 = fma(_136, (*spvDescriptorSet0.vp_c3)._m0[14].x, _162);
    int _167 = as_type<int>(_66) & 1;
    float _169 = fma(_156, _156, _160);
    out.m_36.x = _70;
    float _171 = float(_167);
    float _173 = fma(_164, _164, _169);
    out.m_36.y = _72;
    float _175 = _171 + (-0.5);
    out.m_36.z = _74;
    float _177 = rsqrt(_173);
    float _179 = _146 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _181 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].x, _146);
    float _183 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[12].x, _179);
    float _185 = _181 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _187 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[12].z, _183);
    float _189 = _177 * _175;
    float _191 = _187 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _193 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].y, _146);
    float _195 = fma(_100, (*spvDescriptorSet0.vp_c4)._m0[0].x, _144);
    float _197 = _189 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _199 = _193 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _201 = fma(_195, (*spvDescriptorSet0.vp_c3)._m0[13].x, _185);
    float _203 = _191 * _197;
    float _205 = _191 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _207 = fma(_152, _203, _146);
    float _209 = fma(_156, _203, _144);
    float _211 = fma(_164, _203, _148);
    float _213 = fma(_100, (*spvDescriptorSet0.vp_c4)._m0[0].y, _144);
    float _215 = _207 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _217 = fma(_126, (*spvDescriptorSet0.vp_c4)._m0[0].x, _148);
    float _219 = precise::min(_205, (*spvDescriptorSet0.vp_c4)._m0[2].w);
    float _221 = fma(_213, (*spvDescriptorSet0.vp_c3)._m0[13].x, _199);
    float _223 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[13].x, _215);
    float _225 = fma(_217, (*spvDescriptorSet0.vp_c3)._m0[13].z, _201);
    float _227 = _207 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _229 = _207 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _231 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[13].z, _223);
    float _233 = _207 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _235 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[10].x, _227);
    float _237 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[11].x, _229);
    float _239 = _231 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _241 = fma(_209, (*spvDescriptorSet0.vp_c3)._m0[12].x, _233);
    float _243 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[10].z, _235);
    float _245 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[11].z, _237);
    float _247 = 1.0 / _239;
    float _249 = fma(_126, (*spvDescriptorSet0.vp_c4)._m0[0].y, _148);
    float _251 = _243 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _253 = _245 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _255 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[12].z, _241);
    float _257 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[13].z, _221);
    float _259 = _219 + 1.0;
    float _261 = _225 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _263 = _255 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _265 = _257 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _267 = _259 * (*spvDescriptorSet0.vp_c4)._m0[0].z;
    float _269 = _259 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_38.w = _261;
    float _271 = _251 * _247;
    float _273 = _253 * _247;
    out.m_40.z = _267;
    out.m_40.w = _269;
    float _275 = fma(_271, 0.5, 0.5);
    float _277 = fma(_273, -0.5, 0.5);
    out.m_42.w = _265;
    out.gl_Position.x = _251;
    out.gl_Position.y = _253;
    out.gl_Position.z = _263;
    out.gl_Position.w = _239;
    out.m_44.x = _275;
    out.m_44.y = _277;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

