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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
};

struct main0_out
{
    float4 m_38 [[user(locn0)]];
    float4 m_29 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_36 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = in.m_26.w;
    float _56 = trunc(_54);
    int _59 = int(_56);
    bool _63 = _59 >= 1;
    float _65 = 0.0;
    float _67 = as_type<float>(_59);
    if (!_63)
    {
        _65 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _69 = _65;
    if (!_63)
    {
        out.m_29.x = 0.0;
    }
    int _71 = 0;
    if (!_63)
    {
        float _73 = _69 * 5.0;
        _71 = as_type<int>(_73);
    }
    int _75 = _71;
    int _77 = _75;
    if (!_63)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _350 = as_type<float>(_75);
        out.gl_Position.z = _350;
    }
    if (!_63)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _79 = in.m_31.w;
    bool _81 = _79 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _83 = isnan(_79);
    bool _85 = _81 || _83;
    bool _87 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _89 = _85 || _87;
    float _91 = -_79;
    float _93 = _91 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _95 = _93;
    if (_89)
    {
        float _97 = float(_59);
        _67 = _97;
    }
    float _99 = _67;
    bool _101 = _93 >= _99;
    bool _103 = !_89;
    bool _105 = _101 || _103;
    if (_105)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _95;
    if (_105)
    {
        out.m_29.x = 0.0;
    }
    if (_105)
    {
        float _109 = _107 * 5.0;
        _77 = as_type<int>(_109);
    }
    int _111 = _77;
    if (_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _419 = as_type<float>(_111);
        out.gl_Position.z = _419;
    }
    if (_105)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _113 = as_type<float>(int(gl_VertexIndex));
    float _115 = in.m_36.x;
    float _117 = in.m_36.y;
    float _119 = in.m_26.x;
    float _121 = in.m_26.y;
    float _123 = in.m_26.z;
    int _125 = as_type<int>(_113) & 1;
    bool _127 = _125 != 0;
    int _129 = as_type<int>(_113) & 2;
    bool _131 = _129 != 0;
    float _133 = _117 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _135 = !_131;
    float _137 = _135 ? (-0.5) : 0.5;
    float _139 = _115 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _141 = !_127;
    float _143 = _141 ? (-0.5) : 0.5;
    float _145 = _133 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _147 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _137);
    float _149 = _139 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _151 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _143);
    float _153 = _121 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _155 = _145 * _147;
    float _157 = _149 * _151;
    float _159 = _121 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _161 = _121 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _163 = _155 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _165 = fma(_119, (*spvDescriptorSet0.vp_c10)._m0[5].x, _153);
    float _167 = fma(_119, (*spvDescriptorSet0.vp_c10)._m0[4].x, _159);
    float _169 = fma(_119, (*spvDescriptorSet0.vp_c10)._m0[6].x, _161);
    float _171 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _173 = _155 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _175 = fma(_157, (*spvDescriptorSet0.vp_c8)._m0[25].x, _163);
    float _177 = _155 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _179 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[5].z, _165);
    float _181 = fma(_157, (*spvDescriptorSet0.vp_c8)._m0[24].x, _173);
    float _183 = fma(_171, (*spvDescriptorSet0.vp_c8)._m0[25].z, _175);
    float _185 = fma(_157, (*spvDescriptorSet0.vp_c8)._m0[26].x, _177);
    float _187 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[4].z, _167);
    float _189 = _179 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _191 = _183 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _193 = fma(_171, (*spvDescriptorSet0.vp_c8)._m0[24].z, _181);
    float _195 = fma(_171, (*spvDescriptorSet0.vp_c8)._m0[26].z, _185);
    float _197 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[6].z, _169);
    float _199 = _189 + _191;
    float _201 = _187 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _203 = _193 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _205 = _197 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _207 = _195 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _209 = _199 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _211 = _201 + _203;
    float _213 = _199 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _215 = _205 + _207;
    float _217 = _199 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _219 = fma(_211, (*spvDescriptorSet0.vp_c8)._m0[1].x, _209);
    float _221 = _199 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _223 = fma(_211, (*spvDescriptorSet0.vp_c8)._m0[0].x, _213);
    float _225 = fma(_211, (*spvDescriptorSet0.vp_c8)._m0[2].x, _217);
    float _227 = fma(_215, (*spvDescriptorSet0.vp_c8)._m0[1].z, _219);
    float _229 = fma(_211, (*spvDescriptorSet0.vp_c8)._m0[3].x, _221);
    float _231 = fma(_215, (*spvDescriptorSet0.vp_c8)._m0[0].z, _223);
    float _233 = fma(_215, (*spvDescriptorSet0.vp_c8)._m0[2].z, _225);
    float _235 = _227 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _237 = fma(_215, (*spvDescriptorSet0.vp_c8)._m0[3].z, _229);
    float _239 = _231 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _241 = _233 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _243 = _235 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _245 = _235 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _247 = _235 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _249 = _235 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _251 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[4].x, _243);
    float _253 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[5].x, _245);
    float _255 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[6].x, _247);
    float _257 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[7].x, _249);
    float _259 = _237 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _261 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[4].z, _251);
    float _263 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[5].z, _253);
    float _265 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[6].z, _255);
    float _267 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[7].z, _257);
    float _269 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[4].w, _261);
    float _271 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[5].w, _263);
    float _273 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[6].w, _265);
    float _275 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[7].w, _267);
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _281 = _277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _285 = _273 + _275;
    float _287 = _279 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _289 = _283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _293 = _285 * 0.5;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_38.x = _287;
    out.m_38.y = _281;
    out.m_38.z = _289;
    out.m_38.w = _291;
    out.gl_Position.x = _269;
    out.gl_Position.y = _271;
    out.gl_Position.z = _273;
    out.gl_Position.w = _275;
    out.m_40.z = _293;
    out.m_40.w = _275;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = in.m_26.w;
    float _56 = trunc(_54);
    int _59 = int(_56);
    bool _63 = _59 >= 1;
    float _65 = 0.0;
    float _67 = as_type<float>(_59);
    if (!_63)
    {
        _65 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _69 = _65;
    if (!_63)
    {
        out.m_29.x = 0.0;
    }
    int _71 = 0;
    if (!_63)
    {
        float _73 = _69 * 5.0;
        _71 = as_type<int>(_73);
    }
    int _75 = _71;
    int _77 = _75;
    if (!_63)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _350 = as_type<float>(_75);
        out.gl_Position.z = _350;
    }
    if (!_63)
    {
        return out;
    }
    float _79 = in.m_31.w;
    bool _81 = _79 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _83 = isnan(_79);
    bool _85 = _81 || _83;
    bool _87 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _89 = _85 || _87;
    float _91 = -_79;
    float _93 = _91 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _95 = _93;
    if (_89)
    {
        float _97 = float(_59);
        _67 = _97;
    }
    float _99 = _67;
    bool _101 = _93 >= _99;
    bool _103 = !_89;
    bool _105 = _101 || _103;
    if (_105)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _95;
    if (_105)
    {
        out.m_29.x = 0.0;
    }
    if (_105)
    {
        float _109 = _107 * 5.0;
        _77 = as_type<int>(_109);
    }
    int _111 = _77;
    if (_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _419 = as_type<float>(_111);
        out.gl_Position.z = _419;
    }
    if (_105)
    {
        return out;
    }
    float _113 = as_type<float>(int(gl_VertexIndex));
    float _115 = in.m_36.x;
    float _117 = in.m_36.y;
    float _119 = in.m_26.x;
    float _121 = in.m_26.y;
    float _123 = in.m_26.z;
    int _125 = as_type<int>(_113) & 1;
    bool _127 = _125 != 0;
    int _129 = as_type<int>(_113) & 2;
    bool _131 = _129 != 0;
    float _133 = _117 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _135 = !_131;
    float _137 = _135 ? (-0.5) : 0.5;
    float _139 = _115 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _141 = !_127;
    float _143 = _141 ? (-0.5) : 0.5;
    float _145 = _133 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _147 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _137);
    float _149 = _139 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _151 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _143);
    float _153 = _121 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _155 = _145 * _147;
    float _157 = _149 * _151;
    float _159 = _121 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _161 = _121 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _163 = _155 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _165 = fma(_119, (*spvDescriptorSet0.vp_c10)._m0[5].x, _153);
    float _167 = fma(_119, (*spvDescriptorSet0.vp_c10)._m0[4].x, _159);
    float _169 = fma(_119, (*spvDescriptorSet0.vp_c10)._m0[6].x, _161);
    float _171 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _173 = _155 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _175 = fma(_157, (*spvDescriptorSet0.vp_c8)._m0[25].x, _163);
    float _177 = _155 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _179 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[5].z, _165);
    float _181 = fma(_157, (*spvDescriptorSet0.vp_c8)._m0[24].x, _173);
    float _183 = fma(_171, (*spvDescriptorSet0.vp_c8)._m0[25].z, _175);
    float _185 = fma(_157, (*spvDescriptorSet0.vp_c8)._m0[26].x, _177);
    float _187 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[4].z, _167);
    float _189 = _179 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _191 = _183 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _193 = fma(_171, (*spvDescriptorSet0.vp_c8)._m0[24].z, _181);
    float _195 = fma(_171, (*spvDescriptorSet0.vp_c8)._m0[26].z, _185);
    float _197 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[6].z, _169);
    float _199 = _189 + _191;
    float _201 = _187 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _203 = _193 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _205 = _197 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _207 = _195 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _209 = _199 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _211 = _201 + _203;
    float _213 = _199 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _215 = _205 + _207;
    float _217 = _199 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _219 = fma(_211, (*spvDescriptorSet0.vp_c8)._m0[1].x, _209);
    float _221 = _199 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _223 = fma(_211, (*spvDescriptorSet0.vp_c8)._m0[0].x, _213);
    float _225 = fma(_211, (*spvDescriptorSet0.vp_c8)._m0[2].x, _217);
    float _227 = fma(_215, (*spvDescriptorSet0.vp_c8)._m0[1].z, _219);
    float _229 = fma(_211, (*spvDescriptorSet0.vp_c8)._m0[3].x, _221);
    float _231 = fma(_215, (*spvDescriptorSet0.vp_c8)._m0[0].z, _223);
    float _233 = fma(_215, (*spvDescriptorSet0.vp_c8)._m0[2].z, _225);
    float _235 = _227 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _237 = fma(_215, (*spvDescriptorSet0.vp_c8)._m0[3].z, _229);
    float _239 = _231 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _241 = _233 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _243 = _235 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _245 = _235 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _247 = _235 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _249 = _235 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _251 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[4].x, _243);
    float _253 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[5].x, _245);
    float _255 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[6].x, _247);
    float _257 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[7].x, _249);
    float _259 = _237 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _261 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[4].z, _251);
    float _263 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[5].z, _253);
    float _265 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[6].z, _255);
    float _267 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[7].z, _257);
    float _269 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[4].w, _261);
    float _271 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[5].w, _263);
    float _273 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[6].w, _265);
    float _275 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[7].w, _267);
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _281 = _277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _285 = _273 + _275;
    float _287 = _279 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _289 = _283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _293 = _285 * 0.5;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_38.x = _287;
    out.m_38.y = _281;
    out.m_38.z = _289;
    out.m_38.w = _291;
    out.gl_Position.x = _269;
    out.gl_Position.y = _271;
    out.gl_Position.z = _273;
    out.gl_Position.w = _275;
    out.m_40.z = _293;
    out.m_40.w = _275;
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
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = in.m_26.w;
    float _56 = trunc(_54);
    int _59 = int(_56);
    bool _63 = _59 >= 1;
    float _65 = 0.0;
    float _67 = as_type<float>(_59);
    if (!_63)
    {
        _65 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _69 = _65;
    if (!_63)
    {
        out.m_29.x = 0.0;
    }
    int _71 = 0;
    if (!_63)
    {
        float _73 = _69 * 5.0;
        _71 = as_type<int>(_73);
    }
    int _75 = _71;
    int _77 = _75;
    if (!_63)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _350 = as_type<float>(_75);
        out.gl_Position.z = _350;
    }
    if (!_63)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _79 = in.m_31.w;
    bool _81 = _79 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _83 = isnan(_79);
    bool _85 = _81 || _83;
    bool _87 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _89 = _85 || _87;
    float _91 = -_79;
    float _93 = _91 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _95 = _93;
    if (_89)
    {
        float _97 = float(_59);
        _67 = _97;
    }
    float _99 = _67;
    bool _101 = _93 >= _99;
    bool _103 = !_89;
    bool _105 = _101 || _103;
    if (_105)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _95;
    if (_105)
    {
        out.m_29.x = 0.0;
    }
    if (_105)
    {
        float _109 = _107 * 5.0;
        _77 = as_type<int>(_109);
    }
    int _111 = _77;
    if (_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _419 = as_type<float>(_111);
        out.gl_Position.z = _419;
    }
    if (_105)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _113 = as_type<float>(int(gl_VertexIndex));
    float _115 = in.m_36.x;
    float _117 = in.m_36.y;
    float _119 = in.m_26.x;
    float _121 = in.m_26.y;
    float _123 = in.m_26.z;
    int _125 = as_type<int>(_113) & 1;
    bool _127 = _125 != 0;
    int _129 = as_type<int>(_113) & 2;
    bool _131 = _129 != 0;
    float _133 = _117 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _135 = !_131;
    float _137 = _135 ? (-0.5) : 0.5;
    float _139 = _115 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _141 = !_127;
    float _143 = _141 ? (-0.5) : 0.5;
    float _145 = _133 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _147 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _137);
    float _149 = _139 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _151 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _143);
    float _153 = _121 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _155 = _145 * _147;
    float _157 = _149 * _151;
    float _159 = _121 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _161 = _121 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _163 = _155 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _165 = fma(_119, (*spvDescriptorSet0.vp_c10)._m0[5].x, _153);
    float _167 = fma(_119, (*spvDescriptorSet0.vp_c10)._m0[4].x, _159);
    float _169 = fma(_119, (*spvDescriptorSet0.vp_c10)._m0[6].x, _161);
    float _171 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _173 = _155 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _175 = fma(_157, (*spvDescriptorSet0.vp_c8)._m0[25].x, _163);
    float _177 = _155 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _179 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[5].z, _165);
    float _181 = fma(_157, (*spvDescriptorSet0.vp_c8)._m0[24].x, _173);
    float _183 = fma(_171, (*spvDescriptorSet0.vp_c8)._m0[25].z, _175);
    float _185 = fma(_157, (*spvDescriptorSet0.vp_c8)._m0[26].x, _177);
    float _187 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[4].z, _167);
    float _189 = _179 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _191 = _183 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _193 = fma(_171, (*spvDescriptorSet0.vp_c8)._m0[24].z, _181);
    float _195 = fma(_171, (*spvDescriptorSet0.vp_c8)._m0[26].z, _185);
    float _197 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[6].z, _169);
    float _199 = _189 + _191;
    float _201 = _187 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _203 = _193 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _205 = _197 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _207 = _195 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _209 = _199 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _211 = _201 + _203;
    float _213 = _199 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _215 = _205 + _207;
    float _217 = _199 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _219 = fma(_211, (*spvDescriptorSet0.vp_c8)._m0[1].x, _209);
    float _221 = _199 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _223 = fma(_211, (*spvDescriptorSet0.vp_c8)._m0[0].x, _213);
    float _225 = fma(_211, (*spvDescriptorSet0.vp_c8)._m0[2].x, _217);
    float _227 = fma(_215, (*spvDescriptorSet0.vp_c8)._m0[1].z, _219);
    float _229 = fma(_211, (*spvDescriptorSet0.vp_c8)._m0[3].x, _221);
    float _231 = fma(_215, (*spvDescriptorSet0.vp_c8)._m0[0].z, _223);
    float _233 = fma(_215, (*spvDescriptorSet0.vp_c8)._m0[2].z, _225);
    float _235 = _227 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _237 = fma(_215, (*spvDescriptorSet0.vp_c8)._m0[3].z, _229);
    float _239 = _231 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _241 = _233 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _243 = _235 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _245 = _235 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _247 = _235 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _249 = _235 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _251 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[4].x, _243);
    float _253 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[5].x, _245);
    float _255 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[6].x, _247);
    float _257 = fma(_239, (*spvDescriptorSet0.vp_c8)._m0[7].x, _249);
    float _259 = _237 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _261 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[4].z, _251);
    float _263 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[5].z, _253);
    float _265 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[6].z, _255);
    float _267 = fma(_241, (*spvDescriptorSet0.vp_c8)._m0[7].z, _257);
    float _269 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[4].w, _261);
    float _271 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[5].w, _263);
    float _273 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[6].w, _265);
    float _275 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[7].w, _267);
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _281 = _277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _285 = _273 + _275;
    float _287 = _279 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _289 = _283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _293 = _285 * 0.5;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_38.x = _287;
    out.m_38.y = _281;
    out.m_38.z = _289;
    out.m_38.w = _291;
    out.gl_Position.x = _269;
    out.gl_Position.y = _271;
    out.gl_Position.z = _273;
    out.gl_Position.w = _275;
    out.m_40.z = _293;
    out.m_40.w = _275;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

