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
    int _58 = ~as_type<int>(_49);
    int _60 = _58 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _64 = _60 != 0;
    float _66 = as_type<float>(in.m_28.x);
    float _68 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _70 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _72 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _74 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _68);
    float _76 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _70);
    float _78 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _72);
    float _80 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _74);
    int _82 = 0;
    bool _84 = _64;
    if (!_64)
    {
        float _86 = as_type<float>(in.m_23.y);
        _82 = as_type<int>(_86);
    }
    int _88 = _82;
    bool _90 = false;
    if (_64)
    {
        _90 = false;
    }
    bool _92 = _90;
    float _94 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].z, _76);
    float _96 = _80 * _80;
    float _98 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _78);
    int _100 = as_type<int>(_66) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _102 = _100 << 4;
    int _104 = _102 + 208;
    uint _107 = uint(int(uint(_104) >> uint(2)));
    uint _109 = uint(int(uint(int(_107)) >> uint(2)));
    int _111 = int(_107) & 3;
    float _113 = (*spvDescriptorSet0.vp_c3)._m0[int(_109)][_111];
    int _115 = _104 & 3;
    int _117 = _115 << 3;
    uint _119 = uint(int(uint(as_type<int>(_113)) >> uint(_117)));
    int _121 = int(_119) & 255;
    int _123 = 0;
    bool _125 = _92;
    if (!_64)
    {
        int _127 = ~_88;
        int _129 = _127 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _131 = _129 != 0;
        _123 = _131 ? (-1) : 0;
    }
    int _133 = _123;
    int _135 = _133;
    if (!_64)
    {
        int _137 = ~_133;
        _125 = _137 != 0;
    }
    bool _139 = _125;
    uint _141 = uint(int(uint(_104) >> uint(2)));
    uint _143 = uint(int(uint(int(_141)) >> uint(2)));
    int _145 = int(_141) & 3;
    float _147 = (*spvDescriptorSet0.vp_c3)._m0[int(_143)][_145];
    float _149 = fma(_94, _94, _96);
    int _151 = _100;
    int _153 = _139 ? (-1) : 0;
    if (_139)
    {
        float _155 = as_type<float>(in.m_23.z);
        _151 = as_type<int>(_155);
    }
    int _157 = _151;
    if (!_139)
    {
        _84 = false;
    }
    bool _159 = _84;
    float _161 = fma(_98, _98, _149);
    float _163 = rsqrt(_161);
    float _165 = _94 * _163;
    float _167 = _98 * _163;
    bool _169 = _159;
    if (_139)
    {
        int _171 = ~_157;
        int _173 = _171 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _175 = _173 != 0;
        _135 = _175 ? (-1) : 0;
    }
    int _177 = _135;
    float _179 = in.m_30.x;
    float _181 = in.m_30.y;
    float _183 = in.m_30.z;
    bool _185 = _177 != 0;
    if (_139)
    {
        int _187 = ~_177;
        _169 = _187 != 0;
    }
    bool _189 = _169;
    uint _191 = extract_bits(uint(_121), 0u, 8u);
    float _193 = float(_191);
    uint _195 = extract_bits(as_type<uint>(_147), 24u, 8u);
    float _197 = float(_195);
    int _199 = 0;
    if (_189)
    {
        float _201 = as_type<float>(in.m_23.w);
        _199 = as_type<int>(_201);
    }
    int _203 = _199;
    if (!_189)
    {
        _185 = false;
    }
    bool _205 = _185;
    uint _207 = extract_bits(as_type<uint>(_147), 16u, 8u);
    float _209 = float(_207);
    float _211 = _193 * 0.0039215688593685626983642578125;
    float _213 = _181 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _215 = _181 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _217 = _181 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    uint _219 = extract_bits(as_type<uint>(_147), 8u, 8u);
    float _221 = float(_219);
    float _223 = _181 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _225 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[1].x, _213);
    float _227 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[2].x, _215);
    float _229 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[3].x, _217);
    float _231 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[4].x, _223);
    float _233 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[1].z, _225);
    float _235 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[2].z, _227);
    float _237 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[3].z, _229);
    float _239 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[4].z, _231);
    float _241 = _233 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _243 = _235 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    bool _245 = _205;
    if (_189)
    {
        int _247 = ~_203;
        int _249 = _247 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _251 = _249 != 0;
        _153 = _251 ? (-1) : 0;
    }
    int _253 = _153;
    float _255 = _237 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _257 = _239 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _259 = _197 * 0.0039215688593685626983642578125;
    if (_189)
    {
        int _261 = ~_253;
        _245 = _261 != 0;
    }
    bool _263 = _245;
    float _265 = _209 * 0.0039215688593685626983642578125;
    float _267 = _221 * 0.0039215688593685626983642578125;
    float _269 = _80 * _163;
    out.gl_Position.x = _241;
    out.gl_Position.y = _243;
    out.gl_Position.z = _255;
    out.gl_Position.w = _257;
    out.m_33.x = _259;
    out.m_33.y = _265;
    out.m_33.z = _267;
    out.m_33.w = _211;
    out.m_35.x = _165;
    out.m_35.y = _269;
    out.m_35.z = _167;
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
    int _58 = ~as_type<int>(_49);
    int _60 = _58 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _64 = _60 != 0;
    float _66 = as_type<float>(in.m_28.x);
    float _68 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _70 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _72 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _74 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _68);
    float _76 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _70);
    float _78 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _72);
    float _80 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _74);
    int _82 = 0;
    bool _84 = _64;
    if (!_64)
    {
        float _86 = as_type<float>(in.m_23.y);
        _82 = as_type<int>(_86);
    }
    int _88 = _82;
    bool _90 = false;
    if (_64)
    {
        _90 = false;
    }
    bool _92 = _90;
    float _94 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].z, _76);
    float _96 = _80 * _80;
    float _98 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _78);
    int _100 = as_type<int>(_66) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _102 = _100 << 4;
    int _104 = _102 + 208;
    uint _107 = uint(int(uint(_104) >> uint(2)));
    uint _109 = uint(int(uint(int(_107)) >> uint(2)));
    int _111 = int(_107) & 3;
    float _113 = (*spvDescriptorSet0.vp_c3)._m0[int(_109)][_111];
    int _115 = _104 & 3;
    int _117 = _115 << 3;
    uint _119 = uint(int(uint(as_type<int>(_113)) >> uint(_117)));
    int _121 = int(_119) & 255;
    int _123 = 0;
    bool _125 = _92;
    if (!_64)
    {
        int _127 = ~_88;
        int _129 = _127 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _131 = _129 != 0;
        _123 = _131 ? (-1) : 0;
    }
    int _133 = _123;
    int _135 = _133;
    if (!_64)
    {
        int _137 = ~_133;
        _125 = _137 != 0;
    }
    bool _139 = _125;
    uint _141 = uint(int(uint(_104) >> uint(2)));
    uint _143 = uint(int(uint(int(_141)) >> uint(2)));
    int _145 = int(_141) & 3;
    float _147 = (*spvDescriptorSet0.vp_c3)._m0[int(_143)][_145];
    float _149 = fma(_94, _94, _96);
    int _151 = _100;
    int _153 = _139 ? (-1) : 0;
    if (_139)
    {
        float _155 = as_type<float>(in.m_23.z);
        _151 = as_type<int>(_155);
    }
    int _157 = _151;
    if (!_139)
    {
        _84 = false;
    }
    bool _159 = _84;
    float _161 = fma(_98, _98, _149);
    float _163 = rsqrt(_161);
    float _165 = _94 * _163;
    float _167 = _98 * _163;
    bool _169 = _159;
    if (_139)
    {
        int _171 = ~_157;
        int _173 = _171 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _175 = _173 != 0;
        _135 = _175 ? (-1) : 0;
    }
    int _177 = _135;
    float _179 = in.m_30.x;
    float _181 = in.m_30.y;
    float _183 = in.m_30.z;
    bool _185 = _177 != 0;
    if (_139)
    {
        int _187 = ~_177;
        _169 = _187 != 0;
    }
    bool _189 = _169;
    uint _191 = extract_bits(uint(_121), 0u, 8u);
    float _193 = float(_191);
    uint _195 = extract_bits(as_type<uint>(_147), 24u, 8u);
    float _197 = float(_195);
    int _199 = 0;
    if (_189)
    {
        float _201 = as_type<float>(in.m_23.w);
        _199 = as_type<int>(_201);
    }
    int _203 = _199;
    if (!_189)
    {
        _185 = false;
    }
    bool _205 = _185;
    uint _207 = extract_bits(as_type<uint>(_147), 16u, 8u);
    float _209 = float(_207);
    float _211 = _193 * 0.0039215688593685626983642578125;
    float _213 = _181 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _215 = _181 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _217 = _181 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    uint _219 = extract_bits(as_type<uint>(_147), 8u, 8u);
    float _221 = float(_219);
    float _223 = _181 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _225 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[1].x, _213);
    float _227 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[2].x, _215);
    float _229 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[3].x, _217);
    float _231 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[4].x, _223);
    float _233 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[1].z, _225);
    float _235 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[2].z, _227);
    float _237 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[3].z, _229);
    float _239 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[4].z, _231);
    float _241 = _233 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _243 = _235 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    bool _245 = _205;
    if (_189)
    {
        int _247 = ~_203;
        int _249 = _247 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _251 = _249 != 0;
        _153 = _251 ? (-1) : 0;
    }
    int _253 = _153;
    float _255 = _237 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _257 = _239 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _259 = _197 * 0.0039215688593685626983642578125;
    if (_189)
    {
        int _261 = ~_253;
        _245 = _261 != 0;
    }
    bool _263 = _245;
    float _265 = _209 * 0.0039215688593685626983642578125;
    float _267 = _221 * 0.0039215688593685626983642578125;
    float _269 = _80 * _163;
    out.gl_Position.x = _241;
    out.gl_Position.y = _243;
    out.gl_Position.z = _255;
    out.gl_Position.w = _257;
    out.m_33.x = _259;
    out.m_33.y = _265;
    out.m_33.z = _267;
    out.m_33.w = _211;
    out.m_35.x = _165;
    out.m_35.y = _269;
    out.m_35.z = _167;
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
    int _58 = ~as_type<int>(_49);
    int _60 = _58 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _64 = _60 != 0;
    float _66 = as_type<float>(in.m_28.x);
    float _68 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _70 = _53 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _72 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _74 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _68);
    float _76 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[5].x, _70);
    float _78 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _72);
    float _80 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _74);
    int _82 = 0;
    bool _84 = _64;
    if (!_64)
    {
        float _86 = as_type<float>(in.m_23.y);
        _82 = as_type<int>(_86);
    }
    int _88 = _82;
    bool _90 = false;
    if (_64)
    {
        _90 = false;
    }
    bool _92 = _90;
    float _94 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[5].z, _76);
    float _96 = _80 * _80;
    float _98 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _78);
    int _100 = as_type<int>(_66) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _102 = _100 << 4;
    int _104 = _102 + 208;
    uint _107 = uint(int(uint(_104) >> uint(2)));
    uint _109 = uint(int(uint(int(_107)) >> uint(2)));
    int _111 = int(_107) & 3;
    float _113 = (*spvDescriptorSet0.vp_c3)._m0[int(_109)][_111];
    int _115 = _104 & 3;
    int _117 = _115 << 3;
    uint _119 = uint(int(uint(as_type<int>(_113)) >> uint(_117)));
    int _121 = int(_119) & 255;
    int _123 = 0;
    bool _125 = _92;
    if (!_64)
    {
        int _127 = ~_88;
        int _129 = _127 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _131 = _129 != 0;
        _123 = _131 ? (-1) : 0;
    }
    int _133 = _123;
    int _135 = _133;
    if (!_64)
    {
        int _137 = ~_133;
        _125 = _137 != 0;
    }
    bool _139 = _125;
    uint _141 = uint(int(uint(_104) >> uint(2)));
    uint _143 = uint(int(uint(int(_141)) >> uint(2)));
    int _145 = int(_141) & 3;
    float _147 = (*spvDescriptorSet0.vp_c3)._m0[int(_143)][_145];
    float _149 = fma(_94, _94, _96);
    int _151 = _100;
    int _153 = _139 ? (-1) : 0;
    if (_139)
    {
        float _155 = as_type<float>(in.m_23.z);
        _151 = as_type<int>(_155);
    }
    int _157 = _151;
    if (!_139)
    {
        _84 = false;
    }
    bool _159 = _84;
    float _161 = fma(_98, _98, _149);
    float _163 = rsqrt(_161);
    float _165 = _94 * _163;
    float _167 = _98 * _163;
    bool _169 = _159;
    if (_139)
    {
        int _171 = ~_157;
        int _173 = _171 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _175 = _173 != 0;
        _135 = _175 ? (-1) : 0;
    }
    int _177 = _135;
    float _179 = in.m_30.x;
    float _181 = in.m_30.y;
    float _183 = in.m_30.z;
    bool _185 = _177 != 0;
    if (_139)
    {
        int _187 = ~_177;
        _169 = _187 != 0;
    }
    bool _189 = _169;
    uint _191 = extract_bits(uint(_121), 0u, 8u);
    float _193 = float(_191);
    uint _195 = extract_bits(as_type<uint>(_147), 24u, 8u);
    float _197 = float(_195);
    int _199 = 0;
    if (_189)
    {
        float _201 = as_type<float>(in.m_23.w);
        _199 = as_type<int>(_201);
    }
    int _203 = _199;
    if (!_189)
    {
        _185 = false;
    }
    bool _205 = _185;
    uint _207 = extract_bits(as_type<uint>(_147), 16u, 8u);
    float _209 = float(_207);
    float _211 = _193 * 0.0039215688593685626983642578125;
    float _213 = _181 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _215 = _181 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _217 = _181 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    uint _219 = extract_bits(as_type<uint>(_147), 8u, 8u);
    float _221 = float(_219);
    float _223 = _181 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _225 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[1].x, _213);
    float _227 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[2].x, _215);
    float _229 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[3].x, _217);
    float _231 = fma(_179, (*spvDescriptorSet0.vp_c3)._m0[4].x, _223);
    float _233 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[1].z, _225);
    float _235 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[2].z, _227);
    float _237 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[3].z, _229);
    float _239 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[4].z, _231);
    float _241 = _233 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _243 = _235 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    bool _245 = _205;
    if (_189)
    {
        int _247 = ~_203;
        int _249 = _247 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _251 = _249 != 0;
        _153 = _251 ? (-1) : 0;
    }
    int _253 = _153;
    float _255 = _237 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _257 = _239 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _259 = _197 * 0.0039215688593685626983642578125;
    if (_189)
    {
        int _261 = ~_253;
        _245 = _261 != 0;
    }
    bool _263 = _245;
    float _265 = _209 * 0.0039215688593685626983642578125;
    float _267 = _221 * 0.0039215688593685626983642578125;
    float _269 = _80 * _163;
    out.gl_Position.x = _241;
    out.gl_Position.y = _243;
    out.gl_Position.z = _255;
    out.gl_Position.w = _257;
    out.m_33.x = _259;
    out.m_33.y = _265;
    out.m_33.z = _267;
    out.m_33.w = _211;
    out.m_35.x = _165;
    out.m_35.y = _269;
    out.m_35.z = _167;
    if (!_263)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

