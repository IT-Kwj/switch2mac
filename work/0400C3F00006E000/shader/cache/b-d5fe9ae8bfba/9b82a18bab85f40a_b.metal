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
    float _60 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _62 = as_type<float>(int(gl_VertexIndex));
    float _64 = in.m_29.w;
    float _66 = in.m_31.x;
    float _68 = in.m_31.y;
    float _70 = in.m_31.z;
    bool _74 = _56 > 2.0;
    float _76 = _58 * _58;
    bool _78 = _52 > 2.0;
    float _80 = _54 * _54;
    float _82 = float(as_type<int>(_62));
    float _84 = _78 ? (-1.0) : 1.0;
    float _86 = _74 ? (-1.0) : 1.0;
    float _88 = _56;
    float _90 = _52;
    if (_74)
    {
        float _92 = _56 + (-10.0);
        _88 = _92;
    }
    float _94 = _88;
    if (_78)
    {
        float _96 = _52 + (-10.0);
        _90 = _96;
    }
    float _98 = _90;
    bool _100 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _102 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _104 = _100 || _102;
    bool _106 = isnan(8.0);
    bool _108 = _104 || _106;
    float _110 = fma(_94, _94, _76);
    float _112 = fma(_98, _98, _80);
    float _114 = sqrt(_110);
    float _116 = 0.0;
    if (!_108)
    {
        _116 = (*spvDescriptorSet0.vp_c4)._m0[1].y;
    }
    float _118 = _116;
    float _120 = sqrt(_112);
    float _122 = _118;
    if (!_108)
    {
        float _124 = _118 * 0.5;
        _122 = _124;
    }
    float _126 = _122;
    float _128 = -_114;
    float _130 = _128 + 1.0;
    float _132 = _54 * _94;
    bool _134 = _126 < _82;
    bool _136 = !_108;
    bool _138 = _134 && _136;
    float _140 = _86 * _130;
    float _142 = -_132;
    float _144 = fma(_58, _98, _142);
    float _146 = -_120;
    float _148 = _146 + 1.0;
    float _150 = _140 * _98;
    float _152 = _144 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _154 = _84 * _148;
    float _156 = _154 * _58;
    float _158 = -_150;
    float _160 = fma(_154, _94, _158);
    float _162 = _58 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _164 = -_156;
    float _166 = fma(_140, _54, _164);
    float _168 = _160 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _170 = in.m_29.x;
    float _172 = in.m_29.y;
    float _174 = in.m_29.z;
    float _176 = fma(_94, (*spvDescriptorSet0.vp_c3)._m0[15].x, _162);
    float _178 = -_152;
    float _180 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float _182 = _166 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _184 = -_168;
    float _186 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[14].y, _184);
    float _188 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[15].z, _176);
    float _190 = _180 * _180;
    float _192 = -_182;
    float _194 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[14].x, _192);
    int _197 = as_type<int>(_62) & 1;
    out.m_34.x = _66;
    float _199 = fma(_186, _186, _190);
    float _201 = float(_197);
    out.m_34.y = _68;
    float _203 = fma(_194, _194, _199);
    float _205 = as_type<float>(_197);
    if (!_138)
    {
        _205 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _207 = _205;
    float _209 = _207;
    if (_138)
    {
        float _211 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _209 = _211;
    }
    float _213 = _209;
    float _215 = _201 + (-0.5);
    out.m_34.z = _70;
    float _217 = rsqrt(_203);
    float _219 = -_213;
    float _221 = _219 + _82;
    float _223 = _160 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    out.m_36.z = _188;
    float _225 = _172 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _227 = _221 * _60;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[15].x, _223);
    float _233 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[12].x, _225);
    float _235 = _229 * _64;
    float _237 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[15].z, _231);
    float _239 = fma(_174, (*spvDescriptorSet0.vp_c3)._m0[12].z, _233);
    out.m_38.x = _235;
    float _241 = _217 * _215;
    float _243 = _239 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    out.m_36.x = _237;
    float _245 = _241 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _247 = _243 * _245;
    float _249 = fma(_180, _247, _172);
    float _251 = fma(_186, _247, _170);
    float _253 = fma(_194, _247, _174);
    float _255 = _249 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _257 = _249 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _259 = _249 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _261 = _249 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _263 = fma(_251, (*spvDescriptorSet0.vp_c3)._m0[10].x, _255);
    float _265 = fma(_251, (*spvDescriptorSet0.vp_c3)._m0[11].x, _257);
    float _267 = fma(_251, (*spvDescriptorSet0.vp_c3)._m0[12].x, _259);
    float _269 = fma(_251, (*spvDescriptorSet0.vp_c3)._m0[13].x, _261);
    float _271 = fma(_253, (*spvDescriptorSet0.vp_c3)._m0[10].z, _263);
    float _273 = fma(_253, (*spvDescriptorSet0.vp_c3)._m0[11].z, _265);
    float _275 = fma(_253, (*spvDescriptorSet0.vp_c3)._m0[12].z, _267);
    float _277 = fma(_253, (*spvDescriptorSet0.vp_c3)._m0[13].z, _269);
    float _279 = _271 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _281 = _273 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _283 = _275 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _285 = _277 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.gl_Position.x = _279;
    out.gl_Position.y = _281;
    out.gl_Position.z = _283;
    out.gl_Position.w = _285;
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
    float _60 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _62 = as_type<float>(int(gl_VertexIndex));
    float _64 = in.m_29.w;
    float _66 = in.m_31.x;
    float _68 = in.m_31.y;
    float _70 = in.m_31.z;
    bool _74 = _56 > 2.0;
    float _76 = _58 * _58;
    bool _78 = _52 > 2.0;
    float _80 = _54 * _54;
    float _82 = float(as_type<int>(_62));
    float _84 = _78 ? (-1.0) : 1.0;
    float _86 = _74 ? (-1.0) : 1.0;
    float _88 = _56;
    float _90 = _52;
    if (_74)
    {
        float _92 = _56 + (-10.0);
        _88 = _92;
    }
    float _94 = _88;
    if (_78)
    {
        float _96 = _52 + (-10.0);
        _90 = _96;
    }
    float _98 = _90;
    bool _100 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _102 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _104 = _100 || _102;
    bool _106 = isnan(8.0);
    bool _108 = _104 || _106;
    float _110 = fma(_94, _94, _76);
    float _112 = fma(_98, _98, _80);
    float _114 = sqrt(_110);
    float _116 = 0.0;
    if (!_108)
    {
        _116 = (*spvDescriptorSet0.vp_c4)._m0[1].y;
    }
    float _118 = _116;
    float _120 = sqrt(_112);
    float _122 = _118;
    if (!_108)
    {
        float _124 = _118 * 0.5;
        _122 = _124;
    }
    float _126 = _122;
    float _128 = -_114;
    float _130 = _128 + 1.0;
    float _132 = _54 * _94;
    bool _134 = _126 < _82;
    bool _136 = !_108;
    bool _138 = _134 && _136;
    float _140 = _86 * _130;
    float _142 = -_132;
    float _144 = fma(_58, _98, _142);
    float _146 = -_120;
    float _148 = _146 + 1.0;
    float _150 = _140 * _98;
    float _152 = _144 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _154 = _84 * _148;
    float _156 = _154 * _58;
    float _158 = -_150;
    float _160 = fma(_154, _94, _158);
    float _162 = _58 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _164 = -_156;
    float _166 = fma(_140, _54, _164);
    float _168 = _160 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _170 = in.m_29.x;
    float _172 = in.m_29.y;
    float _174 = in.m_29.z;
    float _176 = fma(_94, (*spvDescriptorSet0.vp_c3)._m0[15].x, _162);
    float _178 = -_152;
    float _180 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float _182 = _166 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _184 = -_168;
    float _186 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[14].y, _184);
    float _188 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[15].z, _176);
    float _190 = _180 * _180;
    float _192 = -_182;
    float _194 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[14].x, _192);
    int _197 = as_type<int>(_62) & 1;
    out.m_34.x = _66;
    float _199 = fma(_186, _186, _190);
    float _201 = float(_197);
    out.m_34.y = _68;
    float _203 = fma(_194, _194, _199);
    float _205 = as_type<float>(_197);
    if (!_138)
    {
        _205 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _207 = _205;
    float _209 = _207;
    if (_138)
    {
        float _211 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _209 = _211;
    }
    float _213 = _209;
    float _215 = _201 + (-0.5);
    out.m_34.z = _70;
    float _217 = rsqrt(_203);
    float _219 = -_213;
    float _221 = _219 + _82;
    float _223 = _160 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    out.m_36.z = _188;
    float _225 = _172 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _227 = _221 * _60;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[15].x, _223);
    float _233 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[12].x, _225);
    float _235 = _229 * _64;
    float _237 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[15].z, _231);
    float _239 = fma(_174, (*spvDescriptorSet0.vp_c3)._m0[12].z, _233);
    out.m_38.x = _235;
    float _241 = _217 * _215;
    float _243 = _239 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    out.m_36.x = _237;
    float _245 = _241 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _247 = _243 * _245;
    float _249 = fma(_180, _247, _172);
    float _251 = fma(_186, _247, _170);
    float _253 = fma(_194, _247, _174);
    float _255 = _249 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _257 = _249 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _259 = _249 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _261 = _249 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _263 = fma(_251, (*spvDescriptorSet0.vp_c3)._m0[10].x, _255);
    float _265 = fma(_251, (*spvDescriptorSet0.vp_c3)._m0[11].x, _257);
    float _267 = fma(_251, (*spvDescriptorSet0.vp_c3)._m0[12].x, _259);
    float _269 = fma(_251, (*spvDescriptorSet0.vp_c3)._m0[13].x, _261);
    float _271 = fma(_253, (*spvDescriptorSet0.vp_c3)._m0[10].z, _263);
    float _273 = fma(_253, (*spvDescriptorSet0.vp_c3)._m0[11].z, _265);
    float _275 = fma(_253, (*spvDescriptorSet0.vp_c3)._m0[12].z, _267);
    float _277 = fma(_253, (*spvDescriptorSet0.vp_c3)._m0[13].z, _269);
    float _279 = _271 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _281 = _273 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _283 = _275 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _285 = _277 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.gl_Position.x = _279;
    out.gl_Position.y = _281;
    out.gl_Position.z = _283;
    out.gl_Position.w = _285;
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
    float _60 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _62 = as_type<float>(int(gl_VertexIndex));
    float _64 = in.m_29.w;
    float _66 = in.m_31.x;
    float _68 = in.m_31.y;
    float _70 = in.m_31.z;
    bool _74 = _56 > 2.0;
    float _76 = _58 * _58;
    bool _78 = _52 > 2.0;
    float _80 = _54 * _54;
    float _82 = float(as_type<int>(_62));
    float _84 = _78 ? (-1.0) : 1.0;
    float _86 = _74 ? (-1.0) : 1.0;
    float _88 = _56;
    float _90 = _52;
    if (_74)
    {
        float _92 = _56 + (-10.0);
        _88 = _92;
    }
    float _94 = _88;
    if (_78)
    {
        float _96 = _52 + (-10.0);
        _90 = _96;
    }
    float _98 = _90;
    bool _100 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _102 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _104 = _100 || _102;
    bool _106 = isnan(8.0);
    bool _108 = _104 || _106;
    float _110 = fma(_94, _94, _76);
    float _112 = fma(_98, _98, _80);
    float _114 = sqrt(_110);
    float _116 = 0.0;
    if (!_108)
    {
        _116 = (*spvDescriptorSet0.vp_c4)._m0[1].y;
    }
    float _118 = _116;
    float _120 = sqrt(_112);
    float _122 = _118;
    if (!_108)
    {
        float _124 = _118 * 0.5;
        _122 = _124;
    }
    float _126 = _122;
    float _128 = -_114;
    float _130 = _128 + 1.0;
    float _132 = _54 * _94;
    bool _134 = _126 < _82;
    bool _136 = !_108;
    bool _138 = _134 && _136;
    float _140 = _86 * _130;
    float _142 = -_132;
    float _144 = fma(_58, _98, _142);
    float _146 = -_120;
    float _148 = _146 + 1.0;
    float _150 = _140 * _98;
    float _152 = _144 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _154 = _84 * _148;
    float _156 = _154 * _58;
    float _158 = -_150;
    float _160 = fma(_154, _94, _158);
    float _162 = _58 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _164 = -_156;
    float _166 = fma(_140, _54, _164);
    float _168 = _160 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _170 = in.m_29.x;
    float _172 = in.m_29.y;
    float _174 = in.m_29.z;
    float _176 = fma(_94, (*spvDescriptorSet0.vp_c3)._m0[15].x, _162);
    float _178 = -_152;
    float _180 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float _182 = _166 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _184 = -_168;
    float _186 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[14].y, _184);
    float _188 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[15].z, _176);
    float _190 = _180 * _180;
    float _192 = -_182;
    float _194 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[14].x, _192);
    int _197 = as_type<int>(_62) & 1;
    out.m_34.x = _66;
    float _199 = fma(_186, _186, _190);
    float _201 = float(_197);
    out.m_34.y = _68;
    float _203 = fma(_194, _194, _199);
    float _205 = as_type<float>(_197);
    if (!_138)
    {
        _205 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _207 = _205;
    float _209 = _207;
    if (_138)
    {
        float _211 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _209 = _211;
    }
    float _213 = _209;
    float _215 = _201 + (-0.5);
    out.m_34.z = _70;
    float _217 = rsqrt(_203);
    float _219 = -_213;
    float _221 = _219 + _82;
    float _223 = _160 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    out.m_36.z = _188;
    float _225 = _172 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _227 = _221 * _60;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[15].x, _223);
    float _233 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[12].x, _225);
    float _235 = _229 * _64;
    float _237 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[15].z, _231);
    float _239 = fma(_174, (*spvDescriptorSet0.vp_c3)._m0[12].z, _233);
    out.m_38.x = _235;
    float _241 = _217 * _215;
    float _243 = _239 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    out.m_36.x = _237;
    float _245 = _241 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _247 = _243 * _245;
    float _249 = fma(_180, _247, _172);
    float _251 = fma(_186, _247, _170);
    float _253 = fma(_194, _247, _174);
    float _255 = _249 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _257 = _249 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _259 = _249 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _261 = _249 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _263 = fma(_251, (*spvDescriptorSet0.vp_c3)._m0[10].x, _255);
    float _265 = fma(_251, (*spvDescriptorSet0.vp_c3)._m0[11].x, _257);
    float _267 = fma(_251, (*spvDescriptorSet0.vp_c3)._m0[12].x, _259);
    float _269 = fma(_251, (*spvDescriptorSet0.vp_c3)._m0[13].x, _261);
    float _271 = fma(_253, (*spvDescriptorSet0.vp_c3)._m0[10].z, _263);
    float _273 = fma(_253, (*spvDescriptorSet0.vp_c3)._m0[11].z, _265);
    float _275 = fma(_253, (*spvDescriptorSet0.vp_c3)._m0[12].z, _267);
    float _277 = fma(_253, (*spvDescriptorSet0.vp_c3)._m0[13].z, _269);
    float _279 = _271 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _281 = _273 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _283 = _275 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _285 = _277 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    out.gl_Position.x = _279;
    out.gl_Position.y = _281;
    out.gl_Position.z = _283;
    out.gl_Position.w = _285;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

