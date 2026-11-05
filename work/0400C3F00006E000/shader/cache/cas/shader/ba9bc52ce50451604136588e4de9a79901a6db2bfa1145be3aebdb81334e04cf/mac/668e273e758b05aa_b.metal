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
    float4 m_31 [[user(locn1)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_28 [[attribute(0)]];
    float4 m_26 [[attribute(1)]];
    uint4 m_23 [[attribute(2)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = as_type<float>(in.m_23.x);
    float _49 = in.m_26.x;
    float _51 = in.m_26.y;
    float _53 = in.m_26.z;
    int _56 = as_type<int>(_47) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    int _58 = _56 << 4;
    int _60 = _58 + 144;
    float _62 = _51 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    uint _65 = uint(int(uint(as_type<int>(_47)) >> uint(5)));
    int _67 = int(_65) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].y);
    float _69 = _51 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    uint _71 = uint(int(uint(_60) >> uint(2)));
    uint _73 = uint(int(uint(int(_71)) >> uint(2)));
    int _75 = int(_71) & 3;
    float _77 = (*spvDescriptorSet0.vp_c3)._m0[int(_73)][_75];
    int _79 = _60 & 3;
    int _81 = _79 << 3;
    uint _83 = uint(int(uint(as_type<int>(_77)) >> uint(_81)));
    int _85 = int(_83) & 255;
    float _87 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _62);
    int _89 = _67 << 4;
    int _91 = _89 + 144;
    float _93 = _51 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _95 = in.m_28.x;
    float _97 = in.m_28.y;
    float _99 = in.m_28.z;
    float _101 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].x, _69);
    float _103 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].z, _87);
    float _105 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[7].x, _93);
    uint _107 = uint(int(uint(_60) >> uint(2)));
    uint _109 = uint(int(uint(int(_107)) >> uint(2)));
    int _111 = int(_107) & 3;
    float _113 = (*spvDescriptorSet0.vp_c3)._m0[int(_109)][_111];
    float _115 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].z, _101);
    float _117 = _103 * _103;
    float _119 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].z, _105);
    uint _121 = uint(int(uint(_91) >> uint(2)));
    uint _123 = uint(int(uint(int(_121)) >> uint(2)));
    int _125 = int(_121) & 3;
    float _127 = (*spvDescriptorSet0.vp_c3)._m0[int(_123)][_125];
    float _129 = fma(_115, _115, _117);
    int _131 = as_type<int>(_47) & 31;
    bool _135 = uint(_131) < 32u;
    int _137 = 1 << _131;
    int _139 = _135 ? _137 : 0;
    float _141 = fma(_119, _119, _129);
    float _143 = rsqrt(_141);
    float _145 = _97 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _147 = _97 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _149 = _97 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _151 = _97 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _153 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[1].x, _145);
    float _155 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[2].x, _147);
    float _157 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[3].x, _149);
    float _159 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[4].x, _151);
    float _161 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[1].z, _153);
    float _163 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[2].z, _155);
    float _165 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[3].z, _157);
    float _167 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[4].z, _159);
    float _169 = _161 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _171 = _163 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _173 = _165 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _175 = _167 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _177 = _115 * _143;
    float _179 = _103 * _143;
    float _181 = _119 * _143;
    uint _183 = extract_bits(uint(_85), 0u, 8u);
    float _185 = float(_183);
    out.gl_Position.x = _169;
    out.gl_Position.y = _171;
    out.gl_Position.z = _173;
    out.gl_Position.w = _175;
    out.m_31.x = _177;
    out.m_31.y = _179;
    out.m_31.z = _181;
    uint _187 = extract_bits(as_type<uint>(_113), 24u, 8u);
    float _189 = float(_187);
    uint _191 = extract_bits(as_type<uint>(_113), 16u, 8u);
    float _193 = float(_191);
    int _195 = _139 & as_type<int>(_127);
    bool _197 = _195 != 0;
    float _199 = _185 * 0.0039215688593685626983642578125;
    uint _201 = extract_bits(as_type<uint>(_113), 8u, 8u);
    float _203 = float(_201);
    float _205 = _189 * 0.0039215688593685626983642578125;
    float _207 = _193 * 0.0039215688593685626983642578125;
    float _209 = _203 * 0.0039215688593685626983642578125;
    out.m_33.x = _205;
    out.m_33.y = _207;
    out.m_33.z = _209;
    out.m_33.w = _199;
    if (_197)
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
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = as_type<float>(in.m_23.x);
    float _49 = in.m_26.x;
    float _51 = in.m_26.y;
    float _53 = in.m_26.z;
    int _56 = as_type<int>(_47) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    int _58 = _56 << 4;
    int _60 = _58 + 144;
    float _62 = _51 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    uint _65 = uint(int(uint(as_type<int>(_47)) >> uint(5)));
    int _67 = int(_65) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].y);
    float _69 = _51 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    uint _71 = uint(int(uint(_60) >> uint(2)));
    uint _73 = uint(int(uint(int(_71)) >> uint(2)));
    int _75 = int(_71) & 3;
    float _77 = (*spvDescriptorSet0.vp_c3)._m0[int(_73)][_75];
    int _79 = _60 & 3;
    int _81 = _79 << 3;
    uint _83 = uint(int(uint(as_type<int>(_77)) >> uint(_81)));
    int _85 = int(_83) & 255;
    float _87 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _62);
    int _89 = _67 << 4;
    int _91 = _89 + 144;
    float _93 = _51 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _95 = in.m_28.x;
    float _97 = in.m_28.y;
    float _99 = in.m_28.z;
    float _101 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].x, _69);
    float _103 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].z, _87);
    float _105 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[7].x, _93);
    uint _107 = uint(int(uint(_60) >> uint(2)));
    uint _109 = uint(int(uint(int(_107)) >> uint(2)));
    int _111 = int(_107) & 3;
    float _113 = (*spvDescriptorSet0.vp_c3)._m0[int(_109)][_111];
    float _115 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].z, _101);
    float _117 = _103 * _103;
    float _119 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].z, _105);
    uint _121 = uint(int(uint(_91) >> uint(2)));
    uint _123 = uint(int(uint(int(_121)) >> uint(2)));
    int _125 = int(_121) & 3;
    float _127 = (*spvDescriptorSet0.vp_c3)._m0[int(_123)][_125];
    float _129 = fma(_115, _115, _117);
    int _131 = as_type<int>(_47) & 31;
    bool _135 = uint(_131) < 32u;
    int _137 = 1 << _131;
    int _139 = _135 ? _137 : 0;
    float _141 = fma(_119, _119, _129);
    float _143 = rsqrt(_141);
    float _145 = _97 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _147 = _97 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _149 = _97 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _151 = _97 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _153 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[1].x, _145);
    float _155 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[2].x, _147);
    float _157 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[3].x, _149);
    float _159 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[4].x, _151);
    float _161 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[1].z, _153);
    float _163 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[2].z, _155);
    float _165 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[3].z, _157);
    float _167 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[4].z, _159);
    float _169 = _161 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _171 = _163 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _173 = _165 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _175 = _167 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _177 = _115 * _143;
    float _179 = _103 * _143;
    float _181 = _119 * _143;
    uint _183 = extract_bits(uint(_85), 0u, 8u);
    float _185 = float(_183);
    out.gl_Position.x = _169;
    out.gl_Position.y = _171;
    out.gl_Position.z = _173;
    out.gl_Position.w = _175;
    out.m_31.x = _177;
    out.m_31.y = _179;
    out.m_31.z = _181;
    uint _187 = extract_bits(as_type<uint>(_113), 24u, 8u);
    float _189 = float(_187);
    uint _191 = extract_bits(as_type<uint>(_113), 16u, 8u);
    float _193 = float(_191);
    int _195 = _139 & as_type<int>(_127);
    bool _197 = _195 != 0;
    float _199 = _185 * 0.0039215688593685626983642578125;
    uint _201 = extract_bits(as_type<uint>(_113), 8u, 8u);
    float _203 = float(_201);
    float _205 = _189 * 0.0039215688593685626983642578125;
    float _207 = _193 * 0.0039215688593685626983642578125;
    float _209 = _203 * 0.0039215688593685626983642578125;
    out.m_33.x = _205;
    out.m_33.y = _207;
    out.m_33.z = _209;
    out.m_33.w = _199;
    if (_197)
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
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = as_type<float>(in.m_23.x);
    float _49 = in.m_26.x;
    float _51 = in.m_26.y;
    float _53 = in.m_26.z;
    int _56 = as_type<int>(_47) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    int _58 = _56 << 4;
    int _60 = _58 + 144;
    float _62 = _51 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    uint _65 = uint(int(uint(as_type<int>(_47)) >> uint(5)));
    int _67 = int(_65) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].y);
    float _69 = _51 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    uint _71 = uint(int(uint(_60) >> uint(2)));
    uint _73 = uint(int(uint(int(_71)) >> uint(2)));
    int _75 = int(_71) & 3;
    float _77 = (*spvDescriptorSet0.vp_c3)._m0[int(_73)][_75];
    int _79 = _60 & 3;
    int _81 = _79 << 3;
    uint _83 = uint(int(uint(as_type<int>(_77)) >> uint(_81)));
    int _85 = int(_83) & 255;
    float _87 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _62);
    int _89 = _67 << 4;
    int _91 = _89 + 144;
    float _93 = _51 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _95 = in.m_28.x;
    float _97 = in.m_28.y;
    float _99 = in.m_28.z;
    float _101 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].x, _69);
    float _103 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].z, _87);
    float _105 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[7].x, _93);
    uint _107 = uint(int(uint(_60) >> uint(2)));
    uint _109 = uint(int(uint(int(_107)) >> uint(2)));
    int _111 = int(_107) & 3;
    float _113 = (*spvDescriptorSet0.vp_c3)._m0[int(_109)][_111];
    float _115 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].z, _101);
    float _117 = _103 * _103;
    float _119 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].z, _105);
    uint _121 = uint(int(uint(_91) >> uint(2)));
    uint _123 = uint(int(uint(int(_121)) >> uint(2)));
    int _125 = int(_121) & 3;
    float _127 = (*spvDescriptorSet0.vp_c3)._m0[int(_123)][_125];
    float _129 = fma(_115, _115, _117);
    int _131 = as_type<int>(_47) & 31;
    bool _135 = uint(_131) < 32u;
    int _137 = 1 << _131;
    int _139 = _135 ? _137 : 0;
    float _141 = fma(_119, _119, _129);
    float _143 = rsqrt(_141);
    float _145 = _97 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _147 = _97 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _149 = _97 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _151 = _97 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _153 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[1].x, _145);
    float _155 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[2].x, _147);
    float _157 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[3].x, _149);
    float _159 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[4].x, _151);
    float _161 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[1].z, _153);
    float _163 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[2].z, _155);
    float _165 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[3].z, _157);
    float _167 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[4].z, _159);
    float _169 = _161 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _171 = _163 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _173 = _165 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _175 = _167 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _177 = _115 * _143;
    float _179 = _103 * _143;
    float _181 = _119 * _143;
    uint _183 = extract_bits(uint(_85), 0u, 8u);
    float _185 = float(_183);
    out.gl_Position.x = _169;
    out.gl_Position.y = _171;
    out.gl_Position.z = _173;
    out.gl_Position.w = _175;
    out.m_31.x = _177;
    out.m_31.y = _179;
    out.m_31.z = _181;
    uint _187 = extract_bits(as_type<uint>(_113), 24u, 8u);
    float _189 = float(_187);
    uint _191 = extract_bits(as_type<uint>(_113), 16u, 8u);
    float _193 = float(_191);
    int _195 = _139 & as_type<int>(_127);
    bool _197 = _195 != 0;
    float _199 = _185 * 0.0039215688593685626983642578125;
    uint _201 = extract_bits(as_type<uint>(_113), 8u, 8u);
    float _203 = float(_201);
    float _205 = _189 * 0.0039215688593685626983642578125;
    float _207 = _193 * 0.0039215688593685626983642578125;
    float _209 = _203 * 0.0039215688593685626983642578125;
    out.m_33.x = _205;
    out.m_33.y = _207;
    out.m_33.z = _209;
    out.m_33.w = _199;
    if (_197)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

