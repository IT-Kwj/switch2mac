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
    uint4 m_28 [[attribute(2)]];
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
    float _51 = in.m_26.x;
    float _53 = in.m_26.y;
    float _55 = in.m_26.z;
    int _58 = as_type<int>(_49) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _62 = _58 != 0;
    float _64 = as_type<float>(in.m_28.x);
    float _66 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _68 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _70 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _72 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _66);
    float _74 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _68);
    float _76 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _70);
    float _78 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _72);
    int _80 = 0;
    bool _82 = _62;
    if (!_62)
    {
        float _84 = as_type<float>(in.m_23.y);
        _80 = as_type<int>(_84);
    }
    int _86 = _80;
    bool _88 = false;
    if (_62)
    {
        _88 = false;
    }
    bool _90 = _88;
    float _92 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].z, _74);
    float _94 = _78 * _78;
    float _96 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _76);
    int _98 = as_type<int>(_64) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _100 = _98 << 4;
    int _102 = _100 + 208;
    uint _105 = uint(int(uint(_102) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.vp_c3)._m0[int(_107)][_109];
    int _113 = _102 & 3;
    int _115 = _113 << 3;
    uint _117 = uint(int(uint(as_type<int>(_111)) >> uint(_115)));
    int _119 = int(_117) & 255;
    int _121 = 0;
    bool _123 = _90;
    if (!_62)
    {
        int _125 = _86 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _127 = _125 != 0;
        _121 = _127 ? (-1) : 0;
    }
    int _129 = _121;
    int _131 = _129;
    if (!_62)
    {
        int _133 = ~_129;
        _123 = _133 != 0;
    }
    bool _135 = _123;
    uint _137 = uint(int(uint(_102) >> uint(2)));
    uint _139 = uint(int(uint(int(_137)) >> uint(2)));
    int _141 = int(_137) & 3;
    float _143 = (*spvDescriptorSet0.vp_c3)._m0[int(_139)][_141];
    float _145 = fma(_92, _92, _94);
    int _147 = _98;
    int _149 = _135 ? (-1) : 0;
    if (_135)
    {
        float _151 = as_type<float>(in.m_23.z);
        _147 = as_type<int>(_151);
    }
    int _153 = _147;
    if (!_135)
    {
        _82 = false;
    }
    bool _155 = _82;
    float _157 = fma(_96, _96, _145);
    float _159 = rsqrt(_157);
    float _161 = _92 * _159;
    float _163 = _96 * _159;
    bool _165 = _155;
    if (_135)
    {
        int _167 = _153 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _169 = _167 != 0;
        _131 = _169 ? (-1) : 0;
    }
    int _171 = _131;
    float _173 = in.m_30.x;
    float _175 = in.m_30.y;
    float _177 = in.m_30.z;
    bool _179 = _171 != 0;
    if (_135)
    {
        int _181 = ~_171;
        _165 = _181 != 0;
    }
    bool _183 = _165;
    uint _185 = extract_bits(uint(_119), 0u, 8u);
    float _187 = float(_185);
    uint _189 = extract_bits(as_type<uint>(_143), 24u, 8u);
    float _191 = float(_189);
    int _193 = 0;
    if (_183)
    {
        float _195 = as_type<float>(in.m_23.w);
        _193 = as_type<int>(_195);
    }
    int _197 = _193;
    if (!_183)
    {
        _179 = false;
    }
    bool _199 = _179;
    uint _201 = extract_bits(as_type<uint>(_143), 16u, 8u);
    float _203 = float(_201);
    float _205 = _187 * 0.0039215688593685626983642578125;
    float _207 = _175 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _209 = _175 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _211 = _175 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    uint _213 = extract_bits(as_type<uint>(_143), 8u, 8u);
    float _215 = float(_213);
    float _217 = _175 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _219 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[1].x, _207);
    float _221 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[2].x, _209);
    float _223 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[3].x, _211);
    float _225 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[4].x, _217);
    float _227 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[1].z, _219);
    float _229 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[2].z, _221);
    float _231 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[3].z, _223);
    float _233 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[4].z, _225);
    float _235 = _227 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _237 = _229 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    bool _239 = _199;
    if (_183)
    {
        int _241 = _197 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _243 = _241 != 0;
        _149 = _243 ? (-1) : 0;
    }
    int _245 = _149;
    float _247 = _231 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _249 = _233 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _251 = _191 * 0.0039215688593685626983642578125;
    if (_183)
    {
        int _253 = ~_245;
        _239 = _253 != 0;
    }
    bool _255 = _239;
    float _257 = _203 * 0.0039215688593685626983642578125;
    float _259 = _215 * 0.0039215688593685626983642578125;
    float _261 = _78 * _159;
    out.gl_Position.x = _235;
    out.gl_Position.y = _237;
    out.gl_Position.z = _247;
    out.gl_Position.w = _249;
    out.m_33.x = _251;
    out.m_33.y = _257;
    out.m_33.z = _259;
    out.m_33.w = _205;
    out.m_35.x = _161;
    out.m_35.y = _261;
    out.m_35.z = _163;
    if (!_255)
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
    int _58 = as_type<int>(_49) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _62 = _58 != 0;
    float _64 = as_type<float>(in.m_28.x);
    float _66 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _68 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _70 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _72 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _66);
    float _74 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _68);
    float _76 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _70);
    float _78 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _72);
    int _80 = 0;
    bool _82 = _62;
    if (!_62)
    {
        float _84 = as_type<float>(in.m_23.y);
        _80 = as_type<int>(_84);
    }
    int _86 = _80;
    bool _88 = false;
    if (_62)
    {
        _88 = false;
    }
    bool _90 = _88;
    float _92 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].z, _74);
    float _94 = _78 * _78;
    float _96 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _76);
    int _98 = as_type<int>(_64) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _100 = _98 << 4;
    int _102 = _100 + 208;
    uint _105 = uint(int(uint(_102) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.vp_c3)._m0[int(_107)][_109];
    int _113 = _102 & 3;
    int _115 = _113 << 3;
    uint _117 = uint(int(uint(as_type<int>(_111)) >> uint(_115)));
    int _119 = int(_117) & 255;
    int _121 = 0;
    bool _123 = _90;
    if (!_62)
    {
        int _125 = _86 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _127 = _125 != 0;
        _121 = _127 ? (-1) : 0;
    }
    int _129 = _121;
    int _131 = _129;
    if (!_62)
    {
        int _133 = ~_129;
        _123 = _133 != 0;
    }
    bool _135 = _123;
    uint _137 = uint(int(uint(_102) >> uint(2)));
    uint _139 = uint(int(uint(int(_137)) >> uint(2)));
    int _141 = int(_137) & 3;
    float _143 = (*spvDescriptorSet0.vp_c3)._m0[int(_139)][_141];
    float _145 = fma(_92, _92, _94);
    int _147 = _98;
    int _149 = _135 ? (-1) : 0;
    if (_135)
    {
        float _151 = as_type<float>(in.m_23.z);
        _147 = as_type<int>(_151);
    }
    int _153 = _147;
    if (!_135)
    {
        _82 = false;
    }
    bool _155 = _82;
    float _157 = fma(_96, _96, _145);
    float _159 = rsqrt(_157);
    float _161 = _92 * _159;
    float _163 = _96 * _159;
    bool _165 = _155;
    if (_135)
    {
        int _167 = _153 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _169 = _167 != 0;
        _131 = _169 ? (-1) : 0;
    }
    int _171 = _131;
    float _173 = in.m_30.x;
    float _175 = in.m_30.y;
    float _177 = in.m_30.z;
    bool _179 = _171 != 0;
    if (_135)
    {
        int _181 = ~_171;
        _165 = _181 != 0;
    }
    bool _183 = _165;
    uint _185 = extract_bits(uint(_119), 0u, 8u);
    float _187 = float(_185);
    uint _189 = extract_bits(as_type<uint>(_143), 24u, 8u);
    float _191 = float(_189);
    int _193 = 0;
    if (_183)
    {
        float _195 = as_type<float>(in.m_23.w);
        _193 = as_type<int>(_195);
    }
    int _197 = _193;
    if (!_183)
    {
        _179 = false;
    }
    bool _199 = _179;
    uint _201 = extract_bits(as_type<uint>(_143), 16u, 8u);
    float _203 = float(_201);
    float _205 = _187 * 0.0039215688593685626983642578125;
    float _207 = _175 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _209 = _175 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _211 = _175 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    uint _213 = extract_bits(as_type<uint>(_143), 8u, 8u);
    float _215 = float(_213);
    float _217 = _175 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _219 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[1].x, _207);
    float _221 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[2].x, _209);
    float _223 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[3].x, _211);
    float _225 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[4].x, _217);
    float _227 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[1].z, _219);
    float _229 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[2].z, _221);
    float _231 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[3].z, _223);
    float _233 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[4].z, _225);
    float _235 = _227 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _237 = _229 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    bool _239 = _199;
    if (_183)
    {
        int _241 = _197 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _243 = _241 != 0;
        _149 = _243 ? (-1) : 0;
    }
    int _245 = _149;
    float _247 = _231 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _249 = _233 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _251 = _191 * 0.0039215688593685626983642578125;
    if (_183)
    {
        int _253 = ~_245;
        _239 = _253 != 0;
    }
    bool _255 = _239;
    float _257 = _203 * 0.0039215688593685626983642578125;
    float _259 = _215 * 0.0039215688593685626983642578125;
    float _261 = _78 * _159;
    out.gl_Position.x = _235;
    out.gl_Position.y = _237;
    out.gl_Position.z = _247;
    out.gl_Position.w = _249;
    out.m_33.x = _251;
    out.m_33.y = _257;
    out.m_33.z = _259;
    out.m_33.w = _205;
    out.m_35.x = _161;
    out.m_35.y = _261;
    out.m_35.z = _163;
    if (!_255)
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
    int _58 = as_type<int>(_49) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _62 = _58 != 0;
    float _64 = as_type<float>(in.m_28.x);
    float _66 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _68 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _70 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _72 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _66);
    float _74 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _68);
    float _76 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _70);
    float _78 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _72);
    int _80 = 0;
    bool _82 = _62;
    if (!_62)
    {
        float _84 = as_type<float>(in.m_23.y);
        _80 = as_type<int>(_84);
    }
    int _86 = _80;
    bool _88 = false;
    if (_62)
    {
        _88 = false;
    }
    bool _90 = _88;
    float _92 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].z, _74);
    float _94 = _78 * _78;
    float _96 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _76);
    int _98 = as_type<int>(_64) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _100 = _98 << 4;
    int _102 = _100 + 208;
    uint _105 = uint(int(uint(_102) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.vp_c3)._m0[int(_107)][_109];
    int _113 = _102 & 3;
    int _115 = _113 << 3;
    uint _117 = uint(int(uint(as_type<int>(_111)) >> uint(_115)));
    int _119 = int(_117) & 255;
    int _121 = 0;
    bool _123 = _90;
    if (!_62)
    {
        int _125 = _86 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _127 = _125 != 0;
        _121 = _127 ? (-1) : 0;
    }
    int _129 = _121;
    int _131 = _129;
    if (!_62)
    {
        int _133 = ~_129;
        _123 = _133 != 0;
    }
    bool _135 = _123;
    uint _137 = uint(int(uint(_102) >> uint(2)));
    uint _139 = uint(int(uint(int(_137)) >> uint(2)));
    int _141 = int(_137) & 3;
    float _143 = (*spvDescriptorSet0.vp_c3)._m0[int(_139)][_141];
    float _145 = fma(_92, _92, _94);
    int _147 = _98;
    int _149 = _135 ? (-1) : 0;
    if (_135)
    {
        float _151 = as_type<float>(in.m_23.z);
        _147 = as_type<int>(_151);
    }
    int _153 = _147;
    if (!_135)
    {
        _82 = false;
    }
    bool _155 = _82;
    float _157 = fma(_96, _96, _145);
    float _159 = rsqrt(_157);
    float _161 = _92 * _159;
    float _163 = _96 * _159;
    bool _165 = _155;
    if (_135)
    {
        int _167 = _153 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _169 = _167 != 0;
        _131 = _169 ? (-1) : 0;
    }
    int _171 = _131;
    float _173 = in.m_30.x;
    float _175 = in.m_30.y;
    float _177 = in.m_30.z;
    bool _179 = _171 != 0;
    if (_135)
    {
        int _181 = ~_171;
        _165 = _181 != 0;
    }
    bool _183 = _165;
    uint _185 = extract_bits(uint(_119), 0u, 8u);
    float _187 = float(_185);
    uint _189 = extract_bits(as_type<uint>(_143), 24u, 8u);
    float _191 = float(_189);
    int _193 = 0;
    if (_183)
    {
        float _195 = as_type<float>(in.m_23.w);
        _193 = as_type<int>(_195);
    }
    int _197 = _193;
    if (!_183)
    {
        _179 = false;
    }
    bool _199 = _179;
    uint _201 = extract_bits(as_type<uint>(_143), 16u, 8u);
    float _203 = float(_201);
    float _205 = _187 * 0.0039215688593685626983642578125;
    float _207 = _175 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _209 = _175 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _211 = _175 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    uint _213 = extract_bits(as_type<uint>(_143), 8u, 8u);
    float _215 = float(_213);
    float _217 = _175 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _219 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[1].x, _207);
    float _221 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[2].x, _209);
    float _223 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[3].x, _211);
    float _225 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[4].x, _217);
    float _227 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[1].z, _219);
    float _229 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[2].z, _221);
    float _231 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[3].z, _223);
    float _233 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[4].z, _225);
    float _235 = _227 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _237 = _229 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    bool _239 = _199;
    if (_183)
    {
        int _241 = _197 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _243 = _241 != 0;
        _149 = _243 ? (-1) : 0;
    }
    int _245 = _149;
    float _247 = _231 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _249 = _233 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _251 = _191 * 0.0039215688593685626983642578125;
    if (_183)
    {
        int _253 = ~_245;
        _239 = _253 != 0;
    }
    bool _255 = _239;
    float _257 = _203 * 0.0039215688593685626983642578125;
    float _259 = _215 * 0.0039215688593685626983642578125;
    float _261 = _78 * _159;
    out.gl_Position.x = _235;
    out.gl_Position.y = _237;
    out.gl_Position.z = _247;
    out.gl_Position.w = _249;
    out.m_33.x = _251;
    out.m_33.y = _257;
    out.m_33.z = _259;
    out.m_33.w = _205;
    out.m_35.x = _161;
    out.m_35.y = _261;
    out.m_35.z = _163;
    if (!_255)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

