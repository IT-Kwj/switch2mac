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
    float4 m_26 [[attribute(1)]];
    uint4 m_23 [[attribute(2)]];
    uint4 m_28 [[attribute(4)]];
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
    float _51 = in.m_26.x;
    float _53 = in.m_26.y;
    float _55 = in.m_26.z;
    int _58 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].z);
    int _60 = _58 << 4;
    int _62 = _60 + 208;
    float _64 = as_type<float>(in.m_28.x);
    uint _67 = uint(int(uint(_62) >> uint(2)));
    uint _69 = uint(int(uint(int(_67)) >> uint(2)));
    int _71 = int(_67) & 3;
    float _73 = (*spvDescriptorSet0.vp_c3)._m0[int(_69)][_71];
    float _75 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _77 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _75);
    float _79 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _77);
    int _81 = ~as_type<int>(_64);
    int _83 = _81 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _87 = _83 != 0;
    int _89 = 0;
    bool _91 = _87;
    if (!_87)
    {
        float _93 = as_type<float>(in.m_28.y);
        _89 = as_type<int>(_93);
    }
    int _95 = _89;
    bool _97 = false;
    if (_87)
    {
        _97 = false;
    }
    bool _99 = _97;
    int _101 = as_type<int>(_73) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _103 = _101 << 4;
    int _105 = _103 + 208;
    uint _107 = uint(int(uint(as_type<int>(_73)) >> uint(5)));
    int _109 = int(_107) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _111 = uint(int(uint(_105) >> uint(2)));
    uint _113 = uint(int(uint(int(_111)) >> uint(2)));
    int _115 = int(_111) & 3;
    float _117 = (*spvDescriptorSet0.vp_c3)._m0[int(_113)][_115];
    int _119 = _105 & 3;
    int _121 = _119 << 3;
    uint _123 = uint(int(uint(as_type<int>(_117)) >> uint(_121)));
    int _125 = int(_123) & 255;
    int _127 = _109 << 4;
    int _129 = _127 + 208;
    int _131 = 0;
    bool _133 = _99;
    if (!_87)
    {
        int _135 = ~_95;
        int _137 = _135 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _139 = _137 != 0;
        _131 = _139 ? (-1) : 0;
    }
    int _141 = _131;
    float _143 = in.m_30.x;
    float _145 = in.m_30.y;
    float _147 = in.m_30.z;
    int _149 = _141;
    if (!_87)
    {
        int _151 = ~_141;
        _133 = _151 != 0;
    }
    bool _153 = _133;
    uint _155 = uint(int(uint(_105) >> uint(2)));
    uint _157 = uint(int(uint(int(_155)) >> uint(2)));
    int _159 = int(_155) & 3;
    float _161 = (*spvDescriptorSet0.vp_c3)._m0[int(_157)][_159];
    uint _163 = uint(int(uint(_129) >> uint(2)));
    uint _165 = uint(int(uint(int(_163)) >> uint(2)));
    int _167 = int(_163) & 3;
    float _169 = (*spvDescriptorSet0.vp_c3)._m0[int(_165)][_167];
    float _171 = _79 * _79;
    int _173 = 0;
    if (_153)
    {
        float _175 = as_type<float>(in.m_28.z);
        _173 = as_type<int>(_175);
    }
    int _177 = _173;
    if (!_153)
    {
        _91 = false;
    }
    bool _179 = _91;
    float _181 = _145 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _183 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[3].x, _181);
    float _185 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[3].z, _183);
    bool _187 = _179;
    int _189 = as_type<int>(_185);
    if (_153)
    {
        int _191 = ~_177;
        int _193 = _191 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _195 = _193 != 0;
        _149 = _195 ? (-1) : 0;
    }
    int _197 = _149;
    float _199 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _201 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    uint _203 = extract_bits(uint(_125), 0u, 8u);
    float _205 = float(_203);
    int _207 = _197;
    if (_153)
    {
        int _209 = ~_197;
        _187 = _209 != 0;
    }
    bool _211 = _187;
    float _213 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _199);
    float _215 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _201);
    float _217 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].z, _213);
    float _219 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _215);
    float _221 = _145 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _223 = _145 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _225 = fma(_217, _217, _171);
    float _227 = _145 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _229 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[1].x, _221);
    float _231 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[2].x, _223);
    int _233 = 0;
    if (_211)
    {
        float _235 = as_type<float>(in.m_28.w);
        _233 = as_type<int>(_235);
    }
    int _237 = _233;
    float _239 = fma(_219, _219, _225);
    float _241 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[4].x, _227);
    int _243 = as_type<int>(_73) & 31;
    bool _245 = uint(_243) < 32u;
    int _247 = 1 << _243;
    int _249 = _245 ? _247 : 0;
    uint _251 = extract_bits(as_type<uint>(_161), 24u, 8u);
    float _253 = float(_251);
    bool _255 = false;
    if (!_211)
    {
        _255 = false;
    }
    bool _257 = _255;
    float _259 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[1].z, _229);
    int _261 = _249 & as_type<int>(_169);
    bool _263 = _261 != 0;
    float _265 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[2].z, _231);
    float _267 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[4].z, _241);
    float _269 = _259 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _271 = _185 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    uint _273 = extract_bits(as_type<uint>(_161), 16u, 8u);
    float _275 = float(_273);
    float _277 = _265 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _279 = _267 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _281 = _205 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _269;
    out.gl_Position.y = _277;
    out.gl_Position.z = _271;
    out.gl_Position.w = _279;
    uint _283 = extract_bits(as_type<uint>(_161), 8u, 8u);
    float _285 = float(_283);
    float _287 = _253 * 0.0039215688593685626983642578125;
    bool _289 = _257;
    if (!_263)
    {
        _189 = -1082130432;
    }
    int _291 = _189;
    if (_211)
    {
        int _293 = ~_237;
        int _295 = _293 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _297 = _295 != 0;
        _207 = _297 ? (-1) : 0;
    }
    int _299 = _207;
    if (!_263)
    {
        float _784 = as_type<float>(_291);
        out.gl_Position.w = _784;
    }
    float _301 = rsqrt(_239);
    if (_211)
    {
        int _303 = ~_299;
        _289 = _303 != 0;
    }
    bool _305 = _289;
    float _307 = _275 * 0.0039215688593685626983642578125;
    float _309 = _285 * 0.0039215688593685626983642578125;
    out.m_33.x = _287;
    out.m_33.y = _307;
    out.m_33.z = _309;
    out.m_33.w = _281;
    float _311 = _217 * _301;
    float _313 = _79 * _301;
    float _315 = _219 * _301;
    out.m_35.x = _311;
    out.m_35.y = _313;
    out.m_35.z = _315;
    if (!_305)
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
    float _51 = in.m_26.x;
    float _53 = in.m_26.y;
    float _55 = in.m_26.z;
    int _58 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].z);
    int _60 = _58 << 4;
    int _62 = _60 + 208;
    float _64 = as_type<float>(in.m_28.x);
    uint _67 = uint(int(uint(_62) >> uint(2)));
    uint _69 = uint(int(uint(int(_67)) >> uint(2)));
    int _71 = int(_67) & 3;
    float _73 = (*spvDescriptorSet0.vp_c3)._m0[int(_69)][_71];
    float _75 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _77 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _75);
    float _79 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _77);
    int _81 = ~as_type<int>(_64);
    int _83 = _81 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _87 = _83 != 0;
    int _89 = 0;
    bool _91 = _87;
    if (!_87)
    {
        float _93 = as_type<float>(in.m_28.y);
        _89 = as_type<int>(_93);
    }
    int _95 = _89;
    bool _97 = false;
    if (_87)
    {
        _97 = false;
    }
    bool _99 = _97;
    int _101 = as_type<int>(_73) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _103 = _101 << 4;
    int _105 = _103 + 208;
    uint _107 = uint(int(uint(as_type<int>(_73)) >> uint(5)));
    int _109 = int(_107) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _111 = uint(int(uint(_105) >> uint(2)));
    uint _113 = uint(int(uint(int(_111)) >> uint(2)));
    int _115 = int(_111) & 3;
    float _117 = (*spvDescriptorSet0.vp_c3)._m0[int(_113)][_115];
    int _119 = _105 & 3;
    int _121 = _119 << 3;
    uint _123 = uint(int(uint(as_type<int>(_117)) >> uint(_121)));
    int _125 = int(_123) & 255;
    int _127 = _109 << 4;
    int _129 = _127 + 208;
    int _131 = 0;
    bool _133 = _99;
    if (!_87)
    {
        int _135 = ~_95;
        int _137 = _135 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _139 = _137 != 0;
        _131 = _139 ? (-1) : 0;
    }
    int _141 = _131;
    float _143 = in.m_30.x;
    float _145 = in.m_30.y;
    float _147 = in.m_30.z;
    int _149 = _141;
    if (!_87)
    {
        int _151 = ~_141;
        _133 = _151 != 0;
    }
    bool _153 = _133;
    uint _155 = uint(int(uint(_105) >> uint(2)));
    uint _157 = uint(int(uint(int(_155)) >> uint(2)));
    int _159 = int(_155) & 3;
    float _161 = (*spvDescriptorSet0.vp_c3)._m0[int(_157)][_159];
    uint _163 = uint(int(uint(_129) >> uint(2)));
    uint _165 = uint(int(uint(int(_163)) >> uint(2)));
    int _167 = int(_163) & 3;
    float _169 = (*spvDescriptorSet0.vp_c3)._m0[int(_165)][_167];
    float _171 = _79 * _79;
    int _173 = 0;
    if (_153)
    {
        float _175 = as_type<float>(in.m_28.z);
        _173 = as_type<int>(_175);
    }
    int _177 = _173;
    if (!_153)
    {
        _91 = false;
    }
    bool _179 = _91;
    float _181 = _145 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _183 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[3].x, _181);
    float _185 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[3].z, _183);
    bool _187 = _179;
    int _189 = as_type<int>(_185);
    if (_153)
    {
        int _191 = ~_177;
        int _193 = _191 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _195 = _193 != 0;
        _149 = _195 ? (-1) : 0;
    }
    int _197 = _149;
    float _199 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _201 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    uint _203 = extract_bits(uint(_125), 0u, 8u);
    float _205 = float(_203);
    int _207 = _197;
    if (_153)
    {
        int _209 = ~_197;
        _187 = _209 != 0;
    }
    bool _211 = _187;
    float _213 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _199);
    float _215 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _201);
    float _217 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].z, _213);
    float _219 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _215);
    float _221 = _145 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _223 = _145 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _225 = fma(_217, _217, _171);
    float _227 = _145 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _229 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[1].x, _221);
    float _231 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[2].x, _223);
    int _233 = 0;
    if (_211)
    {
        float _235 = as_type<float>(in.m_28.w);
        _233 = as_type<int>(_235);
    }
    int _237 = _233;
    float _239 = fma(_219, _219, _225);
    float _241 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[4].x, _227);
    int _243 = as_type<int>(_73) & 31;
    bool _245 = uint(_243) < 32u;
    int _247 = 1 << _243;
    int _249 = _245 ? _247 : 0;
    uint _251 = extract_bits(as_type<uint>(_161), 24u, 8u);
    float _253 = float(_251);
    bool _255 = false;
    if (!_211)
    {
        _255 = false;
    }
    bool _257 = _255;
    float _259 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[1].z, _229);
    int _261 = _249 & as_type<int>(_169);
    bool _263 = _261 != 0;
    float _265 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[2].z, _231);
    float _267 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[4].z, _241);
    float _269 = _259 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _271 = _185 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    uint _273 = extract_bits(as_type<uint>(_161), 16u, 8u);
    float _275 = float(_273);
    float _277 = _265 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _279 = _267 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _281 = _205 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _269;
    out.gl_Position.y = _277;
    out.gl_Position.z = _271;
    out.gl_Position.w = _279;
    uint _283 = extract_bits(as_type<uint>(_161), 8u, 8u);
    float _285 = float(_283);
    float _287 = _253 * 0.0039215688593685626983642578125;
    bool _289 = _257;
    if (!_263)
    {
        _189 = -1082130432;
    }
    int _291 = _189;
    if (_211)
    {
        int _293 = ~_237;
        int _295 = _293 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _297 = _295 != 0;
        _207 = _297 ? (-1) : 0;
    }
    int _299 = _207;
    if (!_263)
    {
        float _784 = as_type<float>(_291);
        out.gl_Position.w = _784;
    }
    float _301 = rsqrt(_239);
    if (_211)
    {
        int _303 = ~_299;
        _289 = _303 != 0;
    }
    bool _305 = _289;
    float _307 = _275 * 0.0039215688593685626983642578125;
    float _309 = _285 * 0.0039215688593685626983642578125;
    out.m_33.x = _287;
    out.m_33.y = _307;
    out.m_33.z = _309;
    out.m_33.w = _281;
    float _311 = _217 * _301;
    float _313 = _79 * _301;
    float _315 = _219 * _301;
    out.m_35.x = _311;
    out.m_35.y = _313;
    out.m_35.z = _315;
    if (!_305)
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
    float _51 = in.m_26.x;
    float _53 = in.m_26.y;
    float _55 = in.m_26.z;
    int _58 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].z);
    int _60 = _58 << 4;
    int _62 = _60 + 208;
    float _64 = as_type<float>(in.m_28.x);
    uint _67 = uint(int(uint(_62) >> uint(2)));
    uint _69 = uint(int(uint(int(_67)) >> uint(2)));
    int _71 = int(_67) & 3;
    float _73 = (*spvDescriptorSet0.vp_c3)._m0[int(_69)][_71];
    float _75 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _77 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _75);
    float _79 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _77);
    int _81 = ~as_type<int>(_64);
    int _83 = _81 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _87 = _83 != 0;
    int _89 = 0;
    bool _91 = _87;
    if (!_87)
    {
        float _93 = as_type<float>(in.m_28.y);
        _89 = as_type<int>(_93);
    }
    int _95 = _89;
    bool _97 = false;
    if (_87)
    {
        _97 = false;
    }
    bool _99 = _97;
    int _101 = as_type<int>(_73) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _103 = _101 << 4;
    int _105 = _103 + 208;
    uint _107 = uint(int(uint(as_type<int>(_73)) >> uint(5)));
    int _109 = int(_107) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _111 = uint(int(uint(_105) >> uint(2)));
    uint _113 = uint(int(uint(int(_111)) >> uint(2)));
    int _115 = int(_111) & 3;
    float _117 = (*spvDescriptorSet0.vp_c3)._m0[int(_113)][_115];
    int _119 = _105 & 3;
    int _121 = _119 << 3;
    uint _123 = uint(int(uint(as_type<int>(_117)) >> uint(_121)));
    int _125 = int(_123) & 255;
    int _127 = _109 << 4;
    int _129 = _127 + 208;
    int _131 = 0;
    bool _133 = _99;
    if (!_87)
    {
        int _135 = ~_95;
        int _137 = _135 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _139 = _137 != 0;
        _131 = _139 ? (-1) : 0;
    }
    int _141 = _131;
    float _143 = in.m_30.x;
    float _145 = in.m_30.y;
    float _147 = in.m_30.z;
    int _149 = _141;
    if (!_87)
    {
        int _151 = ~_141;
        _133 = _151 != 0;
    }
    bool _153 = _133;
    uint _155 = uint(int(uint(_105) >> uint(2)));
    uint _157 = uint(int(uint(int(_155)) >> uint(2)));
    int _159 = int(_155) & 3;
    float _161 = (*spvDescriptorSet0.vp_c3)._m0[int(_157)][_159];
    uint _163 = uint(int(uint(_129) >> uint(2)));
    uint _165 = uint(int(uint(int(_163)) >> uint(2)));
    int _167 = int(_163) & 3;
    float _169 = (*spvDescriptorSet0.vp_c3)._m0[int(_165)][_167];
    float _171 = _79 * _79;
    int _173 = 0;
    if (_153)
    {
        float _175 = as_type<float>(in.m_28.z);
        _173 = as_type<int>(_175);
    }
    int _177 = _173;
    if (!_153)
    {
        _91 = false;
    }
    bool _179 = _91;
    float _181 = _145 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _183 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[3].x, _181);
    float _185 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[3].z, _183);
    bool _187 = _179;
    int _189 = as_type<int>(_185);
    if (_153)
    {
        int _191 = ~_177;
        int _193 = _191 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _195 = _193 != 0;
        _149 = _195 ? (-1) : 0;
    }
    int _197 = _149;
    float _199 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _201 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    uint _203 = extract_bits(uint(_125), 0u, 8u);
    float _205 = float(_203);
    int _207 = _197;
    if (_153)
    {
        int _209 = ~_197;
        _187 = _209 != 0;
    }
    bool _211 = _187;
    float _213 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _199);
    float _215 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _201);
    float _217 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].z, _213);
    float _219 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _215);
    float _221 = _145 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _223 = _145 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _225 = fma(_217, _217, _171);
    float _227 = _145 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _229 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[1].x, _221);
    float _231 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[2].x, _223);
    int _233 = 0;
    if (_211)
    {
        float _235 = as_type<float>(in.m_28.w);
        _233 = as_type<int>(_235);
    }
    int _237 = _233;
    float _239 = fma(_219, _219, _225);
    float _241 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[4].x, _227);
    int _243 = as_type<int>(_73) & 31;
    bool _245 = uint(_243) < 32u;
    int _247 = 1 << _243;
    int _249 = _245 ? _247 : 0;
    uint _251 = extract_bits(as_type<uint>(_161), 24u, 8u);
    float _253 = float(_251);
    bool _255 = false;
    if (!_211)
    {
        _255 = false;
    }
    bool _257 = _255;
    float _259 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[1].z, _229);
    int _261 = _249 & as_type<int>(_169);
    bool _263 = _261 != 0;
    float _265 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[2].z, _231);
    float _267 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[4].z, _241);
    float _269 = _259 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _271 = _185 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    uint _273 = extract_bits(as_type<uint>(_161), 16u, 8u);
    float _275 = float(_273);
    float _277 = _265 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _279 = _267 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _281 = _205 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _269;
    out.gl_Position.y = _277;
    out.gl_Position.z = _271;
    out.gl_Position.w = _279;
    uint _283 = extract_bits(as_type<uint>(_161), 8u, 8u);
    float _285 = float(_283);
    float _287 = _253 * 0.0039215688593685626983642578125;
    bool _289 = _257;
    if (!_263)
    {
        _189 = -1082130432;
    }
    int _291 = _189;
    if (_211)
    {
        int _293 = ~_237;
        int _295 = _293 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _297 = _295 != 0;
        _207 = _297 ? (-1) : 0;
    }
    int _299 = _207;
    if (!_263)
    {
        float _784 = as_type<float>(_291);
        out.gl_Position.w = _784;
    }
    float _301 = rsqrt(_239);
    if (_211)
    {
        int _303 = ~_299;
        _289 = _303 != 0;
    }
    bool _305 = _289;
    float _307 = _275 * 0.0039215688593685626983642578125;
    float _309 = _285 * 0.0039215688593685626983642578125;
    out.m_33.x = _287;
    out.m_33.y = _307;
    out.m_33.z = _309;
    out.m_33.w = _281;
    float _311 = _217 * _301;
    float _313 = _79 * _301;
    float _315 = _219 * _301;
    out.m_35.x = _311;
    out.m_35.y = _313;
    out.m_35.z = _315;
    if (!_305)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

