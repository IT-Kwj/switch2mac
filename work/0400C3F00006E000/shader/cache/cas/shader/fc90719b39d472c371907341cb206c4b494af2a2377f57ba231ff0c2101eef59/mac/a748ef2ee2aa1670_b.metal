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
    float4 m_28 [[attribute(1)]];
    uint4 m_25 [[attribute(2)]];
    uint4 m_23 [[attribute(4)]];
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
    float _49 = as_type<float>(in.m_25.x);
    float _51 = in.m_28.x;
    float _53 = in.m_28.y;
    float _55 = in.m_28.z;
    int _58 = ~as_type<int>(_47);
    int _60 = _58 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _64 = _60 != 0;
    int _66 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].y);
    int _68 = _66 << 4;
    int _70 = _68 + 224;
    float _72 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _74 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _76 = _53 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    int _78 = _66;
    bool _80 = _64;
    if (!_64)
    {
        float _82 = as_type<float>(in.m_23.y);
        _78 = as_type<int>(_82);
    }
    int _84 = _78;
    uint _87 = uint(int(uint(_70) >> uint(2)));
    uint _89 = uint(int(uint(int(_87)) >> uint(2)));
    int _91 = int(_87) & 3;
    float _93 = (*spvDescriptorSet0.vp_c3)._m0[int(_89)][_91];
    bool _95 = false;
    if (_64)
    {
        _95 = false;
    }
    bool _97 = _95;
    float _99 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _72);
    float _101 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _74);
    float _103 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].x, _76);
    float _105 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _99);
    float _107 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _101);
    float _109 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[8].z, _103);
    float _111 = _105 * _105;
    float _113 = fma(_107, _107, _111);
    float _115 = fma(_109, _109, _113);
    int _117 = 0;
    bool _119 = _97;
    if (!_64)
    {
        int _121 = ~_84;
        int _123 = _121 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _125 = _123 != 0;
        _117 = _125 ? (-1) : 0;
    }
    int _127 = _117;
    int _129 = _127;
    if (!_64)
    {
        int _131 = ~_127;
        _119 = _131 != 0;
    }
    bool _133 = _119;
    int _135 = as_type<int>(_47);
    if (_133)
    {
        float _137 = as_type<float>(in.m_23.z);
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    if (!_133)
    {
        _80 = false;
    }
    bool _141 = _80;
    uint _143 = uint(int(uint(as_type<int>(_93)) >> uint(5)));
    int _145 = int(_143) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _147 = as_type<int>(_93) & 31;
    bool _149 = uint(_147) < 32u;
    int _151 = 1 << _147;
    int _153 = _149 ? _151 : 0;
    int _155 = _145 << 4;
    int _157 = _155 + 224;
    uint _159 = uint(int(uint(_157) >> uint(2)));
    uint _161 = uint(int(uint(int(_159)) >> uint(2)));
    int _163 = int(_159) & 3;
    float _165 = (*spvDescriptorSet0.vp_c3)._m0[int(_161)][_163];
    bool _167 = _141;
    if (_133)
    {
        int _169 = ~_139;
        int _171 = _169 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _173 = _171 != 0;
        _129 = _173 ? (-1) : 0;
    }
    int _175 = _129;
    float _177 = rsqrt(_115);
    float _179 = in.m_30.x;
    float _181 = in.m_30.y;
    float _183 = in.m_30.z;
    int _185 = _175;
    if (_133)
    {
        int _187 = ~_175;
        _167 = _187 != 0;
    }
    bool _189 = _167;
    int _191 = 0;
    if (_189)
    {
        float _193 = as_type<float>(in.m_23.w);
        _191 = as_type<int>(_193);
    }
    int _195 = _191;
    bool _197 = false;
    if (!_189)
    {
        _197 = false;
    }
    bool _199 = _197;
    float _201 = _107 * _177;
    float _203 = _109 * _177;
    float _205 = _181 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _207 = _181 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _209 = _181 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _211 = _181 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _213 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[2].x, _205);
    float _215 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[3].x, _207);
    float _217 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[4].x, _209);
    float _219 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[5].x, _211);
    float _221 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[2].z, _213);
    float _223 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[3].z, _215);
    float _225 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[4].z, _217);
    float _227 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[5].z, _219);
    float _229 = _221 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _231 = _223 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    int _233 = _153 & as_type<int>(_165);
    bool _235 = _233 != 0;
    float _237 = _225 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _239 = _199;
    int _241 = as_type<int>(_225);
    if (_189)
    {
        int _243 = ~_195;
        int _245 = _243 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _247 = _245 != 0;
        _185 = _247 ? (-1) : 0;
    }
    int _249 = _185;
    float _251 = _227 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _253 = _105 * _177;
    if (_189)
    {
        int _255 = ~_249;
        _239 = _255 != 0;
    }
    bool _257 = _239;
    out.gl_Position.x = _229;
    out.gl_Position.y = _231;
    out.gl_Position.z = _237;
    out.gl_Position.w = _251;
    out.m_33.x = _201;
    out.m_33.y = _253;
    out.m_33.z = _203;
    if (!_235)
    {
        _241 = -1082130432;
    }
    int _259 = _241;
    if (!_235)
    {
        float _675 = as_type<float>(_259);
        out.gl_Position.w = _675;
    }
    if (!_257)
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
    float _49 = as_type<float>(in.m_25.x);
    float _51 = in.m_28.x;
    float _53 = in.m_28.y;
    float _55 = in.m_28.z;
    int _58 = ~as_type<int>(_47);
    int _60 = _58 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _64 = _60 != 0;
    int _66 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].y);
    int _68 = _66 << 4;
    int _70 = _68 + 224;
    float _72 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _74 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _76 = _53 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    int _78 = _66;
    bool _80 = _64;
    if (!_64)
    {
        float _82 = as_type<float>(in.m_23.y);
        _78 = as_type<int>(_82);
    }
    int _84 = _78;
    uint _87 = uint(int(uint(_70) >> uint(2)));
    uint _89 = uint(int(uint(int(_87)) >> uint(2)));
    int _91 = int(_87) & 3;
    float _93 = (*spvDescriptorSet0.vp_c3)._m0[int(_89)][_91];
    bool _95 = false;
    if (_64)
    {
        _95 = false;
    }
    bool _97 = _95;
    float _99 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _72);
    float _101 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _74);
    float _103 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].x, _76);
    float _105 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _99);
    float _107 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _101);
    float _109 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[8].z, _103);
    float _111 = _105 * _105;
    float _113 = fma(_107, _107, _111);
    float _115 = fma(_109, _109, _113);
    int _117 = 0;
    bool _119 = _97;
    if (!_64)
    {
        int _121 = ~_84;
        int _123 = _121 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _125 = _123 != 0;
        _117 = _125 ? (-1) : 0;
    }
    int _127 = _117;
    int _129 = _127;
    if (!_64)
    {
        int _131 = ~_127;
        _119 = _131 != 0;
    }
    bool _133 = _119;
    int _135 = as_type<int>(_47);
    if (_133)
    {
        float _137 = as_type<float>(in.m_23.z);
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    if (!_133)
    {
        _80 = false;
    }
    bool _141 = _80;
    uint _143 = uint(int(uint(as_type<int>(_93)) >> uint(5)));
    int _145 = int(_143) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _147 = as_type<int>(_93) & 31;
    bool _149 = uint(_147) < 32u;
    int _151 = 1 << _147;
    int _153 = _149 ? _151 : 0;
    int _155 = _145 << 4;
    int _157 = _155 + 224;
    uint _159 = uint(int(uint(_157) >> uint(2)));
    uint _161 = uint(int(uint(int(_159)) >> uint(2)));
    int _163 = int(_159) & 3;
    float _165 = (*spvDescriptorSet0.vp_c3)._m0[int(_161)][_163];
    bool _167 = _141;
    if (_133)
    {
        int _169 = ~_139;
        int _171 = _169 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _173 = _171 != 0;
        _129 = _173 ? (-1) : 0;
    }
    int _175 = _129;
    float _177 = rsqrt(_115);
    float _179 = in.m_30.x;
    float _181 = in.m_30.y;
    float _183 = in.m_30.z;
    int _185 = _175;
    if (_133)
    {
        int _187 = ~_175;
        _167 = _187 != 0;
    }
    bool _189 = _167;
    int _191 = 0;
    if (_189)
    {
        float _193 = as_type<float>(in.m_23.w);
        _191 = as_type<int>(_193);
    }
    int _195 = _191;
    bool _197 = false;
    if (!_189)
    {
        _197 = false;
    }
    bool _199 = _197;
    float _201 = _107 * _177;
    float _203 = _109 * _177;
    float _205 = _181 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _207 = _181 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _209 = _181 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _211 = _181 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _213 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[2].x, _205);
    float _215 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[3].x, _207);
    float _217 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[4].x, _209);
    float _219 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[5].x, _211);
    float _221 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[2].z, _213);
    float _223 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[3].z, _215);
    float _225 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[4].z, _217);
    float _227 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[5].z, _219);
    float _229 = _221 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _231 = _223 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    int _233 = _153 & as_type<int>(_165);
    bool _235 = _233 != 0;
    float _237 = _225 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _239 = _199;
    int _241 = as_type<int>(_225);
    if (_189)
    {
        int _243 = ~_195;
        int _245 = _243 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _247 = _245 != 0;
        _185 = _247 ? (-1) : 0;
    }
    int _249 = _185;
    float _251 = _227 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _253 = _105 * _177;
    if (_189)
    {
        int _255 = ~_249;
        _239 = _255 != 0;
    }
    bool _257 = _239;
    out.gl_Position.x = _229;
    out.gl_Position.y = _231;
    out.gl_Position.z = _237;
    out.gl_Position.w = _251;
    out.m_33.x = _201;
    out.m_33.y = _253;
    out.m_33.z = _203;
    if (!_235)
    {
        _241 = -1082130432;
    }
    int _259 = _241;
    if (!_235)
    {
        float _675 = as_type<float>(_259);
        out.gl_Position.w = _675;
    }
    if (!_257)
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
    float _49 = as_type<float>(in.m_25.x);
    float _51 = in.m_28.x;
    float _53 = in.m_28.y;
    float _55 = in.m_28.z;
    int _58 = ~as_type<int>(_47);
    int _60 = _58 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _64 = _60 != 0;
    int _66 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].y);
    int _68 = _66 << 4;
    int _70 = _68 + 224;
    float _72 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _74 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _76 = _53 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    int _78 = _66;
    bool _80 = _64;
    if (!_64)
    {
        float _82 = as_type<float>(in.m_23.y);
        _78 = as_type<int>(_82);
    }
    int _84 = _78;
    uint _87 = uint(int(uint(_70) >> uint(2)));
    uint _89 = uint(int(uint(int(_87)) >> uint(2)));
    int _91 = int(_87) & 3;
    float _93 = (*spvDescriptorSet0.vp_c3)._m0[int(_89)][_91];
    bool _95 = false;
    if (_64)
    {
        _95 = false;
    }
    bool _97 = _95;
    float _99 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _72);
    float _101 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _74);
    float _103 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].x, _76);
    float _105 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _99);
    float _107 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _101);
    float _109 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[8].z, _103);
    float _111 = _105 * _105;
    float _113 = fma(_107, _107, _111);
    float _115 = fma(_109, _109, _113);
    int _117 = 0;
    bool _119 = _97;
    if (!_64)
    {
        int _121 = ~_84;
        int _123 = _121 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _125 = _123 != 0;
        _117 = _125 ? (-1) : 0;
    }
    int _127 = _117;
    int _129 = _127;
    if (!_64)
    {
        int _131 = ~_127;
        _119 = _131 != 0;
    }
    bool _133 = _119;
    int _135 = as_type<int>(_47);
    if (_133)
    {
        float _137 = as_type<float>(in.m_23.z);
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    if (!_133)
    {
        _80 = false;
    }
    bool _141 = _80;
    uint _143 = uint(int(uint(as_type<int>(_93)) >> uint(5)));
    int _145 = int(_143) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _147 = as_type<int>(_93) & 31;
    bool _149 = uint(_147) < 32u;
    int _151 = 1 << _147;
    int _153 = _149 ? _151 : 0;
    int _155 = _145 << 4;
    int _157 = _155 + 224;
    uint _159 = uint(int(uint(_157) >> uint(2)));
    uint _161 = uint(int(uint(int(_159)) >> uint(2)));
    int _163 = int(_159) & 3;
    float _165 = (*spvDescriptorSet0.vp_c3)._m0[int(_161)][_163];
    bool _167 = _141;
    if (_133)
    {
        int _169 = ~_139;
        int _171 = _169 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _173 = _171 != 0;
        _129 = _173 ? (-1) : 0;
    }
    int _175 = _129;
    float _177 = rsqrt(_115);
    float _179 = in.m_30.x;
    float _181 = in.m_30.y;
    float _183 = in.m_30.z;
    int _185 = _175;
    if (_133)
    {
        int _187 = ~_175;
        _167 = _187 != 0;
    }
    bool _189 = _167;
    int _191 = 0;
    if (_189)
    {
        float _193 = as_type<float>(in.m_23.w);
        _191 = as_type<int>(_193);
    }
    int _195 = _191;
    bool _197 = false;
    if (!_189)
    {
        _197 = false;
    }
    bool _199 = _197;
    float _201 = _107 * _177;
    float _203 = _109 * _177;
    float _205 = _181 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _207 = _181 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _209 = _181 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _211 = _181 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _213 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[2].x, _205);
    float _215 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[3].x, _207);
    float _217 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[4].x, _209);
    float _219 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[5].x, _211);
    float _221 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[2].z, _213);
    float _223 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[3].z, _215);
    float _225 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[4].z, _217);
    float _227 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[5].z, _219);
    float _229 = _221 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _231 = _223 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    int _233 = _153 & as_type<int>(_165);
    bool _235 = _233 != 0;
    float _237 = _225 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _239 = _199;
    int _241 = as_type<int>(_225);
    if (_189)
    {
        int _243 = ~_195;
        int _245 = _243 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _247 = _245 != 0;
        _185 = _247 ? (-1) : 0;
    }
    int _249 = _185;
    float _251 = _227 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _253 = _105 * _177;
    if (_189)
    {
        int _255 = ~_249;
        _239 = _255 != 0;
    }
    bool _257 = _239;
    out.gl_Position.x = _229;
    out.gl_Position.y = _231;
    out.gl_Position.z = _237;
    out.gl_Position.w = _251;
    out.m_33.x = _201;
    out.m_33.y = _253;
    out.m_33.z = _203;
    if (!_235)
    {
        _241 = -1082130432;
    }
    int _259 = _241;
    if (!_235)
    {
        float _675 = as_type<float>(_259);
        out.gl_Position.w = _675;
    }
    if (!_257)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

