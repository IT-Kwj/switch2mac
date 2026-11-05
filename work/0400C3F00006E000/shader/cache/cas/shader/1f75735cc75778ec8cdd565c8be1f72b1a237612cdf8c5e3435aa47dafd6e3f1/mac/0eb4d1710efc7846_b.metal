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
    float4 m_32 [[user(locn1)]];
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
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _46 = in.m_24.x;
    float _48 = in.m_24.y;
    float _50 = in.m_24.z;
    float _52 = in.m_24.w;
    bool _56 = _46 > 2.0;
    float _58 = _48 * _48;
    bool _60 = _50 > 2.0;
    float _62 = _52 * _52;
    float _64 = _56 ? (-1.0) : 1.0;
    float _66 = _60 ? (-1.0) : 1.0;
    float _68 = _46;
    float _70 = _50;
    if (_56)
    {
        float _72 = _46 + (-10.0);
        _68 = _72;
    }
    float _74 = _68;
    if (_60)
    {
        float _76 = _50 + (-10.0);
        _70 = _76;
    }
    float _78 = _70;
    float _80 = fma(_74, _74, _58);
    float _82 = fma(_78, _78, _62);
    float _84 = sqrt(_80);
    float _86 = sqrt(_82);
    float _88 = -_84;
    float _90 = _88 + 1.0;
    float _92 = _64 * _90;
    float _94 = -_86;
    float _96 = _94 + 1.0;
    float _98 = _92 * _52;
    float _100 = _66 * _96;
    float _102 = _78 * _48;
    float _104 = _74 * _100;
    float _106 = -_102;
    float _108 = fma(_74, _52, _106);
    float _110 = -_98;
    float _112 = fma(_100, _48, _110);
    float _114 = as_type<float>(int(gl_VertexIndex));
    float _116 = -_104;
    float _118 = fma(_92, _78, _116);
    float _120 = _108 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _122 = in.m_29.x;
    float _124 = in.m_29.y;
    float _126 = in.m_29.z;
    float _128 = _118 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _130 = -_120;
    float _132 = fma(_112, (*spvDescriptorSet0.vp_c3)._m0[14].z, _130);
    float _134 = -_128;
    float _136 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[14].y, _134);
    float _138 = _112 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _140 = _132 * _132;
    float _142 = -_138;
    float _144 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[14].x, _142);
    float _146 = fma(_136, _136, _140);
    float _148 = fma(_144, _144, _146);
    int _151 = as_type<int>(_114) & 1;
    float _153 = rsqrt(_148);
    float _155 = float(_151);
    float _157 = _124 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _159 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[12].x, _157);
    float _161 = _155 + (-0.5);
    float _163 = fma(_126, (*spvDescriptorSet0.vp_c3)._m0[12].z, _159);
    float _165 = _153 * _161;
    float _167 = _163 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _169 = _165 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _171 = _167 * _169;
    float _173 = in.m_29.w;
    float _175 = fma(_132, _171, _124);
    float _177 = fma(_136, _171, _122);
    float _179 = fma(_144, _171, _126);
    float _181 = _175 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _183 = _175 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _185 = _175 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _187 = _175 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _189 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[10].x, _181);
    float _191 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[11].x, _183);
    float _193 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[12].x, _185);
    float _195 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[13].x, _187);
    float _197 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[10].z, _189);
    float _199 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[11].z, _191);
    float _201 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[12].z, _193);
    float _203 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[13].z, _195);
    float _205 = _197 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _207 = _199 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _209 = _201 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _211 = _203 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.m_32.x = _173;
    out.gl_Position.x = _205;
    out.gl_Position.y = _207;
    out.gl_Position.z = _209;
    out.gl_Position.w = _211;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _46 = in.m_24.x;
    float _48 = in.m_24.y;
    float _50 = in.m_24.z;
    float _52 = in.m_24.w;
    bool _56 = _46 > 2.0;
    float _58 = _48 * _48;
    bool _60 = _50 > 2.0;
    float _62 = _52 * _52;
    float _64 = _56 ? (-1.0) : 1.0;
    float _66 = _60 ? (-1.0) : 1.0;
    float _68 = _46;
    float _70 = _50;
    if (_56)
    {
        float _72 = _46 + (-10.0);
        _68 = _72;
    }
    float _74 = _68;
    if (_60)
    {
        float _76 = _50 + (-10.0);
        _70 = _76;
    }
    float _78 = _70;
    float _80 = fma(_74, _74, _58);
    float _82 = fma(_78, _78, _62);
    float _84 = sqrt(_80);
    float _86 = sqrt(_82);
    float _88 = -_84;
    float _90 = _88 + 1.0;
    float _92 = _64 * _90;
    float _94 = -_86;
    float _96 = _94 + 1.0;
    float _98 = _92 * _52;
    float _100 = _66 * _96;
    float _102 = _78 * _48;
    float _104 = _74 * _100;
    float _106 = -_102;
    float _108 = fma(_74, _52, _106);
    float _110 = -_98;
    float _112 = fma(_100, _48, _110);
    float _114 = as_type<float>(int(gl_VertexIndex));
    float _116 = -_104;
    float _118 = fma(_92, _78, _116);
    float _120 = _108 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _122 = in.m_29.x;
    float _124 = in.m_29.y;
    float _126 = in.m_29.z;
    float _128 = _118 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _130 = -_120;
    float _132 = fma(_112, (*spvDescriptorSet0.vp_c3)._m0[14].z, _130);
    float _134 = -_128;
    float _136 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[14].y, _134);
    float _138 = _112 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _140 = _132 * _132;
    float _142 = -_138;
    float _144 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[14].x, _142);
    float _146 = fma(_136, _136, _140);
    float _148 = fma(_144, _144, _146);
    int _151 = as_type<int>(_114) & 1;
    float _153 = rsqrt(_148);
    float _155 = float(_151);
    float _157 = _124 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _159 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[12].x, _157);
    float _161 = _155 + (-0.5);
    float _163 = fma(_126, (*spvDescriptorSet0.vp_c3)._m0[12].z, _159);
    float _165 = _153 * _161;
    float _167 = _163 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _169 = _165 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _171 = _167 * _169;
    float _173 = in.m_29.w;
    float _175 = fma(_132, _171, _124);
    float _177 = fma(_136, _171, _122);
    float _179 = fma(_144, _171, _126);
    float _181 = _175 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _183 = _175 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _185 = _175 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _187 = _175 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _189 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[10].x, _181);
    float _191 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[11].x, _183);
    float _193 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[12].x, _185);
    float _195 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[13].x, _187);
    float _197 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[10].z, _189);
    float _199 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[11].z, _191);
    float _201 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[12].z, _193);
    float _203 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[13].z, _195);
    float _205 = _197 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _207 = _199 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _209 = _201 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _211 = _203 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.m_32.x = _173;
    out.gl_Position.x = _205;
    out.gl_Position.y = _207;
    out.gl_Position.z = _209;
    out.gl_Position.w = _211;
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
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _46 = in.m_24.x;
    float _48 = in.m_24.y;
    float _50 = in.m_24.z;
    float _52 = in.m_24.w;
    bool _56 = _46 > 2.0;
    float _58 = _48 * _48;
    bool _60 = _50 > 2.0;
    float _62 = _52 * _52;
    float _64 = _56 ? (-1.0) : 1.0;
    float _66 = _60 ? (-1.0) : 1.0;
    float _68 = _46;
    float _70 = _50;
    if (_56)
    {
        float _72 = _46 + (-10.0);
        _68 = _72;
    }
    float _74 = _68;
    if (_60)
    {
        float _76 = _50 + (-10.0);
        _70 = _76;
    }
    float _78 = _70;
    float _80 = fma(_74, _74, _58);
    float _82 = fma(_78, _78, _62);
    float _84 = sqrt(_80);
    float _86 = sqrt(_82);
    float _88 = -_84;
    float _90 = _88 + 1.0;
    float _92 = _64 * _90;
    float _94 = -_86;
    float _96 = _94 + 1.0;
    float _98 = _92 * _52;
    float _100 = _66 * _96;
    float _102 = _78 * _48;
    float _104 = _74 * _100;
    float _106 = -_102;
    float _108 = fma(_74, _52, _106);
    float _110 = -_98;
    float _112 = fma(_100, _48, _110);
    float _114 = as_type<float>(int(gl_VertexIndex));
    float _116 = -_104;
    float _118 = fma(_92, _78, _116);
    float _120 = _108 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _122 = in.m_29.x;
    float _124 = in.m_29.y;
    float _126 = in.m_29.z;
    float _128 = _118 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _130 = -_120;
    float _132 = fma(_112, (*spvDescriptorSet0.vp_c3)._m0[14].z, _130);
    float _134 = -_128;
    float _136 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[14].y, _134);
    float _138 = _112 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _140 = _132 * _132;
    float _142 = -_138;
    float _144 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[14].x, _142);
    float _146 = fma(_136, _136, _140);
    float _148 = fma(_144, _144, _146);
    int _151 = as_type<int>(_114) & 1;
    float _153 = rsqrt(_148);
    float _155 = float(_151);
    float _157 = _124 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _159 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[12].x, _157);
    float _161 = _155 + (-0.5);
    float _163 = fma(_126, (*spvDescriptorSet0.vp_c3)._m0[12].z, _159);
    float _165 = _153 * _161;
    float _167 = _163 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _169 = _165 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _171 = _167 * _169;
    float _173 = in.m_29.w;
    float _175 = fma(_132, _171, _124);
    float _177 = fma(_136, _171, _122);
    float _179 = fma(_144, _171, _126);
    float _181 = _175 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _183 = _175 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _185 = _175 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _187 = _175 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _189 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[10].x, _181);
    float _191 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[11].x, _183);
    float _193 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[12].x, _185);
    float _195 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[13].x, _187);
    float _197 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[10].z, _189);
    float _199 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[11].z, _191);
    float _201 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[12].z, _193);
    float _203 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[13].z, _195);
    float _205 = _197 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _207 = _199 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _209 = _201 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _211 = _203 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.m_32.x = _173;
    out.gl_Position.x = _205;
    out.gl_Position.y = _207;
    out.gl_Position.z = _209;
    out.gl_Position.w = _211;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_32.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_32.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_32.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_32.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

