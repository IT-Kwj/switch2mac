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
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(0)]];
    float4 m_28 [[attribute(1)]];
    uint4 m_23 [[attribute(2)]];
    uint4 m_25 [[attribute(3)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
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
    int _60 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _62 = _60 << 4;
    int _64 = _62 + 208;
    uint _67 = uint(int(uint(as_type<int>(_49)) >> uint(5)));
    int _69 = int(_67) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _71 = uint(int(uint(_64) >> uint(2)));
    uint _73 = uint(int(uint(int(_71)) >> uint(2)));
    int _75 = int(_71) & 3;
    float _77 = (*spvDescriptorSet0.vp_c3)._m0[int(_73)][_75];
    int _79 = _64 & 3;
    int _81 = _79 << 3;
    uint _83 = uint(int(uint(as_type<int>(_77)) >> uint(_81)));
    int _85 = int(_83) & 255;
    int _87 = as_type<int>(_51) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _91 = _87 != 0;
    float _93 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    int _95 = _69 << 4;
    int _97 = _95 + 208;
    float _99 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _101 = in.m_30.x;
    float _103 = in.m_30.y;
    float _105 = in.m_30.z;
    float _107 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _93);
    float _109 = _55 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    uint _111 = uint(int(uint(_64) >> uint(2)));
    uint _113 = uint(int(uint(int(_111)) >> uint(2)));
    int _115 = int(_111) & 3;
    float _117 = (*spvDescriptorSet0.vp_c3)._m0[int(_113)][_115];
    int _119 = as_type<int>(_49) & 31;
    bool _121 = uint(_119) < 32u;
    int _123 = 1 << _119;
    int _125 = _121 ? _123 : 0;
    float _127 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _99);
    float _129 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].x, _109);
    int _131 = 0;
    if (!_91)
    {
        float _133 = as_type<float>(in.m_25.y);
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    float _137 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].z, _127);
    uint _139 = uint(int(uint(_97) >> uint(2)));
    uint _141 = uint(int(uint(int(_139)) >> uint(2)));
    int _143 = int(_139) & 3;
    float _145 = (*spvDescriptorSet0.vp_c3)._m0[int(_141)][_143];
    float _147 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].z, _107);
    float _149 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[7].z, _129);
    bool _151 = false;
    if (_91)
    {
        _151 = false;
    }
    bool _153 = _151;
    float _155 = _103 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _157 = _103 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _159 = _103 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _161 = _103 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _163 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[1].x, _155);
    float _165 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[2].x, _157);
    float _167 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[3].x, _159);
    float _169 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[1].z, _163);
    int _171 = 0;
    bool _173 = _153;
    if (!_91)
    {
        int _175 = _135 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _177 = _175 != 0;
        _171 = _177 ? (-1) : 0;
    }
    int _179 = _171;
    float _181 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[3].z, _167);
    int _183 = as_type<int>(_181);
    if (!_91)
    {
        int _185 = ~_179;
        _173 = _185 != 0;
    }
    bool _187 = _173;
    uint _189 = extract_bits(uint(_85), 0u, 8u);
    float _191 = float(_189);
    uint _193 = extract_bits(as_type<uint>(_117), 24u, 8u);
    float _195 = float(_193);
    int _197 = _125 & as_type<int>(_145);
    bool _199 = _197 != 0;
    float _201 = _147 * _147;
    uint _203 = extract_bits(as_type<uint>(_117), 16u, 8u);
    float _205 = float(_203);
    float _207 = _191 * 0.0039215688593685626983642578125;
    float _209 = fma(_137, _137, _201);
    float _211 = _195 * 0.0039215688593685626983642578125;
    float _213 = fma(_149, _149, _209);
    uint _215 = extract_bits(as_type<uint>(_117), 8u, 8u);
    float _217 = float(_215);
    float _219 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[4].x, _161);
    float _221 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[2].z, _165);
    float _223 = _169 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _225 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[4].z, _219);
    float _227 = _221 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _229 = _181 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _231 = rsqrt(_213);
    float _233 = _225 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    if (!_199)
    {
        _183 = -1082130432;
    }
    int _235 = _183;
    float _237 = _205 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _223;
    out.gl_Position.y = _227;
    out.gl_Position.z = _229;
    out.gl_Position.w = _233;
    float _239 = _217 * 0.0039215688593685626983642578125;
    if (!_199)
    {
        float _618 = as_type<float>(_235);
        out.gl_Position.w = _618;
    }
    out.m_33.x = _211;
    out.m_33.y = _237;
    out.m_33.z = _239;
    out.m_33.w = _207;
    float _241 = _137 * _231;
    float _243 = _147 * _231;
    float _245 = _149 * _231;
    out.m_35.x = _241;
    out.m_35.y = _243;
    out.m_35.z = _245;
    if (!_187)
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
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
    int _60 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _62 = _60 << 4;
    int _64 = _62 + 208;
    uint _67 = uint(int(uint(as_type<int>(_49)) >> uint(5)));
    int _69 = int(_67) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _71 = uint(int(uint(_64) >> uint(2)));
    uint _73 = uint(int(uint(int(_71)) >> uint(2)));
    int _75 = int(_71) & 3;
    float _77 = (*spvDescriptorSet0.vp_c3)._m0[int(_73)][_75];
    int _79 = _64 & 3;
    int _81 = _79 << 3;
    uint _83 = uint(int(uint(as_type<int>(_77)) >> uint(_81)));
    int _85 = int(_83) & 255;
    int _87 = as_type<int>(_51) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _91 = _87 != 0;
    float _93 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    int _95 = _69 << 4;
    int _97 = _95 + 208;
    float _99 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _101 = in.m_30.x;
    float _103 = in.m_30.y;
    float _105 = in.m_30.z;
    float _107 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _93);
    float _109 = _55 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    uint _111 = uint(int(uint(_64) >> uint(2)));
    uint _113 = uint(int(uint(int(_111)) >> uint(2)));
    int _115 = int(_111) & 3;
    float _117 = (*spvDescriptorSet0.vp_c3)._m0[int(_113)][_115];
    int _119 = as_type<int>(_49) & 31;
    bool _121 = uint(_119) < 32u;
    int _123 = 1 << _119;
    int _125 = _121 ? _123 : 0;
    float _127 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _99);
    float _129 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].x, _109);
    int _131 = 0;
    if (!_91)
    {
        float _133 = as_type<float>(in.m_25.y);
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    float _137 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].z, _127);
    uint _139 = uint(int(uint(_97) >> uint(2)));
    uint _141 = uint(int(uint(int(_139)) >> uint(2)));
    int _143 = int(_139) & 3;
    float _145 = (*spvDescriptorSet0.vp_c3)._m0[int(_141)][_143];
    float _147 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].z, _107);
    float _149 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[7].z, _129);
    bool _151 = false;
    if (_91)
    {
        _151 = false;
    }
    bool _153 = _151;
    float _155 = _103 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _157 = _103 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _159 = _103 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _161 = _103 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _163 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[1].x, _155);
    float _165 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[2].x, _157);
    float _167 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[3].x, _159);
    float _169 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[1].z, _163);
    int _171 = 0;
    bool _173 = _153;
    if (!_91)
    {
        int _175 = _135 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _177 = _175 != 0;
        _171 = _177 ? (-1) : 0;
    }
    int _179 = _171;
    float _181 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[3].z, _167);
    int _183 = as_type<int>(_181);
    if (!_91)
    {
        int _185 = ~_179;
        _173 = _185 != 0;
    }
    bool _187 = _173;
    uint _189 = extract_bits(uint(_85), 0u, 8u);
    float _191 = float(_189);
    uint _193 = extract_bits(as_type<uint>(_117), 24u, 8u);
    float _195 = float(_193);
    int _197 = _125 & as_type<int>(_145);
    bool _199 = _197 != 0;
    float _201 = _147 * _147;
    uint _203 = extract_bits(as_type<uint>(_117), 16u, 8u);
    float _205 = float(_203);
    float _207 = _191 * 0.0039215688593685626983642578125;
    float _209 = fma(_137, _137, _201);
    float _211 = _195 * 0.0039215688593685626983642578125;
    float _213 = fma(_149, _149, _209);
    uint _215 = extract_bits(as_type<uint>(_117), 8u, 8u);
    float _217 = float(_215);
    float _219 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[4].x, _161);
    float _221 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[2].z, _165);
    float _223 = _169 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _225 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[4].z, _219);
    float _227 = _221 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _229 = _181 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _231 = rsqrt(_213);
    float _233 = _225 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    if (!_199)
    {
        _183 = -1082130432;
    }
    int _235 = _183;
    float _237 = _205 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _223;
    out.gl_Position.y = _227;
    out.gl_Position.z = _229;
    out.gl_Position.w = _233;
    float _239 = _217 * 0.0039215688593685626983642578125;
    if (!_199)
    {
        float _618 = as_type<float>(_235);
        out.gl_Position.w = _618;
    }
    out.m_33.x = _211;
    out.m_33.y = _237;
    out.m_33.z = _239;
    out.m_33.w = _207;
    float _241 = _137 * _231;
    float _243 = _147 * _231;
    float _245 = _149 * _231;
    out.m_35.x = _241;
    out.m_35.y = _243;
    out.m_35.z = _245;
    if (!_187)
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
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
    int _60 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _62 = _60 << 4;
    int _64 = _62 + 208;
    uint _67 = uint(int(uint(as_type<int>(_49)) >> uint(5)));
    int _69 = int(_67) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _71 = uint(int(uint(_64) >> uint(2)));
    uint _73 = uint(int(uint(int(_71)) >> uint(2)));
    int _75 = int(_71) & 3;
    float _77 = (*spvDescriptorSet0.vp_c3)._m0[int(_73)][_75];
    int _79 = _64 & 3;
    int _81 = _79 << 3;
    uint _83 = uint(int(uint(as_type<int>(_77)) >> uint(_81)));
    int _85 = int(_83) & 255;
    int _87 = as_type<int>(_51) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _91 = _87 != 0;
    float _93 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    int _95 = _69 << 4;
    int _97 = _95 + 208;
    float _99 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _101 = in.m_30.x;
    float _103 = in.m_30.y;
    float _105 = in.m_30.z;
    float _107 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _93);
    float _109 = _55 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    uint _111 = uint(int(uint(_64) >> uint(2)));
    uint _113 = uint(int(uint(int(_111)) >> uint(2)));
    int _115 = int(_111) & 3;
    float _117 = (*spvDescriptorSet0.vp_c3)._m0[int(_113)][_115];
    int _119 = as_type<int>(_49) & 31;
    bool _121 = uint(_119) < 32u;
    int _123 = 1 << _119;
    int _125 = _121 ? _123 : 0;
    float _127 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _99);
    float _129 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].x, _109);
    int _131 = 0;
    if (!_91)
    {
        float _133 = as_type<float>(in.m_25.y);
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    float _137 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].z, _127);
    uint _139 = uint(int(uint(_97) >> uint(2)));
    uint _141 = uint(int(uint(int(_139)) >> uint(2)));
    int _143 = int(_139) & 3;
    float _145 = (*spvDescriptorSet0.vp_c3)._m0[int(_141)][_143];
    float _147 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].z, _107);
    float _149 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[7].z, _129);
    bool _151 = false;
    if (_91)
    {
        _151 = false;
    }
    bool _153 = _151;
    float _155 = _103 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _157 = _103 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _159 = _103 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _161 = _103 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _163 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[1].x, _155);
    float _165 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[2].x, _157);
    float _167 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[3].x, _159);
    float _169 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[1].z, _163);
    int _171 = 0;
    bool _173 = _153;
    if (!_91)
    {
        int _175 = _135 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _177 = _175 != 0;
        _171 = _177 ? (-1) : 0;
    }
    int _179 = _171;
    float _181 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[3].z, _167);
    int _183 = as_type<int>(_181);
    if (!_91)
    {
        int _185 = ~_179;
        _173 = _185 != 0;
    }
    bool _187 = _173;
    uint _189 = extract_bits(uint(_85), 0u, 8u);
    float _191 = float(_189);
    uint _193 = extract_bits(as_type<uint>(_117), 24u, 8u);
    float _195 = float(_193);
    int _197 = _125 & as_type<int>(_145);
    bool _199 = _197 != 0;
    float _201 = _147 * _147;
    uint _203 = extract_bits(as_type<uint>(_117), 16u, 8u);
    float _205 = float(_203);
    float _207 = _191 * 0.0039215688593685626983642578125;
    float _209 = fma(_137, _137, _201);
    float _211 = _195 * 0.0039215688593685626983642578125;
    float _213 = fma(_149, _149, _209);
    uint _215 = extract_bits(as_type<uint>(_117), 8u, 8u);
    float _217 = float(_215);
    float _219 = fma(_101, (*spvDescriptorSet0.vp_c3)._m0[4].x, _161);
    float _221 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[2].z, _165);
    float _223 = _169 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _225 = fma(_105, (*spvDescriptorSet0.vp_c3)._m0[4].z, _219);
    float _227 = _221 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _229 = _181 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _231 = rsqrt(_213);
    float _233 = _225 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    if (!_199)
    {
        _183 = -1082130432;
    }
    int _235 = _183;
    float _237 = _205 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _223;
    out.gl_Position.y = _227;
    out.gl_Position.z = _229;
    out.gl_Position.w = _233;
    float _239 = _217 * 0.0039215688593685626983642578125;
    if (!_199)
    {
        float _618 = as_type<float>(_235);
        out.gl_Position.w = _618;
    }
    out.m_33.x = _211;
    out.m_33.y = _237;
    out.m_33.z = _239;
    out.m_33.w = _207;
    float _241 = _137 * _231;
    float _243 = _147 * _231;
    float _245 = _149 * _231;
    out.m_35.x = _241;
    out.m_35.y = _243;
    out.m_35.z = _245;
    if (!_187)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

