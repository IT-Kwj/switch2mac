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
    int _56 = as_type<int>(_47) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _60 = _56 != 0;
    uint _63 = uint(int(uint(_54) >> uint(2)));
    uint _65 = uint(int(uint(int(_63)) >> uint(2)));
    int _67 = int(_63) & 3;
    float _69 = (*spvDescriptorSet0.vp_c3)._m0[int(_65)][_67];
    int _71 = _50;
    bool _73 = _60;
    if (!_60)
    {
        float _75 = as_type<float>(in.m_25.y);
        _71 = as_type<int>(_75);
    }
    int _77 = _71;
    bool _79 = false;
    if (_60)
    {
        _79 = false;
    }
    bool _81 = _79;
    int _83 = 0;
    bool _85 = _81;
    if (!_60)
    {
        int _87 = _77 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _89 = _87 != 0;
        _83 = _89 ? (-1) : 0;
    }
    int _91 = _83;
    int _93 = _91;
    if (!_60)
    {
        int _95 = ~_91;
        _85 = _95 != 0;
    }
    bool _97 = _85;
    int _99 = as_type<int>(_69) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _101 = as_type<int>(_47);
    if (_97)
    {
        float _103 = as_type<float>(in.m_25.z);
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    if (!_97)
    {
        _73 = false;
    }
    bool _107 = _73;
    int _109 = _99 << 4;
    int _111 = _109 + 208;
    uint _113 = uint(int(uint(as_type<int>(_69)) >> uint(5)));
    int _115 = int(_113) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _117 = uint(int(uint(_111) >> uint(2)));
    uint _119 = uint(int(uint(int(_117)) >> uint(2)));
    int _121 = int(_117) & 3;
    float _123 = (*spvDescriptorSet0.vp_c3)._m0[int(_119)][_121];
    int _125 = as_type<int>(_69) & 31;
    bool _127 = uint(_125) < 32u;
    int _129 = 1 << _125;
    int _131 = _127 ? _129 : 0;
    int _133 = _115 << 4;
    int _135 = _133 + 208;
    uint _137 = uint(int(uint(_111) >> uint(2)));
    uint _139 = uint(int(uint(int(_137)) >> uint(2)));
    int _141 = int(_137) & 3;
    float _143 = (*spvDescriptorSet0.vp_c3)._m0[int(_139)][_141];
    int _145 = _111 & 3;
    int _147 = _145 << 3;
    uint _149 = uint(int(uint(as_type<int>(_143)) >> uint(_147)));
    int _151 = int(_149) & 255;
    uint _153 = uint(int(uint(_135) >> uint(2)));
    uint _155 = uint(int(uint(int(_153)) >> uint(2)));
    int _157 = int(_153) & 3;
    float _159 = (*spvDescriptorSet0.vp_c3)._m0[int(_155)][_157];
    bool _161 = _107;
    if (_97)
    {
        int _163 = _105 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _165 = _163 != 0;
        _93 = _165 ? (-1) : 0;
    }
    int _167 = _93;
    float _169 = in.m_28.x;
    float _171 = in.m_28.y;
    float _173 = in.m_28.z;
    int _175 = _167;
    if (_97)
    {
        int _177 = ~_167;
        _161 = _177 != 0;
    }
    bool _179 = _161;
    int _181 = 0;
    if (_179)
    {
        float _183 = as_type<float>(in.m_25.w);
        _181 = as_type<int>(_183);
    }
    int _185 = _181;
    bool _187 = false;
    if (!_179)
    {
        _187 = false;
    }
    bool _189 = _187;
    float _191 = _171 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _193 = _171 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _195 = _171 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _197 = _171 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _199 = fma(_169, (*spvDescriptorSet0.vp_c3)._m0[1].x, _191);
    uint _201 = extract_bits(as_type<uint>(_123), 24u, 8u);
    float _203 = float(_201);
    float _205 = fma(_169, (*spvDescriptorSet0.vp_c3)._m0[2].x, _193);
    float _207 = fma(_169, (*spvDescriptorSet0.vp_c3)._m0[3].x, _195);
    float _209 = fma(_169, (*spvDescriptorSet0.vp_c3)._m0[4].x, _197);
    float _211 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[1].z, _199);
    float _213 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[2].z, _205);
    float _215 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[3].z, _207);
    float _217 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[4].z, _209);
    uint _219 = extract_bits(as_type<uint>(_123), 16u, 8u);
    float _221 = float(_219);
    float _223 = _211 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    bool _225 = _189;
    if (_179)
    {
        int _227 = _185 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _229 = _227 != 0;
        _175 = _229 ? (-1) : 0;
    }
    int _231 = _175;
    float _233 = _213 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _235 = _215 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _237 = _217 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    if (_179)
    {
        int _239 = ~_231;
        _225 = _239 != 0;
    }
    bool _241 = _225;
    uint _243 = extract_bits(uint(_151), 0u, 8u);
    float _245 = float(_243);
    int _247 = _131 & as_type<int>(_159);
    bool _249 = _247 != 0;
    float _251 = _203 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _223;
    out.gl_Position.y = _233;
    out.gl_Position.z = _235;
    out.gl_Position.w = _237;
    uint _253 = extract_bits(as_type<uint>(_123), 8u, 8u);
    float _255 = float(_253);
    float _257 = _221 * 0.0039215688593685626983642578125;
    int _259 = as_type<int>(_221);
    if (!_249)
    {
        _259 = -1082130432;
    }
    int _261 = _259;
    float _263 = _245 * 0.0039215688593685626983642578125;
    if (!_249)
    {
        float _678 = as_type<float>(_261);
        out.gl_Position.w = _678;
    }
    float _265 = _255 * 0.0039215688593685626983642578125;
    out.m_31.x = _251;
    out.m_31.y = _257;
    out.m_31.z = _265;
    out.m_31.w = _263;
    if (!_241)
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
    int _56 = as_type<int>(_47) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _60 = _56 != 0;
    uint _63 = uint(int(uint(_54) >> uint(2)));
    uint _65 = uint(int(uint(int(_63)) >> uint(2)));
    int _67 = int(_63) & 3;
    float _69 = (*spvDescriptorSet0.vp_c3)._m0[int(_65)][_67];
    int _71 = _50;
    bool _73 = _60;
    if (!_60)
    {
        float _75 = as_type<float>(in.m_25.y);
        _71 = as_type<int>(_75);
    }
    int _77 = _71;
    bool _79 = false;
    if (_60)
    {
        _79 = false;
    }
    bool _81 = _79;
    int _83 = 0;
    bool _85 = _81;
    if (!_60)
    {
        int _87 = _77 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _89 = _87 != 0;
        _83 = _89 ? (-1) : 0;
    }
    int _91 = _83;
    int _93 = _91;
    if (!_60)
    {
        int _95 = ~_91;
        _85 = _95 != 0;
    }
    bool _97 = _85;
    int _99 = as_type<int>(_69) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _101 = as_type<int>(_47);
    if (_97)
    {
        float _103 = as_type<float>(in.m_25.z);
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    if (!_97)
    {
        _73 = false;
    }
    bool _107 = _73;
    int _109 = _99 << 4;
    int _111 = _109 + 208;
    uint _113 = uint(int(uint(as_type<int>(_69)) >> uint(5)));
    int _115 = int(_113) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _117 = uint(int(uint(_111) >> uint(2)));
    uint _119 = uint(int(uint(int(_117)) >> uint(2)));
    int _121 = int(_117) & 3;
    float _123 = (*spvDescriptorSet0.vp_c3)._m0[int(_119)][_121];
    int _125 = as_type<int>(_69) & 31;
    bool _127 = uint(_125) < 32u;
    int _129 = 1 << _125;
    int _131 = _127 ? _129 : 0;
    int _133 = _115 << 4;
    int _135 = _133 + 208;
    uint _137 = uint(int(uint(_111) >> uint(2)));
    uint _139 = uint(int(uint(int(_137)) >> uint(2)));
    int _141 = int(_137) & 3;
    float _143 = (*spvDescriptorSet0.vp_c3)._m0[int(_139)][_141];
    int _145 = _111 & 3;
    int _147 = _145 << 3;
    uint _149 = uint(int(uint(as_type<int>(_143)) >> uint(_147)));
    int _151 = int(_149) & 255;
    uint _153 = uint(int(uint(_135) >> uint(2)));
    uint _155 = uint(int(uint(int(_153)) >> uint(2)));
    int _157 = int(_153) & 3;
    float _159 = (*spvDescriptorSet0.vp_c3)._m0[int(_155)][_157];
    bool _161 = _107;
    if (_97)
    {
        int _163 = _105 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _165 = _163 != 0;
        _93 = _165 ? (-1) : 0;
    }
    int _167 = _93;
    float _169 = in.m_28.x;
    float _171 = in.m_28.y;
    float _173 = in.m_28.z;
    int _175 = _167;
    if (_97)
    {
        int _177 = ~_167;
        _161 = _177 != 0;
    }
    bool _179 = _161;
    int _181 = 0;
    if (_179)
    {
        float _183 = as_type<float>(in.m_25.w);
        _181 = as_type<int>(_183);
    }
    int _185 = _181;
    bool _187 = false;
    if (!_179)
    {
        _187 = false;
    }
    bool _189 = _187;
    float _191 = _171 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _193 = _171 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _195 = _171 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _197 = _171 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _199 = fma(_169, (*spvDescriptorSet0.vp_c3)._m0[1].x, _191);
    uint _201 = extract_bits(as_type<uint>(_123), 24u, 8u);
    float _203 = float(_201);
    float _205 = fma(_169, (*spvDescriptorSet0.vp_c3)._m0[2].x, _193);
    float _207 = fma(_169, (*spvDescriptorSet0.vp_c3)._m0[3].x, _195);
    float _209 = fma(_169, (*spvDescriptorSet0.vp_c3)._m0[4].x, _197);
    float _211 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[1].z, _199);
    float _213 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[2].z, _205);
    float _215 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[3].z, _207);
    float _217 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[4].z, _209);
    uint _219 = extract_bits(as_type<uint>(_123), 16u, 8u);
    float _221 = float(_219);
    float _223 = _211 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    bool _225 = _189;
    if (_179)
    {
        int _227 = _185 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _229 = _227 != 0;
        _175 = _229 ? (-1) : 0;
    }
    int _231 = _175;
    float _233 = _213 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _235 = _215 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _237 = _217 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    if (_179)
    {
        int _239 = ~_231;
        _225 = _239 != 0;
    }
    bool _241 = _225;
    uint _243 = extract_bits(uint(_151), 0u, 8u);
    float _245 = float(_243);
    int _247 = _131 & as_type<int>(_159);
    bool _249 = _247 != 0;
    float _251 = _203 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _223;
    out.gl_Position.y = _233;
    out.gl_Position.z = _235;
    out.gl_Position.w = _237;
    uint _253 = extract_bits(as_type<uint>(_123), 8u, 8u);
    float _255 = float(_253);
    float _257 = _221 * 0.0039215688593685626983642578125;
    int _259 = as_type<int>(_221);
    if (!_249)
    {
        _259 = -1082130432;
    }
    int _261 = _259;
    float _263 = _245 * 0.0039215688593685626983642578125;
    if (!_249)
    {
        float _678 = as_type<float>(_261);
        out.gl_Position.w = _678;
    }
    float _265 = _255 * 0.0039215688593685626983642578125;
    out.m_31.x = _251;
    out.m_31.y = _257;
    out.m_31.z = _265;
    out.m_31.w = _263;
    if (!_241)
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
    int _56 = as_type<int>(_47) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _60 = _56 != 0;
    uint _63 = uint(int(uint(_54) >> uint(2)));
    uint _65 = uint(int(uint(int(_63)) >> uint(2)));
    int _67 = int(_63) & 3;
    float _69 = (*spvDescriptorSet0.vp_c3)._m0[int(_65)][_67];
    int _71 = _50;
    bool _73 = _60;
    if (!_60)
    {
        float _75 = as_type<float>(in.m_25.y);
        _71 = as_type<int>(_75);
    }
    int _77 = _71;
    bool _79 = false;
    if (_60)
    {
        _79 = false;
    }
    bool _81 = _79;
    int _83 = 0;
    bool _85 = _81;
    if (!_60)
    {
        int _87 = _77 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _89 = _87 != 0;
        _83 = _89 ? (-1) : 0;
    }
    int _91 = _83;
    int _93 = _91;
    if (!_60)
    {
        int _95 = ~_91;
        _85 = _95 != 0;
    }
    bool _97 = _85;
    int _99 = as_type<int>(_69) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _101 = as_type<int>(_47);
    if (_97)
    {
        float _103 = as_type<float>(in.m_25.z);
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    if (!_97)
    {
        _73 = false;
    }
    bool _107 = _73;
    int _109 = _99 << 4;
    int _111 = _109 + 208;
    uint _113 = uint(int(uint(as_type<int>(_69)) >> uint(5)));
    int _115 = int(_113) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _117 = uint(int(uint(_111) >> uint(2)));
    uint _119 = uint(int(uint(int(_117)) >> uint(2)));
    int _121 = int(_117) & 3;
    float _123 = (*spvDescriptorSet0.vp_c3)._m0[int(_119)][_121];
    int _125 = as_type<int>(_69) & 31;
    bool _127 = uint(_125) < 32u;
    int _129 = 1 << _125;
    int _131 = _127 ? _129 : 0;
    int _133 = _115 << 4;
    int _135 = _133 + 208;
    uint _137 = uint(int(uint(_111) >> uint(2)));
    uint _139 = uint(int(uint(int(_137)) >> uint(2)));
    int _141 = int(_137) & 3;
    float _143 = (*spvDescriptorSet0.vp_c3)._m0[int(_139)][_141];
    int _145 = _111 & 3;
    int _147 = _145 << 3;
    uint _149 = uint(int(uint(as_type<int>(_143)) >> uint(_147)));
    int _151 = int(_149) & 255;
    uint _153 = uint(int(uint(_135) >> uint(2)));
    uint _155 = uint(int(uint(int(_153)) >> uint(2)));
    int _157 = int(_153) & 3;
    float _159 = (*spvDescriptorSet0.vp_c3)._m0[int(_155)][_157];
    bool _161 = _107;
    if (_97)
    {
        int _163 = _105 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _165 = _163 != 0;
        _93 = _165 ? (-1) : 0;
    }
    int _167 = _93;
    float _169 = in.m_28.x;
    float _171 = in.m_28.y;
    float _173 = in.m_28.z;
    int _175 = _167;
    if (_97)
    {
        int _177 = ~_167;
        _161 = _177 != 0;
    }
    bool _179 = _161;
    int _181 = 0;
    if (_179)
    {
        float _183 = as_type<float>(in.m_25.w);
        _181 = as_type<int>(_183);
    }
    int _185 = _181;
    bool _187 = false;
    if (!_179)
    {
        _187 = false;
    }
    bool _189 = _187;
    float _191 = _171 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _193 = _171 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _195 = _171 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _197 = _171 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _199 = fma(_169, (*spvDescriptorSet0.vp_c3)._m0[1].x, _191);
    uint _201 = extract_bits(as_type<uint>(_123), 24u, 8u);
    float _203 = float(_201);
    float _205 = fma(_169, (*spvDescriptorSet0.vp_c3)._m0[2].x, _193);
    float _207 = fma(_169, (*spvDescriptorSet0.vp_c3)._m0[3].x, _195);
    float _209 = fma(_169, (*spvDescriptorSet0.vp_c3)._m0[4].x, _197);
    float _211 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[1].z, _199);
    float _213 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[2].z, _205);
    float _215 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[3].z, _207);
    float _217 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[4].z, _209);
    uint _219 = extract_bits(as_type<uint>(_123), 16u, 8u);
    float _221 = float(_219);
    float _223 = _211 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    bool _225 = _189;
    if (_179)
    {
        int _227 = _185 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _229 = _227 != 0;
        _175 = _229 ? (-1) : 0;
    }
    int _231 = _175;
    float _233 = _213 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _235 = _215 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _237 = _217 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    if (_179)
    {
        int _239 = ~_231;
        _225 = _239 != 0;
    }
    bool _241 = _225;
    uint _243 = extract_bits(uint(_151), 0u, 8u);
    float _245 = float(_243);
    int _247 = _131 & as_type<int>(_159);
    bool _249 = _247 != 0;
    float _251 = _203 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _223;
    out.gl_Position.y = _233;
    out.gl_Position.z = _235;
    out.gl_Position.w = _237;
    uint _253 = extract_bits(as_type<uint>(_123), 8u, 8u);
    float _255 = float(_253);
    float _257 = _221 * 0.0039215688593685626983642578125;
    int _259 = as_type<int>(_221);
    if (!_249)
    {
        _259 = -1082130432;
    }
    int _261 = _259;
    float _263 = _245 * 0.0039215688593685626983642578125;
    if (!_249)
    {
        float _678 = as_type<float>(_261);
        out.gl_Position.w = _678;
    }
    float _265 = _255 * 0.0039215688593685626983642578125;
    out.m_31.x = _251;
    out.m_31.y = _257;
    out.m_31.z = _265;
    out.m_31.w = _263;
    if (!_241)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

