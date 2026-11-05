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
    float4 m_28 [[attribute(1)]];
    uint4 m_23 [[attribute(2)]];
    uint4 m_25 [[attribute(3)]];
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
    float _51 = as_type<float>(in.m_25.x);
    float _53 = in.m_28.x;
    float _55 = in.m_28.y;
    float _57 = in.m_28.z;
    int _60 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].z);
    int _62 = _60 << 4;
    int _64 = _62 + 208;
    int _66 = as_type<int>(_51) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _70 = _66 != 0;
    uint _73 = uint(int(uint(_64) >> uint(2)));
    uint _75 = uint(int(uint(int(_73)) >> uint(2)));
    int _77 = int(_73) & 3;
    float _79 = (*spvDescriptorSet0.vp_c3)._m0[int(_75)][_77];
    float _81 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _83 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _85 = _55 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _87 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _81);
    float _89 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _83);
    float _91 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].x, _85);
    float _93 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].z, _87);
    float _95 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].z, _89);
    int _97 = 0;
    if (!_70)
    {
        float _99 = as_type<float>(in.m_25.y);
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    float _103 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[7].z, _91);
    bool _105 = false;
    if (_70)
    {
        _105 = false;
    }
    bool _107 = _105;
    int _109 = 0;
    bool _111 = _107;
    if (!_70)
    {
        int _113 = _101 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _115 = _113 != 0;
        _109 = _115 ? (-1) : 0;
    }
    int _117 = _109;
    if (!_70)
    {
        int _119 = ~_117;
        _111 = _119 != 0;
    }
    bool _121 = _111;
    int _123 = as_type<int>(_79) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _125 = _123 << 4;
    int _127 = _125 + 208;
    uint _129 = uint(int(uint(as_type<int>(_79)) >> uint(5)));
    int _131 = int(_129) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _133 = uint(int(uint(_127) >> uint(2)));
    uint _135 = uint(int(uint(int(_133)) >> uint(2)));
    int _137 = int(_133) & 3;
    float _139 = (*spvDescriptorSet0.vp_c3)._m0[int(_135)][_137];
    int _141 = _127 & 3;
    int _143 = _141 << 3;
    uint _145 = uint(int(uint(as_type<int>(_139)) >> uint(_143)));
    int _147 = int(_145) & 255;
    int _149 = _131 << 4;
    int _151 = _149 + 208;
    float _153 = in.m_30.x;
    float _155 = in.m_30.y;
    float _157 = in.m_30.z;
    uint _159 = uint(int(uint(_127) >> uint(2)));
    uint _161 = uint(int(uint(int(_159)) >> uint(2)));
    int _163 = int(_159) & 3;
    float _165 = (*spvDescriptorSet0.vp_c3)._m0[int(_161)][_163];
    uint _167 = uint(int(uint(_151) >> uint(2)));
    uint _169 = uint(int(uint(int(_167)) >> uint(2)));
    int _171 = int(_167) & 3;
    float _173 = (*spvDescriptorSet0.vp_c3)._m0[int(_169)][_171];
    float _175 = _93 * _93;
    float _177 = fma(_95, _95, _175);
    float _179 = fma(_103, _103, _177);
    float _181 = _155 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _183 = _155 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _185 = _155 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _187 = _155 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _189 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[1].x, _181);
    float _191 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[2].x, _183);
    float _193 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[3].x, _185);
    float _195 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[4].x, _187);
    int _197 = as_type<int>(_79) & 31;
    bool _199 = uint(_197) < 32u;
    int _201 = 1 << _197;
    int _203 = _199 ? _201 : 0;
    float _205 = rsqrt(_179);
    float _207 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[1].z, _189);
    float _209 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[2].z, _191);
    float _211 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[3].z, _193);
    float _213 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[4].z, _195);
    float _215 = _209 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _217 = _211 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    uint _219 = extract_bits(uint(_147), 0u, 8u);
    float _221 = float(_219);
    float _223 = _95 * _205;
    float _225 = _93 * _205;
    float _227 = _103 * _205;
    uint _229 = extract_bits(as_type<uint>(_165), 24u, 8u);
    float _231 = float(_229);
    out.m_33.x = _223;
    out.m_33.y = _225;
    out.m_33.z = _227;
    uint _233 = extract_bits(as_type<uint>(_165), 16u, 8u);
    float _235 = float(_233);
    int _237 = _203 & as_type<int>(_173);
    bool _239 = _237 != 0;
    float _241 = _207 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _243 = _213 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _245 = _221 * 0.0039215688593685626983642578125;
    uint _247 = extract_bits(as_type<uint>(_165), 8u, 8u);
    float _249 = float(_247);
    float _251 = _231 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _241;
    out.gl_Position.y = _215;
    out.gl_Position.z = _217;
    out.gl_Position.w = _243;
    int _253 = as_type<int>(_211);
    if (!_239)
    {
        _253 = -1082130432;
    }
    int _255 = _253;
    float _257 = _235 * 0.0039215688593685626983642578125;
    if (!_239)
    {
        float _670 = as_type<float>(_255);
        out.gl_Position.w = _670;
    }
    float _259 = _249 * 0.0039215688593685626983642578125;
    out.m_35.x = _251;
    out.m_35.y = _257;
    out.m_35.z = _259;
    out.m_35.w = _245;
    if (!_121)
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
    float _51 = as_type<float>(in.m_25.x);
    float _53 = in.m_28.x;
    float _55 = in.m_28.y;
    float _57 = in.m_28.z;
    int _60 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].z);
    int _62 = _60 << 4;
    int _64 = _62 + 208;
    int _66 = as_type<int>(_51) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _70 = _66 != 0;
    uint _73 = uint(int(uint(_64) >> uint(2)));
    uint _75 = uint(int(uint(int(_73)) >> uint(2)));
    int _77 = int(_73) & 3;
    float _79 = (*spvDescriptorSet0.vp_c3)._m0[int(_75)][_77];
    float _81 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _83 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _85 = _55 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _87 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _81);
    float _89 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _83);
    float _91 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].x, _85);
    float _93 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].z, _87);
    float _95 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].z, _89);
    int _97 = 0;
    if (!_70)
    {
        float _99 = as_type<float>(in.m_25.y);
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    float _103 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[7].z, _91);
    bool _105 = false;
    if (_70)
    {
        _105 = false;
    }
    bool _107 = _105;
    int _109 = 0;
    bool _111 = _107;
    if (!_70)
    {
        int _113 = _101 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _115 = _113 != 0;
        _109 = _115 ? (-1) : 0;
    }
    int _117 = _109;
    if (!_70)
    {
        int _119 = ~_117;
        _111 = _119 != 0;
    }
    bool _121 = _111;
    int _123 = as_type<int>(_79) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _125 = _123 << 4;
    int _127 = _125 + 208;
    uint _129 = uint(int(uint(as_type<int>(_79)) >> uint(5)));
    int _131 = int(_129) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _133 = uint(int(uint(_127) >> uint(2)));
    uint _135 = uint(int(uint(int(_133)) >> uint(2)));
    int _137 = int(_133) & 3;
    float _139 = (*spvDescriptorSet0.vp_c3)._m0[int(_135)][_137];
    int _141 = _127 & 3;
    int _143 = _141 << 3;
    uint _145 = uint(int(uint(as_type<int>(_139)) >> uint(_143)));
    int _147 = int(_145) & 255;
    int _149 = _131 << 4;
    int _151 = _149 + 208;
    float _153 = in.m_30.x;
    float _155 = in.m_30.y;
    float _157 = in.m_30.z;
    uint _159 = uint(int(uint(_127) >> uint(2)));
    uint _161 = uint(int(uint(int(_159)) >> uint(2)));
    int _163 = int(_159) & 3;
    float _165 = (*spvDescriptorSet0.vp_c3)._m0[int(_161)][_163];
    uint _167 = uint(int(uint(_151) >> uint(2)));
    uint _169 = uint(int(uint(int(_167)) >> uint(2)));
    int _171 = int(_167) & 3;
    float _173 = (*spvDescriptorSet0.vp_c3)._m0[int(_169)][_171];
    float _175 = _93 * _93;
    float _177 = fma(_95, _95, _175);
    float _179 = fma(_103, _103, _177);
    float _181 = _155 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _183 = _155 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _185 = _155 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _187 = _155 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _189 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[1].x, _181);
    float _191 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[2].x, _183);
    float _193 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[3].x, _185);
    float _195 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[4].x, _187);
    int _197 = as_type<int>(_79) & 31;
    bool _199 = uint(_197) < 32u;
    int _201 = 1 << _197;
    int _203 = _199 ? _201 : 0;
    float _205 = rsqrt(_179);
    float _207 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[1].z, _189);
    float _209 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[2].z, _191);
    float _211 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[3].z, _193);
    float _213 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[4].z, _195);
    float _215 = _209 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _217 = _211 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    uint _219 = extract_bits(uint(_147), 0u, 8u);
    float _221 = float(_219);
    float _223 = _95 * _205;
    float _225 = _93 * _205;
    float _227 = _103 * _205;
    uint _229 = extract_bits(as_type<uint>(_165), 24u, 8u);
    float _231 = float(_229);
    out.m_33.x = _223;
    out.m_33.y = _225;
    out.m_33.z = _227;
    uint _233 = extract_bits(as_type<uint>(_165), 16u, 8u);
    float _235 = float(_233);
    int _237 = _203 & as_type<int>(_173);
    bool _239 = _237 != 0;
    float _241 = _207 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _243 = _213 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _245 = _221 * 0.0039215688593685626983642578125;
    uint _247 = extract_bits(as_type<uint>(_165), 8u, 8u);
    float _249 = float(_247);
    float _251 = _231 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _241;
    out.gl_Position.y = _215;
    out.gl_Position.z = _217;
    out.gl_Position.w = _243;
    int _253 = as_type<int>(_211);
    if (!_239)
    {
        _253 = -1082130432;
    }
    int _255 = _253;
    float _257 = _235 * 0.0039215688593685626983642578125;
    if (!_239)
    {
        float _670 = as_type<float>(_255);
        out.gl_Position.w = _670;
    }
    float _259 = _249 * 0.0039215688593685626983642578125;
    out.m_35.x = _251;
    out.m_35.y = _257;
    out.m_35.z = _259;
    out.m_35.w = _245;
    if (!_121)
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
    float _51 = as_type<float>(in.m_25.x);
    float _53 = in.m_28.x;
    float _55 = in.m_28.y;
    float _57 = in.m_28.z;
    int _60 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].z);
    int _62 = _60 << 4;
    int _64 = _62 + 208;
    int _66 = as_type<int>(_51) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _70 = _66 != 0;
    uint _73 = uint(int(uint(_64) >> uint(2)));
    uint _75 = uint(int(uint(int(_73)) >> uint(2)));
    int _77 = int(_73) & 3;
    float _79 = (*spvDescriptorSet0.vp_c3)._m0[int(_75)][_77];
    float _81 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _83 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _85 = _55 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _87 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _81);
    float _89 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _83);
    float _91 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].x, _85);
    float _93 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].z, _87);
    float _95 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].z, _89);
    int _97 = 0;
    if (!_70)
    {
        float _99 = as_type<float>(in.m_25.y);
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    float _103 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[7].z, _91);
    bool _105 = false;
    if (_70)
    {
        _105 = false;
    }
    bool _107 = _105;
    int _109 = 0;
    bool _111 = _107;
    if (!_70)
    {
        int _113 = _101 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _115 = _113 != 0;
        _109 = _115 ? (-1) : 0;
    }
    int _117 = _109;
    if (!_70)
    {
        int _119 = ~_117;
        _111 = _119 != 0;
    }
    bool _121 = _111;
    int _123 = as_type<int>(_79) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _125 = _123 << 4;
    int _127 = _125 + 208;
    uint _129 = uint(int(uint(as_type<int>(_79)) >> uint(5)));
    int _131 = int(_129) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _133 = uint(int(uint(_127) >> uint(2)));
    uint _135 = uint(int(uint(int(_133)) >> uint(2)));
    int _137 = int(_133) & 3;
    float _139 = (*spvDescriptorSet0.vp_c3)._m0[int(_135)][_137];
    int _141 = _127 & 3;
    int _143 = _141 << 3;
    uint _145 = uint(int(uint(as_type<int>(_139)) >> uint(_143)));
    int _147 = int(_145) & 255;
    int _149 = _131 << 4;
    int _151 = _149 + 208;
    float _153 = in.m_30.x;
    float _155 = in.m_30.y;
    float _157 = in.m_30.z;
    uint _159 = uint(int(uint(_127) >> uint(2)));
    uint _161 = uint(int(uint(int(_159)) >> uint(2)));
    int _163 = int(_159) & 3;
    float _165 = (*spvDescriptorSet0.vp_c3)._m0[int(_161)][_163];
    uint _167 = uint(int(uint(_151) >> uint(2)));
    uint _169 = uint(int(uint(int(_167)) >> uint(2)));
    int _171 = int(_167) & 3;
    float _173 = (*spvDescriptorSet0.vp_c3)._m0[int(_169)][_171];
    float _175 = _93 * _93;
    float _177 = fma(_95, _95, _175);
    float _179 = fma(_103, _103, _177);
    float _181 = _155 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _183 = _155 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _185 = _155 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _187 = _155 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _189 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[1].x, _181);
    float _191 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[2].x, _183);
    float _193 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[3].x, _185);
    float _195 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[4].x, _187);
    int _197 = as_type<int>(_79) & 31;
    bool _199 = uint(_197) < 32u;
    int _201 = 1 << _197;
    int _203 = _199 ? _201 : 0;
    float _205 = rsqrt(_179);
    float _207 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[1].z, _189);
    float _209 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[2].z, _191);
    float _211 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[3].z, _193);
    float _213 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[4].z, _195);
    float _215 = _209 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _217 = _211 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    uint _219 = extract_bits(uint(_147), 0u, 8u);
    float _221 = float(_219);
    float _223 = _95 * _205;
    float _225 = _93 * _205;
    float _227 = _103 * _205;
    uint _229 = extract_bits(as_type<uint>(_165), 24u, 8u);
    float _231 = float(_229);
    out.m_33.x = _223;
    out.m_33.y = _225;
    out.m_33.z = _227;
    uint _233 = extract_bits(as_type<uint>(_165), 16u, 8u);
    float _235 = float(_233);
    int _237 = _203 & as_type<int>(_173);
    bool _239 = _237 != 0;
    float _241 = _207 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _243 = _213 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _245 = _221 * 0.0039215688593685626983642578125;
    uint _247 = extract_bits(as_type<uint>(_165), 8u, 8u);
    float _249 = float(_247);
    float _251 = _231 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _241;
    out.gl_Position.y = _215;
    out.gl_Position.z = _217;
    out.gl_Position.w = _243;
    int _253 = as_type<int>(_211);
    if (!_239)
    {
        _253 = -1082130432;
    }
    int _255 = _253;
    float _257 = _235 * 0.0039215688593685626983642578125;
    if (!_239)
    {
        float _670 = as_type<float>(_255);
        out.gl_Position.w = _670;
    }
    float _259 = _249 * 0.0039215688593685626983642578125;
    out.m_35.x = _251;
    out.m_35.y = _257;
    out.m_35.z = _259;
    out.m_35.w = _245;
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

