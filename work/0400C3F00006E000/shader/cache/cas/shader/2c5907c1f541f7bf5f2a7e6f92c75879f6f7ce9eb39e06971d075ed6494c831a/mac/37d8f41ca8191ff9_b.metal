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
    float4 m_31 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_28 [[attribute(0)]];
    uint4 m_23 [[attribute(2)]];
    uint4 m_25 [[attribute(4)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = as_type<float>(in.m_23.x);
    float _47 = as_type<float>(in.m_25.x);
    int _50 = as_type<int>(_45) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].z);
    int _52 = _50 << 4;
    int _54 = _52 + 208;
    int _56 = ~as_type<int>(_47);
    int _58 = _56 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _62 = _58 != 0;
    uint _65 = uint(int(uint(_54) >> uint(2)));
    uint _67 = uint(int(uint(int(_65)) >> uint(2)));
    int _69 = int(_65) & 3;
    float _71 = (*spvDescriptorSet0.vp_c3)._m0[int(_67)][_69];
    int _73 = _50;
    bool _75 = _62;
    if (!_62)
    {
        float _77 = as_type<float>(in.m_25.y);
        _73 = as_type<int>(_77);
    }
    int _79 = _73;
    bool _81 = false;
    if (_62)
    {
        _81 = false;
    }
    bool _83 = _81;
    int _85 = 0;
    bool _87 = _83;
    if (!_62)
    {
        int _89 = ~_79;
        int _91 = _89 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _93 = _91 != 0;
        _85 = _93 ? (-1) : 0;
    }
    int _95 = _85;
    int _97 = _95;
    if (!_62)
    {
        int _99 = ~_95;
        _87 = _99 != 0;
    }
    bool _101 = _87;
    int _103 = as_type<int>(_71) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _105 = as_type<int>(_47);
    if (_101)
    {
        float _107 = as_type<float>(in.m_25.z);
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    if (!_101)
    {
        _75 = false;
    }
    bool _111 = _75;
    int _113 = _103 << 4;
    int _115 = _113 + 208;
    uint _117 = uint(int(uint(as_type<int>(_71)) >> uint(5)));
    int _119 = int(_117) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _121 = uint(int(uint(_115) >> uint(2)));
    uint _123 = uint(int(uint(int(_121)) >> uint(2)));
    int _125 = int(_121) & 3;
    float _127 = (*spvDescriptorSet0.vp_c3)._m0[int(_123)][_125];
    int _129 = as_type<int>(_71) & 31;
    bool _131 = uint(_129) < 32u;
    int _133 = 1 << _129;
    int _135 = _131 ? _133 : 0;
    int _137 = _119 << 4;
    int _139 = _137 + 208;
    uint _141 = uint(int(uint(_115) >> uint(2)));
    uint _143 = uint(int(uint(int(_141)) >> uint(2)));
    int _145 = int(_141) & 3;
    float _147 = (*spvDescriptorSet0.vp_c3)._m0[int(_143)][_145];
    int _149 = _115 & 3;
    int _151 = _149 << 3;
    uint _153 = uint(int(uint(as_type<int>(_147)) >> uint(_151)));
    int _155 = int(_153) & 255;
    uint _157 = uint(int(uint(_139) >> uint(2)));
    uint _159 = uint(int(uint(int(_157)) >> uint(2)));
    int _161 = int(_157) & 3;
    float _163 = (*spvDescriptorSet0.vp_c3)._m0[int(_159)][_161];
    bool _165 = _111;
    if (_101)
    {
        int _167 = ~_109;
        int _169 = _167 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _171 = _169 != 0;
        _97 = _171 ? (-1) : 0;
    }
    int _173 = _97;
    float _175 = in.m_28.x;
    float _177 = in.m_28.y;
    float _179 = in.m_28.z;
    int _181 = _173;
    if (_101)
    {
        int _183 = ~_173;
        _165 = _183 != 0;
    }
    bool _185 = _165;
    int _187 = 0;
    if (_185)
    {
        float _189 = as_type<float>(in.m_25.w);
        _187 = as_type<int>(_189);
    }
    int _191 = _187;
    bool _193 = false;
    if (!_185)
    {
        _193 = false;
    }
    bool _195 = _193;
    float _197 = _177 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _199 = _177 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _201 = _177 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _203 = _177 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _205 = fma(_175, (*spvDescriptorSet0.vp_c3)._m0[1].x, _197);
    uint _207 = extract_bits(as_type<uint>(_127), 24u, 8u);
    float _209 = float(_207);
    float _211 = fma(_175, (*spvDescriptorSet0.vp_c3)._m0[2].x, _199);
    float _213 = fma(_175, (*spvDescriptorSet0.vp_c3)._m0[3].x, _201);
    float _215 = fma(_175, (*spvDescriptorSet0.vp_c3)._m0[4].x, _203);
    float _217 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[1].z, _205);
    float _219 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[2].z, _211);
    float _221 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[3].z, _213);
    float _223 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[4].z, _215);
    uint _225 = extract_bits(as_type<uint>(_127), 16u, 8u);
    float _227 = float(_225);
    float _229 = _217 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    bool _231 = _195;
    if (_185)
    {
        int _233 = ~_191;
        int _235 = _233 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _237 = _235 != 0;
        _181 = _237 ? (-1) : 0;
    }
    int _239 = _181;
    float _241 = _219 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _243 = _221 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _245 = _223 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    if (_185)
    {
        int _247 = ~_239;
        _231 = _247 != 0;
    }
    bool _249 = _231;
    uint _251 = extract_bits(uint(_155), 0u, 8u);
    float _253 = float(_251);
    int _255 = _135 & as_type<int>(_163);
    bool _257 = _255 != 0;
    float _259 = _209 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _229;
    out.gl_Position.y = _241;
    out.gl_Position.z = _243;
    out.gl_Position.w = _245;
    uint _261 = extract_bits(as_type<uint>(_127), 8u, 8u);
    float _263 = float(_261);
    float _265 = _227 * 0.0039215688593685626983642578125;
    int _267 = as_type<int>(_227);
    if (!_257)
    {
        _267 = -1082130432;
    }
    int _269 = _267;
    float _271 = _253 * 0.0039215688593685626983642578125;
    if (!_257)
    {
        float _694 = as_type<float>(_269);
        out.gl_Position.w = _694;
    }
    float _273 = _263 * 0.0039215688593685626983642578125;
    out.m_31.x = _259;
    out.m_31.y = _265;
    out.m_31.z = _273;
    out.m_31.w = _271;
    if (!_249)
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
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = as_type<float>(in.m_23.x);
    float _47 = as_type<float>(in.m_25.x);
    int _50 = as_type<int>(_45) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].z);
    int _52 = _50 << 4;
    int _54 = _52 + 208;
    int _56 = ~as_type<int>(_47);
    int _58 = _56 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _62 = _58 != 0;
    uint _65 = uint(int(uint(_54) >> uint(2)));
    uint _67 = uint(int(uint(int(_65)) >> uint(2)));
    int _69 = int(_65) & 3;
    float _71 = (*spvDescriptorSet0.vp_c3)._m0[int(_67)][_69];
    int _73 = _50;
    bool _75 = _62;
    if (!_62)
    {
        float _77 = as_type<float>(in.m_25.y);
        _73 = as_type<int>(_77);
    }
    int _79 = _73;
    bool _81 = false;
    if (_62)
    {
        _81 = false;
    }
    bool _83 = _81;
    int _85 = 0;
    bool _87 = _83;
    if (!_62)
    {
        int _89 = ~_79;
        int _91 = _89 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _93 = _91 != 0;
        _85 = _93 ? (-1) : 0;
    }
    int _95 = _85;
    int _97 = _95;
    if (!_62)
    {
        int _99 = ~_95;
        _87 = _99 != 0;
    }
    bool _101 = _87;
    int _103 = as_type<int>(_71) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _105 = as_type<int>(_47);
    if (_101)
    {
        float _107 = as_type<float>(in.m_25.z);
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    if (!_101)
    {
        _75 = false;
    }
    bool _111 = _75;
    int _113 = _103 << 4;
    int _115 = _113 + 208;
    uint _117 = uint(int(uint(as_type<int>(_71)) >> uint(5)));
    int _119 = int(_117) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _121 = uint(int(uint(_115) >> uint(2)));
    uint _123 = uint(int(uint(int(_121)) >> uint(2)));
    int _125 = int(_121) & 3;
    float _127 = (*spvDescriptorSet0.vp_c3)._m0[int(_123)][_125];
    int _129 = as_type<int>(_71) & 31;
    bool _131 = uint(_129) < 32u;
    int _133 = 1 << _129;
    int _135 = _131 ? _133 : 0;
    int _137 = _119 << 4;
    int _139 = _137 + 208;
    uint _141 = uint(int(uint(_115) >> uint(2)));
    uint _143 = uint(int(uint(int(_141)) >> uint(2)));
    int _145 = int(_141) & 3;
    float _147 = (*spvDescriptorSet0.vp_c3)._m0[int(_143)][_145];
    int _149 = _115 & 3;
    int _151 = _149 << 3;
    uint _153 = uint(int(uint(as_type<int>(_147)) >> uint(_151)));
    int _155 = int(_153) & 255;
    uint _157 = uint(int(uint(_139) >> uint(2)));
    uint _159 = uint(int(uint(int(_157)) >> uint(2)));
    int _161 = int(_157) & 3;
    float _163 = (*spvDescriptorSet0.vp_c3)._m0[int(_159)][_161];
    bool _165 = _111;
    if (_101)
    {
        int _167 = ~_109;
        int _169 = _167 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _171 = _169 != 0;
        _97 = _171 ? (-1) : 0;
    }
    int _173 = _97;
    float _175 = in.m_28.x;
    float _177 = in.m_28.y;
    float _179 = in.m_28.z;
    int _181 = _173;
    if (_101)
    {
        int _183 = ~_173;
        _165 = _183 != 0;
    }
    bool _185 = _165;
    int _187 = 0;
    if (_185)
    {
        float _189 = as_type<float>(in.m_25.w);
        _187 = as_type<int>(_189);
    }
    int _191 = _187;
    bool _193 = false;
    if (!_185)
    {
        _193 = false;
    }
    bool _195 = _193;
    float _197 = _177 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _199 = _177 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _201 = _177 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _203 = _177 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _205 = fma(_175, (*spvDescriptorSet0.vp_c3)._m0[1].x, _197);
    uint _207 = extract_bits(as_type<uint>(_127), 24u, 8u);
    float _209 = float(_207);
    float _211 = fma(_175, (*spvDescriptorSet0.vp_c3)._m0[2].x, _199);
    float _213 = fma(_175, (*spvDescriptorSet0.vp_c3)._m0[3].x, _201);
    float _215 = fma(_175, (*spvDescriptorSet0.vp_c3)._m0[4].x, _203);
    float _217 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[1].z, _205);
    float _219 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[2].z, _211);
    float _221 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[3].z, _213);
    float _223 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[4].z, _215);
    uint _225 = extract_bits(as_type<uint>(_127), 16u, 8u);
    float _227 = float(_225);
    float _229 = _217 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    bool _231 = _195;
    if (_185)
    {
        int _233 = ~_191;
        int _235 = _233 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _237 = _235 != 0;
        _181 = _237 ? (-1) : 0;
    }
    int _239 = _181;
    float _241 = _219 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _243 = _221 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _245 = _223 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    if (_185)
    {
        int _247 = ~_239;
        _231 = _247 != 0;
    }
    bool _249 = _231;
    uint _251 = extract_bits(uint(_155), 0u, 8u);
    float _253 = float(_251);
    int _255 = _135 & as_type<int>(_163);
    bool _257 = _255 != 0;
    float _259 = _209 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _229;
    out.gl_Position.y = _241;
    out.gl_Position.z = _243;
    out.gl_Position.w = _245;
    uint _261 = extract_bits(as_type<uint>(_127), 8u, 8u);
    float _263 = float(_261);
    float _265 = _227 * 0.0039215688593685626983642578125;
    int _267 = as_type<int>(_227);
    if (!_257)
    {
        _267 = -1082130432;
    }
    int _269 = _267;
    float _271 = _253 * 0.0039215688593685626983642578125;
    if (!_257)
    {
        float _694 = as_type<float>(_269);
        out.gl_Position.w = _694;
    }
    float _273 = _263 * 0.0039215688593685626983642578125;
    out.m_31.x = _259;
    out.m_31.y = _265;
    out.m_31.z = _273;
    out.m_31.w = _271;
    if (!_249)
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
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = as_type<float>(in.m_23.x);
    float _47 = as_type<float>(in.m_25.x);
    int _50 = as_type<int>(_45) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].z);
    int _52 = _50 << 4;
    int _54 = _52 + 208;
    int _56 = ~as_type<int>(_47);
    int _58 = _56 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _62 = _58 != 0;
    uint _65 = uint(int(uint(_54) >> uint(2)));
    uint _67 = uint(int(uint(int(_65)) >> uint(2)));
    int _69 = int(_65) & 3;
    float _71 = (*spvDescriptorSet0.vp_c3)._m0[int(_67)][_69];
    int _73 = _50;
    bool _75 = _62;
    if (!_62)
    {
        float _77 = as_type<float>(in.m_25.y);
        _73 = as_type<int>(_77);
    }
    int _79 = _73;
    bool _81 = false;
    if (_62)
    {
        _81 = false;
    }
    bool _83 = _81;
    int _85 = 0;
    bool _87 = _83;
    if (!_62)
    {
        int _89 = ~_79;
        int _91 = _89 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _93 = _91 != 0;
        _85 = _93 ? (-1) : 0;
    }
    int _95 = _85;
    int _97 = _95;
    if (!_62)
    {
        int _99 = ~_95;
        _87 = _99 != 0;
    }
    bool _101 = _87;
    int _103 = as_type<int>(_71) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _105 = as_type<int>(_47);
    if (_101)
    {
        float _107 = as_type<float>(in.m_25.z);
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    if (!_101)
    {
        _75 = false;
    }
    bool _111 = _75;
    int _113 = _103 << 4;
    int _115 = _113 + 208;
    uint _117 = uint(int(uint(as_type<int>(_71)) >> uint(5)));
    int _119 = int(_117) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _121 = uint(int(uint(_115) >> uint(2)));
    uint _123 = uint(int(uint(int(_121)) >> uint(2)));
    int _125 = int(_121) & 3;
    float _127 = (*spvDescriptorSet0.vp_c3)._m0[int(_123)][_125];
    int _129 = as_type<int>(_71) & 31;
    bool _131 = uint(_129) < 32u;
    int _133 = 1 << _129;
    int _135 = _131 ? _133 : 0;
    int _137 = _119 << 4;
    int _139 = _137 + 208;
    uint _141 = uint(int(uint(_115) >> uint(2)));
    uint _143 = uint(int(uint(int(_141)) >> uint(2)));
    int _145 = int(_141) & 3;
    float _147 = (*spvDescriptorSet0.vp_c3)._m0[int(_143)][_145];
    int _149 = _115 & 3;
    int _151 = _149 << 3;
    uint _153 = uint(int(uint(as_type<int>(_147)) >> uint(_151)));
    int _155 = int(_153) & 255;
    uint _157 = uint(int(uint(_139) >> uint(2)));
    uint _159 = uint(int(uint(int(_157)) >> uint(2)));
    int _161 = int(_157) & 3;
    float _163 = (*spvDescriptorSet0.vp_c3)._m0[int(_159)][_161];
    bool _165 = _111;
    if (_101)
    {
        int _167 = ~_109;
        int _169 = _167 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _171 = _169 != 0;
        _97 = _171 ? (-1) : 0;
    }
    int _173 = _97;
    float _175 = in.m_28.x;
    float _177 = in.m_28.y;
    float _179 = in.m_28.z;
    int _181 = _173;
    if (_101)
    {
        int _183 = ~_173;
        _165 = _183 != 0;
    }
    bool _185 = _165;
    int _187 = 0;
    if (_185)
    {
        float _189 = as_type<float>(in.m_25.w);
        _187 = as_type<int>(_189);
    }
    int _191 = _187;
    bool _193 = false;
    if (!_185)
    {
        _193 = false;
    }
    bool _195 = _193;
    float _197 = _177 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _199 = _177 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _201 = _177 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _203 = _177 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _205 = fma(_175, (*spvDescriptorSet0.vp_c3)._m0[1].x, _197);
    uint _207 = extract_bits(as_type<uint>(_127), 24u, 8u);
    float _209 = float(_207);
    float _211 = fma(_175, (*spvDescriptorSet0.vp_c3)._m0[2].x, _199);
    float _213 = fma(_175, (*spvDescriptorSet0.vp_c3)._m0[3].x, _201);
    float _215 = fma(_175, (*spvDescriptorSet0.vp_c3)._m0[4].x, _203);
    float _217 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[1].z, _205);
    float _219 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[2].z, _211);
    float _221 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[3].z, _213);
    float _223 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[4].z, _215);
    uint _225 = extract_bits(as_type<uint>(_127), 16u, 8u);
    float _227 = float(_225);
    float _229 = _217 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    bool _231 = _195;
    if (_185)
    {
        int _233 = ~_191;
        int _235 = _233 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _237 = _235 != 0;
        _181 = _237 ? (-1) : 0;
    }
    int _239 = _181;
    float _241 = _219 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _243 = _221 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _245 = _223 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    if (_185)
    {
        int _247 = ~_239;
        _231 = _247 != 0;
    }
    bool _249 = _231;
    uint _251 = extract_bits(uint(_155), 0u, 8u);
    float _253 = float(_251);
    int _255 = _135 & as_type<int>(_163);
    bool _257 = _255 != 0;
    float _259 = _209 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _229;
    out.gl_Position.y = _241;
    out.gl_Position.z = _243;
    out.gl_Position.w = _245;
    uint _261 = extract_bits(as_type<uint>(_127), 8u, 8u);
    float _263 = float(_261);
    float _265 = _227 * 0.0039215688593685626983642578125;
    int _267 = as_type<int>(_227);
    if (!_257)
    {
        _267 = -1082130432;
    }
    int _269 = _267;
    float _271 = _253 * 0.0039215688593685626983642578125;
    if (!_257)
    {
        float _694 = as_type<float>(_269);
        out.gl_Position.w = _694;
    }
    float _273 = _263 * 0.0039215688593685626983642578125;
    out.m_31.x = _259;
    out.m_31.y = _265;
    out.m_31.z = _273;
    out.m_31.w = _271;
    if (!_249)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

