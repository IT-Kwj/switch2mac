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
    uint4 m_25 [[attribute(2)]];
    uint4 m_23 [[attribute(4)]];
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
    int _48 = as_type<int>(_45) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _52 = _48 != 0;
    float _54 = as_type<float>(in.m_25.x);
    int _56 = 0;
    bool _58 = _52;
    if (!_52)
    {
        float _60 = as_type<float>(in.m_23.y);
        _56 = as_type<int>(_60);
    }
    int _62 = _56;
    bool _64 = false;
    if (_52)
    {
        _64 = false;
    }
    bool _66 = _64;
    int _68 = as_type<int>(_54) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _70 = _68 << 4;
    int _72 = _70 + 208;
    uint _75 = uint(int(uint(_72) >> uint(2)));
    uint _77 = uint(int(uint(int(_75)) >> uint(2)));
    int _79 = int(_75) & 3;
    float _81 = (*spvDescriptorSet0.vp_c3)._m0[int(_77)][_79];
    int _83 = 0;
    bool _85 = _66;
    if (!_52)
    {
        int _87 = _62 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _89 = _87 != 0;
        _83 = _89 ? (-1) : 0;
    }
    int _91 = _83;
    int _93 = _91;
    if (!_52)
    {
        int _95 = ~_91;
        _85 = _95 != 0;
    }
    bool _97 = _85;
    uint _99 = uint(int(uint(_72) >> uint(2)));
    uint _101 = uint(int(uint(int(_99)) >> uint(2)));
    int _103 = int(_99) & 3;
    float _105 = (*spvDescriptorSet0.vp_c3)._m0[int(_101)][_103];
    int _107 = _72 & 3;
    int _109 = _107 << 3;
    uint _111 = uint(int(uint(as_type<int>(_105)) >> uint(_109)));
    int _113 = int(_111) & 255;
    int _115 = _68;
    int _117 = _97 ? (-1) : 0;
    if (_97)
    {
        float _119 = as_type<float>(in.m_23.z);
        _115 = as_type<int>(_119);
    }
    int _121 = _115;
    if (!_97)
    {
        _58 = false;
    }
    bool _123 = _58;
    bool _125 = _123;
    if (_97)
    {
        int _127 = _121 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _129 = _127 != 0;
        _93 = _129 ? (-1) : 0;
    }
    int _131 = _93;
    float _133 = in.m_28.x;
    float _135 = in.m_28.y;
    float _137 = in.m_28.z;
    bool _139 = _131 != 0;
    if (_97)
    {
        int _141 = ~_131;
        _125 = _141 != 0;
    }
    bool _143 = _125;
    uint _145 = extract_bits(as_type<uint>(_81), 24u, 8u);
    float _147 = float(_145);
    uint _149 = extract_bits(uint(_113), 0u, 8u);
    float _151 = float(_149);
    int _153 = 0;
    if (_143)
    {
        float _155 = as_type<float>(in.m_23.w);
        _153 = as_type<int>(_155);
    }
    int _157 = _153;
    if (!_143)
    {
        _139 = false;
    }
    bool _159 = _139;
    uint _161 = extract_bits(as_type<uint>(_81), 16u, 8u);
    float _163 = float(_161);
    float _165 = _147 * 0.0039215688593685626983642578125;
    float _167 = _135 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _169 = _135 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _171 = _135 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    uint _173 = extract_bits(as_type<uint>(_81), 8u, 8u);
    float _175 = float(_173);
    float _177 = _135 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _179 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[1].x, _167);
    float _181 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[3].x, _171);
    float _183 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[2].x, _169);
    float _185 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[4].x, _177);
    float _187 = fma(_137, (*spvDescriptorSet0.vp_c3)._m0[1].z, _179);
    float _189 = fma(_137, (*spvDescriptorSet0.vp_c3)._m0[3].z, _181);
    float _191 = fma(_137, (*spvDescriptorSet0.vp_c3)._m0[2].z, _183);
    float _193 = fma(_137, (*spvDescriptorSet0.vp_c3)._m0[4].z, _185);
    float _195 = _187 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _197 = _189 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    bool _199 = _159;
    if (_143)
    {
        int _201 = _157 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _203 = _201 != 0;
        _117 = _203 ? (-1) : 0;
    }
    int _205 = _117;
    float _207 = _191 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _209 = _193 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _211 = _151 * 0.0039215688593685626983642578125;
    if (_143)
    {
        int _213 = ~_205;
        _199 = _213 != 0;
    }
    bool _215 = _199;
    float _217 = _163 * 0.0039215688593685626983642578125;
    float _219 = _175 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _195;
    out.gl_Position.y = _207;
    out.gl_Position.z = _197;
    out.gl_Position.w = _209;
    out.m_31.x = _165;
    out.m_31.y = _217;
    out.m_31.z = _219;
    out.m_31.w = _211;
    if (!_215)
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
    int _48 = as_type<int>(_45) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _52 = _48 != 0;
    float _54 = as_type<float>(in.m_25.x);
    int _56 = 0;
    bool _58 = _52;
    if (!_52)
    {
        float _60 = as_type<float>(in.m_23.y);
        _56 = as_type<int>(_60);
    }
    int _62 = _56;
    bool _64 = false;
    if (_52)
    {
        _64 = false;
    }
    bool _66 = _64;
    int _68 = as_type<int>(_54) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _70 = _68 << 4;
    int _72 = _70 + 208;
    uint _75 = uint(int(uint(_72) >> uint(2)));
    uint _77 = uint(int(uint(int(_75)) >> uint(2)));
    int _79 = int(_75) & 3;
    float _81 = (*spvDescriptorSet0.vp_c3)._m0[int(_77)][_79];
    int _83 = 0;
    bool _85 = _66;
    if (!_52)
    {
        int _87 = _62 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _89 = _87 != 0;
        _83 = _89 ? (-1) : 0;
    }
    int _91 = _83;
    int _93 = _91;
    if (!_52)
    {
        int _95 = ~_91;
        _85 = _95 != 0;
    }
    bool _97 = _85;
    uint _99 = uint(int(uint(_72) >> uint(2)));
    uint _101 = uint(int(uint(int(_99)) >> uint(2)));
    int _103 = int(_99) & 3;
    float _105 = (*spvDescriptorSet0.vp_c3)._m0[int(_101)][_103];
    int _107 = _72 & 3;
    int _109 = _107 << 3;
    uint _111 = uint(int(uint(as_type<int>(_105)) >> uint(_109)));
    int _113 = int(_111) & 255;
    int _115 = _68;
    int _117 = _97 ? (-1) : 0;
    if (_97)
    {
        float _119 = as_type<float>(in.m_23.z);
        _115 = as_type<int>(_119);
    }
    int _121 = _115;
    if (!_97)
    {
        _58 = false;
    }
    bool _123 = _58;
    bool _125 = _123;
    if (_97)
    {
        int _127 = _121 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _129 = _127 != 0;
        _93 = _129 ? (-1) : 0;
    }
    int _131 = _93;
    float _133 = in.m_28.x;
    float _135 = in.m_28.y;
    float _137 = in.m_28.z;
    bool _139 = _131 != 0;
    if (_97)
    {
        int _141 = ~_131;
        _125 = _141 != 0;
    }
    bool _143 = _125;
    uint _145 = extract_bits(as_type<uint>(_81), 24u, 8u);
    float _147 = float(_145);
    uint _149 = extract_bits(uint(_113), 0u, 8u);
    float _151 = float(_149);
    int _153 = 0;
    if (_143)
    {
        float _155 = as_type<float>(in.m_23.w);
        _153 = as_type<int>(_155);
    }
    int _157 = _153;
    if (!_143)
    {
        _139 = false;
    }
    bool _159 = _139;
    uint _161 = extract_bits(as_type<uint>(_81), 16u, 8u);
    float _163 = float(_161);
    float _165 = _147 * 0.0039215688593685626983642578125;
    float _167 = _135 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _169 = _135 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _171 = _135 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    uint _173 = extract_bits(as_type<uint>(_81), 8u, 8u);
    float _175 = float(_173);
    float _177 = _135 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _179 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[1].x, _167);
    float _181 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[3].x, _171);
    float _183 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[2].x, _169);
    float _185 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[4].x, _177);
    float _187 = fma(_137, (*spvDescriptorSet0.vp_c3)._m0[1].z, _179);
    float _189 = fma(_137, (*spvDescriptorSet0.vp_c3)._m0[3].z, _181);
    float _191 = fma(_137, (*spvDescriptorSet0.vp_c3)._m0[2].z, _183);
    float _193 = fma(_137, (*spvDescriptorSet0.vp_c3)._m0[4].z, _185);
    float _195 = _187 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _197 = _189 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    bool _199 = _159;
    if (_143)
    {
        int _201 = _157 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _203 = _201 != 0;
        _117 = _203 ? (-1) : 0;
    }
    int _205 = _117;
    float _207 = _191 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _209 = _193 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _211 = _151 * 0.0039215688593685626983642578125;
    if (_143)
    {
        int _213 = ~_205;
        _199 = _213 != 0;
    }
    bool _215 = _199;
    float _217 = _163 * 0.0039215688593685626983642578125;
    float _219 = _175 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _195;
    out.gl_Position.y = _207;
    out.gl_Position.z = _197;
    out.gl_Position.w = _209;
    out.m_31.x = _165;
    out.m_31.y = _217;
    out.m_31.z = _219;
    out.m_31.w = _211;
    if (!_215)
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
    int _48 = as_type<int>(_45) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _52 = _48 != 0;
    float _54 = as_type<float>(in.m_25.x);
    int _56 = 0;
    bool _58 = _52;
    if (!_52)
    {
        float _60 = as_type<float>(in.m_23.y);
        _56 = as_type<int>(_60);
    }
    int _62 = _56;
    bool _64 = false;
    if (_52)
    {
        _64 = false;
    }
    bool _66 = _64;
    int _68 = as_type<int>(_54) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _70 = _68 << 4;
    int _72 = _70 + 208;
    uint _75 = uint(int(uint(_72) >> uint(2)));
    uint _77 = uint(int(uint(int(_75)) >> uint(2)));
    int _79 = int(_75) & 3;
    float _81 = (*spvDescriptorSet0.vp_c3)._m0[int(_77)][_79];
    int _83 = 0;
    bool _85 = _66;
    if (!_52)
    {
        int _87 = _62 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _89 = _87 != 0;
        _83 = _89 ? (-1) : 0;
    }
    int _91 = _83;
    int _93 = _91;
    if (!_52)
    {
        int _95 = ~_91;
        _85 = _95 != 0;
    }
    bool _97 = _85;
    uint _99 = uint(int(uint(_72) >> uint(2)));
    uint _101 = uint(int(uint(int(_99)) >> uint(2)));
    int _103 = int(_99) & 3;
    float _105 = (*spvDescriptorSet0.vp_c3)._m0[int(_101)][_103];
    int _107 = _72 & 3;
    int _109 = _107 << 3;
    uint _111 = uint(int(uint(as_type<int>(_105)) >> uint(_109)));
    int _113 = int(_111) & 255;
    int _115 = _68;
    int _117 = _97 ? (-1) : 0;
    if (_97)
    {
        float _119 = as_type<float>(in.m_23.z);
        _115 = as_type<int>(_119);
    }
    int _121 = _115;
    if (!_97)
    {
        _58 = false;
    }
    bool _123 = _58;
    bool _125 = _123;
    if (_97)
    {
        int _127 = _121 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _129 = _127 != 0;
        _93 = _129 ? (-1) : 0;
    }
    int _131 = _93;
    float _133 = in.m_28.x;
    float _135 = in.m_28.y;
    float _137 = in.m_28.z;
    bool _139 = _131 != 0;
    if (_97)
    {
        int _141 = ~_131;
        _125 = _141 != 0;
    }
    bool _143 = _125;
    uint _145 = extract_bits(as_type<uint>(_81), 24u, 8u);
    float _147 = float(_145);
    uint _149 = extract_bits(uint(_113), 0u, 8u);
    float _151 = float(_149);
    int _153 = 0;
    if (_143)
    {
        float _155 = as_type<float>(in.m_23.w);
        _153 = as_type<int>(_155);
    }
    int _157 = _153;
    if (!_143)
    {
        _139 = false;
    }
    bool _159 = _139;
    uint _161 = extract_bits(as_type<uint>(_81), 16u, 8u);
    float _163 = float(_161);
    float _165 = _147 * 0.0039215688593685626983642578125;
    float _167 = _135 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _169 = _135 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _171 = _135 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    uint _173 = extract_bits(as_type<uint>(_81), 8u, 8u);
    float _175 = float(_173);
    float _177 = _135 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _179 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[1].x, _167);
    float _181 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[3].x, _171);
    float _183 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[2].x, _169);
    float _185 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[4].x, _177);
    float _187 = fma(_137, (*spvDescriptorSet0.vp_c3)._m0[1].z, _179);
    float _189 = fma(_137, (*spvDescriptorSet0.vp_c3)._m0[3].z, _181);
    float _191 = fma(_137, (*spvDescriptorSet0.vp_c3)._m0[2].z, _183);
    float _193 = fma(_137, (*spvDescriptorSet0.vp_c3)._m0[4].z, _185);
    float _195 = _187 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _197 = _189 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    bool _199 = _159;
    if (_143)
    {
        int _201 = _157 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _203 = _201 != 0;
        _117 = _203 ? (-1) : 0;
    }
    int _205 = _117;
    float _207 = _191 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _209 = _193 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _211 = _151 * 0.0039215688593685626983642578125;
    if (_143)
    {
        int _213 = ~_205;
        _199 = _213 != 0;
    }
    bool _215 = _199;
    float _217 = _163 * 0.0039215688593685626983642578125;
    float _219 = _175 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _195;
    out.gl_Position.y = _207;
    out.gl_Position.z = _197;
    out.gl_Position.w = _209;
    out.m_31.x = _165;
    out.m_31.y = _217;
    out.m_31.z = _219;
    out.m_31.w = _211;
    if (!_215)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

