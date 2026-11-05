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
    int _48 = ~as_type<int>(_45);
    int _50 = _48 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _54 = _50 != 0;
    float _56 = as_type<float>(in.m_25.x);
    int _58 = 0;
    bool _60 = _54;
    if (!_54)
    {
        float _62 = as_type<float>(in.m_23.y);
        _58 = as_type<int>(_62);
    }
    int _64 = _58;
    bool _66 = false;
    if (_54)
    {
        _66 = false;
    }
    bool _68 = _66;
    int _70 = as_type<int>(_56) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _72 = _70 << 4;
    int _74 = _72 + 208;
    uint _77 = uint(int(uint(_74) >> uint(2)));
    uint _79 = uint(int(uint(int(_77)) >> uint(2)));
    int _81 = int(_77) & 3;
    float _83 = (*spvDescriptorSet0.vp_c3)._m0[int(_79)][_81];
    int _85 = 0;
    bool _87 = _68;
    if (!_54)
    {
        int _89 = ~_64;
        int _91 = _89 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _93 = _91 != 0;
        _85 = _93 ? (-1) : 0;
    }
    int _95 = _85;
    int _97 = _95;
    if (!_54)
    {
        int _99 = ~_95;
        _87 = _99 != 0;
    }
    bool _101 = _87;
    uint _103 = uint(int(uint(_74) >> uint(2)));
    uint _105 = uint(int(uint(int(_103)) >> uint(2)));
    int _107 = int(_103) & 3;
    float _109 = (*spvDescriptorSet0.vp_c3)._m0[int(_105)][_107];
    int _111 = _74 & 3;
    int _113 = _111 << 3;
    uint _115 = uint(int(uint(as_type<int>(_109)) >> uint(_113)));
    int _117 = int(_115) & 255;
    int _119 = _70;
    int _121 = _101 ? (-1) : 0;
    if (_101)
    {
        float _123 = as_type<float>(in.m_23.z);
        _119 = as_type<int>(_123);
    }
    int _125 = _119;
    if (!_101)
    {
        _60 = false;
    }
    bool _127 = _60;
    bool _129 = _127;
    if (_101)
    {
        int _131 = ~_125;
        int _133 = _131 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _135 = _133 != 0;
        _97 = _135 ? (-1) : 0;
    }
    int _137 = _97;
    float _139 = in.m_28.x;
    float _141 = in.m_28.y;
    float _143 = in.m_28.z;
    bool _145 = _137 != 0;
    if (_101)
    {
        int _147 = ~_137;
        _129 = _147 != 0;
    }
    bool _149 = _129;
    uint _151 = extract_bits(as_type<uint>(_83), 24u, 8u);
    float _153 = float(_151);
    uint _155 = extract_bits(uint(_117), 0u, 8u);
    float _157 = float(_155);
    int _159 = 0;
    if (_149)
    {
        float _161 = as_type<float>(in.m_23.w);
        _159 = as_type<int>(_161);
    }
    int _163 = _159;
    if (!_149)
    {
        _145 = false;
    }
    bool _165 = _145;
    uint _167 = extract_bits(as_type<uint>(_83), 16u, 8u);
    float _169 = float(_167);
    float _171 = _153 * 0.0039215688593685626983642578125;
    float _173 = _141 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _175 = _141 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _177 = _141 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    uint _179 = extract_bits(as_type<uint>(_83), 8u, 8u);
    float _181 = float(_179);
    float _183 = _141 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _185 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[1].x, _173);
    float _187 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[3].x, _177);
    float _189 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[2].x, _175);
    float _191 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[4].x, _183);
    float _193 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[1].z, _185);
    float _195 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[3].z, _187);
    float _197 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[2].z, _189);
    float _199 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[4].z, _191);
    float _201 = _193 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _203 = _195 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    bool _205 = _165;
    if (_149)
    {
        int _207 = ~_163;
        int _209 = _207 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _211 = _209 != 0;
        _121 = _211 ? (-1) : 0;
    }
    int _213 = _121;
    float _215 = _197 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _217 = _199 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _219 = _157 * 0.0039215688593685626983642578125;
    if (_149)
    {
        int _221 = ~_213;
        _205 = _221 != 0;
    }
    bool _223 = _205;
    float _225 = _169 * 0.0039215688593685626983642578125;
    float _227 = _181 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _201;
    out.gl_Position.y = _215;
    out.gl_Position.z = _203;
    out.gl_Position.w = _217;
    out.m_31.x = _171;
    out.m_31.y = _225;
    out.m_31.z = _227;
    out.m_31.w = _219;
    if (!_223)
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
    int _48 = ~as_type<int>(_45);
    int _50 = _48 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _54 = _50 != 0;
    float _56 = as_type<float>(in.m_25.x);
    int _58 = 0;
    bool _60 = _54;
    if (!_54)
    {
        float _62 = as_type<float>(in.m_23.y);
        _58 = as_type<int>(_62);
    }
    int _64 = _58;
    bool _66 = false;
    if (_54)
    {
        _66 = false;
    }
    bool _68 = _66;
    int _70 = as_type<int>(_56) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _72 = _70 << 4;
    int _74 = _72 + 208;
    uint _77 = uint(int(uint(_74) >> uint(2)));
    uint _79 = uint(int(uint(int(_77)) >> uint(2)));
    int _81 = int(_77) & 3;
    float _83 = (*spvDescriptorSet0.vp_c3)._m0[int(_79)][_81];
    int _85 = 0;
    bool _87 = _68;
    if (!_54)
    {
        int _89 = ~_64;
        int _91 = _89 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _93 = _91 != 0;
        _85 = _93 ? (-1) : 0;
    }
    int _95 = _85;
    int _97 = _95;
    if (!_54)
    {
        int _99 = ~_95;
        _87 = _99 != 0;
    }
    bool _101 = _87;
    uint _103 = uint(int(uint(_74) >> uint(2)));
    uint _105 = uint(int(uint(int(_103)) >> uint(2)));
    int _107 = int(_103) & 3;
    float _109 = (*spvDescriptorSet0.vp_c3)._m0[int(_105)][_107];
    int _111 = _74 & 3;
    int _113 = _111 << 3;
    uint _115 = uint(int(uint(as_type<int>(_109)) >> uint(_113)));
    int _117 = int(_115) & 255;
    int _119 = _70;
    int _121 = _101 ? (-1) : 0;
    if (_101)
    {
        float _123 = as_type<float>(in.m_23.z);
        _119 = as_type<int>(_123);
    }
    int _125 = _119;
    if (!_101)
    {
        _60 = false;
    }
    bool _127 = _60;
    bool _129 = _127;
    if (_101)
    {
        int _131 = ~_125;
        int _133 = _131 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _135 = _133 != 0;
        _97 = _135 ? (-1) : 0;
    }
    int _137 = _97;
    float _139 = in.m_28.x;
    float _141 = in.m_28.y;
    float _143 = in.m_28.z;
    bool _145 = _137 != 0;
    if (_101)
    {
        int _147 = ~_137;
        _129 = _147 != 0;
    }
    bool _149 = _129;
    uint _151 = extract_bits(as_type<uint>(_83), 24u, 8u);
    float _153 = float(_151);
    uint _155 = extract_bits(uint(_117), 0u, 8u);
    float _157 = float(_155);
    int _159 = 0;
    if (_149)
    {
        float _161 = as_type<float>(in.m_23.w);
        _159 = as_type<int>(_161);
    }
    int _163 = _159;
    if (!_149)
    {
        _145 = false;
    }
    bool _165 = _145;
    uint _167 = extract_bits(as_type<uint>(_83), 16u, 8u);
    float _169 = float(_167);
    float _171 = _153 * 0.0039215688593685626983642578125;
    float _173 = _141 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _175 = _141 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _177 = _141 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    uint _179 = extract_bits(as_type<uint>(_83), 8u, 8u);
    float _181 = float(_179);
    float _183 = _141 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _185 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[1].x, _173);
    float _187 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[3].x, _177);
    float _189 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[2].x, _175);
    float _191 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[4].x, _183);
    float _193 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[1].z, _185);
    float _195 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[3].z, _187);
    float _197 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[2].z, _189);
    float _199 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[4].z, _191);
    float _201 = _193 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _203 = _195 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    bool _205 = _165;
    if (_149)
    {
        int _207 = ~_163;
        int _209 = _207 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _211 = _209 != 0;
        _121 = _211 ? (-1) : 0;
    }
    int _213 = _121;
    float _215 = _197 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _217 = _199 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _219 = _157 * 0.0039215688593685626983642578125;
    if (_149)
    {
        int _221 = ~_213;
        _205 = _221 != 0;
    }
    bool _223 = _205;
    float _225 = _169 * 0.0039215688593685626983642578125;
    float _227 = _181 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _201;
    out.gl_Position.y = _215;
    out.gl_Position.z = _203;
    out.gl_Position.w = _217;
    out.m_31.x = _171;
    out.m_31.y = _225;
    out.m_31.z = _227;
    out.m_31.w = _219;
    if (!_223)
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
    int _48 = ~as_type<int>(_45);
    int _50 = _48 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _54 = _50 != 0;
    float _56 = as_type<float>(in.m_25.x);
    int _58 = 0;
    bool _60 = _54;
    if (!_54)
    {
        float _62 = as_type<float>(in.m_23.y);
        _58 = as_type<int>(_62);
    }
    int _64 = _58;
    bool _66 = false;
    if (_54)
    {
        _66 = false;
    }
    bool _68 = _66;
    int _70 = as_type<int>(_56) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _72 = _70 << 4;
    int _74 = _72 + 208;
    uint _77 = uint(int(uint(_74) >> uint(2)));
    uint _79 = uint(int(uint(int(_77)) >> uint(2)));
    int _81 = int(_77) & 3;
    float _83 = (*spvDescriptorSet0.vp_c3)._m0[int(_79)][_81];
    int _85 = 0;
    bool _87 = _68;
    if (!_54)
    {
        int _89 = ~_64;
        int _91 = _89 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _93 = _91 != 0;
        _85 = _93 ? (-1) : 0;
    }
    int _95 = _85;
    int _97 = _95;
    if (!_54)
    {
        int _99 = ~_95;
        _87 = _99 != 0;
    }
    bool _101 = _87;
    uint _103 = uint(int(uint(_74) >> uint(2)));
    uint _105 = uint(int(uint(int(_103)) >> uint(2)));
    int _107 = int(_103) & 3;
    float _109 = (*spvDescriptorSet0.vp_c3)._m0[int(_105)][_107];
    int _111 = _74 & 3;
    int _113 = _111 << 3;
    uint _115 = uint(int(uint(as_type<int>(_109)) >> uint(_113)));
    int _117 = int(_115) & 255;
    int _119 = _70;
    int _121 = _101 ? (-1) : 0;
    if (_101)
    {
        float _123 = as_type<float>(in.m_23.z);
        _119 = as_type<int>(_123);
    }
    int _125 = _119;
    if (!_101)
    {
        _60 = false;
    }
    bool _127 = _60;
    bool _129 = _127;
    if (_101)
    {
        int _131 = ~_125;
        int _133 = _131 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _135 = _133 != 0;
        _97 = _135 ? (-1) : 0;
    }
    int _137 = _97;
    float _139 = in.m_28.x;
    float _141 = in.m_28.y;
    float _143 = in.m_28.z;
    bool _145 = _137 != 0;
    if (_101)
    {
        int _147 = ~_137;
        _129 = _147 != 0;
    }
    bool _149 = _129;
    uint _151 = extract_bits(as_type<uint>(_83), 24u, 8u);
    float _153 = float(_151);
    uint _155 = extract_bits(uint(_117), 0u, 8u);
    float _157 = float(_155);
    int _159 = 0;
    if (_149)
    {
        float _161 = as_type<float>(in.m_23.w);
        _159 = as_type<int>(_161);
    }
    int _163 = _159;
    if (!_149)
    {
        _145 = false;
    }
    bool _165 = _145;
    uint _167 = extract_bits(as_type<uint>(_83), 16u, 8u);
    float _169 = float(_167);
    float _171 = _153 * 0.0039215688593685626983642578125;
    float _173 = _141 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _175 = _141 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _177 = _141 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    uint _179 = extract_bits(as_type<uint>(_83), 8u, 8u);
    float _181 = float(_179);
    float _183 = _141 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _185 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[1].x, _173);
    float _187 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[3].x, _177);
    float _189 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[2].x, _175);
    float _191 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[4].x, _183);
    float _193 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[1].z, _185);
    float _195 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[3].z, _187);
    float _197 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[2].z, _189);
    float _199 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[4].z, _191);
    float _201 = _193 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _203 = _195 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    bool _205 = _165;
    if (_149)
    {
        int _207 = ~_163;
        int _209 = _207 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _211 = _209 != 0;
        _121 = _211 ? (-1) : 0;
    }
    int _213 = _121;
    float _215 = _197 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _217 = _199 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _219 = _157 * 0.0039215688593685626983642578125;
    if (_149)
    {
        int _221 = ~_213;
        _205 = _221 != 0;
    }
    bool _223 = _205;
    float _225 = _169 * 0.0039215688593685626983642578125;
    float _227 = _181 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _201;
    out.gl_Position.y = _215;
    out.gl_Position.z = _203;
    out.gl_Position.w = _217;
    out.m_31.x = _171;
    out.m_31.y = _225;
    out.m_31.z = _227;
    out.m_31.w = _219;
    if (!_223)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

