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
    int _50 = as_type<int>(_45) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
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
    int _105 = _101 ? (-1) : 0;
    if (!_101)
    {
        _75 = false;
    }
    bool _107 = _75;
    int _109 = _103 << 4;
    int _111 = _109 + 208;
    int _113 = _103;
    bool _115 = _107;
    if (_101)
    {
        float _117 = as_type<float>(in.m_25.z);
        _113 = as_type<int>(_117);
    }
    int _119 = _113;
    uint _121 = uint(int(uint(_111) >> uint(2)));
    uint _123 = uint(int(uint(int(_121)) >> uint(2)));
    int _125 = int(_121) & 3;
    float _127 = (*spvDescriptorSet0.vp_c3)._m0[int(_123)][_125];
    uint _129 = uint(int(uint(_111) >> uint(2)));
    uint _131 = uint(int(uint(int(_129)) >> uint(2)));
    int _133 = int(_129) & 3;
    float _135 = (*spvDescriptorSet0.vp_c3)._m0[int(_131)][_133];
    int _137 = _111 & 3;
    int _139 = _137 << 3;
    uint _141 = uint(int(uint(as_type<int>(_135)) >> uint(_139)));
    int _143 = int(_141) & 255;
    if (_101)
    {
        int _145 = ~_119;
        int _147 = _145 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _149 = _147 != 0;
        _97 = _149 ? (-1) : 0;
    }
    int _151 = _97;
    float _153 = in.m_28.x;
    float _155 = in.m_28.y;
    float _157 = in.m_28.z;
    bool _159 = _151 != 0;
    if (_101)
    {
        int _161 = ~_151;
        _115 = _161 != 0;
    }
    bool _163 = _115;
    int _165 = 0;
    if (_163)
    {
        float _167 = as_type<float>(in.m_25.w);
        _165 = as_type<int>(_167);
    }
    int _169 = _165;
    if (!_163)
    {
        _159 = false;
    }
    bool _171 = _159;
    uint _173 = extract_bits(as_type<uint>(_127), 16u, 8u);
    float _175 = float(_173);
    float _177 = _155 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _179 = _155 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _181 = _155 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _183 = _155 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _185 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[1].x, _177);
    float _187 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[2].x, _179);
    float _189 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[3].x, _181);
    uint _191 = extract_bits(uint(_143), 0u, 8u);
    float _193 = float(_191);
    float _195 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[4].x, _183);
    float _197 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[1].z, _185);
    float _199 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[2].z, _187);
    float _201 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[3].z, _189);
    float _203 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[4].z, _195);
    float _205 = _197 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    bool _207 = _171;
    if (_163)
    {
        int _209 = ~_169;
        int _211 = _209 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _213 = _211 != 0;
        _105 = _213 ? (-1) : 0;
    }
    int _215 = _105;
    uint _217 = extract_bits(as_type<uint>(_127), 24u, 8u);
    float _219 = float(_217);
    float _221 = _203 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _223 = _175 * 0.0039215688593685626983642578125;
    if (_163)
    {
        int _225 = ~_215;
        _207 = _225 != 0;
    }
    bool _227 = _207;
    float _229 = _199 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _231 = _201 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    uint _233 = extract_bits(as_type<uint>(_127), 8u, 8u);
    float _235 = float(_233);
    float _237 = _193 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _205;
    out.gl_Position.y = _229;
    out.gl_Position.z = _231;
    out.gl_Position.w = _221;
    float _239 = _219 * 0.0039215688593685626983642578125;
    float _241 = _235 * 0.0039215688593685626983642578125;
    out.m_31.x = _239;
    out.m_31.y = _223;
    out.m_31.z = _241;
    out.m_31.w = _237;
    if (!_227)
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
    int _50 = as_type<int>(_45) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
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
    int _105 = _101 ? (-1) : 0;
    if (!_101)
    {
        _75 = false;
    }
    bool _107 = _75;
    int _109 = _103 << 4;
    int _111 = _109 + 208;
    int _113 = _103;
    bool _115 = _107;
    if (_101)
    {
        float _117 = as_type<float>(in.m_25.z);
        _113 = as_type<int>(_117);
    }
    int _119 = _113;
    uint _121 = uint(int(uint(_111) >> uint(2)));
    uint _123 = uint(int(uint(int(_121)) >> uint(2)));
    int _125 = int(_121) & 3;
    float _127 = (*spvDescriptorSet0.vp_c3)._m0[int(_123)][_125];
    uint _129 = uint(int(uint(_111) >> uint(2)));
    uint _131 = uint(int(uint(int(_129)) >> uint(2)));
    int _133 = int(_129) & 3;
    float _135 = (*spvDescriptorSet0.vp_c3)._m0[int(_131)][_133];
    int _137 = _111 & 3;
    int _139 = _137 << 3;
    uint _141 = uint(int(uint(as_type<int>(_135)) >> uint(_139)));
    int _143 = int(_141) & 255;
    if (_101)
    {
        int _145 = ~_119;
        int _147 = _145 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _149 = _147 != 0;
        _97 = _149 ? (-1) : 0;
    }
    int _151 = _97;
    float _153 = in.m_28.x;
    float _155 = in.m_28.y;
    float _157 = in.m_28.z;
    bool _159 = _151 != 0;
    if (_101)
    {
        int _161 = ~_151;
        _115 = _161 != 0;
    }
    bool _163 = _115;
    int _165 = 0;
    if (_163)
    {
        float _167 = as_type<float>(in.m_25.w);
        _165 = as_type<int>(_167);
    }
    int _169 = _165;
    if (!_163)
    {
        _159 = false;
    }
    bool _171 = _159;
    uint _173 = extract_bits(as_type<uint>(_127), 16u, 8u);
    float _175 = float(_173);
    float _177 = _155 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _179 = _155 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _181 = _155 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _183 = _155 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _185 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[1].x, _177);
    float _187 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[2].x, _179);
    float _189 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[3].x, _181);
    uint _191 = extract_bits(uint(_143), 0u, 8u);
    float _193 = float(_191);
    float _195 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[4].x, _183);
    float _197 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[1].z, _185);
    float _199 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[2].z, _187);
    float _201 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[3].z, _189);
    float _203 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[4].z, _195);
    float _205 = _197 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    bool _207 = _171;
    if (_163)
    {
        int _209 = ~_169;
        int _211 = _209 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _213 = _211 != 0;
        _105 = _213 ? (-1) : 0;
    }
    int _215 = _105;
    uint _217 = extract_bits(as_type<uint>(_127), 24u, 8u);
    float _219 = float(_217);
    float _221 = _203 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _223 = _175 * 0.0039215688593685626983642578125;
    if (_163)
    {
        int _225 = ~_215;
        _207 = _225 != 0;
    }
    bool _227 = _207;
    float _229 = _199 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _231 = _201 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    uint _233 = extract_bits(as_type<uint>(_127), 8u, 8u);
    float _235 = float(_233);
    float _237 = _193 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _205;
    out.gl_Position.y = _229;
    out.gl_Position.z = _231;
    out.gl_Position.w = _221;
    float _239 = _219 * 0.0039215688593685626983642578125;
    float _241 = _235 * 0.0039215688593685626983642578125;
    out.m_31.x = _239;
    out.m_31.y = _223;
    out.m_31.z = _241;
    out.m_31.w = _237;
    if (!_227)
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
    int _50 = as_type<int>(_45) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
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
    int _105 = _101 ? (-1) : 0;
    if (!_101)
    {
        _75 = false;
    }
    bool _107 = _75;
    int _109 = _103 << 4;
    int _111 = _109 + 208;
    int _113 = _103;
    bool _115 = _107;
    if (_101)
    {
        float _117 = as_type<float>(in.m_25.z);
        _113 = as_type<int>(_117);
    }
    int _119 = _113;
    uint _121 = uint(int(uint(_111) >> uint(2)));
    uint _123 = uint(int(uint(int(_121)) >> uint(2)));
    int _125 = int(_121) & 3;
    float _127 = (*spvDescriptorSet0.vp_c3)._m0[int(_123)][_125];
    uint _129 = uint(int(uint(_111) >> uint(2)));
    uint _131 = uint(int(uint(int(_129)) >> uint(2)));
    int _133 = int(_129) & 3;
    float _135 = (*spvDescriptorSet0.vp_c3)._m0[int(_131)][_133];
    int _137 = _111 & 3;
    int _139 = _137 << 3;
    uint _141 = uint(int(uint(as_type<int>(_135)) >> uint(_139)));
    int _143 = int(_141) & 255;
    if (_101)
    {
        int _145 = ~_119;
        int _147 = _145 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _149 = _147 != 0;
        _97 = _149 ? (-1) : 0;
    }
    int _151 = _97;
    float _153 = in.m_28.x;
    float _155 = in.m_28.y;
    float _157 = in.m_28.z;
    bool _159 = _151 != 0;
    if (_101)
    {
        int _161 = ~_151;
        _115 = _161 != 0;
    }
    bool _163 = _115;
    int _165 = 0;
    if (_163)
    {
        float _167 = as_type<float>(in.m_25.w);
        _165 = as_type<int>(_167);
    }
    int _169 = _165;
    if (!_163)
    {
        _159 = false;
    }
    bool _171 = _159;
    uint _173 = extract_bits(as_type<uint>(_127), 16u, 8u);
    float _175 = float(_173);
    float _177 = _155 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _179 = _155 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _181 = _155 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _183 = _155 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _185 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[1].x, _177);
    float _187 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[2].x, _179);
    float _189 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[3].x, _181);
    uint _191 = extract_bits(uint(_143), 0u, 8u);
    float _193 = float(_191);
    float _195 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[4].x, _183);
    float _197 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[1].z, _185);
    float _199 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[2].z, _187);
    float _201 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[3].z, _189);
    float _203 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[4].z, _195);
    float _205 = _197 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    bool _207 = _171;
    if (_163)
    {
        int _209 = ~_169;
        int _211 = _209 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _213 = _211 != 0;
        _105 = _213 ? (-1) : 0;
    }
    int _215 = _105;
    uint _217 = extract_bits(as_type<uint>(_127), 24u, 8u);
    float _219 = float(_217);
    float _221 = _203 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _223 = _175 * 0.0039215688593685626983642578125;
    if (_163)
    {
        int _225 = ~_215;
        _207 = _225 != 0;
    }
    bool _227 = _207;
    float _229 = _199 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _231 = _201 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    uint _233 = extract_bits(as_type<uint>(_127), 8u, 8u);
    float _235 = float(_233);
    float _237 = _193 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _205;
    out.gl_Position.y = _229;
    out.gl_Position.z = _231;
    out.gl_Position.w = _221;
    float _239 = _219 * 0.0039215688593685626983642578125;
    float _241 = _235 * 0.0039215688593685626983642578125;
    out.m_31.x = _239;
    out.m_31.y = _223;
    out.m_31.z = _241;
    out.m_31.w = _237;
    if (!_227)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

