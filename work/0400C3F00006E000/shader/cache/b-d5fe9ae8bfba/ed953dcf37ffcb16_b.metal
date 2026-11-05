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
    float _66 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _68 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _70 = _53 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _72 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _66);
    int _74 = as_type<int>(_47);
    bool _76 = _64;
    if (!_64)
    {
        float _78 = as_type<float>(in.m_23.y);
        _74 = as_type<int>(_78);
    }
    int _80 = _74;
    bool _82 = false;
    if (_64)
    {
        _82 = false;
    }
    bool _84 = _82;
    float _86 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _68);
    float _88 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _72);
    float _90 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].x, _70);
    float _92 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _86);
    float _94 = _88 * _88;
    float _96 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[8].z, _90);
    float _98 = fma(_92, _92, _94);
    int _100 = 0;
    bool _102 = _84;
    if (!_64)
    {
        int _104 = ~_80;
        int _106 = _104 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _108 = _106 != 0;
        _100 = _108 ? (-1) : 0;
    }
    int _110 = _100;
    uint _113 = uint(int(uint(as_type<int>(_49)) >> uint(5)));
    int _115 = int(_113) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _117 = _110;
    if (!_64)
    {
        int _119 = ~_110;
        _102 = _119 != 0;
    }
    bool _121 = _102;
    int _123 = _115 << 4;
    int _125 = _123 + 224;
    int _127 = as_type<int>(_49) & 31;
    bool _129 = uint(_127) < 32u;
    int _131 = 1 << _127;
    int _133 = _129 ? _131 : 0;
    uint _135 = uint(int(uint(_125) >> uint(2)));
    uint _137 = uint(int(uint(int(_135)) >> uint(2)));
    int _139 = int(_135) & 3;
    float _141 = (*spvDescriptorSet0.vp_c3)._m0[int(_137)][_139];
    int _143 = _115;
    if (_121)
    {
        float _145 = as_type<float>(in.m_23.z);
        _143 = as_type<int>(_145);
    }
    int _147 = _143;
    if (!_121)
    {
        _76 = false;
    }
    bool _149 = _76;
    bool _151 = _149;
    if (_121)
    {
        int _153 = ~_147;
        int _155 = _153 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _157 = _155 != 0;
        _117 = _157 ? (-1) : 0;
    }
    int _159 = _117;
    float _161 = in.m_30.x;
    float _163 = in.m_30.y;
    float _165 = in.m_30.z;
    int _167 = _159;
    if (_121)
    {
        int _169 = ~_159;
        _151 = _169 != 0;
    }
    bool _171 = _151;
    int _173 = 0;
    if (_171)
    {
        float _175 = as_type<float>(in.m_23.w);
        _173 = as_type<int>(_175);
    }
    int _177 = _173;
    bool _179 = false;
    if (!_171)
    {
        _179 = false;
    }
    bool _181 = _179;
    int _183 = _133 & as_type<int>(_141);
    bool _185 = _183 != 0;
    float _187 = fma(_96, _96, _98);
    float _189 = rsqrt(_187);
    float _191 = _163 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _193 = _163 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _195 = _163 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _197 = _163 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _199 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[2].x, _191);
    float _201 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[3].x, _193);
    float _203 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[4].x, _195);
    float _205 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[5].x, _197);
    float _207 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[2].z, _199);
    float _209 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[3].z, _201);
    float _211 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[4].z, _203);
    float _213 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[5].z, _205);
    float _215 = _207 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _217 = _209 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _219 = _211 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    int _221 = as_type<int>(_211);
    bool _223 = _181;
    if (_171)
    {
        int _225 = ~_177;
        int _227 = _225 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _229 = _227 != 0;
        _167 = _229 ? (-1) : 0;
    }
    int _231 = _167;
    float _233 = _213 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    if (!_185)
    {
        _221 = -1082130432;
    }
    int _235 = _221;
    float _237 = _92 * _189;
    if (_171)
    {
        int _239 = ~_231;
        _223 = _239 != 0;
    }
    bool _241 = _223;
    float _243 = _88 * _189;
    float _245 = _96 * _189;
    out.gl_Position.x = _215;
    out.gl_Position.y = _217;
    out.gl_Position.z = _219;
    out.gl_Position.w = _233;
    if (!_185)
    {
        float _630 = as_type<float>(_235);
        out.gl_Position.w = _630;
    }
    out.m_33.x = _237;
    out.m_33.y = _243;
    out.m_33.z = _245;
    if (!_241)
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
    float _66 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _68 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _70 = _53 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _72 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _66);
    int _74 = as_type<int>(_47);
    bool _76 = _64;
    if (!_64)
    {
        float _78 = as_type<float>(in.m_23.y);
        _74 = as_type<int>(_78);
    }
    int _80 = _74;
    bool _82 = false;
    if (_64)
    {
        _82 = false;
    }
    bool _84 = _82;
    float _86 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _68);
    float _88 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _72);
    float _90 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].x, _70);
    float _92 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _86);
    float _94 = _88 * _88;
    float _96 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[8].z, _90);
    float _98 = fma(_92, _92, _94);
    int _100 = 0;
    bool _102 = _84;
    if (!_64)
    {
        int _104 = ~_80;
        int _106 = _104 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _108 = _106 != 0;
        _100 = _108 ? (-1) : 0;
    }
    int _110 = _100;
    uint _113 = uint(int(uint(as_type<int>(_49)) >> uint(5)));
    int _115 = int(_113) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _117 = _110;
    if (!_64)
    {
        int _119 = ~_110;
        _102 = _119 != 0;
    }
    bool _121 = _102;
    int _123 = _115 << 4;
    int _125 = _123 + 224;
    int _127 = as_type<int>(_49) & 31;
    bool _129 = uint(_127) < 32u;
    int _131 = 1 << _127;
    int _133 = _129 ? _131 : 0;
    uint _135 = uint(int(uint(_125) >> uint(2)));
    uint _137 = uint(int(uint(int(_135)) >> uint(2)));
    int _139 = int(_135) & 3;
    float _141 = (*spvDescriptorSet0.vp_c3)._m0[int(_137)][_139];
    int _143 = _115;
    if (_121)
    {
        float _145 = as_type<float>(in.m_23.z);
        _143 = as_type<int>(_145);
    }
    int _147 = _143;
    if (!_121)
    {
        _76 = false;
    }
    bool _149 = _76;
    bool _151 = _149;
    if (_121)
    {
        int _153 = ~_147;
        int _155 = _153 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _157 = _155 != 0;
        _117 = _157 ? (-1) : 0;
    }
    int _159 = _117;
    float _161 = in.m_30.x;
    float _163 = in.m_30.y;
    float _165 = in.m_30.z;
    int _167 = _159;
    if (_121)
    {
        int _169 = ~_159;
        _151 = _169 != 0;
    }
    bool _171 = _151;
    int _173 = 0;
    if (_171)
    {
        float _175 = as_type<float>(in.m_23.w);
        _173 = as_type<int>(_175);
    }
    int _177 = _173;
    bool _179 = false;
    if (!_171)
    {
        _179 = false;
    }
    bool _181 = _179;
    int _183 = _133 & as_type<int>(_141);
    bool _185 = _183 != 0;
    float _187 = fma(_96, _96, _98);
    float _189 = rsqrt(_187);
    float _191 = _163 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _193 = _163 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _195 = _163 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _197 = _163 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _199 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[2].x, _191);
    float _201 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[3].x, _193);
    float _203 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[4].x, _195);
    float _205 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[5].x, _197);
    float _207 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[2].z, _199);
    float _209 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[3].z, _201);
    float _211 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[4].z, _203);
    float _213 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[5].z, _205);
    float _215 = _207 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _217 = _209 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _219 = _211 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    int _221 = as_type<int>(_211);
    bool _223 = _181;
    if (_171)
    {
        int _225 = ~_177;
        int _227 = _225 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _229 = _227 != 0;
        _167 = _229 ? (-1) : 0;
    }
    int _231 = _167;
    float _233 = _213 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    if (!_185)
    {
        _221 = -1082130432;
    }
    int _235 = _221;
    float _237 = _92 * _189;
    if (_171)
    {
        int _239 = ~_231;
        _223 = _239 != 0;
    }
    bool _241 = _223;
    float _243 = _88 * _189;
    float _245 = _96 * _189;
    out.gl_Position.x = _215;
    out.gl_Position.y = _217;
    out.gl_Position.z = _219;
    out.gl_Position.w = _233;
    if (!_185)
    {
        float _630 = as_type<float>(_235);
        out.gl_Position.w = _630;
    }
    out.m_33.x = _237;
    out.m_33.y = _243;
    out.m_33.z = _245;
    if (!_241)
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
    float _66 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _68 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _70 = _53 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _72 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _66);
    int _74 = as_type<int>(_47);
    bool _76 = _64;
    if (!_64)
    {
        float _78 = as_type<float>(in.m_23.y);
        _74 = as_type<int>(_78);
    }
    int _80 = _74;
    bool _82 = false;
    if (_64)
    {
        _82 = false;
    }
    bool _84 = _82;
    float _86 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _68);
    float _88 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _72);
    float _90 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].x, _70);
    float _92 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _86);
    float _94 = _88 * _88;
    float _96 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[8].z, _90);
    float _98 = fma(_92, _92, _94);
    int _100 = 0;
    bool _102 = _84;
    if (!_64)
    {
        int _104 = ~_80;
        int _106 = _104 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _108 = _106 != 0;
        _100 = _108 ? (-1) : 0;
    }
    int _110 = _100;
    uint _113 = uint(int(uint(as_type<int>(_49)) >> uint(5)));
    int _115 = int(_113) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _117 = _110;
    if (!_64)
    {
        int _119 = ~_110;
        _102 = _119 != 0;
    }
    bool _121 = _102;
    int _123 = _115 << 4;
    int _125 = _123 + 224;
    int _127 = as_type<int>(_49) & 31;
    bool _129 = uint(_127) < 32u;
    int _131 = 1 << _127;
    int _133 = _129 ? _131 : 0;
    uint _135 = uint(int(uint(_125) >> uint(2)));
    uint _137 = uint(int(uint(int(_135)) >> uint(2)));
    int _139 = int(_135) & 3;
    float _141 = (*spvDescriptorSet0.vp_c3)._m0[int(_137)][_139];
    int _143 = _115;
    if (_121)
    {
        float _145 = as_type<float>(in.m_23.z);
        _143 = as_type<int>(_145);
    }
    int _147 = _143;
    if (!_121)
    {
        _76 = false;
    }
    bool _149 = _76;
    bool _151 = _149;
    if (_121)
    {
        int _153 = ~_147;
        int _155 = _153 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _157 = _155 != 0;
        _117 = _157 ? (-1) : 0;
    }
    int _159 = _117;
    float _161 = in.m_30.x;
    float _163 = in.m_30.y;
    float _165 = in.m_30.z;
    int _167 = _159;
    if (_121)
    {
        int _169 = ~_159;
        _151 = _169 != 0;
    }
    bool _171 = _151;
    int _173 = 0;
    if (_171)
    {
        float _175 = as_type<float>(in.m_23.w);
        _173 = as_type<int>(_175);
    }
    int _177 = _173;
    bool _179 = false;
    if (!_171)
    {
        _179 = false;
    }
    bool _181 = _179;
    int _183 = _133 & as_type<int>(_141);
    bool _185 = _183 != 0;
    float _187 = fma(_96, _96, _98);
    float _189 = rsqrt(_187);
    float _191 = _163 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _193 = _163 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _195 = _163 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _197 = _163 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _199 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[2].x, _191);
    float _201 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[3].x, _193);
    float _203 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[4].x, _195);
    float _205 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[5].x, _197);
    float _207 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[2].z, _199);
    float _209 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[3].z, _201);
    float _211 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[4].z, _203);
    float _213 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[5].z, _205);
    float _215 = _207 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _217 = _209 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _219 = _211 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    int _221 = as_type<int>(_211);
    bool _223 = _181;
    if (_171)
    {
        int _225 = ~_177;
        int _227 = _225 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _229 = _227 != 0;
        _167 = _229 ? (-1) : 0;
    }
    int _231 = _167;
    float _233 = _213 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    if (!_185)
    {
        _221 = -1082130432;
    }
    int _235 = _221;
    float _237 = _92 * _189;
    if (_171)
    {
        int _239 = ~_231;
        _223 = _239 != 0;
    }
    bool _241 = _223;
    float _243 = _88 * _189;
    float _245 = _96 * _189;
    out.gl_Position.x = _215;
    out.gl_Position.y = _217;
    out.gl_Position.z = _219;
    out.gl_Position.w = _233;
    if (!_185)
    {
        float _630 = as_type<float>(_235);
        out.gl_Position.w = _630;
    }
    out.m_33.x = _237;
    out.m_33.y = _243;
    out.m_33.z = _245;
    if (!_241)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

