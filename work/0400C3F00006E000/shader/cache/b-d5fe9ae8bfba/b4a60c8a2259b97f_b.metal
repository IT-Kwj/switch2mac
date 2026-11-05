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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = as_type<float>(in.m_23.x);
    float _49 = in.m_26.x;
    float _51 = in.m_26.y;
    float _53 = in.m_26.z;
    uint _56 = uint(int(uint(as_type<int>(_47)) >> uint(5)));
    int _59 = int(_56) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _61 = _59 << 4;
    int _63 = _61 + 224;
    float _65 = _51 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _67 = as_type<float>(in.m_28.x);
    float _69 = _51 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _71 = _51 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _73 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[7].x, _65);
    uint _75 = uint(int(uint(_63) >> uint(2)));
    uint _77 = uint(int(uint(int(_75)) >> uint(2)));
    int _79 = int(_75) & 3;
    float _81 = (*spvDescriptorSet0.vp_c3)._m0[int(_77)][_79];
    float _83 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _69);
    float _85 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[8].x, _71);
    float _87 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].z, _73);
    float _89 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].z, _83);
    float _91 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[8].z, _85);
    float _93 = _87 * _87;
    int _95 = as_type<int>(_47) & 31;
    bool _99 = uint(_95) < 32u;
    int _101 = 1 << _95;
    int _103 = _99 ? _101 : 0;
    float _105 = fma(_89, _89, _93);
    int _107 = as_type<int>(_67) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _109 = _107 != 0;
    float _111 = in.m_30.x;
    float _113 = in.m_30.y;
    float _115 = in.m_30.z;
    int _117 = 0;
    if (!_109)
    {
        float _119 = as_type<float>(in.m_28.y);
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    bool _123 = false;
    if (_109)
    {
        _123 = false;
    }
    bool _125 = _123;
    float _127 = _113 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _129 = _113 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    int _131 = _103 & as_type<int>(_81);
    bool _133 = _131 != 0;
    float _135 = fma(_91, _91, _105);
    float _137 = _113 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _139 = _113 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _141 = fma(_111, (*spvDescriptorSet0.vp_c3)._m0[2].x, _127);
    float _143 = rsqrt(_135);
    float _145 = fma(_111, (*spvDescriptorSet0.vp_c3)._m0[3].x, _129);
    float _147 = fma(_111, (*spvDescriptorSet0.vp_c3)._m0[4].x, _137);
    float _149 = fma(_111, (*spvDescriptorSet0.vp_c3)._m0[5].x, _139);
    int _151 = 0;
    bool _153 = _125;
    if (!_109)
    {
        int _155 = _121 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _157 = _155 != 0;
        _151 = _157 ? (-1) : 0;
    }
    int _159 = _151;
    float _161 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[2].z, _141);
    float _163 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[3].z, _145);
    float _165 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[4].z, _147);
    int _167 = as_type<int>(_165);
    if (!_109)
    {
        int _169 = ~_159;
        _153 = _169 != 0;
    }
    bool _171 = _153;
    float _173 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[5].z, _149);
    float _175 = _161 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _177 = _163 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _179 = _165 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _181 = _173 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    if (!_133)
    {
        _167 = -1082130432;
    }
    int _183 = _167;
    float _185 = _89 * _143;
    float _187 = _87 * _143;
    float _189 = _91 * _143;
    out.gl_Position.x = _175;
    out.gl_Position.y = _177;
    out.gl_Position.z = _179;
    out.gl_Position.w = _181;
    if (!_133)
    {
        float _486 = as_type<float>(_183);
        out.gl_Position.w = _486;
    }
    out.m_33.x = _185;
    out.m_33.y = _187;
    out.m_33.z = _189;
    if (!_171)
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
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = as_type<float>(in.m_23.x);
    float _49 = in.m_26.x;
    float _51 = in.m_26.y;
    float _53 = in.m_26.z;
    uint _56 = uint(int(uint(as_type<int>(_47)) >> uint(5)));
    int _59 = int(_56) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _61 = _59 << 4;
    int _63 = _61 + 224;
    float _65 = _51 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _67 = as_type<float>(in.m_28.x);
    float _69 = _51 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _71 = _51 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _73 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[7].x, _65);
    uint _75 = uint(int(uint(_63) >> uint(2)));
    uint _77 = uint(int(uint(int(_75)) >> uint(2)));
    int _79 = int(_75) & 3;
    float _81 = (*spvDescriptorSet0.vp_c3)._m0[int(_77)][_79];
    float _83 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _69);
    float _85 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[8].x, _71);
    float _87 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].z, _73);
    float _89 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].z, _83);
    float _91 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[8].z, _85);
    float _93 = _87 * _87;
    int _95 = as_type<int>(_47) & 31;
    bool _99 = uint(_95) < 32u;
    int _101 = 1 << _95;
    int _103 = _99 ? _101 : 0;
    float _105 = fma(_89, _89, _93);
    int _107 = as_type<int>(_67) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _109 = _107 != 0;
    float _111 = in.m_30.x;
    float _113 = in.m_30.y;
    float _115 = in.m_30.z;
    int _117 = 0;
    if (!_109)
    {
        float _119 = as_type<float>(in.m_28.y);
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    bool _123 = false;
    if (_109)
    {
        _123 = false;
    }
    bool _125 = _123;
    float _127 = _113 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _129 = _113 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    int _131 = _103 & as_type<int>(_81);
    bool _133 = _131 != 0;
    float _135 = fma(_91, _91, _105);
    float _137 = _113 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _139 = _113 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _141 = fma(_111, (*spvDescriptorSet0.vp_c3)._m0[2].x, _127);
    float _143 = rsqrt(_135);
    float _145 = fma(_111, (*spvDescriptorSet0.vp_c3)._m0[3].x, _129);
    float _147 = fma(_111, (*spvDescriptorSet0.vp_c3)._m0[4].x, _137);
    float _149 = fma(_111, (*spvDescriptorSet0.vp_c3)._m0[5].x, _139);
    int _151 = 0;
    bool _153 = _125;
    if (!_109)
    {
        int _155 = _121 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _157 = _155 != 0;
        _151 = _157 ? (-1) : 0;
    }
    int _159 = _151;
    float _161 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[2].z, _141);
    float _163 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[3].z, _145);
    float _165 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[4].z, _147);
    int _167 = as_type<int>(_165);
    if (!_109)
    {
        int _169 = ~_159;
        _153 = _169 != 0;
    }
    bool _171 = _153;
    float _173 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[5].z, _149);
    float _175 = _161 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _177 = _163 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _179 = _165 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _181 = _173 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    if (!_133)
    {
        _167 = -1082130432;
    }
    int _183 = _167;
    float _185 = _89 * _143;
    float _187 = _87 * _143;
    float _189 = _91 * _143;
    out.gl_Position.x = _175;
    out.gl_Position.y = _177;
    out.gl_Position.z = _179;
    out.gl_Position.w = _181;
    if (!_133)
    {
        float _486 = as_type<float>(_183);
        out.gl_Position.w = _486;
    }
    out.m_33.x = _185;
    out.m_33.y = _187;
    out.m_33.z = _189;
    if (!_171)
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
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = as_type<float>(in.m_23.x);
    float _49 = in.m_26.x;
    float _51 = in.m_26.y;
    float _53 = in.m_26.z;
    uint _56 = uint(int(uint(as_type<int>(_47)) >> uint(5)));
    int _59 = int(_56) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _61 = _59 << 4;
    int _63 = _61 + 224;
    float _65 = _51 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _67 = as_type<float>(in.m_28.x);
    float _69 = _51 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _71 = _51 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _73 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[7].x, _65);
    uint _75 = uint(int(uint(_63) >> uint(2)));
    uint _77 = uint(int(uint(int(_75)) >> uint(2)));
    int _79 = int(_75) & 3;
    float _81 = (*spvDescriptorSet0.vp_c3)._m0[int(_77)][_79];
    float _83 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _69);
    float _85 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[8].x, _71);
    float _87 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].z, _73);
    float _89 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].z, _83);
    float _91 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[8].z, _85);
    float _93 = _87 * _87;
    int _95 = as_type<int>(_47) & 31;
    bool _99 = uint(_95) < 32u;
    int _101 = 1 << _95;
    int _103 = _99 ? _101 : 0;
    float _105 = fma(_89, _89, _93);
    int _107 = as_type<int>(_67) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _109 = _107 != 0;
    float _111 = in.m_30.x;
    float _113 = in.m_30.y;
    float _115 = in.m_30.z;
    int _117 = 0;
    if (!_109)
    {
        float _119 = as_type<float>(in.m_28.y);
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    bool _123 = false;
    if (_109)
    {
        _123 = false;
    }
    bool _125 = _123;
    float _127 = _113 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _129 = _113 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    int _131 = _103 & as_type<int>(_81);
    bool _133 = _131 != 0;
    float _135 = fma(_91, _91, _105);
    float _137 = _113 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _139 = _113 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _141 = fma(_111, (*spvDescriptorSet0.vp_c3)._m0[2].x, _127);
    float _143 = rsqrt(_135);
    float _145 = fma(_111, (*spvDescriptorSet0.vp_c3)._m0[3].x, _129);
    float _147 = fma(_111, (*spvDescriptorSet0.vp_c3)._m0[4].x, _137);
    float _149 = fma(_111, (*spvDescriptorSet0.vp_c3)._m0[5].x, _139);
    int _151 = 0;
    bool _153 = _125;
    if (!_109)
    {
        int _155 = _121 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _157 = _155 != 0;
        _151 = _157 ? (-1) : 0;
    }
    int _159 = _151;
    float _161 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[2].z, _141);
    float _163 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[3].z, _145);
    float _165 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[4].z, _147);
    int _167 = as_type<int>(_165);
    if (!_109)
    {
        int _169 = ~_159;
        _153 = _169 != 0;
    }
    bool _171 = _153;
    float _173 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[5].z, _149);
    float _175 = _161 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _177 = _163 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _179 = _165 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _181 = _173 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    if (!_133)
    {
        _167 = -1082130432;
    }
    int _183 = _167;
    float _185 = _89 * _143;
    float _187 = _87 * _143;
    float _189 = _91 * _143;
    out.gl_Position.x = _175;
    out.gl_Position.y = _177;
    out.gl_Position.z = _179;
    out.gl_Position.w = _181;
    if (!_133)
    {
        float _486 = as_type<float>(_183);
        out.gl_Position.w = _486;
    }
    out.m_33.x = _185;
    out.m_33.y = _187;
    out.m_33.z = _189;
    if (!_171)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

