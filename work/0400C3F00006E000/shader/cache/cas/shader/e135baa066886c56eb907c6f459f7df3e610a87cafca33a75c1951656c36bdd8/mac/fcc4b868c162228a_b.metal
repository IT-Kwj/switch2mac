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
    float4 m_46 [[user(locn0)]];
    float4 m_40 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 m_36 [[user(locn4)]];
    float4 m_34 [[user(locn5)]];
    float4 m_42 [[user(locn7)]];
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _70 = in.m_29.y;
    float _72 = in.m_29.x;
    float _74 = in.m_29.z;
    float _76 = in.m_31.w;
    bool _80 = _60 > 2.0;
    float _82 = _62 * _62;
    bool _84 = _64 > 2.0;
    float _86 = _66 * _66;
    float _88 = _80 ? (-1.0) : 1.0;
    float _90 = _84 ? (-1.0) : 1.0;
    float _92 = float(as_type<int>(_68));
    float _94 = _60;
    float _96 = _64;
    if (_80)
    {
        float _98 = _60 + (-10.0);
        _94 = _98;
    }
    float _100 = _94;
    bool _102 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _104 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _106 = _102 || _104;
    bool _108 = isnan(8.0);
    bool _110 = _106 || _108;
    float _112 = _100;
    if (_84)
    {
        float _114 = _64 + (-10.0);
        _96 = _114;
    }
    float _116 = _96;
    float _118 = fma(_100, _100, _82);
    float _120 = fma(_116, _116, _86);
    float _122 = _62 * _116;
    float _124 = sqrt(_118);
    float _126 = -_122;
    float _128 = fma(_66, _100, _126);
    float _130 = _128 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _132 = sqrt(_120);
    float _134 = -_124;
    float _136 = _134 + 1.0;
    float _138 = _88 * _136;
    float _140 = -_132;
    float _142 = _140 + 1.0;
    float _144 = _90 * _142;
    float _146 = _138 * _66;
    float _148 = in.m_31.x;
    float _150 = in.m_31.y;
    float _152 = in.m_31.z;
    float _154 = _66 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _156 = _144 * _100;
    float _158 = -_146;
    float _160 = fma(_144, _62, _158);
    out.m_34.y = _70;
    float _162 = fma(_116, (*spvDescriptorSet0.vp_c3)._m0[15].x, _154);
    float _164 = -_156;
    float _166 = fma(_138, _116, _164);
    float _168 = -_130;
    float _170 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float _172 = _160 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _174 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[15].z, _162);
    float _176 = _166 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _178 = _170 * _170;
    float _180 = -_172;
    float _182 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[14].x, _180);
    int _185 = as_type<int>(_68) & 1;
    float _187 = -_176;
    float _189 = fma(_128, (*spvDescriptorSet0.vp_c3)._m0[14].y, _187);
    float _191 = _166 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    out.m_34.x = _72;
    float _193 = fma(_189, _189, _178);
    float _195 = 0.0;
    if (!_110)
    {
        float _197 = 0.5 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _195 = _197;
    }
    float _199 = _195;
    float _201 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[15].x, _191);
    float _203 = fma(_182, _182, _193);
    out.m_34.z = _74;
    float _205 = _150 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    bool _207 = _199 < _92;
    bool _209 = !_110;
    bool _211 = _207 && _209;
    float _213 = rsqrt(_203);
    float _215 = float(_185);
    float _217 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[12].x, _205);
    float _219 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[0].x, _150);
    float _221 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[0].y, _150);
    float _223 = fma(_100, (*spvDescriptorSet0.vp_c4)._m0[0].x, _148);
    float _225 = _215 + (-0.5);
    float _227 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[12].z, _217);
    float _229 = _219 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _231 = fma(_100, (*spvDescriptorSet0.vp_c4)._m0[0].y, _148);
    float _233 = _221 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _235 = _227 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _237 = fma(_223, (*spvDescriptorSet0.vp_c3)._m0[13].x, _229);
    if (!_211)
    {
        _112 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _239 = _112;
    float _241 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _243 = _239;
    if (_211)
    {
        float _245 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _243 = _245;
    }
    float _247 = _243;
    float _249 = _213 * _225;
    float _251 = fma(_231, (*spvDescriptorSet0.vp_c3)._m0[13].x, _233);
    float _253 = fma(_128, (*spvDescriptorSet0.vp_c3)._m0[15].z, _201);
    float _255 = -_247;
    float _257 = _255 + _92;
    float _259 = _249 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _261 = fma(_138, (*spvDescriptorSet0.vp_c4)._m0[0].x, _152);
    float _263 = fma(_138, (*spvDescriptorSet0.vp_c4)._m0[0].y, _152);
    out.m_36.z = _174;
    float _265 = _235 * _259;
    float _267 = _235 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _269 = fma(_263, (*spvDescriptorSet0.vp_c3)._m0[13].z, _251);
    out.m_36.x = _253;
    float _271 = fma(_170, _265, _150);
    float _273 = fma(_189, _265, _148);
    float _275 = fma(_182, _265, _152);
    float _277 = _257 * _241;
    float _279 = precise::clamp(_277, 0.0, 1.0);
    float _281 = _271 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _283 = fma(_261, (*spvDescriptorSet0.vp_c3)._m0[13].z, _237);
    float _285 = _271 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _287 = _279 * _76;
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c3)._m0[13].x, _281);
    float _291 = _271 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _293 = fma(_273, (*spvDescriptorSet0.vp_c3)._m0[10].x, _285);
    float _295 = _271 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _297 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[13].z, _289);
    float _299 = fma(_273, (*spvDescriptorSet0.vp_c3)._m0[11].x, _291);
    float _301 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[10].z, _293);
    float _303 = precise::min(_267, (*spvDescriptorSet0.vp_c4)._m0[2].w);
    float _305 = _297 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _307 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[11].z, _299);
    float _309 = fma(_273, (*spvDescriptorSet0.vp_c3)._m0[12].x, _295);
    float _311 = _301 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _313 = 1.0 / _305;
    float _315 = _307 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _317 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[12].z, _309);
    float _319 = _303 + 1.0;
    float _321 = _283 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _323 = _269 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _325 = _317 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _327 = _319 * (*spvDescriptorSet0.vp_c4)._m0[0].z;
    float _329 = _319 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_38.x = _287;
    out.m_40.z = _327;
    out.m_40.w = _329;
    float _331 = _311 * _313;
    float _333 = _315 * _313;
    out.m_42.w = _321;
    float _335 = fma(_331, 0.5, 0.5);
    float _337 = fma(_333, -0.5, 0.5);
    out.m_44.w = _323;
    out.gl_Position.x = _311;
    out.gl_Position.y = _315;
    out.gl_Position.z = _325;
    out.gl_Position.w = _305;
    out.m_46.x = _335;
    out.m_46.y = _337;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _70 = in.m_29.y;
    float _72 = in.m_29.x;
    float _74 = in.m_29.z;
    float _76 = in.m_31.w;
    bool _80 = _60 > 2.0;
    float _82 = _62 * _62;
    bool _84 = _64 > 2.0;
    float _86 = _66 * _66;
    float _88 = _80 ? (-1.0) : 1.0;
    float _90 = _84 ? (-1.0) : 1.0;
    float _92 = float(as_type<int>(_68));
    float _94 = _60;
    float _96 = _64;
    if (_80)
    {
        float _98 = _60 + (-10.0);
        _94 = _98;
    }
    float _100 = _94;
    bool _102 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _104 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _106 = _102 || _104;
    bool _108 = isnan(8.0);
    bool _110 = _106 || _108;
    float _112 = _100;
    if (_84)
    {
        float _114 = _64 + (-10.0);
        _96 = _114;
    }
    float _116 = _96;
    float _118 = fma(_100, _100, _82);
    float _120 = fma(_116, _116, _86);
    float _122 = _62 * _116;
    float _124 = sqrt(_118);
    float _126 = -_122;
    float _128 = fma(_66, _100, _126);
    float _130 = _128 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _132 = sqrt(_120);
    float _134 = -_124;
    float _136 = _134 + 1.0;
    float _138 = _88 * _136;
    float _140 = -_132;
    float _142 = _140 + 1.0;
    float _144 = _90 * _142;
    float _146 = _138 * _66;
    float _148 = in.m_31.x;
    float _150 = in.m_31.y;
    float _152 = in.m_31.z;
    float _154 = _66 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _156 = _144 * _100;
    float _158 = -_146;
    float _160 = fma(_144, _62, _158);
    out.m_34.y = _70;
    float _162 = fma(_116, (*spvDescriptorSet0.vp_c3)._m0[15].x, _154);
    float _164 = -_156;
    float _166 = fma(_138, _116, _164);
    float _168 = -_130;
    float _170 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float _172 = _160 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _174 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[15].z, _162);
    float _176 = _166 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _178 = _170 * _170;
    float _180 = -_172;
    float _182 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[14].x, _180);
    int _185 = as_type<int>(_68) & 1;
    float _187 = -_176;
    float _189 = fma(_128, (*spvDescriptorSet0.vp_c3)._m0[14].y, _187);
    float _191 = _166 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    out.m_34.x = _72;
    float _193 = fma(_189, _189, _178);
    float _195 = 0.0;
    if (!_110)
    {
        float _197 = 0.5 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _195 = _197;
    }
    float _199 = _195;
    float _201 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[15].x, _191);
    float _203 = fma(_182, _182, _193);
    out.m_34.z = _74;
    float _205 = _150 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    bool _207 = _199 < _92;
    bool _209 = !_110;
    bool _211 = _207 && _209;
    float _213 = rsqrt(_203);
    float _215 = float(_185);
    float _217 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[12].x, _205);
    float _219 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[0].x, _150);
    float _221 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[0].y, _150);
    float _223 = fma(_100, (*spvDescriptorSet0.vp_c4)._m0[0].x, _148);
    float _225 = _215 + (-0.5);
    float _227 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[12].z, _217);
    float _229 = _219 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _231 = fma(_100, (*spvDescriptorSet0.vp_c4)._m0[0].y, _148);
    float _233 = _221 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _235 = _227 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _237 = fma(_223, (*spvDescriptorSet0.vp_c3)._m0[13].x, _229);
    if (!_211)
    {
        _112 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _239 = _112;
    float _241 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _243 = _239;
    if (_211)
    {
        float _245 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _243 = _245;
    }
    float _247 = _243;
    float _249 = _213 * _225;
    float _251 = fma(_231, (*spvDescriptorSet0.vp_c3)._m0[13].x, _233);
    float _253 = fma(_128, (*spvDescriptorSet0.vp_c3)._m0[15].z, _201);
    float _255 = -_247;
    float _257 = _255 + _92;
    float _259 = _249 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _261 = fma(_138, (*spvDescriptorSet0.vp_c4)._m0[0].x, _152);
    float _263 = fma(_138, (*spvDescriptorSet0.vp_c4)._m0[0].y, _152);
    out.m_36.z = _174;
    float _265 = _235 * _259;
    float _267 = _235 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _269 = fma(_263, (*spvDescriptorSet0.vp_c3)._m0[13].z, _251);
    out.m_36.x = _253;
    float _271 = fma(_170, _265, _150);
    float _273 = fma(_189, _265, _148);
    float _275 = fma(_182, _265, _152);
    float _277 = _257 * _241;
    float _279 = precise::clamp(_277, 0.0, 1.0);
    float _281 = _271 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _283 = fma(_261, (*spvDescriptorSet0.vp_c3)._m0[13].z, _237);
    float _285 = _271 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _287 = _279 * _76;
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c3)._m0[13].x, _281);
    float _291 = _271 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _293 = fma(_273, (*spvDescriptorSet0.vp_c3)._m0[10].x, _285);
    float _295 = _271 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _297 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[13].z, _289);
    float _299 = fma(_273, (*spvDescriptorSet0.vp_c3)._m0[11].x, _291);
    float _301 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[10].z, _293);
    float _303 = precise::min(_267, (*spvDescriptorSet0.vp_c4)._m0[2].w);
    float _305 = _297 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _307 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[11].z, _299);
    float _309 = fma(_273, (*spvDescriptorSet0.vp_c3)._m0[12].x, _295);
    float _311 = _301 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _313 = 1.0 / _305;
    float _315 = _307 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _317 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[12].z, _309);
    float _319 = _303 + 1.0;
    float _321 = _283 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _323 = _269 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _325 = _317 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _327 = _319 * (*spvDescriptorSet0.vp_c4)._m0[0].z;
    float _329 = _319 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_38.x = _287;
    out.m_40.z = _327;
    out.m_40.w = _329;
    float _331 = _311 * _313;
    float _333 = _315 * _313;
    out.m_42.w = _321;
    float _335 = fma(_331, 0.5, 0.5);
    float _337 = fma(_333, -0.5, 0.5);
    out.m_44.w = _323;
    out.gl_Position.x = _311;
    out.gl_Position.y = _315;
    out.gl_Position.z = _325;
    out.gl_Position.w = _305;
    out.m_46.x = _335;
    out.m_46.y = _337;
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
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _70 = in.m_29.y;
    float _72 = in.m_29.x;
    float _74 = in.m_29.z;
    float _76 = in.m_31.w;
    bool _80 = _60 > 2.0;
    float _82 = _62 * _62;
    bool _84 = _64 > 2.0;
    float _86 = _66 * _66;
    float _88 = _80 ? (-1.0) : 1.0;
    float _90 = _84 ? (-1.0) : 1.0;
    float _92 = float(as_type<int>(_68));
    float _94 = _60;
    float _96 = _64;
    if (_80)
    {
        float _98 = _60 + (-10.0);
        _94 = _98;
    }
    float _100 = _94;
    bool _102 = (*spvDescriptorSet0.vp_c4)._m0[1].z >= 8.0;
    bool _104 = isnan((*spvDescriptorSet0.vp_c4)._m0[1].z);
    bool _106 = _102 || _104;
    bool _108 = isnan(8.0);
    bool _110 = _106 || _108;
    float _112 = _100;
    if (_84)
    {
        float _114 = _64 + (-10.0);
        _96 = _114;
    }
    float _116 = _96;
    float _118 = fma(_100, _100, _82);
    float _120 = fma(_116, _116, _86);
    float _122 = _62 * _116;
    float _124 = sqrt(_118);
    float _126 = -_122;
    float _128 = fma(_66, _100, _126);
    float _130 = _128 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _132 = sqrt(_120);
    float _134 = -_124;
    float _136 = _134 + 1.0;
    float _138 = _88 * _136;
    float _140 = -_132;
    float _142 = _140 + 1.0;
    float _144 = _90 * _142;
    float _146 = _138 * _66;
    float _148 = in.m_31.x;
    float _150 = in.m_31.y;
    float _152 = in.m_31.z;
    float _154 = _66 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _156 = _144 * _100;
    float _158 = -_146;
    float _160 = fma(_144, _62, _158);
    out.m_34.y = _70;
    float _162 = fma(_116, (*spvDescriptorSet0.vp_c3)._m0[15].x, _154);
    float _164 = -_156;
    float _166 = fma(_138, _116, _164);
    float _168 = -_130;
    float _170 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float _172 = _160 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _174 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[15].z, _162);
    float _176 = _166 * (*spvDescriptorSet0.vp_c3)._m0[14].z;
    float _178 = _170 * _170;
    float _180 = -_172;
    float _182 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[14].x, _180);
    int _185 = as_type<int>(_68) & 1;
    float _187 = -_176;
    float _189 = fma(_128, (*spvDescriptorSet0.vp_c3)._m0[14].y, _187);
    float _191 = _166 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    out.m_34.x = _72;
    float _193 = fma(_189, _189, _178);
    float _195 = 0.0;
    if (!_110)
    {
        float _197 = 0.5 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _195 = _197;
    }
    float _199 = _195;
    float _201 = fma(_160, (*spvDescriptorSet0.vp_c3)._m0[15].x, _191);
    float _203 = fma(_182, _182, _193);
    out.m_34.z = _74;
    float _205 = _150 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    bool _207 = _199 < _92;
    bool _209 = !_110;
    bool _211 = _207 && _209;
    float _213 = rsqrt(_203);
    float _215 = float(_185);
    float _217 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[12].x, _205);
    float _219 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[0].x, _150);
    float _221 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[0].y, _150);
    float _223 = fma(_100, (*spvDescriptorSet0.vp_c4)._m0[0].x, _148);
    float _225 = _215 + (-0.5);
    float _227 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[12].z, _217);
    float _229 = _219 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _231 = fma(_100, (*spvDescriptorSet0.vp_c4)._m0[0].y, _148);
    float _233 = _221 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _235 = _227 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _237 = fma(_223, (*spvDescriptorSet0.vp_c3)._m0[13].x, _229);
    if (!_211)
    {
        _112 = (*spvDescriptorSet0.vp_c4)._m0[1].z;
    }
    float _239 = _112;
    float _241 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _243 = _239;
    if (_211)
    {
        float _245 = (*spvDescriptorSet0.vp_c4)._m0[1].z + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        _243 = _245;
    }
    float _247 = _243;
    float _249 = _213 * _225;
    float _251 = fma(_231, (*spvDescriptorSet0.vp_c3)._m0[13].x, _233);
    float _253 = fma(_128, (*spvDescriptorSet0.vp_c3)._m0[15].z, _201);
    float _255 = -_247;
    float _257 = _255 + _92;
    float _259 = _249 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _261 = fma(_138, (*spvDescriptorSet0.vp_c4)._m0[0].x, _152);
    float _263 = fma(_138, (*spvDescriptorSet0.vp_c4)._m0[0].y, _152);
    out.m_36.z = _174;
    float _265 = _235 * _259;
    float _267 = _235 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _269 = fma(_263, (*spvDescriptorSet0.vp_c3)._m0[13].z, _251);
    out.m_36.x = _253;
    float _271 = fma(_170, _265, _150);
    float _273 = fma(_189, _265, _148);
    float _275 = fma(_182, _265, _152);
    float _277 = _257 * _241;
    float _279 = precise::clamp(_277, 0.0, 1.0);
    float _281 = _271 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _283 = fma(_261, (*spvDescriptorSet0.vp_c3)._m0[13].z, _237);
    float _285 = _271 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _287 = _279 * _76;
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c3)._m0[13].x, _281);
    float _291 = _271 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _293 = fma(_273, (*spvDescriptorSet0.vp_c3)._m0[10].x, _285);
    float _295 = _271 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _297 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[13].z, _289);
    float _299 = fma(_273, (*spvDescriptorSet0.vp_c3)._m0[11].x, _291);
    float _301 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[10].z, _293);
    float _303 = precise::min(_267, (*spvDescriptorSet0.vp_c4)._m0[2].w);
    float _305 = _297 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _307 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[11].z, _299);
    float _309 = fma(_273, (*spvDescriptorSet0.vp_c3)._m0[12].x, _295);
    float _311 = _301 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _313 = 1.0 / _305;
    float _315 = _307 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _317 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[12].z, _309);
    float _319 = _303 + 1.0;
    float _321 = _283 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _323 = _269 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _325 = _317 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _327 = _319 * (*spvDescriptorSet0.vp_c4)._m0[0].z;
    float _329 = _319 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_38.x = _287;
    out.m_40.z = _327;
    out.m_40.w = _329;
    float _331 = _311 * _313;
    float _333 = _315 * _313;
    out.m_42.w = _321;
    float _335 = fma(_331, 0.5, 0.5);
    float _337 = fma(_333, -0.5, 0.5);
    out.m_44.w = _323;
    out.gl_Position.x = _311;
    out.gl_Position.y = _315;
    out.gl_Position.z = _325;
    out.gl_Position.w = _305;
    out.m_46.x = _335;
    out.m_46.y = _337;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

