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
    int _81 = as_type<int>(_64) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _85 = _81 != 0;
    int _87 = 0;
    bool _89 = _85;
    if (!_85)
    {
        float _91 = as_type<float>(in.m_28.y);
        _87 = as_type<int>(_91);
    }
    int _93 = _87;
    bool _95 = false;
    if (_85)
    {
        _95 = false;
    }
    bool _97 = _95;
    int _99 = as_type<int>(_73) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _101 = _99 << 4;
    int _103 = _101 + 208;
    uint _105 = uint(int(uint(as_type<int>(_73)) >> uint(5)));
    int _107 = int(_105) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _109 = uint(int(uint(_103) >> uint(2)));
    uint _111 = uint(int(uint(int(_109)) >> uint(2)));
    int _113 = int(_109) & 3;
    float _115 = (*spvDescriptorSet0.vp_c3)._m0[int(_111)][_113];
    int _117 = _103 & 3;
    int _119 = _117 << 3;
    uint _121 = uint(int(uint(as_type<int>(_115)) >> uint(_119)));
    int _123 = int(_121) & 255;
    int _125 = _107 << 4;
    int _127 = _125 + 208;
    int _129 = 0;
    bool _131 = _97;
    if (!_85)
    {
        int _133 = _93 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _135 = _133 != 0;
        _129 = _135 ? (-1) : 0;
    }
    int _137 = _129;
    float _139 = in.m_30.x;
    float _141 = in.m_30.y;
    float _143 = in.m_30.z;
    int _145 = _137;
    if (!_85)
    {
        int _147 = ~_137;
        _131 = _147 != 0;
    }
    bool _149 = _131;
    uint _151 = uint(int(uint(_103) >> uint(2)));
    uint _153 = uint(int(uint(int(_151)) >> uint(2)));
    int _155 = int(_151) & 3;
    float _157 = (*spvDescriptorSet0.vp_c3)._m0[int(_153)][_155];
    uint _159 = uint(int(uint(_127) >> uint(2)));
    uint _161 = uint(int(uint(int(_159)) >> uint(2)));
    int _163 = int(_159) & 3;
    float _165 = (*spvDescriptorSet0.vp_c3)._m0[int(_161)][_163];
    float _167 = _79 * _79;
    int _169 = 0;
    if (_149)
    {
        float _171 = as_type<float>(in.m_28.z);
        _169 = as_type<int>(_171);
    }
    int _173 = _169;
    if (!_149)
    {
        _89 = false;
    }
    bool _175 = _89;
    float _177 = _141 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _179 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[3].x, _177);
    float _181 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[3].z, _179);
    bool _183 = _175;
    int _185 = as_type<int>(_181);
    if (_149)
    {
        int _187 = _173 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _189 = _187 != 0;
        _145 = _189 ? (-1) : 0;
    }
    int _191 = _145;
    float _193 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _195 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    uint _197 = extract_bits(uint(_123), 0u, 8u);
    float _199 = float(_197);
    int _201 = _191;
    if (_149)
    {
        int _203 = ~_191;
        _183 = _203 != 0;
    }
    bool _205 = _183;
    float _207 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _193);
    float _209 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _195);
    float _211 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].z, _207);
    float _213 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _209);
    float _215 = _141 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _217 = _141 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _219 = fma(_211, _211, _167);
    float _221 = _141 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _223 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[1].x, _215);
    float _225 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[2].x, _217);
    int _227 = 0;
    if (_205)
    {
        float _229 = as_type<float>(in.m_28.w);
        _227 = as_type<int>(_229);
    }
    int _231 = _227;
    float _233 = fma(_213, _213, _219);
    float _235 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[4].x, _221);
    int _237 = as_type<int>(_73) & 31;
    bool _239 = uint(_237) < 32u;
    int _241 = 1 << _237;
    int _243 = _239 ? _241 : 0;
    uint _245 = extract_bits(as_type<uint>(_157), 24u, 8u);
    float _247 = float(_245);
    bool _249 = false;
    if (!_205)
    {
        _249 = false;
    }
    bool _251 = _249;
    float _253 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[1].z, _223);
    int _255 = _243 & as_type<int>(_165);
    bool _257 = _255 != 0;
    float _259 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[2].z, _225);
    float _261 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[4].z, _235);
    float _263 = _253 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _265 = _181 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    uint _267 = extract_bits(as_type<uint>(_157), 16u, 8u);
    float _269 = float(_267);
    float _271 = _259 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _273 = _261 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _275 = _199 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _263;
    out.gl_Position.y = _271;
    out.gl_Position.z = _265;
    out.gl_Position.w = _273;
    uint _277 = extract_bits(as_type<uint>(_157), 8u, 8u);
    float _279 = float(_277);
    float _281 = _247 * 0.0039215688593685626983642578125;
    bool _283 = _251;
    if (!_257)
    {
        _185 = -1082130432;
    }
    int _285 = _185;
    if (_205)
    {
        int _287 = _231 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _289 = _287 != 0;
        _201 = _289 ? (-1) : 0;
    }
    int _291 = _201;
    if (!_257)
    {
        float _768 = as_type<float>(_285);
        out.gl_Position.w = _768;
    }
    float _293 = rsqrt(_233);
    if (_205)
    {
        int _295 = ~_291;
        _283 = _295 != 0;
    }
    bool _297 = _283;
    float _299 = _269 * 0.0039215688593685626983642578125;
    float _301 = _279 * 0.0039215688593685626983642578125;
    out.m_33.x = _281;
    out.m_33.y = _299;
    out.m_33.z = _301;
    out.m_33.w = _275;
    float _303 = _211 * _293;
    float _305 = _79 * _293;
    float _307 = _213 * _293;
    out.m_35.x = _303;
    out.m_35.y = _305;
    out.m_35.z = _307;
    if (!_297)
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
    int _81 = as_type<int>(_64) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _85 = _81 != 0;
    int _87 = 0;
    bool _89 = _85;
    if (!_85)
    {
        float _91 = as_type<float>(in.m_28.y);
        _87 = as_type<int>(_91);
    }
    int _93 = _87;
    bool _95 = false;
    if (_85)
    {
        _95 = false;
    }
    bool _97 = _95;
    int _99 = as_type<int>(_73) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _101 = _99 << 4;
    int _103 = _101 + 208;
    uint _105 = uint(int(uint(as_type<int>(_73)) >> uint(5)));
    int _107 = int(_105) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _109 = uint(int(uint(_103) >> uint(2)));
    uint _111 = uint(int(uint(int(_109)) >> uint(2)));
    int _113 = int(_109) & 3;
    float _115 = (*spvDescriptorSet0.vp_c3)._m0[int(_111)][_113];
    int _117 = _103 & 3;
    int _119 = _117 << 3;
    uint _121 = uint(int(uint(as_type<int>(_115)) >> uint(_119)));
    int _123 = int(_121) & 255;
    int _125 = _107 << 4;
    int _127 = _125 + 208;
    int _129 = 0;
    bool _131 = _97;
    if (!_85)
    {
        int _133 = _93 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _135 = _133 != 0;
        _129 = _135 ? (-1) : 0;
    }
    int _137 = _129;
    float _139 = in.m_30.x;
    float _141 = in.m_30.y;
    float _143 = in.m_30.z;
    int _145 = _137;
    if (!_85)
    {
        int _147 = ~_137;
        _131 = _147 != 0;
    }
    bool _149 = _131;
    uint _151 = uint(int(uint(_103) >> uint(2)));
    uint _153 = uint(int(uint(int(_151)) >> uint(2)));
    int _155 = int(_151) & 3;
    float _157 = (*spvDescriptorSet0.vp_c3)._m0[int(_153)][_155];
    uint _159 = uint(int(uint(_127) >> uint(2)));
    uint _161 = uint(int(uint(int(_159)) >> uint(2)));
    int _163 = int(_159) & 3;
    float _165 = (*spvDescriptorSet0.vp_c3)._m0[int(_161)][_163];
    float _167 = _79 * _79;
    int _169 = 0;
    if (_149)
    {
        float _171 = as_type<float>(in.m_28.z);
        _169 = as_type<int>(_171);
    }
    int _173 = _169;
    if (!_149)
    {
        _89 = false;
    }
    bool _175 = _89;
    float _177 = _141 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _179 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[3].x, _177);
    float _181 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[3].z, _179);
    bool _183 = _175;
    int _185 = as_type<int>(_181);
    if (_149)
    {
        int _187 = _173 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _189 = _187 != 0;
        _145 = _189 ? (-1) : 0;
    }
    int _191 = _145;
    float _193 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _195 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    uint _197 = extract_bits(uint(_123), 0u, 8u);
    float _199 = float(_197);
    int _201 = _191;
    if (_149)
    {
        int _203 = ~_191;
        _183 = _203 != 0;
    }
    bool _205 = _183;
    float _207 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _193);
    float _209 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _195);
    float _211 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].z, _207);
    float _213 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _209);
    float _215 = _141 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _217 = _141 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _219 = fma(_211, _211, _167);
    float _221 = _141 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _223 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[1].x, _215);
    float _225 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[2].x, _217);
    int _227 = 0;
    if (_205)
    {
        float _229 = as_type<float>(in.m_28.w);
        _227 = as_type<int>(_229);
    }
    int _231 = _227;
    float _233 = fma(_213, _213, _219);
    float _235 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[4].x, _221);
    int _237 = as_type<int>(_73) & 31;
    bool _239 = uint(_237) < 32u;
    int _241 = 1 << _237;
    int _243 = _239 ? _241 : 0;
    uint _245 = extract_bits(as_type<uint>(_157), 24u, 8u);
    float _247 = float(_245);
    bool _249 = false;
    if (!_205)
    {
        _249 = false;
    }
    bool _251 = _249;
    float _253 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[1].z, _223);
    int _255 = _243 & as_type<int>(_165);
    bool _257 = _255 != 0;
    float _259 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[2].z, _225);
    float _261 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[4].z, _235);
    float _263 = _253 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _265 = _181 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    uint _267 = extract_bits(as_type<uint>(_157), 16u, 8u);
    float _269 = float(_267);
    float _271 = _259 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _273 = _261 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _275 = _199 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _263;
    out.gl_Position.y = _271;
    out.gl_Position.z = _265;
    out.gl_Position.w = _273;
    uint _277 = extract_bits(as_type<uint>(_157), 8u, 8u);
    float _279 = float(_277);
    float _281 = _247 * 0.0039215688593685626983642578125;
    bool _283 = _251;
    if (!_257)
    {
        _185 = -1082130432;
    }
    int _285 = _185;
    if (_205)
    {
        int _287 = _231 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _289 = _287 != 0;
        _201 = _289 ? (-1) : 0;
    }
    int _291 = _201;
    if (!_257)
    {
        float _768 = as_type<float>(_285);
        out.gl_Position.w = _768;
    }
    float _293 = rsqrt(_233);
    if (_205)
    {
        int _295 = ~_291;
        _283 = _295 != 0;
    }
    bool _297 = _283;
    float _299 = _269 * 0.0039215688593685626983642578125;
    float _301 = _279 * 0.0039215688593685626983642578125;
    out.m_33.x = _281;
    out.m_33.y = _299;
    out.m_33.z = _301;
    out.m_33.w = _275;
    float _303 = _211 * _293;
    float _305 = _79 * _293;
    float _307 = _213 * _293;
    out.m_35.x = _303;
    out.m_35.y = _305;
    out.m_35.z = _307;
    if (!_297)
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
    int _81 = as_type<int>(_64) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _85 = _81 != 0;
    int _87 = 0;
    bool _89 = _85;
    if (!_85)
    {
        float _91 = as_type<float>(in.m_28.y);
        _87 = as_type<int>(_91);
    }
    int _93 = _87;
    bool _95 = false;
    if (_85)
    {
        _95 = false;
    }
    bool _97 = _95;
    int _99 = as_type<int>(_73) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _101 = _99 << 4;
    int _103 = _101 + 208;
    uint _105 = uint(int(uint(as_type<int>(_73)) >> uint(5)));
    int _107 = int(_105) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _109 = uint(int(uint(_103) >> uint(2)));
    uint _111 = uint(int(uint(int(_109)) >> uint(2)));
    int _113 = int(_109) & 3;
    float _115 = (*spvDescriptorSet0.vp_c3)._m0[int(_111)][_113];
    int _117 = _103 & 3;
    int _119 = _117 << 3;
    uint _121 = uint(int(uint(as_type<int>(_115)) >> uint(_119)));
    int _123 = int(_121) & 255;
    int _125 = _107 << 4;
    int _127 = _125 + 208;
    int _129 = 0;
    bool _131 = _97;
    if (!_85)
    {
        int _133 = _93 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _135 = _133 != 0;
        _129 = _135 ? (-1) : 0;
    }
    int _137 = _129;
    float _139 = in.m_30.x;
    float _141 = in.m_30.y;
    float _143 = in.m_30.z;
    int _145 = _137;
    if (!_85)
    {
        int _147 = ~_137;
        _131 = _147 != 0;
    }
    bool _149 = _131;
    uint _151 = uint(int(uint(_103) >> uint(2)));
    uint _153 = uint(int(uint(int(_151)) >> uint(2)));
    int _155 = int(_151) & 3;
    float _157 = (*spvDescriptorSet0.vp_c3)._m0[int(_153)][_155];
    uint _159 = uint(int(uint(_127) >> uint(2)));
    uint _161 = uint(int(uint(int(_159)) >> uint(2)));
    int _163 = int(_159) & 3;
    float _165 = (*spvDescriptorSet0.vp_c3)._m0[int(_161)][_163];
    float _167 = _79 * _79;
    int _169 = 0;
    if (_149)
    {
        float _171 = as_type<float>(in.m_28.z);
        _169 = as_type<int>(_171);
    }
    int _173 = _169;
    if (!_149)
    {
        _89 = false;
    }
    bool _175 = _89;
    float _177 = _141 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _179 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[3].x, _177);
    float _181 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[3].z, _179);
    bool _183 = _175;
    int _185 = as_type<int>(_181);
    if (_149)
    {
        int _187 = _173 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _189 = _187 != 0;
        _145 = _189 ? (-1) : 0;
    }
    int _191 = _145;
    float _193 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _195 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    uint _197 = extract_bits(uint(_123), 0u, 8u);
    float _199 = float(_197);
    int _201 = _191;
    if (_149)
    {
        int _203 = ~_191;
        _183 = _203 != 0;
    }
    bool _205 = _183;
    float _207 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _193);
    float _209 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _195);
    float _211 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].z, _207);
    float _213 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _209);
    float _215 = _141 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _217 = _141 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _219 = fma(_211, _211, _167);
    float _221 = _141 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _223 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[1].x, _215);
    float _225 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[2].x, _217);
    int _227 = 0;
    if (_205)
    {
        float _229 = as_type<float>(in.m_28.w);
        _227 = as_type<int>(_229);
    }
    int _231 = _227;
    float _233 = fma(_213, _213, _219);
    float _235 = fma(_139, (*spvDescriptorSet0.vp_c3)._m0[4].x, _221);
    int _237 = as_type<int>(_73) & 31;
    bool _239 = uint(_237) < 32u;
    int _241 = 1 << _237;
    int _243 = _239 ? _241 : 0;
    uint _245 = extract_bits(as_type<uint>(_157), 24u, 8u);
    float _247 = float(_245);
    bool _249 = false;
    if (!_205)
    {
        _249 = false;
    }
    bool _251 = _249;
    float _253 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[1].z, _223);
    int _255 = _243 & as_type<int>(_165);
    bool _257 = _255 != 0;
    float _259 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[2].z, _225);
    float _261 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[4].z, _235);
    float _263 = _253 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _265 = _181 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    uint _267 = extract_bits(as_type<uint>(_157), 16u, 8u);
    float _269 = float(_267);
    float _271 = _259 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _273 = _261 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _275 = _199 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _263;
    out.gl_Position.y = _271;
    out.gl_Position.z = _265;
    out.gl_Position.w = _273;
    uint _277 = extract_bits(as_type<uint>(_157), 8u, 8u);
    float _279 = float(_277);
    float _281 = _247 * 0.0039215688593685626983642578125;
    bool _283 = _251;
    if (!_257)
    {
        _185 = -1082130432;
    }
    int _285 = _185;
    if (_205)
    {
        int _287 = _231 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _289 = _287 != 0;
        _201 = _289 ? (-1) : 0;
    }
    int _291 = _201;
    if (!_257)
    {
        float _768 = as_type<float>(_285);
        out.gl_Position.w = _768;
    }
    float _293 = rsqrt(_233);
    if (_205)
    {
        int _295 = ~_291;
        _283 = _295 != 0;
    }
    bool _297 = _283;
    float _299 = _269 * 0.0039215688593685626983642578125;
    float _301 = _279 * 0.0039215688593685626983642578125;
    out.m_33.x = _281;
    out.m_33.y = _299;
    out.m_33.z = _301;
    out.m_33.w = _275;
    float _303 = _211 * _293;
    float _305 = _79 * _293;
    float _307 = _213 * _293;
    out.m_35.x = _303;
    out.m_35.y = _305;
    out.m_35.z = _307;
    if (!_297)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

