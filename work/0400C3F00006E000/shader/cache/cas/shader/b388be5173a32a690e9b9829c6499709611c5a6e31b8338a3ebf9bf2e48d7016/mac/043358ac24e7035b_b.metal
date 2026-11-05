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
    float4 m_26 [[attribute(1)]];
    uint4 m_23 [[attribute(2)]];
    uint4 m_28 [[attribute(3)]];
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
    float _51 = in.m_26.x;
    float _53 = in.m_26.y;
    float _55 = in.m_26.z;
    int _58 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    int _60 = _58 << 4;
    int _62 = _60 + 208;
    float _64 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _66 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _68 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    uint _71 = uint(int(uint(_62) >> uint(2)));
    uint _73 = uint(int(uint(int(_71)) >> uint(2)));
    int _75 = int(_71) & 3;
    float _77 = (*spvDescriptorSet0.vp_c3)._m0[int(_73)][_75];
    float _79 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _64);
    float _81 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _66);
    float _83 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _68);
    float _85 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _79);
    float _87 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].z, _81);
    float _89 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _83);
    float _91 = _85 * _85;
    float _93 = fma(_87, _87, _91);
    float _95 = fma(_89, _89, _93);
    float _97 = rsqrt(_95);
    float _99 = _87 * _97;
    float _101 = _89 * _97;
    int _103 = as_type<int>(_77) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _105 = _103 << 4;
    int _107 = _105 + 208;
    float _109 = as_type<float>(in.m_28.x);
    uint _111 = uint(int(uint(_107) >> uint(2)));
    uint _113 = uint(int(uint(int(_111)) >> uint(2)));
    int _115 = int(_111) & 3;
    float _117 = (*spvDescriptorSet0.vp_c3)._m0[int(_113)][_115];
    int _119 = _107 & 3;
    int _121 = _119 << 3;
    uint _123 = uint(int(uint(as_type<int>(_117)) >> uint(_121)));
    int _125 = int(_123) & 255;
    uint _127 = uint(int(uint(_107) >> uint(2)));
    uint _129 = uint(int(uint(int(_127)) >> uint(2)));
    int _131 = int(_127) & 3;
    float _133 = (*spvDescriptorSet0.vp_c3)._m0[int(_129)][_131];
    int _135 = ~as_type<int>(_109);
    int _137 = _135 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _141 = _137 != 0;
    float _143 = in.m_30.x;
    float _145 = in.m_30.y;
    float _147 = in.m_30.z;
    int _149 = 0;
    if (!_141)
    {
        float _151 = as_type<float>(in.m_28.y);
        _149 = as_type<int>(_151);
    }
    int _153 = _149;
    bool _155 = false;
    if (_141)
    {
        _155 = false;
    }
    bool _157 = _155;
    uint _159 = extract_bits(uint(_125), 0u, 8u);
    float _161 = float(_159);
    float _163 = _145 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _165 = _145 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _167 = _145 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _169 = _145 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _171 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[1].x, _163);
    float _173 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[2].x, _165);
    float _175 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[3].x, _167);
    uint _177 = extract_bits(as_type<uint>(_133), 24u, 8u);
    float _179 = float(_177);
    float _181 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[4].x, _169);
    float _183 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[1].z, _171);
    int _185 = 0;
    bool _187 = _157;
    if (!_141)
    {
        int _189 = ~_153;
        int _191 = _189 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _193 = _191 != 0;
        _185 = _193 ? (-1) : 0;
    }
    int _195 = _185;
    float _197 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[2].z, _173);
    float _199 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[3].z, _175);
    float _201 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[4].z, _181);
    if (!_141)
    {
        int _203 = ~_195;
        _187 = _203 != 0;
    }
    bool _205 = _187;
    uint _207 = extract_bits(as_type<uint>(_133), 16u, 8u);
    float _209 = float(_207);
    float _211 = _183 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _213 = _197 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _215 = _199 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _217 = _201 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _219 = _85 * _97;
    float _221 = _161 * 0.0039215688593685626983642578125;
    uint _223 = extract_bits(as_type<uint>(_133), 8u, 8u);
    float _225 = float(_223);
    float _227 = _179 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _211;
    out.gl_Position.y = _213;
    out.gl_Position.z = _215;
    out.gl_Position.w = _217;
    out.m_33.x = _99;
    out.m_33.y = _219;
    out.m_33.z = _101;
    float _229 = _209 * 0.0039215688593685626983642578125;
    float _231 = _225 * 0.0039215688593685626983642578125;
    out.m_35.x = _227;
    out.m_35.y = _229;
    out.m_35.z = _231;
    out.m_35.w = _221;
    if (!_205)
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
    float _51 = in.m_26.x;
    float _53 = in.m_26.y;
    float _55 = in.m_26.z;
    int _58 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    int _60 = _58 << 4;
    int _62 = _60 + 208;
    float _64 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _66 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _68 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    uint _71 = uint(int(uint(_62) >> uint(2)));
    uint _73 = uint(int(uint(int(_71)) >> uint(2)));
    int _75 = int(_71) & 3;
    float _77 = (*spvDescriptorSet0.vp_c3)._m0[int(_73)][_75];
    float _79 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _64);
    float _81 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _66);
    float _83 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _68);
    float _85 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _79);
    float _87 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].z, _81);
    float _89 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _83);
    float _91 = _85 * _85;
    float _93 = fma(_87, _87, _91);
    float _95 = fma(_89, _89, _93);
    float _97 = rsqrt(_95);
    float _99 = _87 * _97;
    float _101 = _89 * _97;
    int _103 = as_type<int>(_77) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _105 = _103 << 4;
    int _107 = _105 + 208;
    float _109 = as_type<float>(in.m_28.x);
    uint _111 = uint(int(uint(_107) >> uint(2)));
    uint _113 = uint(int(uint(int(_111)) >> uint(2)));
    int _115 = int(_111) & 3;
    float _117 = (*spvDescriptorSet0.vp_c3)._m0[int(_113)][_115];
    int _119 = _107 & 3;
    int _121 = _119 << 3;
    uint _123 = uint(int(uint(as_type<int>(_117)) >> uint(_121)));
    int _125 = int(_123) & 255;
    uint _127 = uint(int(uint(_107) >> uint(2)));
    uint _129 = uint(int(uint(int(_127)) >> uint(2)));
    int _131 = int(_127) & 3;
    float _133 = (*spvDescriptorSet0.vp_c3)._m0[int(_129)][_131];
    int _135 = ~as_type<int>(_109);
    int _137 = _135 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _141 = _137 != 0;
    float _143 = in.m_30.x;
    float _145 = in.m_30.y;
    float _147 = in.m_30.z;
    int _149 = 0;
    if (!_141)
    {
        float _151 = as_type<float>(in.m_28.y);
        _149 = as_type<int>(_151);
    }
    int _153 = _149;
    bool _155 = false;
    if (_141)
    {
        _155 = false;
    }
    bool _157 = _155;
    uint _159 = extract_bits(uint(_125), 0u, 8u);
    float _161 = float(_159);
    float _163 = _145 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _165 = _145 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _167 = _145 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _169 = _145 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _171 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[1].x, _163);
    float _173 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[2].x, _165);
    float _175 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[3].x, _167);
    uint _177 = extract_bits(as_type<uint>(_133), 24u, 8u);
    float _179 = float(_177);
    float _181 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[4].x, _169);
    float _183 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[1].z, _171);
    int _185 = 0;
    bool _187 = _157;
    if (!_141)
    {
        int _189 = ~_153;
        int _191 = _189 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _193 = _191 != 0;
        _185 = _193 ? (-1) : 0;
    }
    int _195 = _185;
    float _197 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[2].z, _173);
    float _199 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[3].z, _175);
    float _201 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[4].z, _181);
    if (!_141)
    {
        int _203 = ~_195;
        _187 = _203 != 0;
    }
    bool _205 = _187;
    uint _207 = extract_bits(as_type<uint>(_133), 16u, 8u);
    float _209 = float(_207);
    float _211 = _183 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _213 = _197 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _215 = _199 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _217 = _201 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _219 = _85 * _97;
    float _221 = _161 * 0.0039215688593685626983642578125;
    uint _223 = extract_bits(as_type<uint>(_133), 8u, 8u);
    float _225 = float(_223);
    float _227 = _179 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _211;
    out.gl_Position.y = _213;
    out.gl_Position.z = _215;
    out.gl_Position.w = _217;
    out.m_33.x = _99;
    out.m_33.y = _219;
    out.m_33.z = _101;
    float _229 = _209 * 0.0039215688593685626983642578125;
    float _231 = _225 * 0.0039215688593685626983642578125;
    out.m_35.x = _227;
    out.m_35.y = _229;
    out.m_35.z = _231;
    out.m_35.w = _221;
    if (!_205)
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
    float _51 = in.m_26.x;
    float _53 = in.m_26.y;
    float _55 = in.m_26.z;
    int _58 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    int _60 = _58 << 4;
    int _62 = _60 + 208;
    float _64 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _66 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _68 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    uint _71 = uint(int(uint(_62) >> uint(2)));
    uint _73 = uint(int(uint(int(_71)) >> uint(2)));
    int _75 = int(_71) & 3;
    float _77 = (*spvDescriptorSet0.vp_c3)._m0[int(_73)][_75];
    float _79 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _64);
    float _81 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _66);
    float _83 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _68);
    float _85 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _79);
    float _87 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].z, _81);
    float _89 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _83);
    float _91 = _85 * _85;
    float _93 = fma(_87, _87, _91);
    float _95 = fma(_89, _89, _93);
    float _97 = rsqrt(_95);
    float _99 = _87 * _97;
    float _101 = _89 * _97;
    int _103 = as_type<int>(_77) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _105 = _103 << 4;
    int _107 = _105 + 208;
    float _109 = as_type<float>(in.m_28.x);
    uint _111 = uint(int(uint(_107) >> uint(2)));
    uint _113 = uint(int(uint(int(_111)) >> uint(2)));
    int _115 = int(_111) & 3;
    float _117 = (*spvDescriptorSet0.vp_c3)._m0[int(_113)][_115];
    int _119 = _107 & 3;
    int _121 = _119 << 3;
    uint _123 = uint(int(uint(as_type<int>(_117)) >> uint(_121)));
    int _125 = int(_123) & 255;
    uint _127 = uint(int(uint(_107) >> uint(2)));
    uint _129 = uint(int(uint(int(_127)) >> uint(2)));
    int _131 = int(_127) & 3;
    float _133 = (*spvDescriptorSet0.vp_c3)._m0[int(_129)][_131];
    int _135 = ~as_type<int>(_109);
    int _137 = _135 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _141 = _137 != 0;
    float _143 = in.m_30.x;
    float _145 = in.m_30.y;
    float _147 = in.m_30.z;
    int _149 = 0;
    if (!_141)
    {
        float _151 = as_type<float>(in.m_28.y);
        _149 = as_type<int>(_151);
    }
    int _153 = _149;
    bool _155 = false;
    if (_141)
    {
        _155 = false;
    }
    bool _157 = _155;
    uint _159 = extract_bits(uint(_125), 0u, 8u);
    float _161 = float(_159);
    float _163 = _145 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _165 = _145 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _167 = _145 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _169 = _145 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _171 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[1].x, _163);
    float _173 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[2].x, _165);
    float _175 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[3].x, _167);
    uint _177 = extract_bits(as_type<uint>(_133), 24u, 8u);
    float _179 = float(_177);
    float _181 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[4].x, _169);
    float _183 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[1].z, _171);
    int _185 = 0;
    bool _187 = _157;
    if (!_141)
    {
        int _189 = ~_153;
        int _191 = _189 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _193 = _191 != 0;
        _185 = _193 ? (-1) : 0;
    }
    int _195 = _185;
    float _197 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[2].z, _173);
    float _199 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[3].z, _175);
    float _201 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[4].z, _181);
    if (!_141)
    {
        int _203 = ~_195;
        _187 = _203 != 0;
    }
    bool _205 = _187;
    uint _207 = extract_bits(as_type<uint>(_133), 16u, 8u);
    float _209 = float(_207);
    float _211 = _183 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _213 = _197 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _215 = _199 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _217 = _201 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _219 = _85 * _97;
    float _221 = _161 * 0.0039215688593685626983642578125;
    uint _223 = extract_bits(as_type<uint>(_133), 8u, 8u);
    float _225 = float(_223);
    float _227 = _179 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _211;
    out.gl_Position.y = _213;
    out.gl_Position.z = _215;
    out.gl_Position.w = _217;
    out.m_33.x = _99;
    out.m_33.y = _219;
    out.m_33.z = _101;
    float _229 = _209 * 0.0039215688593685626983642578125;
    float _231 = _225 * 0.0039215688593685626983642578125;
    out.m_35.x = _227;
    out.m_35.y = _229;
    out.m_35.z = _231;
    out.m_35.w = _221;
    if (!_205)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

