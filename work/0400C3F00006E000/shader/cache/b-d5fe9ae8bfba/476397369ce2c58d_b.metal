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
    uint4 m_25 [[attribute(3)]];
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
    int _71 = 0;
    if (!_60)
    {
        float _73 = as_type<float>(in.m_25.y);
        _71 = as_type<int>(_73);
    }
    int _75 = _71;
    bool _77 = false;
    if (_60)
    {
        _77 = false;
    }
    bool _79 = _77;
    int _81 = 0;
    bool _83 = _79;
    if (!_60)
    {
        int _85 = _75 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _87 = _85 != 0;
        _81 = _87 ? (-1) : 0;
    }
    int _89 = _81;
    if (!_60)
    {
        int _91 = ~_89;
        _83 = _91 != 0;
    }
    bool _93 = _83;
    int _95 = as_type<int>(_69) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _97 = as_type<int>(_69) & 31;
    bool _99 = uint(_97) < 32u;
    int _101 = 1 << _97;
    int _103 = _99 ? _101 : 0;
    int _105 = _95 << 4;
    int _107 = _105 + 208;
    uint _109 = uint(int(uint(as_type<int>(_69)) >> uint(5)));
    int _111 = int(_109) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _113 = uint(int(uint(_107) >> uint(2)));
    uint _115 = uint(int(uint(int(_113)) >> uint(2)));
    int _117 = int(_113) & 3;
    float _119 = (*spvDescriptorSet0.vp_c3)._m0[int(_115)][_117];
    int _121 = _111 << 4;
    int _123 = _121 + 208;
    float _125 = in.m_28.x;
    float _127 = in.m_28.y;
    float _129 = in.m_28.z;
    uint _131 = uint(int(uint(_107) >> uint(2)));
    uint _133 = uint(int(uint(int(_131)) >> uint(2)));
    int _135 = int(_131) & 3;
    float _137 = (*spvDescriptorSet0.vp_c3)._m0[int(_133)][_135];
    int _139 = _107 & 3;
    int _141 = _139 << 3;
    uint _143 = uint(int(uint(as_type<int>(_137)) >> uint(_141)));
    int _145 = int(_143) & 255;
    uint _147 = uint(int(uint(_123) >> uint(2)));
    uint _149 = uint(int(uint(int(_147)) >> uint(2)));
    int _151 = int(_147) & 3;
    float _153 = (*spvDescriptorSet0.vp_c3)._m0[int(_149)][_151];
    float _155 = _127 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _157 = _127 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _159 = _127 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _161 = _127 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _163 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[1].x, _155);
    float _165 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[2].x, _157);
    float _167 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[3].x, _159);
    float _169 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[4].x, _161);
    float _171 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[1].z, _163);
    float _173 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[2].z, _165);
    float _175 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[3].z, _167);
    float _177 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[4].z, _169);
    float _179 = _171 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _181 = _173 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _183 = _175 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _185 = _177 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    uint _187 = extract_bits(as_type<uint>(_119), 16u, 8u);
    float _189 = float(_187);
    out.gl_Position.x = _179;
    out.gl_Position.y = _181;
    out.gl_Position.z = _183;
    out.gl_Position.w = _185;
    uint _191 = extract_bits(as_type<uint>(_119), 8u, 8u);
    float _193 = float(_191);
    uint _195 = extract_bits(uint(_145), 0u, 8u);
    float _197 = float(_195);
    int _199 = _103 & as_type<int>(_153);
    bool _201 = _199 != 0;
    float _203 = _189 * 0.0039215688593685626983642578125;
    uint _205 = extract_bits(as_type<uint>(_119), 24u, 8u);
    float _207 = float(_205);
    float _209 = _193 * 0.0039215688593685626983642578125;
    int _211 = as_type<int>(_193);
    if (!_201)
    {
        _211 = -1082130432;
    }
    int _213 = _211;
    float _215 = _197 * 0.0039215688593685626983642578125;
    if (!_201)
    {
        float _550 = as_type<float>(_213);
        out.gl_Position.w = _550;
    }
    float _217 = _207 * 0.0039215688593685626983642578125;
    out.m_31.x = _217;
    out.m_31.y = _203;
    out.m_31.z = _209;
    out.m_31.w = _215;
    if (!_93)
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
    int _71 = 0;
    if (!_60)
    {
        float _73 = as_type<float>(in.m_25.y);
        _71 = as_type<int>(_73);
    }
    int _75 = _71;
    bool _77 = false;
    if (_60)
    {
        _77 = false;
    }
    bool _79 = _77;
    int _81 = 0;
    bool _83 = _79;
    if (!_60)
    {
        int _85 = _75 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _87 = _85 != 0;
        _81 = _87 ? (-1) : 0;
    }
    int _89 = _81;
    if (!_60)
    {
        int _91 = ~_89;
        _83 = _91 != 0;
    }
    bool _93 = _83;
    int _95 = as_type<int>(_69) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _97 = as_type<int>(_69) & 31;
    bool _99 = uint(_97) < 32u;
    int _101 = 1 << _97;
    int _103 = _99 ? _101 : 0;
    int _105 = _95 << 4;
    int _107 = _105 + 208;
    uint _109 = uint(int(uint(as_type<int>(_69)) >> uint(5)));
    int _111 = int(_109) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _113 = uint(int(uint(_107) >> uint(2)));
    uint _115 = uint(int(uint(int(_113)) >> uint(2)));
    int _117 = int(_113) & 3;
    float _119 = (*spvDescriptorSet0.vp_c3)._m0[int(_115)][_117];
    int _121 = _111 << 4;
    int _123 = _121 + 208;
    float _125 = in.m_28.x;
    float _127 = in.m_28.y;
    float _129 = in.m_28.z;
    uint _131 = uint(int(uint(_107) >> uint(2)));
    uint _133 = uint(int(uint(int(_131)) >> uint(2)));
    int _135 = int(_131) & 3;
    float _137 = (*spvDescriptorSet0.vp_c3)._m0[int(_133)][_135];
    int _139 = _107 & 3;
    int _141 = _139 << 3;
    uint _143 = uint(int(uint(as_type<int>(_137)) >> uint(_141)));
    int _145 = int(_143) & 255;
    uint _147 = uint(int(uint(_123) >> uint(2)));
    uint _149 = uint(int(uint(int(_147)) >> uint(2)));
    int _151 = int(_147) & 3;
    float _153 = (*spvDescriptorSet0.vp_c3)._m0[int(_149)][_151];
    float _155 = _127 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _157 = _127 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _159 = _127 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _161 = _127 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _163 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[1].x, _155);
    float _165 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[2].x, _157);
    float _167 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[3].x, _159);
    float _169 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[4].x, _161);
    float _171 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[1].z, _163);
    float _173 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[2].z, _165);
    float _175 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[3].z, _167);
    float _177 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[4].z, _169);
    float _179 = _171 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _181 = _173 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _183 = _175 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _185 = _177 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    uint _187 = extract_bits(as_type<uint>(_119), 16u, 8u);
    float _189 = float(_187);
    out.gl_Position.x = _179;
    out.gl_Position.y = _181;
    out.gl_Position.z = _183;
    out.gl_Position.w = _185;
    uint _191 = extract_bits(as_type<uint>(_119), 8u, 8u);
    float _193 = float(_191);
    uint _195 = extract_bits(uint(_145), 0u, 8u);
    float _197 = float(_195);
    int _199 = _103 & as_type<int>(_153);
    bool _201 = _199 != 0;
    float _203 = _189 * 0.0039215688593685626983642578125;
    uint _205 = extract_bits(as_type<uint>(_119), 24u, 8u);
    float _207 = float(_205);
    float _209 = _193 * 0.0039215688593685626983642578125;
    int _211 = as_type<int>(_193);
    if (!_201)
    {
        _211 = -1082130432;
    }
    int _213 = _211;
    float _215 = _197 * 0.0039215688593685626983642578125;
    if (!_201)
    {
        float _550 = as_type<float>(_213);
        out.gl_Position.w = _550;
    }
    float _217 = _207 * 0.0039215688593685626983642578125;
    out.m_31.x = _217;
    out.m_31.y = _203;
    out.m_31.z = _209;
    out.m_31.w = _215;
    if (!_93)
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
    int _71 = 0;
    if (!_60)
    {
        float _73 = as_type<float>(in.m_25.y);
        _71 = as_type<int>(_73);
    }
    int _75 = _71;
    bool _77 = false;
    if (_60)
    {
        _77 = false;
    }
    bool _79 = _77;
    int _81 = 0;
    bool _83 = _79;
    if (!_60)
    {
        int _85 = _75 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _87 = _85 != 0;
        _81 = _87 ? (-1) : 0;
    }
    int _89 = _81;
    if (!_60)
    {
        int _91 = ~_89;
        _83 = _91 != 0;
    }
    bool _93 = _83;
    int _95 = as_type<int>(_69) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _97 = as_type<int>(_69) & 31;
    bool _99 = uint(_97) < 32u;
    int _101 = 1 << _97;
    int _103 = _99 ? _101 : 0;
    int _105 = _95 << 4;
    int _107 = _105 + 208;
    uint _109 = uint(int(uint(as_type<int>(_69)) >> uint(5)));
    int _111 = int(_109) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _113 = uint(int(uint(_107) >> uint(2)));
    uint _115 = uint(int(uint(int(_113)) >> uint(2)));
    int _117 = int(_113) & 3;
    float _119 = (*spvDescriptorSet0.vp_c3)._m0[int(_115)][_117];
    int _121 = _111 << 4;
    int _123 = _121 + 208;
    float _125 = in.m_28.x;
    float _127 = in.m_28.y;
    float _129 = in.m_28.z;
    uint _131 = uint(int(uint(_107) >> uint(2)));
    uint _133 = uint(int(uint(int(_131)) >> uint(2)));
    int _135 = int(_131) & 3;
    float _137 = (*spvDescriptorSet0.vp_c3)._m0[int(_133)][_135];
    int _139 = _107 & 3;
    int _141 = _139 << 3;
    uint _143 = uint(int(uint(as_type<int>(_137)) >> uint(_141)));
    int _145 = int(_143) & 255;
    uint _147 = uint(int(uint(_123) >> uint(2)));
    uint _149 = uint(int(uint(int(_147)) >> uint(2)));
    int _151 = int(_147) & 3;
    float _153 = (*spvDescriptorSet0.vp_c3)._m0[int(_149)][_151];
    float _155 = _127 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _157 = _127 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _159 = _127 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _161 = _127 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _163 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[1].x, _155);
    float _165 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[2].x, _157);
    float _167 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[3].x, _159);
    float _169 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[4].x, _161);
    float _171 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[1].z, _163);
    float _173 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[2].z, _165);
    float _175 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[3].z, _167);
    float _177 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[4].z, _169);
    float _179 = _171 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _181 = _173 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _183 = _175 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _185 = _177 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    uint _187 = extract_bits(as_type<uint>(_119), 16u, 8u);
    float _189 = float(_187);
    out.gl_Position.x = _179;
    out.gl_Position.y = _181;
    out.gl_Position.z = _183;
    out.gl_Position.w = _185;
    uint _191 = extract_bits(as_type<uint>(_119), 8u, 8u);
    float _193 = float(_191);
    uint _195 = extract_bits(uint(_145), 0u, 8u);
    float _197 = float(_195);
    int _199 = _103 & as_type<int>(_153);
    bool _201 = _199 != 0;
    float _203 = _189 * 0.0039215688593685626983642578125;
    uint _205 = extract_bits(as_type<uint>(_119), 24u, 8u);
    float _207 = float(_205);
    float _209 = _193 * 0.0039215688593685626983642578125;
    int _211 = as_type<int>(_193);
    if (!_201)
    {
        _211 = -1082130432;
    }
    int _213 = _211;
    float _215 = _197 * 0.0039215688593685626983642578125;
    if (!_201)
    {
        float _550 = as_type<float>(_213);
        out.gl_Position.w = _550;
    }
    float _217 = _207 * 0.0039215688593685626983642578125;
    out.m_31.x = _217;
    out.m_31.y = _203;
    out.m_31.z = _209;
    out.m_31.w = _215;
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

