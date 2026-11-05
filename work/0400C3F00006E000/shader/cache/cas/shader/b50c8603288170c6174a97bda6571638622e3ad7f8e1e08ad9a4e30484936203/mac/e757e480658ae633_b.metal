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
    int _60 = ~as_type<int>(_49);
    int _62 = _60 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _66 = _62 != 0;
    int _68 = as_type<int>(_51) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _70 = _68 << 4;
    int _72 = _70 + 208;
    float _74 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    uint _77 = uint(int(uint(as_type<int>(_51)) >> uint(5)));
    int _79 = int(_77) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _81 = uint(int(uint(_72) >> uint(2)));
    uint _83 = uint(int(uint(int(_81)) >> uint(2)));
    int _85 = int(_81) & 3;
    float _87 = (*spvDescriptorSet0.vp_c3)._m0[int(_83)][_85];
    int _89 = _72 & 3;
    int _91 = _89 << 3;
    uint _93 = uint(int(uint(as_type<int>(_87)) >> uint(_91)));
    int _95 = int(_93) & 255;
    int _97 = 0;
    bool _99 = _66;
    if (!_66)
    {
        float _101 = as_type<float>(in.m_23.y);
        _97 = as_type<int>(_101);
    }
    int _103 = _97;
    bool _105 = false;
    if (_66)
    {
        _105 = false;
    }
    bool _107 = _105;
    float _109 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _74);
    int _111 = _79 << 4;
    int _113 = _111 + 208;
    int _115 = as_type<int>(_51) & 31;
    bool _117 = uint(_115) < 32u;
    int _119 = 1 << _115;
    int _121 = _117 ? _119 : 0;
    uint _123 = uint(int(uint(_72) >> uint(2)));
    uint _125 = uint(int(uint(int(_123)) >> uint(2)));
    int _127 = int(_123) & 3;
    float _129 = (*spvDescriptorSet0.vp_c3)._m0[int(_125)][_127];
    uint _131 = uint(int(uint(_113) >> uint(2)));
    uint _133 = uint(int(uint(int(_131)) >> uint(2)));
    int _135 = int(_131) & 3;
    float _137 = (*spvDescriptorSet0.vp_c3)._m0[int(_133)][_135];
    float _139 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].z, _109);
    int _141 = 0;
    bool _143 = _107;
    if (!_66)
    {
        int _145 = ~_103;
        int _147 = _145 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _149 = _147 != 0;
        _141 = _149 ? (-1) : 0;
    }
    int _151 = _141;
    float _153 = in.m_30.x;
    float _155 = in.m_30.y;
    float _157 = in.m_30.z;
    int _159 = _151;
    if (!_66)
    {
        int _161 = ~_151;
        _143 = _161 != 0;
    }
    bool _163 = _143;
    int _165 = 0;
    if (_163)
    {
        float _167 = as_type<float>(in.m_23.z);
        _165 = as_type<int>(_167);
    }
    int _169 = _165;
    if (!_163)
    {
        _99 = false;
    }
    bool _171 = _99;
    uint _173 = extract_bits(uint(_95), 0u, 8u);
    float _175 = float(_173);
    float _177 = _155 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _179 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[3].x, _177);
    uint _181 = extract_bits(as_type<uint>(_129), 24u, 8u);
    float _183 = float(_181);
    float _185 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[3].z, _179);
    uint _187 = extract_bits(as_type<uint>(_129), 16u, 8u);
    float _189 = float(_187);
    float _191 = _175 * 0.0039215688593685626983642578125;
    bool _193 = _171;
    int _195 = as_type<int>(_185);
    if (_163)
    {
        int _197 = ~_169;
        int _199 = _197 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _201 = _199 != 0;
        _159 = _201 ? (-1) : 0;
    }
    int _203 = _159;
    float _205 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _207 = _55 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    int _209 = _203;
    if (_163)
    {
        int _211 = ~_203;
        _193 = _211 != 0;
    }
    bool _213 = _193;
    float _215 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _205);
    float _217 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].x, _207);
    int _219 = _121 & as_type<int>(_137);
    bool _221 = _219 != 0;
    float _223 = _139 * _139;
    float _225 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].z, _215);
    float _227 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[7].z, _217);
    uint _229 = extract_bits(as_type<uint>(_129), 8u, 8u);
    float _231 = float(_229);
    float _233 = _155 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _235 = fma(_225, _225, _223);
    float _237 = _155 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _239 = _155 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _241 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[1].x, _233);
    int _243 = 0;
    if (_213)
    {
        float _245 = as_type<float>(in.m_23.w);
        _243 = as_type<int>(_245);
    }
    int _247 = _243;
    float _249 = fma(_227, _227, _235);
    float _251 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[2].x, _237);
    float _253 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[4].x, _239);
    bool _255 = false;
    if (!_213)
    {
        _255 = false;
    }
    bool _257 = _255;
    float _259 = rsqrt(_249);
    float _261 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[1].z, _241);
    float _263 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[2].z, _251);
    float _265 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[4].z, _253);
    float _267 = _185 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _269 = _261 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _271 = _263 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _273 = _265 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _275 = _257;
    if (!_221)
    {
        _195 = -1082130432;
    }
    int _277 = _195;
    float _279 = _183 * 0.0039215688593685626983642578125;
    float _281 = _189 * 0.0039215688593685626983642578125;
    float _283 = _231 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _269;
    out.gl_Position.y = _271;
    out.gl_Position.z = _267;
    out.gl_Position.w = _273;
    float _285 = _225 * _259;
    float _287 = _139 * _259;
    float _289 = _227 * _259;
    if (_213)
    {
        int _291 = ~_247;
        int _293 = _291 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _295 = _293 != 0;
        _209 = _295 ? (-1) : 0;
    }
    int _297 = _209;
    out.m_33.x = _279;
    out.m_33.y = _281;
    out.m_33.z = _283;
    out.m_33.w = _191;
    if (_213)
    {
        int _299 = ~_297;
        _275 = _299 != 0;
    }
    bool _301 = _275;
    if (!_221)
    {
        float _776 = as_type<float>(_277);
        out.gl_Position.w = _776;
    }
    out.m_35.x = _285;
    out.m_35.y = _287;
    out.m_35.z = _289;
    if (!_301)
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
    int _60 = ~as_type<int>(_49);
    int _62 = _60 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _66 = _62 != 0;
    int _68 = as_type<int>(_51) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _70 = _68 << 4;
    int _72 = _70 + 208;
    float _74 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    uint _77 = uint(int(uint(as_type<int>(_51)) >> uint(5)));
    int _79 = int(_77) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _81 = uint(int(uint(_72) >> uint(2)));
    uint _83 = uint(int(uint(int(_81)) >> uint(2)));
    int _85 = int(_81) & 3;
    float _87 = (*spvDescriptorSet0.vp_c3)._m0[int(_83)][_85];
    int _89 = _72 & 3;
    int _91 = _89 << 3;
    uint _93 = uint(int(uint(as_type<int>(_87)) >> uint(_91)));
    int _95 = int(_93) & 255;
    int _97 = 0;
    bool _99 = _66;
    if (!_66)
    {
        float _101 = as_type<float>(in.m_23.y);
        _97 = as_type<int>(_101);
    }
    int _103 = _97;
    bool _105 = false;
    if (_66)
    {
        _105 = false;
    }
    bool _107 = _105;
    float _109 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _74);
    int _111 = _79 << 4;
    int _113 = _111 + 208;
    int _115 = as_type<int>(_51) & 31;
    bool _117 = uint(_115) < 32u;
    int _119 = 1 << _115;
    int _121 = _117 ? _119 : 0;
    uint _123 = uint(int(uint(_72) >> uint(2)));
    uint _125 = uint(int(uint(int(_123)) >> uint(2)));
    int _127 = int(_123) & 3;
    float _129 = (*spvDescriptorSet0.vp_c3)._m0[int(_125)][_127];
    uint _131 = uint(int(uint(_113) >> uint(2)));
    uint _133 = uint(int(uint(int(_131)) >> uint(2)));
    int _135 = int(_131) & 3;
    float _137 = (*spvDescriptorSet0.vp_c3)._m0[int(_133)][_135];
    float _139 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].z, _109);
    int _141 = 0;
    bool _143 = _107;
    if (!_66)
    {
        int _145 = ~_103;
        int _147 = _145 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _149 = _147 != 0;
        _141 = _149 ? (-1) : 0;
    }
    int _151 = _141;
    float _153 = in.m_30.x;
    float _155 = in.m_30.y;
    float _157 = in.m_30.z;
    int _159 = _151;
    if (!_66)
    {
        int _161 = ~_151;
        _143 = _161 != 0;
    }
    bool _163 = _143;
    int _165 = 0;
    if (_163)
    {
        float _167 = as_type<float>(in.m_23.z);
        _165 = as_type<int>(_167);
    }
    int _169 = _165;
    if (!_163)
    {
        _99 = false;
    }
    bool _171 = _99;
    uint _173 = extract_bits(uint(_95), 0u, 8u);
    float _175 = float(_173);
    float _177 = _155 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _179 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[3].x, _177);
    uint _181 = extract_bits(as_type<uint>(_129), 24u, 8u);
    float _183 = float(_181);
    float _185 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[3].z, _179);
    uint _187 = extract_bits(as_type<uint>(_129), 16u, 8u);
    float _189 = float(_187);
    float _191 = _175 * 0.0039215688593685626983642578125;
    bool _193 = _171;
    int _195 = as_type<int>(_185);
    if (_163)
    {
        int _197 = ~_169;
        int _199 = _197 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _201 = _199 != 0;
        _159 = _201 ? (-1) : 0;
    }
    int _203 = _159;
    float _205 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _207 = _55 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    int _209 = _203;
    if (_163)
    {
        int _211 = ~_203;
        _193 = _211 != 0;
    }
    bool _213 = _193;
    float _215 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _205);
    float _217 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].x, _207);
    int _219 = _121 & as_type<int>(_137);
    bool _221 = _219 != 0;
    float _223 = _139 * _139;
    float _225 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].z, _215);
    float _227 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[7].z, _217);
    uint _229 = extract_bits(as_type<uint>(_129), 8u, 8u);
    float _231 = float(_229);
    float _233 = _155 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _235 = fma(_225, _225, _223);
    float _237 = _155 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _239 = _155 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _241 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[1].x, _233);
    int _243 = 0;
    if (_213)
    {
        float _245 = as_type<float>(in.m_23.w);
        _243 = as_type<int>(_245);
    }
    int _247 = _243;
    float _249 = fma(_227, _227, _235);
    float _251 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[2].x, _237);
    float _253 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[4].x, _239);
    bool _255 = false;
    if (!_213)
    {
        _255 = false;
    }
    bool _257 = _255;
    float _259 = rsqrt(_249);
    float _261 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[1].z, _241);
    float _263 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[2].z, _251);
    float _265 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[4].z, _253);
    float _267 = _185 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _269 = _261 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _271 = _263 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _273 = _265 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _275 = _257;
    if (!_221)
    {
        _195 = -1082130432;
    }
    int _277 = _195;
    float _279 = _183 * 0.0039215688593685626983642578125;
    float _281 = _189 * 0.0039215688593685626983642578125;
    float _283 = _231 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _269;
    out.gl_Position.y = _271;
    out.gl_Position.z = _267;
    out.gl_Position.w = _273;
    float _285 = _225 * _259;
    float _287 = _139 * _259;
    float _289 = _227 * _259;
    if (_213)
    {
        int _291 = ~_247;
        int _293 = _291 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _295 = _293 != 0;
        _209 = _295 ? (-1) : 0;
    }
    int _297 = _209;
    out.m_33.x = _279;
    out.m_33.y = _281;
    out.m_33.z = _283;
    out.m_33.w = _191;
    if (_213)
    {
        int _299 = ~_297;
        _275 = _299 != 0;
    }
    bool _301 = _275;
    if (!_221)
    {
        float _776 = as_type<float>(_277);
        out.gl_Position.w = _776;
    }
    out.m_35.x = _285;
    out.m_35.y = _287;
    out.m_35.z = _289;
    if (!_301)
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
    int _60 = ~as_type<int>(_49);
    int _62 = _60 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _66 = _62 != 0;
    int _68 = as_type<int>(_51) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _70 = _68 << 4;
    int _72 = _70 + 208;
    float _74 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    uint _77 = uint(int(uint(as_type<int>(_51)) >> uint(5)));
    int _79 = int(_77) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _81 = uint(int(uint(_72) >> uint(2)));
    uint _83 = uint(int(uint(int(_81)) >> uint(2)));
    int _85 = int(_81) & 3;
    float _87 = (*spvDescriptorSet0.vp_c3)._m0[int(_83)][_85];
    int _89 = _72 & 3;
    int _91 = _89 << 3;
    uint _93 = uint(int(uint(as_type<int>(_87)) >> uint(_91)));
    int _95 = int(_93) & 255;
    int _97 = 0;
    bool _99 = _66;
    if (!_66)
    {
        float _101 = as_type<float>(in.m_23.y);
        _97 = as_type<int>(_101);
    }
    int _103 = _97;
    bool _105 = false;
    if (_66)
    {
        _105 = false;
    }
    bool _107 = _105;
    float _109 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _74);
    int _111 = _79 << 4;
    int _113 = _111 + 208;
    int _115 = as_type<int>(_51) & 31;
    bool _117 = uint(_115) < 32u;
    int _119 = 1 << _115;
    int _121 = _117 ? _119 : 0;
    uint _123 = uint(int(uint(_72) >> uint(2)));
    uint _125 = uint(int(uint(int(_123)) >> uint(2)));
    int _127 = int(_123) & 3;
    float _129 = (*spvDescriptorSet0.vp_c3)._m0[int(_125)][_127];
    uint _131 = uint(int(uint(_113) >> uint(2)));
    uint _133 = uint(int(uint(int(_131)) >> uint(2)));
    int _135 = int(_131) & 3;
    float _137 = (*spvDescriptorSet0.vp_c3)._m0[int(_133)][_135];
    float _139 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].z, _109);
    int _141 = 0;
    bool _143 = _107;
    if (!_66)
    {
        int _145 = ~_103;
        int _147 = _145 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _149 = _147 != 0;
        _141 = _149 ? (-1) : 0;
    }
    int _151 = _141;
    float _153 = in.m_30.x;
    float _155 = in.m_30.y;
    float _157 = in.m_30.z;
    int _159 = _151;
    if (!_66)
    {
        int _161 = ~_151;
        _143 = _161 != 0;
    }
    bool _163 = _143;
    int _165 = 0;
    if (_163)
    {
        float _167 = as_type<float>(in.m_23.z);
        _165 = as_type<int>(_167);
    }
    int _169 = _165;
    if (!_163)
    {
        _99 = false;
    }
    bool _171 = _99;
    uint _173 = extract_bits(uint(_95), 0u, 8u);
    float _175 = float(_173);
    float _177 = _155 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _179 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[3].x, _177);
    uint _181 = extract_bits(as_type<uint>(_129), 24u, 8u);
    float _183 = float(_181);
    float _185 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[3].z, _179);
    uint _187 = extract_bits(as_type<uint>(_129), 16u, 8u);
    float _189 = float(_187);
    float _191 = _175 * 0.0039215688593685626983642578125;
    bool _193 = _171;
    int _195 = as_type<int>(_185);
    if (_163)
    {
        int _197 = ~_169;
        int _199 = _197 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _201 = _199 != 0;
        _159 = _201 ? (-1) : 0;
    }
    int _203 = _159;
    float _205 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _207 = _55 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    int _209 = _203;
    if (_163)
    {
        int _211 = ~_203;
        _193 = _211 != 0;
    }
    bool _213 = _193;
    float _215 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _205);
    float _217 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].x, _207);
    int _219 = _121 & as_type<int>(_137);
    bool _221 = _219 != 0;
    float _223 = _139 * _139;
    float _225 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].z, _215);
    float _227 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[7].z, _217);
    uint _229 = extract_bits(as_type<uint>(_129), 8u, 8u);
    float _231 = float(_229);
    float _233 = _155 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _235 = fma(_225, _225, _223);
    float _237 = _155 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _239 = _155 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _241 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[1].x, _233);
    int _243 = 0;
    if (_213)
    {
        float _245 = as_type<float>(in.m_23.w);
        _243 = as_type<int>(_245);
    }
    int _247 = _243;
    float _249 = fma(_227, _227, _235);
    float _251 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[2].x, _237);
    float _253 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[4].x, _239);
    bool _255 = false;
    if (!_213)
    {
        _255 = false;
    }
    bool _257 = _255;
    float _259 = rsqrt(_249);
    float _261 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[1].z, _241);
    float _263 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[2].z, _251);
    float _265 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[4].z, _253);
    float _267 = _185 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _269 = _261 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _271 = _263 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _273 = _265 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _275 = _257;
    if (!_221)
    {
        _195 = -1082130432;
    }
    int _277 = _195;
    float _279 = _183 * 0.0039215688593685626983642578125;
    float _281 = _189 * 0.0039215688593685626983642578125;
    float _283 = _231 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _269;
    out.gl_Position.y = _271;
    out.gl_Position.z = _267;
    out.gl_Position.w = _273;
    float _285 = _225 * _259;
    float _287 = _139 * _259;
    float _289 = _227 * _259;
    if (_213)
    {
        int _291 = ~_247;
        int _293 = _291 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _295 = _293 != 0;
        _209 = _295 ? (-1) : 0;
    }
    int _297 = _209;
    out.m_33.x = _279;
    out.m_33.y = _281;
    out.m_33.z = _283;
    out.m_33.w = _191;
    if (_213)
    {
        int _299 = ~_297;
        _275 = _299 != 0;
    }
    bool _301 = _275;
    if (!_221)
    {
        float _776 = as_type<float>(_277);
        out.gl_Position.w = _776;
    }
    out.m_35.x = _285;
    out.m_35.y = _287;
    out.m_35.z = _289;
    if (!_301)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

