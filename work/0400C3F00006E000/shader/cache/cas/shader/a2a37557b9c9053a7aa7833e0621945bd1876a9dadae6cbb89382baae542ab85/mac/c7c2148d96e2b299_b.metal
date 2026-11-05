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
};

struct main0_out
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(0)]];
    float4 m_28 [[attribute(1)]];
    uint4 m_23 [[attribute(2)]];
    uint4 m_25 [[attribute(4)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = as_type<float>(in.m_23.x);
    float _51 = as_type<float>(in.m_25.x);
    float _53 = in.m_28.x;
    float _55 = in.m_28.y;
    float _57 = in.m_28.z;
    int _60 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    int _62 = as_type<int>(_51) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _66 = _62 != 0;
    int _68 = _60 << 4;
    int _70 = _68 + 208;
    float _72 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _74 = _55 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    uint _77 = uint(int(uint(_70) >> uint(2)));
    uint _79 = uint(int(uint(int(_77)) >> uint(2)));
    int _81 = int(_77) & 3;
    float _83 = (*spvDescriptorSet0.vp_c3)._m0[int(_79)][_81];
    float _85 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _72);
    float _87 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].x, _74);
    int _89 = as_type<int>(_51);
    bool _91 = _66;
    if (!_66)
    {
        float _93 = as_type<float>(in.m_25.y);
        _89 = as_type<int>(_93);
    }
    int _95 = _89;
    bool _97 = false;
    if (_66)
    {
        _97 = false;
    }
    bool _99 = _97;
    float _101 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].z, _85);
    float _103 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[7].z, _87);
    int _105 = 0;
    bool _107 = _99;
    if (!_66)
    {
        int _109 = _95 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _111 = _109 != 0;
        _105 = _111 ? (-1) : 0;
    }
    int _113 = _105;
    int _115 = _113;
    if (!_66)
    {
        int _117 = ~_113;
        _107 = _117 != 0;
    }
    bool _119 = _107;
    int _121 = 0;
    int _123 = _119 ? (-1) : 0;
    if (_119)
    {
        float _125 = as_type<float>(in.m_25.z);
        _121 = as_type<int>(_125);
    }
    int _127 = _121;
    if (!_119)
    {
        _91 = false;
    }
    bool _129 = _91;
    int _131 = as_type<int>(_83) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _133 = _131 << 4;
    int _135 = _133 + 208;
    float _137 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    uint _139 = uint(int(uint(_135) >> uint(2)));
    uint _141 = uint(int(uint(int(_139)) >> uint(2)));
    int _143 = int(_139) & 3;
    float _145 = (*spvDescriptorSet0.vp_c3)._m0[int(_141)][_143];
    int _147 = _135 & 3;
    int _149 = _147 << 3;
    uint _151 = uint(int(uint(as_type<int>(_145)) >> uint(_149)));
    int _153 = int(_151) & 255;
    float _155 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _137);
    float _157 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].z, _155);
    float _159 = _101 * _101;
    uint _161 = uint(int(uint(_135) >> uint(2)));
    uint _163 = uint(int(uint(int(_161)) >> uint(2)));
    int _165 = int(_161) & 3;
    float _167 = (*spvDescriptorSet0.vp_c3)._m0[int(_163)][_165];
    float _169 = fma(_157, _157, _159);
    bool _171 = _129;
    if (_119)
    {
        int _173 = _127 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _175 = _173 != 0;
        _115 = _175 ? (-1) : 0;
    }
    int _177 = _115;
    float _179 = fma(_103, _103, _169);
    float _181 = in.m_30.x;
    float _183 = in.m_30.y;
    float _185 = in.m_30.z;
    bool _187 = _177 != 0;
    if (_119)
    {
        int _189 = ~_177;
        _171 = _189 != 0;
    }
    bool _191 = _171;
    float _193 = rsqrt(_179);
    int _195 = 0;
    if (_191)
    {
        float _197 = as_type<float>(in.m_25.w);
        _195 = as_type<int>(_197);
    }
    int _199 = _195;
    if (!_191)
    {
        _187 = false;
    }
    bool _201 = _187;
    float _203 = _157 * _193;
    float _205 = _183 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _207 = _183 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _209 = _183 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _211 = _183 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c3)._m0[1].x, _205);
    float _215 = fma(_181, (*spvDescriptorSet0.vp_c3)._m0[2].x, _207);
    float _217 = fma(_181, (*spvDescriptorSet0.vp_c3)._m0[3].x, _209);
    float _219 = fma(_181, (*spvDescriptorSet0.vp_c3)._m0[4].x, _211);
    float _221 = fma(_185, (*spvDescriptorSet0.vp_c3)._m0[1].z, _213);
    uint _223 = extract_bits(uint(_153), 0u, 8u);
    float _225 = float(_223);
    float _227 = fma(_185, (*spvDescriptorSet0.vp_c3)._m0[2].z, _215);
    float _229 = fma(_185, (*spvDescriptorSet0.vp_c3)._m0[3].z, _217);
    float _231 = fma(_185, (*spvDescriptorSet0.vp_c3)._m0[4].z, _219);
    float _233 = _221 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _235 = _101 * _193;
    bool _237 = _201;
    if (_191)
    {
        int _239 = _199 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _241 = _239 != 0;
        _123 = _241 ? (-1) : 0;
    }
    int _243 = _123;
    float _245 = _227 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    uint _247 = extract_bits(as_type<uint>(_167), 24u, 8u);
    float _249 = float(_247);
    float _251 = _229 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    if (_191)
    {
        int _253 = ~_243;
        _237 = _253 != 0;
    }
    bool _255 = _237;
    float _257 = _231 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _259 = _103 * _193;
    uint _261 = extract_bits(as_type<uint>(_167), 16u, 8u);
    float _263 = float(_261);
    float _265 = _225 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _233;
    out.gl_Position.y = _245;
    out.gl_Position.z = _251;
    out.gl_Position.w = _257;
    out.m_33.x = _203;
    out.m_33.y = _235;
    out.m_33.z = _259;
    uint _267 = extract_bits(as_type<uint>(_167), 8u, 8u);
    float _269 = float(_267);
    float _271 = _249 * 0.0039215688593685626983642578125;
    float _273 = _263 * 0.0039215688593685626983642578125;
    float _275 = _269 * 0.0039215688593685626983642578125;
    out.m_35.x = _271;
    out.m_35.y = _273;
    out.m_35.z = _275;
    out.m_35.w = _265;
    if (!_255)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.gl_Position.w = -1.0;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = as_type<float>(in.m_23.x);
    float _51 = as_type<float>(in.m_25.x);
    float _53 = in.m_28.x;
    float _55 = in.m_28.y;
    float _57 = in.m_28.z;
    int _60 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    int _62 = as_type<int>(_51) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _66 = _62 != 0;
    int _68 = _60 << 4;
    int _70 = _68 + 208;
    float _72 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _74 = _55 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    uint _77 = uint(int(uint(_70) >> uint(2)));
    uint _79 = uint(int(uint(int(_77)) >> uint(2)));
    int _81 = int(_77) & 3;
    float _83 = (*spvDescriptorSet0.vp_c3)._m0[int(_79)][_81];
    float _85 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _72);
    float _87 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].x, _74);
    int _89 = as_type<int>(_51);
    bool _91 = _66;
    if (!_66)
    {
        float _93 = as_type<float>(in.m_25.y);
        _89 = as_type<int>(_93);
    }
    int _95 = _89;
    bool _97 = false;
    if (_66)
    {
        _97 = false;
    }
    bool _99 = _97;
    float _101 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].z, _85);
    float _103 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[7].z, _87);
    int _105 = 0;
    bool _107 = _99;
    if (!_66)
    {
        int _109 = _95 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _111 = _109 != 0;
        _105 = _111 ? (-1) : 0;
    }
    int _113 = _105;
    int _115 = _113;
    if (!_66)
    {
        int _117 = ~_113;
        _107 = _117 != 0;
    }
    bool _119 = _107;
    int _121 = 0;
    int _123 = _119 ? (-1) : 0;
    if (_119)
    {
        float _125 = as_type<float>(in.m_25.z);
        _121 = as_type<int>(_125);
    }
    int _127 = _121;
    if (!_119)
    {
        _91 = false;
    }
    bool _129 = _91;
    int _131 = as_type<int>(_83) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _133 = _131 << 4;
    int _135 = _133 + 208;
    float _137 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    uint _139 = uint(int(uint(_135) >> uint(2)));
    uint _141 = uint(int(uint(int(_139)) >> uint(2)));
    int _143 = int(_139) & 3;
    float _145 = (*spvDescriptorSet0.vp_c3)._m0[int(_141)][_143];
    int _147 = _135 & 3;
    int _149 = _147 << 3;
    uint _151 = uint(int(uint(as_type<int>(_145)) >> uint(_149)));
    int _153 = int(_151) & 255;
    float _155 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _137);
    float _157 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].z, _155);
    float _159 = _101 * _101;
    uint _161 = uint(int(uint(_135) >> uint(2)));
    uint _163 = uint(int(uint(int(_161)) >> uint(2)));
    int _165 = int(_161) & 3;
    float _167 = (*spvDescriptorSet0.vp_c3)._m0[int(_163)][_165];
    float _169 = fma(_157, _157, _159);
    bool _171 = _129;
    if (_119)
    {
        int _173 = _127 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _175 = _173 != 0;
        _115 = _175 ? (-1) : 0;
    }
    int _177 = _115;
    float _179 = fma(_103, _103, _169);
    float _181 = in.m_30.x;
    float _183 = in.m_30.y;
    float _185 = in.m_30.z;
    bool _187 = _177 != 0;
    if (_119)
    {
        int _189 = ~_177;
        _171 = _189 != 0;
    }
    bool _191 = _171;
    float _193 = rsqrt(_179);
    int _195 = 0;
    if (_191)
    {
        float _197 = as_type<float>(in.m_25.w);
        _195 = as_type<int>(_197);
    }
    int _199 = _195;
    if (!_191)
    {
        _187 = false;
    }
    bool _201 = _187;
    float _203 = _157 * _193;
    float _205 = _183 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _207 = _183 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _209 = _183 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _211 = _183 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c3)._m0[1].x, _205);
    float _215 = fma(_181, (*spvDescriptorSet0.vp_c3)._m0[2].x, _207);
    float _217 = fma(_181, (*spvDescriptorSet0.vp_c3)._m0[3].x, _209);
    float _219 = fma(_181, (*spvDescriptorSet0.vp_c3)._m0[4].x, _211);
    float _221 = fma(_185, (*spvDescriptorSet0.vp_c3)._m0[1].z, _213);
    uint _223 = extract_bits(uint(_153), 0u, 8u);
    float _225 = float(_223);
    float _227 = fma(_185, (*spvDescriptorSet0.vp_c3)._m0[2].z, _215);
    float _229 = fma(_185, (*spvDescriptorSet0.vp_c3)._m0[3].z, _217);
    float _231 = fma(_185, (*spvDescriptorSet0.vp_c3)._m0[4].z, _219);
    float _233 = _221 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _235 = _101 * _193;
    bool _237 = _201;
    if (_191)
    {
        int _239 = _199 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _241 = _239 != 0;
        _123 = _241 ? (-1) : 0;
    }
    int _243 = _123;
    float _245 = _227 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    uint _247 = extract_bits(as_type<uint>(_167), 24u, 8u);
    float _249 = float(_247);
    float _251 = _229 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    if (_191)
    {
        int _253 = ~_243;
        _237 = _253 != 0;
    }
    bool _255 = _237;
    float _257 = _231 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _259 = _103 * _193;
    uint _261 = extract_bits(as_type<uint>(_167), 16u, 8u);
    float _263 = float(_261);
    float _265 = _225 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _233;
    out.gl_Position.y = _245;
    out.gl_Position.z = _251;
    out.gl_Position.w = _257;
    out.m_33.x = _203;
    out.m_33.y = _235;
    out.m_33.z = _259;
    uint _267 = extract_bits(as_type<uint>(_167), 8u, 8u);
    float _269 = float(_267);
    float _271 = _249 * 0.0039215688593685626983642578125;
    float _273 = _263 * 0.0039215688593685626983642578125;
    float _275 = _269 * 0.0039215688593685626983642578125;
    out.m_35.x = _271;
    out.m_35.y = _273;
    out.m_35.z = _275;
    out.m_35.w = _265;
    if (!_255)
    {
        return out;
    }
    out.gl_Position.w = -1.0;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = as_type<float>(in.m_23.x);
    float _51 = as_type<float>(in.m_25.x);
    float _53 = in.m_28.x;
    float _55 = in.m_28.y;
    float _57 = in.m_28.z;
    int _60 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    int _62 = as_type<int>(_51) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _66 = _62 != 0;
    int _68 = _60 << 4;
    int _70 = _68 + 208;
    float _72 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _74 = _55 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    uint _77 = uint(int(uint(_70) >> uint(2)));
    uint _79 = uint(int(uint(int(_77)) >> uint(2)));
    int _81 = int(_77) & 3;
    float _83 = (*spvDescriptorSet0.vp_c3)._m0[int(_79)][_81];
    float _85 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _72);
    float _87 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].x, _74);
    int _89 = as_type<int>(_51);
    bool _91 = _66;
    if (!_66)
    {
        float _93 = as_type<float>(in.m_25.y);
        _89 = as_type<int>(_93);
    }
    int _95 = _89;
    bool _97 = false;
    if (_66)
    {
        _97 = false;
    }
    bool _99 = _97;
    float _101 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].z, _85);
    float _103 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[7].z, _87);
    int _105 = 0;
    bool _107 = _99;
    if (!_66)
    {
        int _109 = _95 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _111 = _109 != 0;
        _105 = _111 ? (-1) : 0;
    }
    int _113 = _105;
    int _115 = _113;
    if (!_66)
    {
        int _117 = ~_113;
        _107 = _117 != 0;
    }
    bool _119 = _107;
    int _121 = 0;
    int _123 = _119 ? (-1) : 0;
    if (_119)
    {
        float _125 = as_type<float>(in.m_25.z);
        _121 = as_type<int>(_125);
    }
    int _127 = _121;
    if (!_119)
    {
        _91 = false;
    }
    bool _129 = _91;
    int _131 = as_type<int>(_83) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _133 = _131 << 4;
    int _135 = _133 + 208;
    float _137 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    uint _139 = uint(int(uint(_135) >> uint(2)));
    uint _141 = uint(int(uint(int(_139)) >> uint(2)));
    int _143 = int(_139) & 3;
    float _145 = (*spvDescriptorSet0.vp_c3)._m0[int(_141)][_143];
    int _147 = _135 & 3;
    int _149 = _147 << 3;
    uint _151 = uint(int(uint(as_type<int>(_145)) >> uint(_149)));
    int _153 = int(_151) & 255;
    float _155 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _137);
    float _157 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].z, _155);
    float _159 = _101 * _101;
    uint _161 = uint(int(uint(_135) >> uint(2)));
    uint _163 = uint(int(uint(int(_161)) >> uint(2)));
    int _165 = int(_161) & 3;
    float _167 = (*spvDescriptorSet0.vp_c3)._m0[int(_163)][_165];
    float _169 = fma(_157, _157, _159);
    bool _171 = _129;
    if (_119)
    {
        int _173 = _127 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _175 = _173 != 0;
        _115 = _175 ? (-1) : 0;
    }
    int _177 = _115;
    float _179 = fma(_103, _103, _169);
    float _181 = in.m_30.x;
    float _183 = in.m_30.y;
    float _185 = in.m_30.z;
    bool _187 = _177 != 0;
    if (_119)
    {
        int _189 = ~_177;
        _171 = _189 != 0;
    }
    bool _191 = _171;
    float _193 = rsqrt(_179);
    int _195 = 0;
    if (_191)
    {
        float _197 = as_type<float>(in.m_25.w);
        _195 = as_type<int>(_197);
    }
    int _199 = _195;
    if (!_191)
    {
        _187 = false;
    }
    bool _201 = _187;
    float _203 = _157 * _193;
    float _205 = _183 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _207 = _183 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _209 = _183 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _211 = _183 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c3)._m0[1].x, _205);
    float _215 = fma(_181, (*spvDescriptorSet0.vp_c3)._m0[2].x, _207);
    float _217 = fma(_181, (*spvDescriptorSet0.vp_c3)._m0[3].x, _209);
    float _219 = fma(_181, (*spvDescriptorSet0.vp_c3)._m0[4].x, _211);
    float _221 = fma(_185, (*spvDescriptorSet0.vp_c3)._m0[1].z, _213);
    uint _223 = extract_bits(uint(_153), 0u, 8u);
    float _225 = float(_223);
    float _227 = fma(_185, (*spvDescriptorSet0.vp_c3)._m0[2].z, _215);
    float _229 = fma(_185, (*spvDescriptorSet0.vp_c3)._m0[3].z, _217);
    float _231 = fma(_185, (*spvDescriptorSet0.vp_c3)._m0[4].z, _219);
    float _233 = _221 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _235 = _101 * _193;
    bool _237 = _201;
    if (_191)
    {
        int _239 = _199 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _241 = _239 != 0;
        _123 = _241 ? (-1) : 0;
    }
    int _243 = _123;
    float _245 = _227 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    uint _247 = extract_bits(as_type<uint>(_167), 24u, 8u);
    float _249 = float(_247);
    float _251 = _229 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    if (_191)
    {
        int _253 = ~_243;
        _237 = _253 != 0;
    }
    bool _255 = _237;
    float _257 = _231 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _259 = _103 * _193;
    uint _261 = extract_bits(as_type<uint>(_167), 16u, 8u);
    float _263 = float(_261);
    float _265 = _225 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _233;
    out.gl_Position.y = _245;
    out.gl_Position.z = _251;
    out.gl_Position.w = _257;
    out.m_33.x = _203;
    out.m_33.y = _235;
    out.m_33.z = _259;
    uint _267 = extract_bits(as_type<uint>(_167), 8u, 8u);
    float _269 = float(_267);
    float _271 = _249 * 0.0039215688593685626983642578125;
    float _273 = _263 * 0.0039215688593685626983642578125;
    float _275 = _269 * 0.0039215688593685626983642578125;
    out.m_35.x = _271;
    out.m_35.y = _273;
    out.m_35.z = _275;
    out.m_35.w = _265;
    if (!_255)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

