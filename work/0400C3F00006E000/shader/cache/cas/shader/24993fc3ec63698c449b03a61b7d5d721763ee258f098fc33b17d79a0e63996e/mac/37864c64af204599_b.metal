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
    float4 m_40 [[user(locn0)]];
    float4 m_32 [[user(locn1)]];
    float4 m_34 [[user(locn2)]];
    float4 m_38 [[user(locn3)]];
    float4 m_36 [[user(locn6)]];
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
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = in.m_24.x;
    float _56 = in.m_24.y;
    float _58 = in.m_24.z;
    float _60 = in.m_24.w;
    float _62 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _64 = as_type<float>(int(gl_VertexIndex));
    float _66 = in.m_29.w;
    bool _70 = _58 > 2.0;
    float _72 = _60 * _60;
    bool _74 = _54 > 2.0;
    float _76 = _56 * _56;
    float _78 = _74 ? (-1.0) : 1.0;
    float _80 = _70 ? (-1.0) : 1.0;
    float _82 = _58;
    float _84 = _54;
    if (_70)
    {
        float _86 = _58 + (-10.0);
        _82 = _86;
    }
    float _88 = _82;
    if (_74)
    {
        float _90 = _54 + (-10.0);
        _84 = _90;
    }
    float _92 = _84;
    bool _94 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _96 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _98 = _94 || _96;
    bool _100 = isnan(8.0);
    bool _102 = _98 || _100;
    float _104 = fma(_88, _88, _72);
    float _106 = _56 * _88;
    float _108 = fma(_92, _92, _76);
    float _110 = -_106;
    float _112 = fma(_60, _92, _110);
    float _114 = sqrt(_104);
    float _116 = sqrt(_108);
    float _118 = -_114;
    float _120 = _118 + 1.0;
    float _122 = _112 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _124 = _80 * _120;
    float _126 = -_116;
    float _128 = _126 + 1.0;
    float _130 = _78 * _128;
    float _132 = _124 * _92;
    float _134 = _130 * _60;
    float _136 = -_132;
    float _138 = fma(_130, _88, _136);
    float _140 = -_134;
    float _142 = fma(_124, _56, _140);
    float _144 = _138 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _146 = in.m_29.x;
    float _148 = in.m_29.y;
    float _150 = in.m_29.z;
    float _152 = -_122;
    float _154 = fma(_142, (*spvDescriptorSet0.vp_c3)._m0[14].z, _152);
    float _156 = _142 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _158 = -_144;
    float _160 = fma(_112, (*spvDescriptorSet0.vp_c3)._m0[14].y, _158);
    float _162 = _154 * _154;
    float _164 = -_156;
    float _166 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[14].x, _164);
    int _169 = as_type<int>(_64) & 1;
    float _171 = fma(_160, _160, _162);
    float _173 = float(_169);
    float _175 = fma(_166, _166, _171);
    float _177 = float(as_type<int>(_64));
    float _179 = _112;
    float _181 = _92;
    if (!_102)
    {
        float _183 = 0.5 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _179 = _183;
    }
    float _185 = _179;
    float _187 = _173 + (-0.5);
    float _189 = rsqrt(_175);
    bool _191 = _185 < _177;
    bool _193 = !_102;
    bool _195 = _191 && _193;
    float _197 = _148 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _199 = fma(_56, (*spvDescriptorSet0.vp_c4)._m0[0].x, _148);
    float _201 = fma(_146, (*spvDescriptorSet0.vp_c3)._m0[12].x, _197);
    float _203 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[12].z, _201);
    float _205 = _199 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _207 = fma(_92, (*spvDescriptorSet0.vp_c4)._m0[0].x, _146);
    float _209 = _189 * _187;
    float _211 = _203 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _213 = fma(_207, (*spvDescriptorSet0.vp_c3)._m0[13].x, _205);
    float _215 = _209 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _217 = fma(_56, (*spvDescriptorSet0.vp_c4)._m0[0].y, _148);
    float _219 = fma(_92, (*spvDescriptorSet0.vp_c4)._m0[0].y, _146);
    if (!_195)
    {
        _181 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _221 = _181;
    float _223 = _211 * _215;
    float _225 = _221;
    if (_195)
    {
        float _227 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _225 = _227;
    }
    float _229 = _225;
    float _231 = _217 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _233 = _211 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _235 = fma(_154, _223, _148);
    float _237 = fma(_160, _223, _146);
    float _239 = fma(_166, _223, _150);
    float _241 = -_229;
    float _243 = _241 + _177;
    float _245 = _235 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _247 = fma(_219, (*spvDescriptorSet0.vp_c3)._m0[13].x, _231);
    float _249 = fma(_130, (*spvDescriptorSet0.vp_c4)._m0[0].x, _150);
    float _251 = fma(_130, (*spvDescriptorSet0.vp_c4)._m0[0].y, _150);
    float _253 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[13].x, _245);
    float _255 = precise::min(_233, (*spvDescriptorSet0.vp_c4)._m0[2].w);
    float _257 = _235 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _259 = fma(_251, (*spvDescriptorSet0.vp_c3)._m0[13].z, _247);
    float _261 = fma(_239, (*spvDescriptorSet0.vp_c3)._m0[13].z, _253);
    float _263 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[13].z, _213);
    float _265 = _255 + 1.0;
    float _267 = _235 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _269 = _261 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _271 = _235 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _273 = _265 * (*spvDescriptorSet0.vp_c4)._m0[0].z;
    float _275 = _265 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _277 = 1.0 / _269;
    float _279 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[10].x, _267);
    float _281 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[11].x, _257);
    float _283 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[12].x, _271);
    float _285 = _243 * _62;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = fma(_239, (*spvDescriptorSet0.vp_c3)._m0[10].z, _279);
    float _291 = fma(_239, (*spvDescriptorSet0.vp_c3)._m0[11].z, _281);
    float _293 = fma(_239, (*spvDescriptorSet0.vp_c3)._m0[12].z, _283);
    float _295 = _263 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _297 = _289 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _299 = _291 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _301 = _287 * _66;
    float _303 = _259 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _305 = _293 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    out.m_32.z = _273;
    out.m_32.w = _275;
    float _307 = _297 * _277;
    float _309 = _299 * _277;
    out.m_34.x = _301;
    float _311 = fma(_307, 0.5, 0.5);
    float _313 = fma(_309, -0.5, 0.5);
    out.m_36.w = _295;
    out.m_38.w = _303;
    out.gl_Position.x = _297;
    out.gl_Position.y = _299;
    out.gl_Position.z = _305;
    out.gl_Position.w = _269;
    out.m_40.x = _311;
    out.m_40.y = _313;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = in.m_24.x;
    float _56 = in.m_24.y;
    float _58 = in.m_24.z;
    float _60 = in.m_24.w;
    float _62 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _64 = as_type<float>(int(gl_VertexIndex));
    float _66 = in.m_29.w;
    bool _70 = _58 > 2.0;
    float _72 = _60 * _60;
    bool _74 = _54 > 2.0;
    float _76 = _56 * _56;
    float _78 = _74 ? (-1.0) : 1.0;
    float _80 = _70 ? (-1.0) : 1.0;
    float _82 = _58;
    float _84 = _54;
    if (_70)
    {
        float _86 = _58 + (-10.0);
        _82 = _86;
    }
    float _88 = _82;
    if (_74)
    {
        float _90 = _54 + (-10.0);
        _84 = _90;
    }
    float _92 = _84;
    bool _94 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _96 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _98 = _94 || _96;
    bool _100 = isnan(8.0);
    bool _102 = _98 || _100;
    float _104 = fma(_88, _88, _72);
    float _106 = _56 * _88;
    float _108 = fma(_92, _92, _76);
    float _110 = -_106;
    float _112 = fma(_60, _92, _110);
    float _114 = sqrt(_104);
    float _116 = sqrt(_108);
    float _118 = -_114;
    float _120 = _118 + 1.0;
    float _122 = _112 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _124 = _80 * _120;
    float _126 = -_116;
    float _128 = _126 + 1.0;
    float _130 = _78 * _128;
    float _132 = _124 * _92;
    float _134 = _130 * _60;
    float _136 = -_132;
    float _138 = fma(_130, _88, _136);
    float _140 = -_134;
    float _142 = fma(_124, _56, _140);
    float _144 = _138 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _146 = in.m_29.x;
    float _148 = in.m_29.y;
    float _150 = in.m_29.z;
    float _152 = -_122;
    float _154 = fma(_142, (*spvDescriptorSet0.vp_c3)._m0[14].z, _152);
    float _156 = _142 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _158 = -_144;
    float _160 = fma(_112, (*spvDescriptorSet0.vp_c3)._m0[14].y, _158);
    float _162 = _154 * _154;
    float _164 = -_156;
    float _166 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[14].x, _164);
    int _169 = as_type<int>(_64) & 1;
    float _171 = fma(_160, _160, _162);
    float _173 = float(_169);
    float _175 = fma(_166, _166, _171);
    float _177 = float(as_type<int>(_64));
    float _179 = _112;
    float _181 = _92;
    if (!_102)
    {
        float _183 = 0.5 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _179 = _183;
    }
    float _185 = _179;
    float _187 = _173 + (-0.5);
    float _189 = rsqrt(_175);
    bool _191 = _185 < _177;
    bool _193 = !_102;
    bool _195 = _191 && _193;
    float _197 = _148 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _199 = fma(_56, (*spvDescriptorSet0.vp_c4)._m0[0].x, _148);
    float _201 = fma(_146, (*spvDescriptorSet0.vp_c3)._m0[12].x, _197);
    float _203 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[12].z, _201);
    float _205 = _199 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _207 = fma(_92, (*spvDescriptorSet0.vp_c4)._m0[0].x, _146);
    float _209 = _189 * _187;
    float _211 = _203 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _213 = fma(_207, (*spvDescriptorSet0.vp_c3)._m0[13].x, _205);
    float _215 = _209 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _217 = fma(_56, (*spvDescriptorSet0.vp_c4)._m0[0].y, _148);
    float _219 = fma(_92, (*spvDescriptorSet0.vp_c4)._m0[0].y, _146);
    if (!_195)
    {
        _181 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _221 = _181;
    float _223 = _211 * _215;
    float _225 = _221;
    if (_195)
    {
        float _227 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _225 = _227;
    }
    float _229 = _225;
    float _231 = _217 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _233 = _211 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _235 = fma(_154, _223, _148);
    float _237 = fma(_160, _223, _146);
    float _239 = fma(_166, _223, _150);
    float _241 = -_229;
    float _243 = _241 + _177;
    float _245 = _235 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _247 = fma(_219, (*spvDescriptorSet0.vp_c3)._m0[13].x, _231);
    float _249 = fma(_130, (*spvDescriptorSet0.vp_c4)._m0[0].x, _150);
    float _251 = fma(_130, (*spvDescriptorSet0.vp_c4)._m0[0].y, _150);
    float _253 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[13].x, _245);
    float _255 = precise::min(_233, (*spvDescriptorSet0.vp_c4)._m0[2].w);
    float _257 = _235 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _259 = fma(_251, (*spvDescriptorSet0.vp_c3)._m0[13].z, _247);
    float _261 = fma(_239, (*spvDescriptorSet0.vp_c3)._m0[13].z, _253);
    float _263 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[13].z, _213);
    float _265 = _255 + 1.0;
    float _267 = _235 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _269 = _261 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _271 = _235 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _273 = _265 * (*spvDescriptorSet0.vp_c4)._m0[0].z;
    float _275 = _265 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _277 = 1.0 / _269;
    float _279 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[10].x, _267);
    float _281 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[11].x, _257);
    float _283 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[12].x, _271);
    float _285 = _243 * _62;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = fma(_239, (*spvDescriptorSet0.vp_c3)._m0[10].z, _279);
    float _291 = fma(_239, (*spvDescriptorSet0.vp_c3)._m0[11].z, _281);
    float _293 = fma(_239, (*spvDescriptorSet0.vp_c3)._m0[12].z, _283);
    float _295 = _263 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _297 = _289 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _299 = _291 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _301 = _287 * _66;
    float _303 = _259 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _305 = _293 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    out.m_32.z = _273;
    out.m_32.w = _275;
    float _307 = _297 * _277;
    float _309 = _299 * _277;
    out.m_34.x = _301;
    float _311 = fma(_307, 0.5, 0.5);
    float _313 = fma(_309, -0.5, 0.5);
    out.m_36.w = _295;
    out.m_38.w = _303;
    out.gl_Position.x = _297;
    out.gl_Position.y = _299;
    out.gl_Position.z = _305;
    out.gl_Position.w = _269;
    out.m_40.x = _311;
    out.m_40.y = _313;
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
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = in.m_24.x;
    float _56 = in.m_24.y;
    float _58 = in.m_24.z;
    float _60 = in.m_24.w;
    float _62 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _64 = as_type<float>(int(gl_VertexIndex));
    float _66 = in.m_29.w;
    bool _70 = _58 > 2.0;
    float _72 = _60 * _60;
    bool _74 = _54 > 2.0;
    float _76 = _56 * _56;
    float _78 = _74 ? (-1.0) : 1.0;
    float _80 = _70 ? (-1.0) : 1.0;
    float _82 = _58;
    float _84 = _54;
    if (_70)
    {
        float _86 = _58 + (-10.0);
        _82 = _86;
    }
    float _88 = _82;
    if (_74)
    {
        float _90 = _54 + (-10.0);
        _84 = _90;
    }
    float _92 = _84;
    bool _94 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _96 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _98 = _94 || _96;
    bool _100 = isnan(8.0);
    bool _102 = _98 || _100;
    float _104 = fma(_88, _88, _72);
    float _106 = _56 * _88;
    float _108 = fma(_92, _92, _76);
    float _110 = -_106;
    float _112 = fma(_60, _92, _110);
    float _114 = sqrt(_104);
    float _116 = sqrt(_108);
    float _118 = -_114;
    float _120 = _118 + 1.0;
    float _122 = _112 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _124 = _80 * _120;
    float _126 = -_116;
    float _128 = _126 + 1.0;
    float _130 = _78 * _128;
    float _132 = _124 * _92;
    float _134 = _130 * _60;
    float _136 = -_132;
    float _138 = fma(_130, _88, _136);
    float _140 = -_134;
    float _142 = fma(_124, _56, _140);
    float _144 = _138 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _146 = in.m_29.x;
    float _148 = in.m_29.y;
    float _150 = in.m_29.z;
    float _152 = -_122;
    float _154 = fma(_142, (*spvDescriptorSet0.vp_c3)._m0[14].z, _152);
    float _156 = _142 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _158 = -_144;
    float _160 = fma(_112, (*spvDescriptorSet0.vp_c3)._m0[14].y, _158);
    float _162 = _154 * _154;
    float _164 = -_156;
    float _166 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[14].x, _164);
    int _169 = as_type<int>(_64) & 1;
    float _171 = fma(_160, _160, _162);
    float _173 = float(_169);
    float _175 = fma(_166, _166, _171);
    float _177 = float(as_type<int>(_64));
    float _179 = _112;
    float _181 = _92;
    if (!_102)
    {
        float _183 = 0.5 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _179 = _183;
    }
    float _185 = _179;
    float _187 = _173 + (-0.5);
    float _189 = rsqrt(_175);
    bool _191 = _185 < _177;
    bool _193 = !_102;
    bool _195 = _191 && _193;
    float _197 = _148 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _199 = fma(_56, (*spvDescriptorSet0.vp_c4)._m0[0].x, _148);
    float _201 = fma(_146, (*spvDescriptorSet0.vp_c3)._m0[12].x, _197);
    float _203 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[12].z, _201);
    float _205 = _199 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _207 = fma(_92, (*spvDescriptorSet0.vp_c4)._m0[0].x, _146);
    float _209 = _189 * _187;
    float _211 = _203 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _213 = fma(_207, (*spvDescriptorSet0.vp_c3)._m0[13].x, _205);
    float _215 = _209 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _217 = fma(_56, (*spvDescriptorSet0.vp_c4)._m0[0].y, _148);
    float _219 = fma(_92, (*spvDescriptorSet0.vp_c4)._m0[0].y, _146);
    if (!_195)
    {
        _181 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _221 = _181;
    float _223 = _211 * _215;
    float _225 = _221;
    if (_195)
    {
        float _227 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _225 = _227;
    }
    float _229 = _225;
    float _231 = _217 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _233 = _211 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _235 = fma(_154, _223, _148);
    float _237 = fma(_160, _223, _146);
    float _239 = fma(_166, _223, _150);
    float _241 = -_229;
    float _243 = _241 + _177;
    float _245 = _235 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _247 = fma(_219, (*spvDescriptorSet0.vp_c3)._m0[13].x, _231);
    float _249 = fma(_130, (*spvDescriptorSet0.vp_c4)._m0[0].x, _150);
    float _251 = fma(_130, (*spvDescriptorSet0.vp_c4)._m0[0].y, _150);
    float _253 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[13].x, _245);
    float _255 = precise::min(_233, (*spvDescriptorSet0.vp_c4)._m0[2].w);
    float _257 = _235 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _259 = fma(_251, (*spvDescriptorSet0.vp_c3)._m0[13].z, _247);
    float _261 = fma(_239, (*spvDescriptorSet0.vp_c3)._m0[13].z, _253);
    float _263 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[13].z, _213);
    float _265 = _255 + 1.0;
    float _267 = _235 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _269 = _261 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _271 = _235 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _273 = _265 * (*spvDescriptorSet0.vp_c4)._m0[0].z;
    float _275 = _265 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _277 = 1.0 / _269;
    float _279 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[10].x, _267);
    float _281 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[11].x, _257);
    float _283 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[12].x, _271);
    float _285 = _243 * _62;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = fma(_239, (*spvDescriptorSet0.vp_c3)._m0[10].z, _279);
    float _291 = fma(_239, (*spvDescriptorSet0.vp_c3)._m0[11].z, _281);
    float _293 = fma(_239, (*spvDescriptorSet0.vp_c3)._m0[12].z, _283);
    float _295 = _263 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _297 = _289 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _299 = _291 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _301 = _287 * _66;
    float _303 = _259 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _305 = _293 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    out.m_32.z = _273;
    out.m_32.w = _275;
    float _307 = _297 * _277;
    float _309 = _299 * _277;
    out.m_34.x = _301;
    float _311 = fma(_307, 0.5, 0.5);
    float _313 = fma(_309, -0.5, 0.5);
    out.m_36.w = _295;
    out.m_38.w = _303;
    out.gl_Position.x = _297;
    out.gl_Position.y = _299;
    out.gl_Position.z = _305;
    out.gl_Position.w = _269;
    out.m_40.x = _311;
    out.m_40.y = _313;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_32.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_32.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_32.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_32.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

