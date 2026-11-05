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
    float _47 = as_type<float>(in.m_25.x);
    int _50 = ~as_type<int>(_45);
    int _52 = _50 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _56 = _52 != 0;
    int _58 = as_type<int>(_45);
    bool _60 = _56;
    if (!_56)
    {
        float _62 = as_type<float>(in.m_23.y);
        _58 = as_type<int>(_62);
    }
    int _64 = _58;
    bool _66 = false;
    if (_56)
    {
        _66 = false;
    }
    bool _68 = _66;
    int _70 = 0;
    bool _72 = _68;
    if (!_56)
    {
        int _74 = ~_64;
        int _76 = _74 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _78 = _76 != 0;
        _70 = _78 ? (-1) : 0;
    }
    int _80 = _70;
    int _82 = as_type<int>(_47) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _84 = _80;
    if (!_56)
    {
        int _86 = ~_80;
        _72 = _86 != 0;
    }
    bool _88 = _72;
    int _90 = _82 << 4;
    int _92 = _90 + 208;
    uint _95 = uint(int(uint(as_type<int>(_47)) >> uint(5)));
    int _97 = int(_95) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _99 = uint(int(uint(_92) >> uint(2)));
    uint _101 = uint(int(uint(int(_99)) >> uint(2)));
    int _103 = int(_99) & 3;
    float _105 = (*spvDescriptorSet0.vp_c3)._m0[int(_101)][_103];
    int _107 = as_type<int>(_47) & 31;
    bool _109 = uint(_107) < 32u;
    int _111 = 1 << _107;
    int _113 = _109 ? _111 : 0;
    int _115 = _97 << 4;
    int _117 = _115 + 208;
    int _119 = 0;
    if (_88)
    {
        float _121 = as_type<float>(in.m_23.z);
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    uint _125 = uint(int(uint(_92) >> uint(2)));
    uint _127 = uint(int(uint(int(_125)) >> uint(2)));
    int _129 = int(_125) & 3;
    float _131 = (*spvDescriptorSet0.vp_c3)._m0[int(_127)][_129];
    int _133 = _92 & 3;
    int _135 = _133 << 3;
    uint _137 = uint(int(uint(as_type<int>(_131)) >> uint(_135)));
    int _139 = int(_137) & 255;
    if (!_88)
    {
        _60 = false;
    }
    bool _141 = _60;
    uint _143 = uint(int(uint(_117) >> uint(2)));
    uint _145 = uint(int(uint(int(_143)) >> uint(2)));
    int _147 = int(_143) & 3;
    float _149 = (*spvDescriptorSet0.vp_c3)._m0[int(_145)][_147];
    bool _151 = _141;
    if (_88)
    {
        int _153 = ~_123;
        int _155 = _153 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _157 = _155 != 0;
        _84 = _157 ? (-1) : 0;
    }
    int _159 = _84;
    float _161 = in.m_28.x;
    float _163 = in.m_28.y;
    float _165 = in.m_28.z;
    int _167 = _159;
    if (_88)
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
    uint _179 = extract_bits(as_type<uint>(_105), 24u, 8u);
    float _181 = float(_179);
    bool _183 = false;
    if (!_171)
    {
        _183 = false;
    }
    bool _185 = _183;
    uint _187 = extract_bits(as_type<uint>(_105), 16u, 8u);
    float _189 = float(_187);
    float _191 = _163 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _193 = _163 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _195 = _163 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _197 = _163 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _199 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[1].x, _191);
    float _201 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[2].x, _193);
    int _203 = _113 & as_type<int>(_149);
    bool _205 = _203 != 0;
    uint _207 = extract_bits(uint(_139), 0u, 8u);
    float _209 = float(_207);
    float _211 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[3].x, _195);
    float _213 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[4].x, _197);
    float _215 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[1].z, _199);
    float _217 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[2].z, _201);
    float _219 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[3].z, _211);
    float _221 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[4].z, _213);
    bool _223 = _185;
    if (_171)
    {
        int _225 = ~_177;
        int _227 = _225 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _229 = _227 != 0;
        _167 = _229 ? (-1) : 0;
    }
    int _231 = _167;
    uint _233 = extract_bits(as_type<uint>(_105), 8u, 8u);
    float _235 = float(_233);
    float _237 = _215 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _239 = _217 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    if (_171)
    {
        int _241 = ~_231;
        _223 = _241 != 0;
    }
    bool _243 = _223;
    float _245 = _219 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _247 = _221 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _249 = _181 * 0.0039215688593685626983642578125;
    float _251 = _189 * 0.0039215688593685626983642578125;
    float _253 = _209 * 0.0039215688593685626983642578125;
    int _255 = as_type<int>(_189);
    if (!_205)
    {
        _255 = -1082130432;
    }
    int _257 = _255;
    out.gl_Position.x = _237;
    out.gl_Position.y = _239;
    out.gl_Position.z = _245;
    out.gl_Position.w = _247;
    if (!_205)
    {
        float _654 = as_type<float>(_257);
        out.gl_Position.w = _654;
    }
    float _259 = _235 * 0.0039215688593685626983642578125;
    out.m_31.x = _249;
    out.m_31.y = _251;
    out.m_31.z = _259;
    out.m_31.w = _253;
    if (!_243)
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
    float _47 = as_type<float>(in.m_25.x);
    int _50 = ~as_type<int>(_45);
    int _52 = _50 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _56 = _52 != 0;
    int _58 = as_type<int>(_45);
    bool _60 = _56;
    if (!_56)
    {
        float _62 = as_type<float>(in.m_23.y);
        _58 = as_type<int>(_62);
    }
    int _64 = _58;
    bool _66 = false;
    if (_56)
    {
        _66 = false;
    }
    bool _68 = _66;
    int _70 = 0;
    bool _72 = _68;
    if (!_56)
    {
        int _74 = ~_64;
        int _76 = _74 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _78 = _76 != 0;
        _70 = _78 ? (-1) : 0;
    }
    int _80 = _70;
    int _82 = as_type<int>(_47) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _84 = _80;
    if (!_56)
    {
        int _86 = ~_80;
        _72 = _86 != 0;
    }
    bool _88 = _72;
    int _90 = _82 << 4;
    int _92 = _90 + 208;
    uint _95 = uint(int(uint(as_type<int>(_47)) >> uint(5)));
    int _97 = int(_95) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _99 = uint(int(uint(_92) >> uint(2)));
    uint _101 = uint(int(uint(int(_99)) >> uint(2)));
    int _103 = int(_99) & 3;
    float _105 = (*spvDescriptorSet0.vp_c3)._m0[int(_101)][_103];
    int _107 = as_type<int>(_47) & 31;
    bool _109 = uint(_107) < 32u;
    int _111 = 1 << _107;
    int _113 = _109 ? _111 : 0;
    int _115 = _97 << 4;
    int _117 = _115 + 208;
    int _119 = 0;
    if (_88)
    {
        float _121 = as_type<float>(in.m_23.z);
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    uint _125 = uint(int(uint(_92) >> uint(2)));
    uint _127 = uint(int(uint(int(_125)) >> uint(2)));
    int _129 = int(_125) & 3;
    float _131 = (*spvDescriptorSet0.vp_c3)._m0[int(_127)][_129];
    int _133 = _92 & 3;
    int _135 = _133 << 3;
    uint _137 = uint(int(uint(as_type<int>(_131)) >> uint(_135)));
    int _139 = int(_137) & 255;
    if (!_88)
    {
        _60 = false;
    }
    bool _141 = _60;
    uint _143 = uint(int(uint(_117) >> uint(2)));
    uint _145 = uint(int(uint(int(_143)) >> uint(2)));
    int _147 = int(_143) & 3;
    float _149 = (*spvDescriptorSet0.vp_c3)._m0[int(_145)][_147];
    bool _151 = _141;
    if (_88)
    {
        int _153 = ~_123;
        int _155 = _153 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _157 = _155 != 0;
        _84 = _157 ? (-1) : 0;
    }
    int _159 = _84;
    float _161 = in.m_28.x;
    float _163 = in.m_28.y;
    float _165 = in.m_28.z;
    int _167 = _159;
    if (_88)
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
    uint _179 = extract_bits(as_type<uint>(_105), 24u, 8u);
    float _181 = float(_179);
    bool _183 = false;
    if (!_171)
    {
        _183 = false;
    }
    bool _185 = _183;
    uint _187 = extract_bits(as_type<uint>(_105), 16u, 8u);
    float _189 = float(_187);
    float _191 = _163 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _193 = _163 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _195 = _163 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _197 = _163 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _199 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[1].x, _191);
    float _201 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[2].x, _193);
    int _203 = _113 & as_type<int>(_149);
    bool _205 = _203 != 0;
    uint _207 = extract_bits(uint(_139), 0u, 8u);
    float _209 = float(_207);
    float _211 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[3].x, _195);
    float _213 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[4].x, _197);
    float _215 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[1].z, _199);
    float _217 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[2].z, _201);
    float _219 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[3].z, _211);
    float _221 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[4].z, _213);
    bool _223 = _185;
    if (_171)
    {
        int _225 = ~_177;
        int _227 = _225 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _229 = _227 != 0;
        _167 = _229 ? (-1) : 0;
    }
    int _231 = _167;
    uint _233 = extract_bits(as_type<uint>(_105), 8u, 8u);
    float _235 = float(_233);
    float _237 = _215 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _239 = _217 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    if (_171)
    {
        int _241 = ~_231;
        _223 = _241 != 0;
    }
    bool _243 = _223;
    float _245 = _219 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _247 = _221 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _249 = _181 * 0.0039215688593685626983642578125;
    float _251 = _189 * 0.0039215688593685626983642578125;
    float _253 = _209 * 0.0039215688593685626983642578125;
    int _255 = as_type<int>(_189);
    if (!_205)
    {
        _255 = -1082130432;
    }
    int _257 = _255;
    out.gl_Position.x = _237;
    out.gl_Position.y = _239;
    out.gl_Position.z = _245;
    out.gl_Position.w = _247;
    if (!_205)
    {
        float _654 = as_type<float>(_257);
        out.gl_Position.w = _654;
    }
    float _259 = _235 * 0.0039215688593685626983642578125;
    out.m_31.x = _249;
    out.m_31.y = _251;
    out.m_31.z = _259;
    out.m_31.w = _253;
    if (!_243)
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
    float _47 = as_type<float>(in.m_25.x);
    int _50 = ~as_type<int>(_45);
    int _52 = _50 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _56 = _52 != 0;
    int _58 = as_type<int>(_45);
    bool _60 = _56;
    if (!_56)
    {
        float _62 = as_type<float>(in.m_23.y);
        _58 = as_type<int>(_62);
    }
    int _64 = _58;
    bool _66 = false;
    if (_56)
    {
        _66 = false;
    }
    bool _68 = _66;
    int _70 = 0;
    bool _72 = _68;
    if (!_56)
    {
        int _74 = ~_64;
        int _76 = _74 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _78 = _76 != 0;
        _70 = _78 ? (-1) : 0;
    }
    int _80 = _70;
    int _82 = as_type<int>(_47) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _84 = _80;
    if (!_56)
    {
        int _86 = ~_80;
        _72 = _86 != 0;
    }
    bool _88 = _72;
    int _90 = _82 << 4;
    int _92 = _90 + 208;
    uint _95 = uint(int(uint(as_type<int>(_47)) >> uint(5)));
    int _97 = int(_95) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _99 = uint(int(uint(_92) >> uint(2)));
    uint _101 = uint(int(uint(int(_99)) >> uint(2)));
    int _103 = int(_99) & 3;
    float _105 = (*spvDescriptorSet0.vp_c3)._m0[int(_101)][_103];
    int _107 = as_type<int>(_47) & 31;
    bool _109 = uint(_107) < 32u;
    int _111 = 1 << _107;
    int _113 = _109 ? _111 : 0;
    int _115 = _97 << 4;
    int _117 = _115 + 208;
    int _119 = 0;
    if (_88)
    {
        float _121 = as_type<float>(in.m_23.z);
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    uint _125 = uint(int(uint(_92) >> uint(2)));
    uint _127 = uint(int(uint(int(_125)) >> uint(2)));
    int _129 = int(_125) & 3;
    float _131 = (*spvDescriptorSet0.vp_c3)._m0[int(_127)][_129];
    int _133 = _92 & 3;
    int _135 = _133 << 3;
    uint _137 = uint(int(uint(as_type<int>(_131)) >> uint(_135)));
    int _139 = int(_137) & 255;
    if (!_88)
    {
        _60 = false;
    }
    bool _141 = _60;
    uint _143 = uint(int(uint(_117) >> uint(2)));
    uint _145 = uint(int(uint(int(_143)) >> uint(2)));
    int _147 = int(_143) & 3;
    float _149 = (*spvDescriptorSet0.vp_c3)._m0[int(_145)][_147];
    bool _151 = _141;
    if (_88)
    {
        int _153 = ~_123;
        int _155 = _153 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _157 = _155 != 0;
        _84 = _157 ? (-1) : 0;
    }
    int _159 = _84;
    float _161 = in.m_28.x;
    float _163 = in.m_28.y;
    float _165 = in.m_28.z;
    int _167 = _159;
    if (_88)
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
    uint _179 = extract_bits(as_type<uint>(_105), 24u, 8u);
    float _181 = float(_179);
    bool _183 = false;
    if (!_171)
    {
        _183 = false;
    }
    bool _185 = _183;
    uint _187 = extract_bits(as_type<uint>(_105), 16u, 8u);
    float _189 = float(_187);
    float _191 = _163 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _193 = _163 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _195 = _163 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _197 = _163 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _199 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[1].x, _191);
    float _201 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[2].x, _193);
    int _203 = _113 & as_type<int>(_149);
    bool _205 = _203 != 0;
    uint _207 = extract_bits(uint(_139), 0u, 8u);
    float _209 = float(_207);
    float _211 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[3].x, _195);
    float _213 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[4].x, _197);
    float _215 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[1].z, _199);
    float _217 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[2].z, _201);
    float _219 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[3].z, _211);
    float _221 = fma(_165, (*spvDescriptorSet0.vp_c3)._m0[4].z, _213);
    bool _223 = _185;
    if (_171)
    {
        int _225 = ~_177;
        int _227 = _225 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _229 = _227 != 0;
        _167 = _229 ? (-1) : 0;
    }
    int _231 = _167;
    uint _233 = extract_bits(as_type<uint>(_105), 8u, 8u);
    float _235 = float(_233);
    float _237 = _215 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _239 = _217 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    if (_171)
    {
        int _241 = ~_231;
        _223 = _241 != 0;
    }
    bool _243 = _223;
    float _245 = _219 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _247 = _221 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _249 = _181 * 0.0039215688593685626983642578125;
    float _251 = _189 * 0.0039215688593685626983642578125;
    float _253 = _209 * 0.0039215688593685626983642578125;
    int _255 = as_type<int>(_189);
    if (!_205)
    {
        _255 = -1082130432;
    }
    int _257 = _255;
    out.gl_Position.x = _237;
    out.gl_Position.y = _239;
    out.gl_Position.z = _245;
    out.gl_Position.w = _247;
    if (!_205)
    {
        float _654 = as_type<float>(_257);
        out.gl_Position.w = _654;
    }
    float _259 = _235 * 0.0039215688593685626983642578125;
    out.m_31.x = _249;
    out.m_31.y = _251;
    out.m_31.z = _259;
    out.m_31.w = _253;
    if (!_243)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

