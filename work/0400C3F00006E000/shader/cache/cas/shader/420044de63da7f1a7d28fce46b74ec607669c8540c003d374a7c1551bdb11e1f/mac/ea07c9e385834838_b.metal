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
    float4 m_44 [[user(locn0)]];
    float4 m_38 [[user(locn1)]];
    float4 m_36 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
    float4 m_34 [[user(locn4)]];
    float4 m_40 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_31 [[attribute(0)]];
    float4 m_29 [[attribute(1)]];
    float4 m_24 [[attribute(2)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _68 = in.m_29.x;
    float _70 = in.m_29.y;
    float _72 = in.m_29.z;
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
    bool _100 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _102 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _104 = _100 || _102;
    bool _106 = isnan(8.0);
    bool _108 = _104 || _106;
    float _110 = fma(_94, _94, _78);
    float _112 = _60 * _94;
    float _114 = fma(_98, _98, _82);
    float _116 = -_112;
    float _118 = fma(_64, _98, _116);
    float _120 = sqrt(_110);
    float _122 = sqrt(_114);
    float _124 = -_120;
    float _126 = _124 + 1.0;
    float _128 = _118 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _130 = _86 * _126;
    float _132 = -_122;
    float _134 = _132 + 1.0;
    float _136 = _84 * _134;
    float _138 = _130 * _98;
    float _140 = _136 * _64;
    float _142 = -_138;
    float _144 = fma(_136, _94, _142);
    float _146 = -_140;
    float _148 = fma(_130, _60, _146);
    float _150 = _144 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _152 = in.m_31.x;
    float _154 = in.m_31.y;
    float _156 = in.m_31.z;
    float _158 = -_128;
    float _160 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[14].z, _158);
    float _162 = _148 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _164 = -_150;
    float _166 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[14].y, _164);
    int _169 = as_type<int>(_66) & 1;
    float _171 = _160 * _160;
    float _173 = -_162;
    float _175 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[14].x, _173);
    float _177 = in.m_31.w;
    float _179 = fma(_166, _166, _171);
    float _181 = float(_169);
    float _183 = 0.0;
    float _185 = _98;
    if (!_108)
    {
        float _187 = 0.5 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _183 = _187;
    }
    float _189 = _183;
    float _191 = fma(_175, _175, _179);
    float _193 = float(as_type<int>(_66));
    float _195 = _181 + (-0.5);
    out.m_34.x = _68;
    bool _197 = _189 < _193;
    bool _199 = !_108;
    bool _201 = _197 && _199;
    float _203 = rsqrt(_191);
    out.m_34.y = _70;
    float _205 = _154 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    out.m_34.z = _72;
    float _207 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[12].x, _205);
    float _209 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _211 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[12].z, _207);
    float _213 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].x, _154);
    float _215 = _203 * _195;
    float _217 = _211 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _219 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].y, _154);
    float _221 = fma(_98, (*spvDescriptorSet0.vp_c4)._m0[0].x, _152);
    float _223 = _215 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _225 = fma(_98, (*spvDescriptorSet0.vp_c4)._m0[0].y, _152);
    if (!_201)
    {
        _185 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _227 = _185;
    float _229 = _227;
    if (_201)
    {
        float _231 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _229 = _231;
    }
    float _233 = _229;
    float _235 = _217 * _223;
    float _237 = _219 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _239 = _213 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _241 = -_233;
    float _243 = _241 + _193;
    float _245 = fma(_160, _235, _154);
    float _247 = fma(_166, _235, _152);
    float _249 = fma(_175, _235, _156);
    float _251 = fma(_225, (*spvDescriptorSet0.vp_c3)._m0[13].x, _237);
    float _253 = _245 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _255 = fma(_136, (*spvDescriptorSet0.vp_c4)._m0[0].x, _156);
    float _257 = fma(_221, (*spvDescriptorSet0.vp_c3)._m0[13].x, _239);
    float _259 = fma(_136, (*spvDescriptorSet0.vp_c4)._m0[0].y, _156);
    float _261 = fma(_247, (*spvDescriptorSet0.vp_c3)._m0[13].x, _253);
    float _263 = _245 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _265 = _217 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _267 = fma(_259, (*spvDescriptorSet0.vp_c3)._m0[13].z, _251);
    float _269 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[13].z, _261);
    float _271 = fma(_255, (*spvDescriptorSet0.vp_c3)._m0[13].z, _257);
    float _273 = _245 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _275 = fma(_247, (*spvDescriptorSet0.vp_c3)._m0[11].x, _263);
    float _277 = _269 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _279 = _245 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _281 = fma(_247, (*spvDescriptorSet0.vp_c3)._m0[10].x, _273);
    float _283 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[11].z, _275);
    float _285 = 1.0 / _277;
    float _287 = _243 * _209;
    float _289 = precise::clamp(_287, 0.0, 1.0);
    float _291 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[10].z, _281);
    float _293 = precise::min(_265, (*spvDescriptorSet0.vp_c4)._m0[2].w);
    float _295 = fma(_247, (*spvDescriptorSet0.vp_c3)._m0[12].x, _279);
    float _297 = _283 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _299 = _291 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _301 = _289 * _177;
    float _303 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[12].z, _295);
    float _305 = _293 + 1.0;
    float _307 = _271 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _309 = _267 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _311 = _303 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _313 = _305 * (*spvDescriptorSet0.vp_c4)._m0[0].z;
    float _315 = _305 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_36.x = _301;
    float _317 = _299 * _285;
    float _319 = _297 * _285;
    out.m_38.z = _313;
    out.m_38.w = _315;
    float _321 = fma(_317, 0.5, 0.5);
    float _323 = fma(_319, -0.5, 0.5);
    out.m_40.w = _307;
    out.m_42.w = _309;
    out.gl_Position.x = _299;
    out.gl_Position.y = _297;
    out.gl_Position.z = _311;
    out.gl_Position.w = _277;
    out.m_44.x = _321;
    out.m_44.y = _323;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _68 = in.m_29.x;
    float _70 = in.m_29.y;
    float _72 = in.m_29.z;
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
    bool _100 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _102 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _104 = _100 || _102;
    bool _106 = isnan(8.0);
    bool _108 = _104 || _106;
    float _110 = fma(_94, _94, _78);
    float _112 = _60 * _94;
    float _114 = fma(_98, _98, _82);
    float _116 = -_112;
    float _118 = fma(_64, _98, _116);
    float _120 = sqrt(_110);
    float _122 = sqrt(_114);
    float _124 = -_120;
    float _126 = _124 + 1.0;
    float _128 = _118 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _130 = _86 * _126;
    float _132 = -_122;
    float _134 = _132 + 1.0;
    float _136 = _84 * _134;
    float _138 = _130 * _98;
    float _140 = _136 * _64;
    float _142 = -_138;
    float _144 = fma(_136, _94, _142);
    float _146 = -_140;
    float _148 = fma(_130, _60, _146);
    float _150 = _144 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _152 = in.m_31.x;
    float _154 = in.m_31.y;
    float _156 = in.m_31.z;
    float _158 = -_128;
    float _160 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[14].z, _158);
    float _162 = _148 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _164 = -_150;
    float _166 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[14].y, _164);
    int _169 = as_type<int>(_66) & 1;
    float _171 = _160 * _160;
    float _173 = -_162;
    float _175 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[14].x, _173);
    float _177 = in.m_31.w;
    float _179 = fma(_166, _166, _171);
    float _181 = float(_169);
    float _183 = 0.0;
    float _185 = _98;
    if (!_108)
    {
        float _187 = 0.5 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _183 = _187;
    }
    float _189 = _183;
    float _191 = fma(_175, _175, _179);
    float _193 = float(as_type<int>(_66));
    float _195 = _181 + (-0.5);
    out.m_34.x = _68;
    bool _197 = _189 < _193;
    bool _199 = !_108;
    bool _201 = _197 && _199;
    float _203 = rsqrt(_191);
    out.m_34.y = _70;
    float _205 = _154 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    out.m_34.z = _72;
    float _207 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[12].x, _205);
    float _209 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _211 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[12].z, _207);
    float _213 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].x, _154);
    float _215 = _203 * _195;
    float _217 = _211 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _219 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].y, _154);
    float _221 = fma(_98, (*spvDescriptorSet0.vp_c4)._m0[0].x, _152);
    float _223 = _215 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _225 = fma(_98, (*spvDescriptorSet0.vp_c4)._m0[0].y, _152);
    if (!_201)
    {
        _185 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _227 = _185;
    float _229 = _227;
    if (_201)
    {
        float _231 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _229 = _231;
    }
    float _233 = _229;
    float _235 = _217 * _223;
    float _237 = _219 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _239 = _213 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _241 = -_233;
    float _243 = _241 + _193;
    float _245 = fma(_160, _235, _154);
    float _247 = fma(_166, _235, _152);
    float _249 = fma(_175, _235, _156);
    float _251 = fma(_225, (*spvDescriptorSet0.vp_c3)._m0[13].x, _237);
    float _253 = _245 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _255 = fma(_136, (*spvDescriptorSet0.vp_c4)._m0[0].x, _156);
    float _257 = fma(_221, (*spvDescriptorSet0.vp_c3)._m0[13].x, _239);
    float _259 = fma(_136, (*spvDescriptorSet0.vp_c4)._m0[0].y, _156);
    float _261 = fma(_247, (*spvDescriptorSet0.vp_c3)._m0[13].x, _253);
    float _263 = _245 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _265 = _217 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _267 = fma(_259, (*spvDescriptorSet0.vp_c3)._m0[13].z, _251);
    float _269 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[13].z, _261);
    float _271 = fma(_255, (*spvDescriptorSet0.vp_c3)._m0[13].z, _257);
    float _273 = _245 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _275 = fma(_247, (*spvDescriptorSet0.vp_c3)._m0[11].x, _263);
    float _277 = _269 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _279 = _245 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _281 = fma(_247, (*spvDescriptorSet0.vp_c3)._m0[10].x, _273);
    float _283 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[11].z, _275);
    float _285 = 1.0 / _277;
    float _287 = _243 * _209;
    float _289 = precise::clamp(_287, 0.0, 1.0);
    float _291 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[10].z, _281);
    float _293 = precise::min(_265, (*spvDescriptorSet0.vp_c4)._m0[2].w);
    float _295 = fma(_247, (*spvDescriptorSet0.vp_c3)._m0[12].x, _279);
    float _297 = _283 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _299 = _291 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _301 = _289 * _177;
    float _303 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[12].z, _295);
    float _305 = _293 + 1.0;
    float _307 = _271 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _309 = _267 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _311 = _303 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _313 = _305 * (*spvDescriptorSet0.vp_c4)._m0[0].z;
    float _315 = _305 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_36.x = _301;
    float _317 = _299 * _285;
    float _319 = _297 * _285;
    out.m_38.z = _313;
    out.m_38.w = _315;
    float _321 = fma(_317, 0.5, 0.5);
    float _323 = fma(_319, -0.5, 0.5);
    out.m_40.w = _307;
    out.m_42.w = _309;
    out.gl_Position.x = _299;
    out.gl_Position.y = _297;
    out.gl_Position.z = _311;
    out.gl_Position.w = _277;
    out.m_44.x = _321;
    out.m_44.y = _323;
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
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _68 = in.m_29.x;
    float _70 = in.m_29.y;
    float _72 = in.m_29.z;
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
    bool _100 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _102 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _104 = _100 || _102;
    bool _106 = isnan(8.0);
    bool _108 = _104 || _106;
    float _110 = fma(_94, _94, _78);
    float _112 = _60 * _94;
    float _114 = fma(_98, _98, _82);
    float _116 = -_112;
    float _118 = fma(_64, _98, _116);
    float _120 = sqrt(_110);
    float _122 = sqrt(_114);
    float _124 = -_120;
    float _126 = _124 + 1.0;
    float _128 = _118 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _130 = _86 * _126;
    float _132 = -_122;
    float _134 = _132 + 1.0;
    float _136 = _84 * _134;
    float _138 = _130 * _98;
    float _140 = _136 * _64;
    float _142 = -_138;
    float _144 = fma(_136, _94, _142);
    float _146 = -_140;
    float _148 = fma(_130, _60, _146);
    float _150 = _144 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _152 = in.m_31.x;
    float _154 = in.m_31.y;
    float _156 = in.m_31.z;
    float _158 = -_128;
    float _160 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[14].z, _158);
    float _162 = _148 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _164 = -_150;
    float _166 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[14].y, _164);
    int _169 = as_type<int>(_66) & 1;
    float _171 = _160 * _160;
    float _173 = -_162;
    float _175 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[14].x, _173);
    float _177 = in.m_31.w;
    float _179 = fma(_166, _166, _171);
    float _181 = float(_169);
    float _183 = 0.0;
    float _185 = _98;
    if (!_108)
    {
        float _187 = 0.5 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _183 = _187;
    }
    float _189 = _183;
    float _191 = fma(_175, _175, _179);
    float _193 = float(as_type<int>(_66));
    float _195 = _181 + (-0.5);
    out.m_34.x = _68;
    bool _197 = _189 < _193;
    bool _199 = !_108;
    bool _201 = _197 && _199;
    float _203 = rsqrt(_191);
    out.m_34.y = _70;
    float _205 = _154 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    out.m_34.z = _72;
    float _207 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[12].x, _205);
    float _209 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _211 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[12].z, _207);
    float _213 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].x, _154);
    float _215 = _203 * _195;
    float _217 = _211 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _219 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[0].y, _154);
    float _221 = fma(_98, (*spvDescriptorSet0.vp_c4)._m0[0].x, _152);
    float _223 = _215 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _225 = fma(_98, (*spvDescriptorSet0.vp_c4)._m0[0].y, _152);
    if (!_201)
    {
        _185 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _227 = _185;
    float _229 = _227;
    if (_201)
    {
        float _231 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _229 = _231;
    }
    float _233 = _229;
    float _235 = _217 * _223;
    float _237 = _219 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _239 = _213 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _241 = -_233;
    float _243 = _241 + _193;
    float _245 = fma(_160, _235, _154);
    float _247 = fma(_166, _235, _152);
    float _249 = fma(_175, _235, _156);
    float _251 = fma(_225, (*spvDescriptorSet0.vp_c3)._m0[13].x, _237);
    float _253 = _245 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _255 = fma(_136, (*spvDescriptorSet0.vp_c4)._m0[0].x, _156);
    float _257 = fma(_221, (*spvDescriptorSet0.vp_c3)._m0[13].x, _239);
    float _259 = fma(_136, (*spvDescriptorSet0.vp_c4)._m0[0].y, _156);
    float _261 = fma(_247, (*spvDescriptorSet0.vp_c3)._m0[13].x, _253);
    float _263 = _245 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _265 = _217 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _267 = fma(_259, (*spvDescriptorSet0.vp_c3)._m0[13].z, _251);
    float _269 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[13].z, _261);
    float _271 = fma(_255, (*spvDescriptorSet0.vp_c3)._m0[13].z, _257);
    float _273 = _245 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _275 = fma(_247, (*spvDescriptorSet0.vp_c3)._m0[11].x, _263);
    float _277 = _269 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _279 = _245 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _281 = fma(_247, (*spvDescriptorSet0.vp_c3)._m0[10].x, _273);
    float _283 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[11].z, _275);
    float _285 = 1.0 / _277;
    float _287 = _243 * _209;
    float _289 = precise::clamp(_287, 0.0, 1.0);
    float _291 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[10].z, _281);
    float _293 = precise::min(_265, (*spvDescriptorSet0.vp_c4)._m0[2].w);
    float _295 = fma(_247, (*spvDescriptorSet0.vp_c3)._m0[12].x, _279);
    float _297 = _283 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _299 = _291 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _301 = _289 * _177;
    float _303 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[12].z, _295);
    float _305 = _293 + 1.0;
    float _307 = _271 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _309 = _267 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _311 = _303 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _313 = _305 * (*spvDescriptorSet0.vp_c4)._m0[0].z;
    float _315 = _305 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_36.x = _301;
    float _317 = _299 * _285;
    float _319 = _297 * _285;
    out.m_38.z = _313;
    out.m_38.w = _315;
    float _321 = fma(_317, 0.5, 0.5);
    float _323 = fma(_319, -0.5, 0.5);
    out.m_40.w = _307;
    out.m_42.w = _309;
    out.gl_Position.x = _299;
    out.gl_Position.y = _297;
    out.gl_Position.z = _311;
    out.gl_Position.w = _277;
    out.m_44.x = _321;
    out.m_44.y = _323;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

