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
    float4 m_32 [[user(locn1)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(0)]];
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
    float _54 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _56 = in.m_26.w;
    bool _60 = _50 > 2.0;
    float _62 = _52 * _52;
    bool _64 = _46 > 2.0;
    float _66 = _48 * _48;
    float _68 = _64 ? (-1.0) : 1.0;
    float _70 = _60 ? (-1.0) : 1.0;
    float _72 = _50;
    float _74 = _46;
    if (_60)
    {
        float _76 = _50 + (-10.0);
        _72 = _76;
    }
    float _78 = _72;
    if (_64)
    {
        float _80 = _46 + (-10.0);
        _74 = _80;
    }
    float _82 = _74;
    bool _84 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _86 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _88 = _84 || _86;
    bool _90 = isnan(8.0);
    bool _92 = _88 || _90;
    float _94 = fma(_78, _78, _62);
    float _96 = _48 * _78;
    float _98 = fma(_82, _82, _66);
    float _100 = -_96;
    float _102 = fma(_52, _82, _100);
    float _104 = sqrt(_94);
    float _106 = sqrt(_98);
    float _108 = -_104;
    float _110 = _108 + 1.0;
    float _112 = _70 * _110;
    float _114 = as_type<float>(int(gl_VertexIndex));
    float _116 = -_106;
    float _118 = _116 + 1.0;
    float _120 = _112 * _82;
    float _122 = _68 * _118;
    float _124 = _122 * _52;
    float _126 = -_120;
    float _128 = fma(_122, _78, _126);
    float _130 = _102 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _132 = -_124;
    float _134 = fma(_112, _48, _132);
    float _136 = _128 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _138 = in.m_26.x;
    float _140 = in.m_26.y;
    float _142 = in.m_26.z;
    float _144 = -_130;
    float _146 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[14].z, _144);
    float _148 = -_136;
    float _150 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[14].y, _148);
    float _152 = _134 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _154 = _134;
    if (!_92)
    {
        _154 = (*spvDescriptorSet0.vp_c4)._m0[1].y;
    }
    float _156 = _154;
    float _158 = _146 * _146;
    float _160 = -_152;
    float _162 = fma(_128, (*spvDescriptorSet0.vp_c3)._m0[14].x, _160);
    float _164 = float(as_type<int>(_114));
    float _166 = fma(_150, _150, _158);
    float _168 = _156;
    if (!_92)
    {
        float _170 = _156 * 0.5;
        _168 = _170;
    }
    float _172 = _168;
    int _175 = as_type<int>(_114) & 1;
    float _177 = fma(_162, _162, _166);
    bool _179 = _172 < _164;
    bool _181 = !_92;
    bool _183 = _179 && _181;
    float _185 = float(_175);
    float _187 = rsqrt(_177);
    float _189 = _185 + (-0.5);
    float _191 = _140 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _193 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[12].x, _191);
    float _195 = _191;
    if (!_183)
    {
        _195 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _197 = _195;
    float _199 = _197;
    if (_183)
    {
        float _201 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _199 = _201;
    }
    float _203 = _199;
    float _205 = fma(_142, (*spvDescriptorSet0.vp_c3)._m0[12].z, _193);
    float _207 = -_203;
    float _209 = _207 + _164;
    float _211 = _187 * _189;
    float _213 = _205 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _215 = _209 * _54;
    float _217 = precise::clamp(_215, 0.0, 1.0);
    float _219 = _211 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _221 = _213 * _219;
    float _223 = _217 * _56;
    float _225 = fma(_146, _221, _140);
    float _227 = fma(_150, _221, _138);
    float _229 = fma(_162, _221, _142);
    out.m_32.x = _223;
    float _231 = _225 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _233 = _225 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _235 = _225 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _237 = _225 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _239 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[10].x, _231);
    float _241 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[11].x, _233);
    float _243 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[12].x, _235);
    float _245 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[13].x, _237);
    float _247 = fma(_229, (*spvDescriptorSet0.vp_c3)._m0[10].z, _239);
    float _249 = fma(_229, (*spvDescriptorSet0.vp_c3)._m0[11].z, _241);
    float _251 = fma(_229, (*spvDescriptorSet0.vp_c3)._m0[12].z, _243);
    float _253 = fma(_229, (*spvDescriptorSet0.vp_c3)._m0[13].z, _245);
    float _255 = _247 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _257 = _249 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _259 = _251 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _261 = _253 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.gl_Position.x = _255;
    out.gl_Position.y = _257;
    out.gl_Position.z = _259;
    out.gl_Position.w = _261;
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
    float _54 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _56 = in.m_26.w;
    bool _60 = _50 > 2.0;
    float _62 = _52 * _52;
    bool _64 = _46 > 2.0;
    float _66 = _48 * _48;
    float _68 = _64 ? (-1.0) : 1.0;
    float _70 = _60 ? (-1.0) : 1.0;
    float _72 = _50;
    float _74 = _46;
    if (_60)
    {
        float _76 = _50 + (-10.0);
        _72 = _76;
    }
    float _78 = _72;
    if (_64)
    {
        float _80 = _46 + (-10.0);
        _74 = _80;
    }
    float _82 = _74;
    bool _84 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _86 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _88 = _84 || _86;
    bool _90 = isnan(8.0);
    bool _92 = _88 || _90;
    float _94 = fma(_78, _78, _62);
    float _96 = _48 * _78;
    float _98 = fma(_82, _82, _66);
    float _100 = -_96;
    float _102 = fma(_52, _82, _100);
    float _104 = sqrt(_94);
    float _106 = sqrt(_98);
    float _108 = -_104;
    float _110 = _108 + 1.0;
    float _112 = _70 * _110;
    float _114 = as_type<float>(int(gl_VertexIndex));
    float _116 = -_106;
    float _118 = _116 + 1.0;
    float _120 = _112 * _82;
    float _122 = _68 * _118;
    float _124 = _122 * _52;
    float _126 = -_120;
    float _128 = fma(_122, _78, _126);
    float _130 = _102 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _132 = -_124;
    float _134 = fma(_112, _48, _132);
    float _136 = _128 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _138 = in.m_26.x;
    float _140 = in.m_26.y;
    float _142 = in.m_26.z;
    float _144 = -_130;
    float _146 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[14].z, _144);
    float _148 = -_136;
    float _150 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[14].y, _148);
    float _152 = _134 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _154 = _134;
    if (!_92)
    {
        _154 = (*spvDescriptorSet0.vp_c4)._m0[1].y;
    }
    float _156 = _154;
    float _158 = _146 * _146;
    float _160 = -_152;
    float _162 = fma(_128, (*spvDescriptorSet0.vp_c3)._m0[14].x, _160);
    float _164 = float(as_type<int>(_114));
    float _166 = fma(_150, _150, _158);
    float _168 = _156;
    if (!_92)
    {
        float _170 = _156 * 0.5;
        _168 = _170;
    }
    float _172 = _168;
    int _175 = as_type<int>(_114) & 1;
    float _177 = fma(_162, _162, _166);
    bool _179 = _172 < _164;
    bool _181 = !_92;
    bool _183 = _179 && _181;
    float _185 = float(_175);
    float _187 = rsqrt(_177);
    float _189 = _185 + (-0.5);
    float _191 = _140 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _193 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[12].x, _191);
    float _195 = _191;
    if (!_183)
    {
        _195 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _197 = _195;
    float _199 = _197;
    if (_183)
    {
        float _201 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _199 = _201;
    }
    float _203 = _199;
    float _205 = fma(_142, (*spvDescriptorSet0.vp_c3)._m0[12].z, _193);
    float _207 = -_203;
    float _209 = _207 + _164;
    float _211 = _187 * _189;
    float _213 = _205 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _215 = _209 * _54;
    float _217 = precise::clamp(_215, 0.0, 1.0);
    float _219 = _211 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _221 = _213 * _219;
    float _223 = _217 * _56;
    float _225 = fma(_146, _221, _140);
    float _227 = fma(_150, _221, _138);
    float _229 = fma(_162, _221, _142);
    out.m_32.x = _223;
    float _231 = _225 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _233 = _225 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _235 = _225 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _237 = _225 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _239 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[10].x, _231);
    float _241 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[11].x, _233);
    float _243 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[12].x, _235);
    float _245 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[13].x, _237);
    float _247 = fma(_229, (*spvDescriptorSet0.vp_c3)._m0[10].z, _239);
    float _249 = fma(_229, (*spvDescriptorSet0.vp_c3)._m0[11].z, _241);
    float _251 = fma(_229, (*spvDescriptorSet0.vp_c3)._m0[12].z, _243);
    float _253 = fma(_229, (*spvDescriptorSet0.vp_c3)._m0[13].z, _245);
    float _255 = _247 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _257 = _249 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _259 = _251 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _261 = _253 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.gl_Position.x = _255;
    out.gl_Position.y = _257;
    out.gl_Position.z = _259;
    out.gl_Position.w = _261;
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
    float _54 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _56 = in.m_26.w;
    bool _60 = _50 > 2.0;
    float _62 = _52 * _52;
    bool _64 = _46 > 2.0;
    float _66 = _48 * _48;
    float _68 = _64 ? (-1.0) : 1.0;
    float _70 = _60 ? (-1.0) : 1.0;
    float _72 = _50;
    float _74 = _46;
    if (_60)
    {
        float _76 = _50 + (-10.0);
        _72 = _76;
    }
    float _78 = _72;
    if (_64)
    {
        float _80 = _46 + (-10.0);
        _74 = _80;
    }
    float _82 = _74;
    bool _84 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _86 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _88 = _84 || _86;
    bool _90 = isnan(8.0);
    bool _92 = _88 || _90;
    float _94 = fma(_78, _78, _62);
    float _96 = _48 * _78;
    float _98 = fma(_82, _82, _66);
    float _100 = -_96;
    float _102 = fma(_52, _82, _100);
    float _104 = sqrt(_94);
    float _106 = sqrt(_98);
    float _108 = -_104;
    float _110 = _108 + 1.0;
    float _112 = _70 * _110;
    float _114 = as_type<float>(int(gl_VertexIndex));
    float _116 = -_106;
    float _118 = _116 + 1.0;
    float _120 = _112 * _82;
    float _122 = _68 * _118;
    float _124 = _122 * _52;
    float _126 = -_120;
    float _128 = fma(_122, _78, _126);
    float _130 = _102 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _132 = -_124;
    float _134 = fma(_112, _48, _132);
    float _136 = _128 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _138 = in.m_26.x;
    float _140 = in.m_26.y;
    float _142 = in.m_26.z;
    float _144 = -_130;
    float _146 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[14].z, _144);
    float _148 = -_136;
    float _150 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[14].y, _148);
    float _152 = _134 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _154 = _134;
    if (!_92)
    {
        _154 = (*spvDescriptorSet0.vp_c4)._m0[1].y;
    }
    float _156 = _154;
    float _158 = _146 * _146;
    float _160 = -_152;
    float _162 = fma(_128, (*spvDescriptorSet0.vp_c3)._m0[14].x, _160);
    float _164 = float(as_type<int>(_114));
    float _166 = fma(_150, _150, _158);
    float _168 = _156;
    if (!_92)
    {
        float _170 = _156 * 0.5;
        _168 = _170;
    }
    float _172 = _168;
    int _175 = as_type<int>(_114) & 1;
    float _177 = fma(_162, _162, _166);
    bool _179 = _172 < _164;
    bool _181 = !_92;
    bool _183 = _179 && _181;
    float _185 = float(_175);
    float _187 = rsqrt(_177);
    float _189 = _185 + (-0.5);
    float _191 = _140 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _193 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[12].x, _191);
    float _195 = _191;
    if (!_183)
    {
        _195 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _197 = _195;
    float _199 = _197;
    if (_183)
    {
        float _201 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _199 = _201;
    }
    float _203 = _199;
    float _205 = fma(_142, (*spvDescriptorSet0.vp_c3)._m0[12].z, _193);
    float _207 = -_203;
    float _209 = _207 + _164;
    float _211 = _187 * _189;
    float _213 = _205 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _215 = _209 * _54;
    float _217 = precise::clamp(_215, 0.0, 1.0);
    float _219 = _211 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _221 = _213 * _219;
    float _223 = _217 * _56;
    float _225 = fma(_146, _221, _140);
    float _227 = fma(_150, _221, _138);
    float _229 = fma(_162, _221, _142);
    out.m_32.x = _223;
    float _231 = _225 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _233 = _225 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _235 = _225 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _237 = _225 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _239 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[10].x, _231);
    float _241 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[11].x, _233);
    float _243 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[12].x, _235);
    float _245 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[13].x, _237);
    float _247 = fma(_229, (*spvDescriptorSet0.vp_c3)._m0[10].z, _239);
    float _249 = fma(_229, (*spvDescriptorSet0.vp_c3)._m0[11].z, _241);
    float _251 = fma(_229, (*spvDescriptorSet0.vp_c3)._m0[12].z, _243);
    float _253 = fma(_229, (*spvDescriptorSet0.vp_c3)._m0[13].z, _245);
    float _255 = _247 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _257 = _249 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _259 = _251 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _261 = _253 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.gl_Position.x = _255;
    out.gl_Position.y = _257;
    out.gl_Position.z = _259;
    out.gl_Position.w = _261;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_32.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_32.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_32.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_32.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

