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
    float _64 = in.m_28.x;
    float _66 = in.m_28.y;
    float _68 = in.m_28.z;
    float _70 = _51 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    uint _73 = uint(int(uint(_60) >> uint(2)));
    uint _75 = uint(int(uint(int(_73)) >> uint(2)));
    int _77 = int(_73) & 3;
    float _79 = (*spvDescriptorSet0.vp_c3)._m0[int(_75)][_77];
    int _81 = _60 & 3;
    int _83 = _81 << 3;
    uint _85 = uint(int(uint(as_type<int>(_79)) >> uint(_83)));
    int _87 = int(_85) & 255;
    float _89 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _62);
    float _91 = _51 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _93 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].x, _70);
    float _95 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].z, _89);
    float _97 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[7].x, _91);
    float _99 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].z, _93);
    uint _101 = uint(int(uint(_60) >> uint(2)));
    uint _103 = uint(int(uint(int(_101)) >> uint(2)));
    int _105 = int(_101) & 3;
    float _107 = (*spvDescriptorSet0.vp_c3)._m0[int(_103)][_105];
    float _109 = _95 * _95;
    float _111 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].z, _97);
    float _113 = fma(_99, _99, _109);
    float _115 = fma(_111, _111, _113);
    float _117 = rsqrt(_115);
    float _119 = _66 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _121 = _66 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _123 = _66 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _125 = _66 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _127 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[1].x, _119);
    float _129 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[2].x, _121);
    float _131 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[3].x, _123);
    float _133 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[4].x, _125);
    float _135 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[1].z, _127);
    float _137 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[2].z, _129);
    float _139 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[3].z, _131);
    float _141 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[4].z, _133);
    float _143 = _135 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _145 = _137 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _147 = _139 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _149 = _141 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _151 = _99 * _117;
    float _153 = _95 * _117;
    float _155 = _111 * _117;
    out.gl_Position.x = _143;
    out.gl_Position.y = _145;
    out.gl_Position.z = _147;
    out.gl_Position.w = _149;
    out.m_31.x = _151;
    out.m_31.y = _153;
    out.m_31.z = _155;
    uint _157 = extract_bits(uint(_87), 0u, 8u);
    float _159 = float(_157);
    uint _161 = extract_bits(as_type<uint>(_107), 24u, 8u);
    float _163 = float(_161);
    uint _165 = extract_bits(as_type<uint>(_107), 16u, 8u);
    float _167 = float(_165);
    float _169 = _159 * 0.0039215688593685626983642578125;
    uint _171 = extract_bits(as_type<uint>(_107), 8u, 8u);
    float _173 = float(_171);
    float _175 = _163 * 0.0039215688593685626983642578125;
    float _177 = _167 * 0.0039215688593685626983642578125;
    float _179 = _173 * 0.0039215688593685626983642578125;
    out.m_33.x = _175;
    out.m_33.y = _177;
    out.m_33.z = _179;
    out.m_33.w = _169;
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
    float _64 = in.m_28.x;
    float _66 = in.m_28.y;
    float _68 = in.m_28.z;
    float _70 = _51 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    uint _73 = uint(int(uint(_60) >> uint(2)));
    uint _75 = uint(int(uint(int(_73)) >> uint(2)));
    int _77 = int(_73) & 3;
    float _79 = (*spvDescriptorSet0.vp_c3)._m0[int(_75)][_77];
    int _81 = _60 & 3;
    int _83 = _81 << 3;
    uint _85 = uint(int(uint(as_type<int>(_79)) >> uint(_83)));
    int _87 = int(_85) & 255;
    float _89 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _62);
    float _91 = _51 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _93 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].x, _70);
    float _95 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].z, _89);
    float _97 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[7].x, _91);
    float _99 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].z, _93);
    uint _101 = uint(int(uint(_60) >> uint(2)));
    uint _103 = uint(int(uint(int(_101)) >> uint(2)));
    int _105 = int(_101) & 3;
    float _107 = (*spvDescriptorSet0.vp_c3)._m0[int(_103)][_105];
    float _109 = _95 * _95;
    float _111 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].z, _97);
    float _113 = fma(_99, _99, _109);
    float _115 = fma(_111, _111, _113);
    float _117 = rsqrt(_115);
    float _119 = _66 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _121 = _66 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _123 = _66 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _125 = _66 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _127 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[1].x, _119);
    float _129 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[2].x, _121);
    float _131 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[3].x, _123);
    float _133 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[4].x, _125);
    float _135 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[1].z, _127);
    float _137 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[2].z, _129);
    float _139 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[3].z, _131);
    float _141 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[4].z, _133);
    float _143 = _135 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _145 = _137 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _147 = _139 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _149 = _141 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _151 = _99 * _117;
    float _153 = _95 * _117;
    float _155 = _111 * _117;
    out.gl_Position.x = _143;
    out.gl_Position.y = _145;
    out.gl_Position.z = _147;
    out.gl_Position.w = _149;
    out.m_31.x = _151;
    out.m_31.y = _153;
    out.m_31.z = _155;
    uint _157 = extract_bits(uint(_87), 0u, 8u);
    float _159 = float(_157);
    uint _161 = extract_bits(as_type<uint>(_107), 24u, 8u);
    float _163 = float(_161);
    uint _165 = extract_bits(as_type<uint>(_107), 16u, 8u);
    float _167 = float(_165);
    float _169 = _159 * 0.0039215688593685626983642578125;
    uint _171 = extract_bits(as_type<uint>(_107), 8u, 8u);
    float _173 = float(_171);
    float _175 = _163 * 0.0039215688593685626983642578125;
    float _177 = _167 * 0.0039215688593685626983642578125;
    float _179 = _173 * 0.0039215688593685626983642578125;
    out.m_33.x = _175;
    out.m_33.y = _177;
    out.m_33.z = _179;
    out.m_33.w = _169;
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
    float _64 = in.m_28.x;
    float _66 = in.m_28.y;
    float _68 = in.m_28.z;
    float _70 = _51 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    uint _73 = uint(int(uint(_60) >> uint(2)));
    uint _75 = uint(int(uint(int(_73)) >> uint(2)));
    int _77 = int(_73) & 3;
    float _79 = (*spvDescriptorSet0.vp_c3)._m0[int(_75)][_77];
    int _81 = _60 & 3;
    int _83 = _81 << 3;
    uint _85 = uint(int(uint(as_type<int>(_79)) >> uint(_83)));
    int _87 = int(_85) & 255;
    float _89 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _62);
    float _91 = _51 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _93 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].x, _70);
    float _95 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].z, _89);
    float _97 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[7].x, _91);
    float _99 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].z, _93);
    uint _101 = uint(int(uint(_60) >> uint(2)));
    uint _103 = uint(int(uint(int(_101)) >> uint(2)));
    int _105 = int(_101) & 3;
    float _107 = (*spvDescriptorSet0.vp_c3)._m0[int(_103)][_105];
    float _109 = _95 * _95;
    float _111 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].z, _97);
    float _113 = fma(_99, _99, _109);
    float _115 = fma(_111, _111, _113);
    float _117 = rsqrt(_115);
    float _119 = _66 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _121 = _66 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _123 = _66 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _125 = _66 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _127 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[1].x, _119);
    float _129 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[2].x, _121);
    float _131 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[3].x, _123);
    float _133 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[4].x, _125);
    float _135 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[1].z, _127);
    float _137 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[2].z, _129);
    float _139 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[3].z, _131);
    float _141 = fma(_68, (*spvDescriptorSet0.vp_c3)._m0[4].z, _133);
    float _143 = _135 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _145 = _137 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _147 = _139 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _149 = _141 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _151 = _99 * _117;
    float _153 = _95 * _117;
    float _155 = _111 * _117;
    out.gl_Position.x = _143;
    out.gl_Position.y = _145;
    out.gl_Position.z = _147;
    out.gl_Position.w = _149;
    out.m_31.x = _151;
    out.m_31.y = _153;
    out.m_31.z = _155;
    uint _157 = extract_bits(uint(_87), 0u, 8u);
    float _159 = float(_157);
    uint _161 = extract_bits(as_type<uint>(_107), 24u, 8u);
    float _163 = float(_161);
    uint _165 = extract_bits(as_type<uint>(_107), 16u, 8u);
    float _167 = float(_165);
    float _169 = _159 * 0.0039215688593685626983642578125;
    uint _171 = extract_bits(as_type<uint>(_107), 8u, 8u);
    float _173 = float(_171);
    float _175 = _163 * 0.0039215688593685626983642578125;
    float _177 = _167 * 0.0039215688593685626983642578125;
    float _179 = _173 * 0.0039215688593685626983642578125;
    out.m_33.x = _175;
    out.m_33.y = _177;
    out.m_33.z = _179;
    out.m_33.w = _169;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

