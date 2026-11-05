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
    int _50 = as_type<int>(_45) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _54 = _50 != 0;
    int _56 = as_type<int>(_45);
    bool _58 = _54;
    if (!_54)
    {
        float _60 = as_type<float>(in.m_23.y);
        _56 = as_type<int>(_60);
    }
    int _62 = _56;
    bool _64 = false;
    if (_54)
    {
        _64 = false;
    }
    bool _66 = _64;
    int _68 = 0;
    bool _70 = _66;
    if (!_54)
    {
        int _72 = _62 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _74 = _72 != 0;
        _68 = _74 ? (-1) : 0;
    }
    int _76 = _68;
    int _78 = as_type<int>(_47) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _80 = _76;
    if (!_54)
    {
        int _82 = ~_76;
        _70 = _82 != 0;
    }
    bool _84 = _70;
    int _86 = _78 << 4;
    int _88 = _86 + 208;
    uint _91 = uint(int(uint(as_type<int>(_47)) >> uint(5)));
    int _93 = int(_91) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _95 = uint(int(uint(_88) >> uint(2)));
    uint _97 = uint(int(uint(int(_95)) >> uint(2)));
    int _99 = int(_95) & 3;
    float _101 = (*spvDescriptorSet0.vp_c3)._m0[int(_97)][_99];
    int _103 = as_type<int>(_47) & 31;
    bool _105 = uint(_103) < 32u;
    int _107 = 1 << _103;
    int _109 = _105 ? _107 : 0;
    int _111 = _93 << 4;
    int _113 = _111 + 208;
    int _115 = 0;
    if (_84)
    {
        float _117 = as_type<float>(in.m_23.z);
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    uint _121 = uint(int(uint(_88) >> uint(2)));
    uint _123 = uint(int(uint(int(_121)) >> uint(2)));
    int _125 = int(_121) & 3;
    float _127 = (*spvDescriptorSet0.vp_c3)._m0[int(_123)][_125];
    int _129 = _88 & 3;
    int _131 = _129 << 3;
    uint _133 = uint(int(uint(as_type<int>(_127)) >> uint(_131)));
    int _135 = int(_133) & 255;
    if (!_84)
    {
        _58 = false;
    }
    bool _137 = _58;
    uint _139 = uint(int(uint(_113) >> uint(2)));
    uint _141 = uint(int(uint(int(_139)) >> uint(2)));
    int _143 = int(_139) & 3;
    float _145 = (*spvDescriptorSet0.vp_c3)._m0[int(_141)][_143];
    bool _147 = _137;
    if (_84)
    {
        int _149 = _119 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _151 = _149 != 0;
        _80 = _151 ? (-1) : 0;
    }
    int _153 = _80;
    float _155 = in.m_28.x;
    float _157 = in.m_28.y;
    float _159 = in.m_28.z;
    int _161 = _153;
    if (_84)
    {
        int _163 = ~_153;
        _147 = _163 != 0;
    }
    bool _165 = _147;
    int _167 = 0;
    if (_165)
    {
        float _169 = as_type<float>(in.m_23.w);
        _167 = as_type<int>(_169);
    }
    int _171 = _167;
    uint _173 = extract_bits(as_type<uint>(_101), 24u, 8u);
    float _175 = float(_173);
    bool _177 = false;
    if (!_165)
    {
        _177 = false;
    }
    bool _179 = _177;
    uint _181 = extract_bits(as_type<uint>(_101), 16u, 8u);
    float _183 = float(_181);
    float _185 = _157 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _187 = _157 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _189 = _157 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _191 = _157 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _193 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[1].x, _185);
    float _195 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[2].x, _187);
    int _197 = _109 & as_type<int>(_145);
    bool _199 = _197 != 0;
    uint _201 = extract_bits(uint(_135), 0u, 8u);
    float _203 = float(_201);
    float _205 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[3].x, _189);
    float _207 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[4].x, _191);
    float _209 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[1].z, _193);
    float _211 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[2].z, _195);
    float _213 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[3].z, _205);
    float _215 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[4].z, _207);
    bool _217 = _179;
    if (_165)
    {
        int _219 = _171 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _221 = _219 != 0;
        _161 = _221 ? (-1) : 0;
    }
    int _223 = _161;
    uint _225 = extract_bits(as_type<uint>(_101), 8u, 8u);
    float _227 = float(_225);
    float _229 = _209 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _231 = _211 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    if (_165)
    {
        int _233 = ~_223;
        _217 = _233 != 0;
    }
    bool _235 = _217;
    float _237 = _213 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _239 = _215 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _241 = _175 * 0.0039215688593685626983642578125;
    float _243 = _183 * 0.0039215688593685626983642578125;
    float _245 = _203 * 0.0039215688593685626983642578125;
    int _247 = as_type<int>(_183);
    if (!_199)
    {
        _247 = -1082130432;
    }
    int _249 = _247;
    out.gl_Position.x = _229;
    out.gl_Position.y = _231;
    out.gl_Position.z = _237;
    out.gl_Position.w = _239;
    if (!_199)
    {
        float _638 = as_type<float>(_249);
        out.gl_Position.w = _638;
    }
    float _251 = _227 * 0.0039215688593685626983642578125;
    out.m_31.x = _241;
    out.m_31.y = _243;
    out.m_31.z = _251;
    out.m_31.w = _245;
    if (!_235)
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
    int _50 = as_type<int>(_45) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _54 = _50 != 0;
    int _56 = as_type<int>(_45);
    bool _58 = _54;
    if (!_54)
    {
        float _60 = as_type<float>(in.m_23.y);
        _56 = as_type<int>(_60);
    }
    int _62 = _56;
    bool _64 = false;
    if (_54)
    {
        _64 = false;
    }
    bool _66 = _64;
    int _68 = 0;
    bool _70 = _66;
    if (!_54)
    {
        int _72 = _62 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _74 = _72 != 0;
        _68 = _74 ? (-1) : 0;
    }
    int _76 = _68;
    int _78 = as_type<int>(_47) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _80 = _76;
    if (!_54)
    {
        int _82 = ~_76;
        _70 = _82 != 0;
    }
    bool _84 = _70;
    int _86 = _78 << 4;
    int _88 = _86 + 208;
    uint _91 = uint(int(uint(as_type<int>(_47)) >> uint(5)));
    int _93 = int(_91) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _95 = uint(int(uint(_88) >> uint(2)));
    uint _97 = uint(int(uint(int(_95)) >> uint(2)));
    int _99 = int(_95) & 3;
    float _101 = (*spvDescriptorSet0.vp_c3)._m0[int(_97)][_99];
    int _103 = as_type<int>(_47) & 31;
    bool _105 = uint(_103) < 32u;
    int _107 = 1 << _103;
    int _109 = _105 ? _107 : 0;
    int _111 = _93 << 4;
    int _113 = _111 + 208;
    int _115 = 0;
    if (_84)
    {
        float _117 = as_type<float>(in.m_23.z);
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    uint _121 = uint(int(uint(_88) >> uint(2)));
    uint _123 = uint(int(uint(int(_121)) >> uint(2)));
    int _125 = int(_121) & 3;
    float _127 = (*spvDescriptorSet0.vp_c3)._m0[int(_123)][_125];
    int _129 = _88 & 3;
    int _131 = _129 << 3;
    uint _133 = uint(int(uint(as_type<int>(_127)) >> uint(_131)));
    int _135 = int(_133) & 255;
    if (!_84)
    {
        _58 = false;
    }
    bool _137 = _58;
    uint _139 = uint(int(uint(_113) >> uint(2)));
    uint _141 = uint(int(uint(int(_139)) >> uint(2)));
    int _143 = int(_139) & 3;
    float _145 = (*spvDescriptorSet0.vp_c3)._m0[int(_141)][_143];
    bool _147 = _137;
    if (_84)
    {
        int _149 = _119 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _151 = _149 != 0;
        _80 = _151 ? (-1) : 0;
    }
    int _153 = _80;
    float _155 = in.m_28.x;
    float _157 = in.m_28.y;
    float _159 = in.m_28.z;
    int _161 = _153;
    if (_84)
    {
        int _163 = ~_153;
        _147 = _163 != 0;
    }
    bool _165 = _147;
    int _167 = 0;
    if (_165)
    {
        float _169 = as_type<float>(in.m_23.w);
        _167 = as_type<int>(_169);
    }
    int _171 = _167;
    uint _173 = extract_bits(as_type<uint>(_101), 24u, 8u);
    float _175 = float(_173);
    bool _177 = false;
    if (!_165)
    {
        _177 = false;
    }
    bool _179 = _177;
    uint _181 = extract_bits(as_type<uint>(_101), 16u, 8u);
    float _183 = float(_181);
    float _185 = _157 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _187 = _157 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _189 = _157 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _191 = _157 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _193 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[1].x, _185);
    float _195 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[2].x, _187);
    int _197 = _109 & as_type<int>(_145);
    bool _199 = _197 != 0;
    uint _201 = extract_bits(uint(_135), 0u, 8u);
    float _203 = float(_201);
    float _205 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[3].x, _189);
    float _207 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[4].x, _191);
    float _209 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[1].z, _193);
    float _211 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[2].z, _195);
    float _213 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[3].z, _205);
    float _215 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[4].z, _207);
    bool _217 = _179;
    if (_165)
    {
        int _219 = _171 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _221 = _219 != 0;
        _161 = _221 ? (-1) : 0;
    }
    int _223 = _161;
    uint _225 = extract_bits(as_type<uint>(_101), 8u, 8u);
    float _227 = float(_225);
    float _229 = _209 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _231 = _211 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    if (_165)
    {
        int _233 = ~_223;
        _217 = _233 != 0;
    }
    bool _235 = _217;
    float _237 = _213 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _239 = _215 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _241 = _175 * 0.0039215688593685626983642578125;
    float _243 = _183 * 0.0039215688593685626983642578125;
    float _245 = _203 * 0.0039215688593685626983642578125;
    int _247 = as_type<int>(_183);
    if (!_199)
    {
        _247 = -1082130432;
    }
    int _249 = _247;
    out.gl_Position.x = _229;
    out.gl_Position.y = _231;
    out.gl_Position.z = _237;
    out.gl_Position.w = _239;
    if (!_199)
    {
        float _638 = as_type<float>(_249);
        out.gl_Position.w = _638;
    }
    float _251 = _227 * 0.0039215688593685626983642578125;
    out.m_31.x = _241;
    out.m_31.y = _243;
    out.m_31.z = _251;
    out.m_31.w = _245;
    if (!_235)
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
    int _50 = as_type<int>(_45) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _54 = _50 != 0;
    int _56 = as_type<int>(_45);
    bool _58 = _54;
    if (!_54)
    {
        float _60 = as_type<float>(in.m_23.y);
        _56 = as_type<int>(_60);
    }
    int _62 = _56;
    bool _64 = false;
    if (_54)
    {
        _64 = false;
    }
    bool _66 = _64;
    int _68 = 0;
    bool _70 = _66;
    if (!_54)
    {
        int _72 = _62 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _74 = _72 != 0;
        _68 = _74 ? (-1) : 0;
    }
    int _76 = _68;
    int _78 = as_type<int>(_47) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _80 = _76;
    if (!_54)
    {
        int _82 = ~_76;
        _70 = _82 != 0;
    }
    bool _84 = _70;
    int _86 = _78 << 4;
    int _88 = _86 + 208;
    uint _91 = uint(int(uint(as_type<int>(_47)) >> uint(5)));
    int _93 = int(_91) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _95 = uint(int(uint(_88) >> uint(2)));
    uint _97 = uint(int(uint(int(_95)) >> uint(2)));
    int _99 = int(_95) & 3;
    float _101 = (*spvDescriptorSet0.vp_c3)._m0[int(_97)][_99];
    int _103 = as_type<int>(_47) & 31;
    bool _105 = uint(_103) < 32u;
    int _107 = 1 << _103;
    int _109 = _105 ? _107 : 0;
    int _111 = _93 << 4;
    int _113 = _111 + 208;
    int _115 = 0;
    if (_84)
    {
        float _117 = as_type<float>(in.m_23.z);
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    uint _121 = uint(int(uint(_88) >> uint(2)));
    uint _123 = uint(int(uint(int(_121)) >> uint(2)));
    int _125 = int(_121) & 3;
    float _127 = (*spvDescriptorSet0.vp_c3)._m0[int(_123)][_125];
    int _129 = _88 & 3;
    int _131 = _129 << 3;
    uint _133 = uint(int(uint(as_type<int>(_127)) >> uint(_131)));
    int _135 = int(_133) & 255;
    if (!_84)
    {
        _58 = false;
    }
    bool _137 = _58;
    uint _139 = uint(int(uint(_113) >> uint(2)));
    uint _141 = uint(int(uint(int(_139)) >> uint(2)));
    int _143 = int(_139) & 3;
    float _145 = (*spvDescriptorSet0.vp_c3)._m0[int(_141)][_143];
    bool _147 = _137;
    if (_84)
    {
        int _149 = _119 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _151 = _149 != 0;
        _80 = _151 ? (-1) : 0;
    }
    int _153 = _80;
    float _155 = in.m_28.x;
    float _157 = in.m_28.y;
    float _159 = in.m_28.z;
    int _161 = _153;
    if (_84)
    {
        int _163 = ~_153;
        _147 = _163 != 0;
    }
    bool _165 = _147;
    int _167 = 0;
    if (_165)
    {
        float _169 = as_type<float>(in.m_23.w);
        _167 = as_type<int>(_169);
    }
    int _171 = _167;
    uint _173 = extract_bits(as_type<uint>(_101), 24u, 8u);
    float _175 = float(_173);
    bool _177 = false;
    if (!_165)
    {
        _177 = false;
    }
    bool _179 = _177;
    uint _181 = extract_bits(as_type<uint>(_101), 16u, 8u);
    float _183 = float(_181);
    float _185 = _157 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _187 = _157 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _189 = _157 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _191 = _157 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _193 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[1].x, _185);
    float _195 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[2].x, _187);
    int _197 = _109 & as_type<int>(_145);
    bool _199 = _197 != 0;
    uint _201 = extract_bits(uint(_135), 0u, 8u);
    float _203 = float(_201);
    float _205 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[3].x, _189);
    float _207 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[4].x, _191);
    float _209 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[1].z, _193);
    float _211 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[2].z, _195);
    float _213 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[3].z, _205);
    float _215 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[4].z, _207);
    bool _217 = _179;
    if (_165)
    {
        int _219 = _171 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _221 = _219 != 0;
        _161 = _221 ? (-1) : 0;
    }
    int _223 = _161;
    uint _225 = extract_bits(as_type<uint>(_101), 8u, 8u);
    float _227 = float(_225);
    float _229 = _209 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _231 = _211 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    if (_165)
    {
        int _233 = ~_223;
        _217 = _233 != 0;
    }
    bool _235 = _217;
    float _237 = _213 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _239 = _215 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _241 = _175 * 0.0039215688593685626983642578125;
    float _243 = _183 * 0.0039215688593685626983642578125;
    float _245 = _203 * 0.0039215688593685626983642578125;
    int _247 = as_type<int>(_183);
    if (!_199)
    {
        _247 = -1082130432;
    }
    int _249 = _247;
    out.gl_Position.x = _229;
    out.gl_Position.y = _231;
    out.gl_Position.z = _237;
    out.gl_Position.w = _239;
    if (!_199)
    {
        float _638 = as_type<float>(_249);
        out.gl_Position.w = _638;
    }
    float _251 = _227 * 0.0039215688593685626983642578125;
    out.m_31.x = _241;
    out.m_31.y = _243;
    out.m_31.z = _251;
    out.m_31.w = _245;
    if (!_235)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

