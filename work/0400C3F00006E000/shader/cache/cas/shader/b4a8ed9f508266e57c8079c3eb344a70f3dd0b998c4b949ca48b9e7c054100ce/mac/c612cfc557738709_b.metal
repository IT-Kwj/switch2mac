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
    uint4 m_25 [[attribute(4)]];
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
    int _60 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    int _62 = ~as_type<int>(_51);
    int _64 = _62 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _68 = _64 != 0;
    int _70 = _60 << 4;
    int _72 = _70 + 208;
    float _74 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _76 = _55 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    uint _79 = uint(int(uint(_72) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.vp_c3)._m0[int(_81)][_83];
    float _87 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _74);
    float _89 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].x, _76);
    int _91 = as_type<int>(_51);
    bool _93 = _68;
    if (!_68)
    {
        float _95 = as_type<float>(in.m_25.y);
        _91 = as_type<int>(_95);
    }
    int _97 = _91;
    bool _99 = false;
    if (_68)
    {
        _99 = false;
    }
    bool _101 = _99;
    float _103 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].z, _87);
    float _105 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[7].z, _89);
    int _107 = 0;
    bool _109 = _101;
    if (!_68)
    {
        int _111 = ~_97;
        int _113 = _111 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _115 = _113 != 0;
        _107 = _115 ? (-1) : 0;
    }
    int _117 = _107;
    int _119 = _117;
    if (!_68)
    {
        int _121 = ~_117;
        _109 = _121 != 0;
    }
    bool _123 = _109;
    int _125 = 0;
    int _127 = _123 ? (-1) : 0;
    if (_123)
    {
        float _129 = as_type<float>(in.m_25.z);
        _125 = as_type<int>(_129);
    }
    int _131 = _125;
    if (!_123)
    {
        _93 = false;
    }
    bool _133 = _93;
    int _135 = as_type<int>(_85) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _137 = _135 << 4;
    int _139 = _137 + 208;
    float _141 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    uint _143 = uint(int(uint(_139) >> uint(2)));
    uint _145 = uint(int(uint(int(_143)) >> uint(2)));
    int _147 = int(_143) & 3;
    float _149 = (*spvDescriptorSet0.vp_c3)._m0[int(_145)][_147];
    int _151 = _139 & 3;
    int _153 = _151 << 3;
    uint _155 = uint(int(uint(as_type<int>(_149)) >> uint(_153)));
    int _157 = int(_155) & 255;
    float _159 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _141);
    float _161 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].z, _159);
    float _163 = _103 * _103;
    uint _165 = uint(int(uint(_139) >> uint(2)));
    uint _167 = uint(int(uint(int(_165)) >> uint(2)));
    int _169 = int(_165) & 3;
    float _171 = (*spvDescriptorSet0.vp_c3)._m0[int(_167)][_169];
    float _173 = fma(_161, _161, _163);
    bool _175 = _133;
    if (_123)
    {
        int _177 = ~_131;
        int _179 = _177 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _181 = _179 != 0;
        _119 = _181 ? (-1) : 0;
    }
    int _183 = _119;
    float _185 = fma(_105, _105, _173);
    float _187 = in.m_30.x;
    float _189 = in.m_30.y;
    float _191 = in.m_30.z;
    bool _193 = _183 != 0;
    if (_123)
    {
        int _195 = ~_183;
        _175 = _195 != 0;
    }
    bool _197 = _175;
    float _199 = rsqrt(_185);
    int _201 = 0;
    if (_197)
    {
        float _203 = as_type<float>(in.m_25.w);
        _201 = as_type<int>(_203);
    }
    int _205 = _201;
    if (!_197)
    {
        _193 = false;
    }
    bool _207 = _193;
    float _209 = _161 * _199;
    float _211 = _189 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _213 = _189 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _215 = _189 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _217 = _189 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _219 = fma(_187, (*spvDescriptorSet0.vp_c3)._m0[1].x, _211);
    float _221 = fma(_187, (*spvDescriptorSet0.vp_c3)._m0[2].x, _213);
    float _223 = fma(_187, (*spvDescriptorSet0.vp_c3)._m0[3].x, _215);
    float _225 = fma(_187, (*spvDescriptorSet0.vp_c3)._m0[4].x, _217);
    float _227 = fma(_191, (*spvDescriptorSet0.vp_c3)._m0[1].z, _219);
    uint _229 = extract_bits(uint(_157), 0u, 8u);
    float _231 = float(_229);
    float _233 = fma(_191, (*spvDescriptorSet0.vp_c3)._m0[2].z, _221);
    float _235 = fma(_191, (*spvDescriptorSet0.vp_c3)._m0[3].z, _223);
    float _237 = fma(_191, (*spvDescriptorSet0.vp_c3)._m0[4].z, _225);
    float _239 = _227 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _241 = _103 * _199;
    bool _243 = _207;
    if (_197)
    {
        int _245 = ~_205;
        int _247 = _245 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _249 = _247 != 0;
        _127 = _249 ? (-1) : 0;
    }
    int _251 = _127;
    float _253 = _233 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    uint _255 = extract_bits(as_type<uint>(_171), 24u, 8u);
    float _257 = float(_255);
    float _259 = _235 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    if (_197)
    {
        int _261 = ~_251;
        _243 = _261 != 0;
    }
    bool _263 = _243;
    float _265 = _237 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _267 = _105 * _199;
    uint _269 = extract_bits(as_type<uint>(_171), 16u, 8u);
    float _271 = float(_269);
    float _273 = _231 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _239;
    out.gl_Position.y = _253;
    out.gl_Position.z = _259;
    out.gl_Position.w = _265;
    out.m_33.x = _209;
    out.m_33.y = _241;
    out.m_33.z = _267;
    uint _275 = extract_bits(as_type<uint>(_171), 8u, 8u);
    float _277 = float(_275);
    float _279 = _257 * 0.0039215688593685626983642578125;
    float _281 = _271 * 0.0039215688593685626983642578125;
    float _283 = _277 * 0.0039215688593685626983642578125;
    out.m_35.x = _279;
    out.m_35.y = _281;
    out.m_35.z = _283;
    out.m_35.w = _273;
    if (!_263)
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
    int _60 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    int _62 = ~as_type<int>(_51);
    int _64 = _62 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _68 = _64 != 0;
    int _70 = _60 << 4;
    int _72 = _70 + 208;
    float _74 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _76 = _55 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    uint _79 = uint(int(uint(_72) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.vp_c3)._m0[int(_81)][_83];
    float _87 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _74);
    float _89 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].x, _76);
    int _91 = as_type<int>(_51);
    bool _93 = _68;
    if (!_68)
    {
        float _95 = as_type<float>(in.m_25.y);
        _91 = as_type<int>(_95);
    }
    int _97 = _91;
    bool _99 = false;
    if (_68)
    {
        _99 = false;
    }
    bool _101 = _99;
    float _103 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].z, _87);
    float _105 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[7].z, _89);
    int _107 = 0;
    bool _109 = _101;
    if (!_68)
    {
        int _111 = ~_97;
        int _113 = _111 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _115 = _113 != 0;
        _107 = _115 ? (-1) : 0;
    }
    int _117 = _107;
    int _119 = _117;
    if (!_68)
    {
        int _121 = ~_117;
        _109 = _121 != 0;
    }
    bool _123 = _109;
    int _125 = 0;
    int _127 = _123 ? (-1) : 0;
    if (_123)
    {
        float _129 = as_type<float>(in.m_25.z);
        _125 = as_type<int>(_129);
    }
    int _131 = _125;
    if (!_123)
    {
        _93 = false;
    }
    bool _133 = _93;
    int _135 = as_type<int>(_85) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _137 = _135 << 4;
    int _139 = _137 + 208;
    float _141 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    uint _143 = uint(int(uint(_139) >> uint(2)));
    uint _145 = uint(int(uint(int(_143)) >> uint(2)));
    int _147 = int(_143) & 3;
    float _149 = (*spvDescriptorSet0.vp_c3)._m0[int(_145)][_147];
    int _151 = _139 & 3;
    int _153 = _151 << 3;
    uint _155 = uint(int(uint(as_type<int>(_149)) >> uint(_153)));
    int _157 = int(_155) & 255;
    float _159 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _141);
    float _161 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].z, _159);
    float _163 = _103 * _103;
    uint _165 = uint(int(uint(_139) >> uint(2)));
    uint _167 = uint(int(uint(int(_165)) >> uint(2)));
    int _169 = int(_165) & 3;
    float _171 = (*spvDescriptorSet0.vp_c3)._m0[int(_167)][_169];
    float _173 = fma(_161, _161, _163);
    bool _175 = _133;
    if (_123)
    {
        int _177 = ~_131;
        int _179 = _177 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _181 = _179 != 0;
        _119 = _181 ? (-1) : 0;
    }
    int _183 = _119;
    float _185 = fma(_105, _105, _173);
    float _187 = in.m_30.x;
    float _189 = in.m_30.y;
    float _191 = in.m_30.z;
    bool _193 = _183 != 0;
    if (_123)
    {
        int _195 = ~_183;
        _175 = _195 != 0;
    }
    bool _197 = _175;
    float _199 = rsqrt(_185);
    int _201 = 0;
    if (_197)
    {
        float _203 = as_type<float>(in.m_25.w);
        _201 = as_type<int>(_203);
    }
    int _205 = _201;
    if (!_197)
    {
        _193 = false;
    }
    bool _207 = _193;
    float _209 = _161 * _199;
    float _211 = _189 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _213 = _189 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _215 = _189 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _217 = _189 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _219 = fma(_187, (*spvDescriptorSet0.vp_c3)._m0[1].x, _211);
    float _221 = fma(_187, (*spvDescriptorSet0.vp_c3)._m0[2].x, _213);
    float _223 = fma(_187, (*spvDescriptorSet0.vp_c3)._m0[3].x, _215);
    float _225 = fma(_187, (*spvDescriptorSet0.vp_c3)._m0[4].x, _217);
    float _227 = fma(_191, (*spvDescriptorSet0.vp_c3)._m0[1].z, _219);
    uint _229 = extract_bits(uint(_157), 0u, 8u);
    float _231 = float(_229);
    float _233 = fma(_191, (*spvDescriptorSet0.vp_c3)._m0[2].z, _221);
    float _235 = fma(_191, (*spvDescriptorSet0.vp_c3)._m0[3].z, _223);
    float _237 = fma(_191, (*spvDescriptorSet0.vp_c3)._m0[4].z, _225);
    float _239 = _227 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _241 = _103 * _199;
    bool _243 = _207;
    if (_197)
    {
        int _245 = ~_205;
        int _247 = _245 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _249 = _247 != 0;
        _127 = _249 ? (-1) : 0;
    }
    int _251 = _127;
    float _253 = _233 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    uint _255 = extract_bits(as_type<uint>(_171), 24u, 8u);
    float _257 = float(_255);
    float _259 = _235 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    if (_197)
    {
        int _261 = ~_251;
        _243 = _261 != 0;
    }
    bool _263 = _243;
    float _265 = _237 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _267 = _105 * _199;
    uint _269 = extract_bits(as_type<uint>(_171), 16u, 8u);
    float _271 = float(_269);
    float _273 = _231 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _239;
    out.gl_Position.y = _253;
    out.gl_Position.z = _259;
    out.gl_Position.w = _265;
    out.m_33.x = _209;
    out.m_33.y = _241;
    out.m_33.z = _267;
    uint _275 = extract_bits(as_type<uint>(_171), 8u, 8u);
    float _277 = float(_275);
    float _279 = _257 * 0.0039215688593685626983642578125;
    float _281 = _271 * 0.0039215688593685626983642578125;
    float _283 = _277 * 0.0039215688593685626983642578125;
    out.m_35.x = _279;
    out.m_35.y = _281;
    out.m_35.z = _283;
    out.m_35.w = _273;
    if (!_263)
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
    int _60 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    int _62 = ~as_type<int>(_51);
    int _64 = _62 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _68 = _64 != 0;
    int _70 = _60 << 4;
    int _72 = _70 + 208;
    float _74 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _76 = _55 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    uint _79 = uint(int(uint(_72) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.vp_c3)._m0[int(_81)][_83];
    float _87 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _74);
    float _89 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].x, _76);
    int _91 = as_type<int>(_51);
    bool _93 = _68;
    if (!_68)
    {
        float _95 = as_type<float>(in.m_25.y);
        _91 = as_type<int>(_95);
    }
    int _97 = _91;
    bool _99 = false;
    if (_68)
    {
        _99 = false;
    }
    bool _101 = _99;
    float _103 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].z, _87);
    float _105 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[7].z, _89);
    int _107 = 0;
    bool _109 = _101;
    if (!_68)
    {
        int _111 = ~_97;
        int _113 = _111 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _115 = _113 != 0;
        _107 = _115 ? (-1) : 0;
    }
    int _117 = _107;
    int _119 = _117;
    if (!_68)
    {
        int _121 = ~_117;
        _109 = _121 != 0;
    }
    bool _123 = _109;
    int _125 = 0;
    int _127 = _123 ? (-1) : 0;
    if (_123)
    {
        float _129 = as_type<float>(in.m_25.z);
        _125 = as_type<int>(_129);
    }
    int _131 = _125;
    if (!_123)
    {
        _93 = false;
    }
    bool _133 = _93;
    int _135 = as_type<int>(_85) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _137 = _135 << 4;
    int _139 = _137 + 208;
    float _141 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    uint _143 = uint(int(uint(_139) >> uint(2)));
    uint _145 = uint(int(uint(int(_143)) >> uint(2)));
    int _147 = int(_143) & 3;
    float _149 = (*spvDescriptorSet0.vp_c3)._m0[int(_145)][_147];
    int _151 = _139 & 3;
    int _153 = _151 << 3;
    uint _155 = uint(int(uint(as_type<int>(_149)) >> uint(_153)));
    int _157 = int(_155) & 255;
    float _159 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _141);
    float _161 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].z, _159);
    float _163 = _103 * _103;
    uint _165 = uint(int(uint(_139) >> uint(2)));
    uint _167 = uint(int(uint(int(_165)) >> uint(2)));
    int _169 = int(_165) & 3;
    float _171 = (*spvDescriptorSet0.vp_c3)._m0[int(_167)][_169];
    float _173 = fma(_161, _161, _163);
    bool _175 = _133;
    if (_123)
    {
        int _177 = ~_131;
        int _179 = _177 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _181 = _179 != 0;
        _119 = _181 ? (-1) : 0;
    }
    int _183 = _119;
    float _185 = fma(_105, _105, _173);
    float _187 = in.m_30.x;
    float _189 = in.m_30.y;
    float _191 = in.m_30.z;
    bool _193 = _183 != 0;
    if (_123)
    {
        int _195 = ~_183;
        _175 = _195 != 0;
    }
    bool _197 = _175;
    float _199 = rsqrt(_185);
    int _201 = 0;
    if (_197)
    {
        float _203 = as_type<float>(in.m_25.w);
        _201 = as_type<int>(_203);
    }
    int _205 = _201;
    if (!_197)
    {
        _193 = false;
    }
    bool _207 = _193;
    float _209 = _161 * _199;
    float _211 = _189 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _213 = _189 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _215 = _189 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _217 = _189 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _219 = fma(_187, (*spvDescriptorSet0.vp_c3)._m0[1].x, _211);
    float _221 = fma(_187, (*spvDescriptorSet0.vp_c3)._m0[2].x, _213);
    float _223 = fma(_187, (*spvDescriptorSet0.vp_c3)._m0[3].x, _215);
    float _225 = fma(_187, (*spvDescriptorSet0.vp_c3)._m0[4].x, _217);
    float _227 = fma(_191, (*spvDescriptorSet0.vp_c3)._m0[1].z, _219);
    uint _229 = extract_bits(uint(_157), 0u, 8u);
    float _231 = float(_229);
    float _233 = fma(_191, (*spvDescriptorSet0.vp_c3)._m0[2].z, _221);
    float _235 = fma(_191, (*spvDescriptorSet0.vp_c3)._m0[3].z, _223);
    float _237 = fma(_191, (*spvDescriptorSet0.vp_c3)._m0[4].z, _225);
    float _239 = _227 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _241 = _103 * _199;
    bool _243 = _207;
    if (_197)
    {
        int _245 = ~_205;
        int _247 = _245 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _249 = _247 != 0;
        _127 = _249 ? (-1) : 0;
    }
    int _251 = _127;
    float _253 = _233 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    uint _255 = extract_bits(as_type<uint>(_171), 24u, 8u);
    float _257 = float(_255);
    float _259 = _235 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    if (_197)
    {
        int _261 = ~_251;
        _243 = _261 != 0;
    }
    bool _263 = _243;
    float _265 = _237 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _267 = _105 * _199;
    uint _269 = extract_bits(as_type<uint>(_171), 16u, 8u);
    float _271 = float(_269);
    float _273 = _231 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _239;
    out.gl_Position.y = _253;
    out.gl_Position.z = _259;
    out.gl_Position.w = _265;
    out.m_33.x = _209;
    out.m_33.y = _241;
    out.m_33.z = _267;
    uint _275 = extract_bits(as_type<uint>(_171), 8u, 8u);
    float _277 = float(_275);
    float _279 = _257 * 0.0039215688593685626983642578125;
    float _281 = _271 * 0.0039215688593685626983642578125;
    float _283 = _277 * 0.0039215688593685626983642578125;
    out.m_35.x = _279;
    out.m_35.y = _281;
    out.m_35.z = _283;
    out.m_35.w = _273;
    if (!_263)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

