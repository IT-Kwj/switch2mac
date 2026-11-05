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
    float4 m_28 [[attribute(1)]];
    uint4 m_25 [[attribute(2)]];
    uint4 m_23 [[attribute(4)]];
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
    float _51 = as_type<float>(in.m_25.x);
    float _53 = in.m_28.x;
    float _55 = in.m_28.y;
    float _57 = in.m_28.z;
    int _60 = as_type<int>(_49) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _64 = _60 != 0;
    int _66 = as_type<int>(_51) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _68 = _66 << 4;
    int _70 = _68 + 208;
    float _72 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    uint _75 = uint(int(uint(as_type<int>(_51)) >> uint(5)));
    int _77 = int(_75) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _79 = uint(int(uint(_70) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.vp_c3)._m0[int(_81)][_83];
    int _87 = _70 & 3;
    int _89 = _87 << 3;
    uint _91 = uint(int(uint(as_type<int>(_85)) >> uint(_89)));
    int _93 = int(_91) & 255;
    int _95 = 0;
    bool _97 = _64;
    if (!_64)
    {
        float _99 = as_type<float>(in.m_23.y);
        _95 = as_type<int>(_99);
    }
    int _101 = _95;
    bool _103 = false;
    if (_64)
    {
        _103 = false;
    }
    bool _105 = _103;
    float _107 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _72);
    int _109 = _77 << 4;
    int _111 = _109 + 208;
    int _113 = as_type<int>(_51) & 31;
    bool _115 = uint(_113) < 32u;
    int _117 = 1 << _113;
    int _119 = _115 ? _117 : 0;
    uint _121 = uint(int(uint(_70) >> uint(2)));
    uint _123 = uint(int(uint(int(_121)) >> uint(2)));
    int _125 = int(_121) & 3;
    float _127 = (*spvDescriptorSet0.vp_c3)._m0[int(_123)][_125];
    uint _129 = uint(int(uint(_111) >> uint(2)));
    uint _131 = uint(int(uint(int(_129)) >> uint(2)));
    int _133 = int(_129) & 3;
    float _135 = (*spvDescriptorSet0.vp_c3)._m0[int(_131)][_133];
    float _137 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].z, _107);
    int _139 = 0;
    bool _141 = _105;
    if (!_64)
    {
        int _143 = _101 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _145 = _143 != 0;
        _139 = _145 ? (-1) : 0;
    }
    int _147 = _139;
    float _149 = in.m_30.x;
    float _151 = in.m_30.y;
    float _153 = in.m_30.z;
    int _155 = _147;
    if (!_64)
    {
        int _157 = ~_147;
        _141 = _157 != 0;
    }
    bool _159 = _141;
    int _161 = 0;
    if (_159)
    {
        float _163 = as_type<float>(in.m_23.z);
        _161 = as_type<int>(_163);
    }
    int _165 = _161;
    if (!_159)
    {
        _97 = false;
    }
    bool _167 = _97;
    uint _169 = extract_bits(uint(_93), 0u, 8u);
    float _171 = float(_169);
    float _173 = _151 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _175 = fma(_149, (*spvDescriptorSet0.vp_c3)._m0[3].x, _173);
    uint _177 = extract_bits(as_type<uint>(_127), 24u, 8u);
    float _179 = float(_177);
    float _181 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[3].z, _175);
    uint _183 = extract_bits(as_type<uint>(_127), 16u, 8u);
    float _185 = float(_183);
    float _187 = _171 * 0.0039215688593685626983642578125;
    bool _189 = _167;
    int _191 = as_type<int>(_181);
    if (_159)
    {
        int _193 = _165 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _195 = _193 != 0;
        _155 = _195 ? (-1) : 0;
    }
    int _197 = _155;
    float _199 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _201 = _55 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    int _203 = _197;
    if (_159)
    {
        int _205 = ~_197;
        _189 = _205 != 0;
    }
    bool _207 = _189;
    float _209 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _199);
    float _211 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].x, _201);
    int _213 = _119 & as_type<int>(_135);
    bool _215 = _213 != 0;
    float _217 = _137 * _137;
    float _219 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].z, _209);
    float _221 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[7].z, _211);
    uint _223 = extract_bits(as_type<uint>(_127), 8u, 8u);
    float _225 = float(_223);
    float _227 = _151 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _229 = fma(_219, _219, _217);
    float _231 = _151 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _233 = _151 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _235 = fma(_149, (*spvDescriptorSet0.vp_c3)._m0[1].x, _227);
    int _237 = 0;
    if (_207)
    {
        float _239 = as_type<float>(in.m_23.w);
        _237 = as_type<int>(_239);
    }
    int _241 = _237;
    float _243 = fma(_221, _221, _229);
    float _245 = fma(_149, (*spvDescriptorSet0.vp_c3)._m0[2].x, _231);
    float _247 = fma(_149, (*spvDescriptorSet0.vp_c3)._m0[4].x, _233);
    bool _249 = false;
    if (!_207)
    {
        _249 = false;
    }
    bool _251 = _249;
    float _253 = rsqrt(_243);
    float _255 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[1].z, _235);
    float _257 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[2].z, _245);
    float _259 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[4].z, _247);
    float _261 = _181 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _263 = _255 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _265 = _257 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _267 = _259 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _269 = _251;
    if (!_215)
    {
        _191 = -1082130432;
    }
    int _271 = _191;
    float _273 = _179 * 0.0039215688593685626983642578125;
    float _275 = _185 * 0.0039215688593685626983642578125;
    float _277 = _225 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _263;
    out.gl_Position.y = _265;
    out.gl_Position.z = _261;
    out.gl_Position.w = _267;
    float _279 = _219 * _253;
    float _281 = _137 * _253;
    float _283 = _221 * _253;
    if (_207)
    {
        int _285 = _241 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _287 = _285 != 0;
        _203 = _287 ? (-1) : 0;
    }
    int _289 = _203;
    out.m_33.x = _273;
    out.m_33.y = _275;
    out.m_33.z = _277;
    out.m_33.w = _187;
    if (_207)
    {
        int _291 = ~_289;
        _269 = _291 != 0;
    }
    bool _293 = _269;
    if (!_215)
    {
        float _760 = as_type<float>(_271);
        out.gl_Position.w = _760;
    }
    out.m_35.x = _279;
    out.m_35.y = _281;
    out.m_35.z = _283;
    if (!_293)
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
    float _51 = as_type<float>(in.m_25.x);
    float _53 = in.m_28.x;
    float _55 = in.m_28.y;
    float _57 = in.m_28.z;
    int _60 = as_type<int>(_49) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _64 = _60 != 0;
    int _66 = as_type<int>(_51) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _68 = _66 << 4;
    int _70 = _68 + 208;
    float _72 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    uint _75 = uint(int(uint(as_type<int>(_51)) >> uint(5)));
    int _77 = int(_75) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _79 = uint(int(uint(_70) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.vp_c3)._m0[int(_81)][_83];
    int _87 = _70 & 3;
    int _89 = _87 << 3;
    uint _91 = uint(int(uint(as_type<int>(_85)) >> uint(_89)));
    int _93 = int(_91) & 255;
    int _95 = 0;
    bool _97 = _64;
    if (!_64)
    {
        float _99 = as_type<float>(in.m_23.y);
        _95 = as_type<int>(_99);
    }
    int _101 = _95;
    bool _103 = false;
    if (_64)
    {
        _103 = false;
    }
    bool _105 = _103;
    float _107 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _72);
    int _109 = _77 << 4;
    int _111 = _109 + 208;
    int _113 = as_type<int>(_51) & 31;
    bool _115 = uint(_113) < 32u;
    int _117 = 1 << _113;
    int _119 = _115 ? _117 : 0;
    uint _121 = uint(int(uint(_70) >> uint(2)));
    uint _123 = uint(int(uint(int(_121)) >> uint(2)));
    int _125 = int(_121) & 3;
    float _127 = (*spvDescriptorSet0.vp_c3)._m0[int(_123)][_125];
    uint _129 = uint(int(uint(_111) >> uint(2)));
    uint _131 = uint(int(uint(int(_129)) >> uint(2)));
    int _133 = int(_129) & 3;
    float _135 = (*spvDescriptorSet0.vp_c3)._m0[int(_131)][_133];
    float _137 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].z, _107);
    int _139 = 0;
    bool _141 = _105;
    if (!_64)
    {
        int _143 = _101 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _145 = _143 != 0;
        _139 = _145 ? (-1) : 0;
    }
    int _147 = _139;
    float _149 = in.m_30.x;
    float _151 = in.m_30.y;
    float _153 = in.m_30.z;
    int _155 = _147;
    if (!_64)
    {
        int _157 = ~_147;
        _141 = _157 != 0;
    }
    bool _159 = _141;
    int _161 = 0;
    if (_159)
    {
        float _163 = as_type<float>(in.m_23.z);
        _161 = as_type<int>(_163);
    }
    int _165 = _161;
    if (!_159)
    {
        _97 = false;
    }
    bool _167 = _97;
    uint _169 = extract_bits(uint(_93), 0u, 8u);
    float _171 = float(_169);
    float _173 = _151 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _175 = fma(_149, (*spvDescriptorSet0.vp_c3)._m0[3].x, _173);
    uint _177 = extract_bits(as_type<uint>(_127), 24u, 8u);
    float _179 = float(_177);
    float _181 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[3].z, _175);
    uint _183 = extract_bits(as_type<uint>(_127), 16u, 8u);
    float _185 = float(_183);
    float _187 = _171 * 0.0039215688593685626983642578125;
    bool _189 = _167;
    int _191 = as_type<int>(_181);
    if (_159)
    {
        int _193 = _165 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _195 = _193 != 0;
        _155 = _195 ? (-1) : 0;
    }
    int _197 = _155;
    float _199 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _201 = _55 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    int _203 = _197;
    if (_159)
    {
        int _205 = ~_197;
        _189 = _205 != 0;
    }
    bool _207 = _189;
    float _209 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _199);
    float _211 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].x, _201);
    int _213 = _119 & as_type<int>(_135);
    bool _215 = _213 != 0;
    float _217 = _137 * _137;
    float _219 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].z, _209);
    float _221 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[7].z, _211);
    uint _223 = extract_bits(as_type<uint>(_127), 8u, 8u);
    float _225 = float(_223);
    float _227 = _151 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _229 = fma(_219, _219, _217);
    float _231 = _151 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _233 = _151 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _235 = fma(_149, (*spvDescriptorSet0.vp_c3)._m0[1].x, _227);
    int _237 = 0;
    if (_207)
    {
        float _239 = as_type<float>(in.m_23.w);
        _237 = as_type<int>(_239);
    }
    int _241 = _237;
    float _243 = fma(_221, _221, _229);
    float _245 = fma(_149, (*spvDescriptorSet0.vp_c3)._m0[2].x, _231);
    float _247 = fma(_149, (*spvDescriptorSet0.vp_c3)._m0[4].x, _233);
    bool _249 = false;
    if (!_207)
    {
        _249 = false;
    }
    bool _251 = _249;
    float _253 = rsqrt(_243);
    float _255 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[1].z, _235);
    float _257 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[2].z, _245);
    float _259 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[4].z, _247);
    float _261 = _181 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _263 = _255 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _265 = _257 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _267 = _259 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _269 = _251;
    if (!_215)
    {
        _191 = -1082130432;
    }
    int _271 = _191;
    float _273 = _179 * 0.0039215688593685626983642578125;
    float _275 = _185 * 0.0039215688593685626983642578125;
    float _277 = _225 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _263;
    out.gl_Position.y = _265;
    out.gl_Position.z = _261;
    out.gl_Position.w = _267;
    float _279 = _219 * _253;
    float _281 = _137 * _253;
    float _283 = _221 * _253;
    if (_207)
    {
        int _285 = _241 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _287 = _285 != 0;
        _203 = _287 ? (-1) : 0;
    }
    int _289 = _203;
    out.m_33.x = _273;
    out.m_33.y = _275;
    out.m_33.z = _277;
    out.m_33.w = _187;
    if (_207)
    {
        int _291 = ~_289;
        _269 = _291 != 0;
    }
    bool _293 = _269;
    if (!_215)
    {
        float _760 = as_type<float>(_271);
        out.gl_Position.w = _760;
    }
    out.m_35.x = _279;
    out.m_35.y = _281;
    out.m_35.z = _283;
    if (!_293)
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
    float _51 = as_type<float>(in.m_25.x);
    float _53 = in.m_28.x;
    float _55 = in.m_28.y;
    float _57 = in.m_28.z;
    int _60 = as_type<int>(_49) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _64 = _60 != 0;
    int _66 = as_type<int>(_51) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _68 = _66 << 4;
    int _70 = _68 + 208;
    float _72 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    uint _75 = uint(int(uint(as_type<int>(_51)) >> uint(5)));
    int _77 = int(_75) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _79 = uint(int(uint(_70) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.vp_c3)._m0[int(_81)][_83];
    int _87 = _70 & 3;
    int _89 = _87 << 3;
    uint _91 = uint(int(uint(as_type<int>(_85)) >> uint(_89)));
    int _93 = int(_91) & 255;
    int _95 = 0;
    bool _97 = _64;
    if (!_64)
    {
        float _99 = as_type<float>(in.m_23.y);
        _95 = as_type<int>(_99);
    }
    int _101 = _95;
    bool _103 = false;
    if (_64)
    {
        _103 = false;
    }
    bool _105 = _103;
    float _107 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _72);
    int _109 = _77 << 4;
    int _111 = _109 + 208;
    int _113 = as_type<int>(_51) & 31;
    bool _115 = uint(_113) < 32u;
    int _117 = 1 << _113;
    int _119 = _115 ? _117 : 0;
    uint _121 = uint(int(uint(_70) >> uint(2)));
    uint _123 = uint(int(uint(int(_121)) >> uint(2)));
    int _125 = int(_121) & 3;
    float _127 = (*spvDescriptorSet0.vp_c3)._m0[int(_123)][_125];
    uint _129 = uint(int(uint(_111) >> uint(2)));
    uint _131 = uint(int(uint(int(_129)) >> uint(2)));
    int _133 = int(_129) & 3;
    float _135 = (*spvDescriptorSet0.vp_c3)._m0[int(_131)][_133];
    float _137 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].z, _107);
    int _139 = 0;
    bool _141 = _105;
    if (!_64)
    {
        int _143 = _101 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _145 = _143 != 0;
        _139 = _145 ? (-1) : 0;
    }
    int _147 = _139;
    float _149 = in.m_30.x;
    float _151 = in.m_30.y;
    float _153 = in.m_30.z;
    int _155 = _147;
    if (!_64)
    {
        int _157 = ~_147;
        _141 = _157 != 0;
    }
    bool _159 = _141;
    int _161 = 0;
    if (_159)
    {
        float _163 = as_type<float>(in.m_23.z);
        _161 = as_type<int>(_163);
    }
    int _165 = _161;
    if (!_159)
    {
        _97 = false;
    }
    bool _167 = _97;
    uint _169 = extract_bits(uint(_93), 0u, 8u);
    float _171 = float(_169);
    float _173 = _151 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _175 = fma(_149, (*spvDescriptorSet0.vp_c3)._m0[3].x, _173);
    uint _177 = extract_bits(as_type<uint>(_127), 24u, 8u);
    float _179 = float(_177);
    float _181 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[3].z, _175);
    uint _183 = extract_bits(as_type<uint>(_127), 16u, 8u);
    float _185 = float(_183);
    float _187 = _171 * 0.0039215688593685626983642578125;
    bool _189 = _167;
    int _191 = as_type<int>(_181);
    if (_159)
    {
        int _193 = _165 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _195 = _193 != 0;
        _155 = _195 ? (-1) : 0;
    }
    int _197 = _155;
    float _199 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _201 = _55 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    int _203 = _197;
    if (_159)
    {
        int _205 = ~_197;
        _189 = _205 != 0;
    }
    bool _207 = _189;
    float _209 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _199);
    float _211 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].x, _201);
    int _213 = _119 & as_type<int>(_135);
    bool _215 = _213 != 0;
    float _217 = _137 * _137;
    float _219 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].z, _209);
    float _221 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[7].z, _211);
    uint _223 = extract_bits(as_type<uint>(_127), 8u, 8u);
    float _225 = float(_223);
    float _227 = _151 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _229 = fma(_219, _219, _217);
    float _231 = _151 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _233 = _151 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _235 = fma(_149, (*spvDescriptorSet0.vp_c3)._m0[1].x, _227);
    int _237 = 0;
    if (_207)
    {
        float _239 = as_type<float>(in.m_23.w);
        _237 = as_type<int>(_239);
    }
    int _241 = _237;
    float _243 = fma(_221, _221, _229);
    float _245 = fma(_149, (*spvDescriptorSet0.vp_c3)._m0[2].x, _231);
    float _247 = fma(_149, (*spvDescriptorSet0.vp_c3)._m0[4].x, _233);
    bool _249 = false;
    if (!_207)
    {
        _249 = false;
    }
    bool _251 = _249;
    float _253 = rsqrt(_243);
    float _255 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[1].z, _235);
    float _257 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[2].z, _245);
    float _259 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[4].z, _247);
    float _261 = _181 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _263 = _255 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _265 = _257 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _267 = _259 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _269 = _251;
    if (!_215)
    {
        _191 = -1082130432;
    }
    int _271 = _191;
    float _273 = _179 * 0.0039215688593685626983642578125;
    float _275 = _185 * 0.0039215688593685626983642578125;
    float _277 = _225 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _263;
    out.gl_Position.y = _265;
    out.gl_Position.z = _261;
    out.gl_Position.w = _267;
    float _279 = _219 * _253;
    float _281 = _137 * _253;
    float _283 = _221 * _253;
    if (_207)
    {
        int _285 = _241 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _287 = _285 != 0;
        _203 = _287 ? (-1) : 0;
    }
    int _289 = _203;
    out.m_33.x = _273;
    out.m_33.y = _275;
    out.m_33.z = _277;
    out.m_33.w = _187;
    if (_207)
    {
        int _291 = ~_289;
        _269 = _291 != 0;
    }
    bool _293 = _269;
    if (!_215)
    {
        float _760 = as_type<float>(_271);
        out.gl_Position.w = _760;
    }
    out.m_35.x = _279;
    out.m_35.y = _281;
    out.m_35.z = _283;
    if (!_293)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

