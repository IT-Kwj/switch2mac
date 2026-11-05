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
    int _58 = as_type<int>(_47) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _62 = _58 != 0;
    float _64 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _66 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _68 = _53 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _70 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _64);
    int _72 = as_type<int>(_47);
    bool _74 = _62;
    if (!_62)
    {
        float _76 = as_type<float>(in.m_23.y);
        _72 = as_type<int>(_76);
    }
    int _78 = _72;
    bool _80 = false;
    if (_62)
    {
        _80 = false;
    }
    bool _82 = _80;
    float _84 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _66);
    float _86 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _70);
    float _88 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].x, _68);
    float _90 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _84);
    float _92 = _86 * _86;
    float _94 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[8].z, _88);
    float _96 = fma(_90, _90, _92);
    int _98 = 0;
    bool _100 = _82;
    if (!_62)
    {
        int _102 = _78 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _104 = _102 != 0;
        _98 = _104 ? (-1) : 0;
    }
    int _106 = _98;
    uint _109 = uint(int(uint(as_type<int>(_49)) >> uint(5)));
    int _111 = int(_109) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _113 = _106;
    if (!_62)
    {
        int _115 = ~_106;
        _100 = _115 != 0;
    }
    bool _117 = _100;
    int _119 = _111 << 4;
    int _121 = _119 + 224;
    int _123 = as_type<int>(_49) & 31;
    bool _125 = uint(_123) < 32u;
    int _127 = 1 << _123;
    int _129 = _125 ? _127 : 0;
    uint _131 = uint(int(uint(_121) >> uint(2)));
    uint _133 = uint(int(uint(int(_131)) >> uint(2)));
    int _135 = int(_131) & 3;
    float _137 = (*spvDescriptorSet0.vp_c3)._m0[int(_133)][_135];
    int _139 = _111;
    if (_117)
    {
        float _141 = as_type<float>(in.m_23.z);
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    if (!_117)
    {
        _74 = false;
    }
    bool _145 = _74;
    bool _147 = _145;
    if (_117)
    {
        int _149 = _143 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _151 = _149 != 0;
        _113 = _151 ? (-1) : 0;
    }
    int _153 = _113;
    float _155 = in.m_30.x;
    float _157 = in.m_30.y;
    float _159 = in.m_30.z;
    int _161 = _153;
    if (_117)
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
    bool _173 = false;
    if (!_165)
    {
        _173 = false;
    }
    bool _175 = _173;
    int _177 = _129 & as_type<int>(_137);
    bool _179 = _177 != 0;
    float _181 = fma(_94, _94, _96);
    float _183 = rsqrt(_181);
    float _185 = _157 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _187 = _157 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _189 = _157 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _191 = _157 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _193 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[2].x, _185);
    float _195 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[3].x, _187);
    float _197 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[4].x, _189);
    float _199 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[5].x, _191);
    float _201 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[2].z, _193);
    float _203 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[3].z, _195);
    float _205 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[4].z, _197);
    float _207 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[5].z, _199);
    float _209 = _201 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _211 = _203 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _213 = _205 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    int _215 = as_type<int>(_205);
    bool _217 = _175;
    if (_165)
    {
        int _219 = _171 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _221 = _219 != 0;
        _161 = _221 ? (-1) : 0;
    }
    int _223 = _161;
    float _225 = _207 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    if (!_179)
    {
        _215 = -1082130432;
    }
    int _227 = _215;
    float _229 = _90 * _183;
    if (_165)
    {
        int _231 = ~_223;
        _217 = _231 != 0;
    }
    bool _233 = _217;
    float _235 = _86 * _183;
    float _237 = _94 * _183;
    out.gl_Position.x = _209;
    out.gl_Position.y = _211;
    out.gl_Position.z = _213;
    out.gl_Position.w = _225;
    if (!_179)
    {
        float _614 = as_type<float>(_227);
        out.gl_Position.w = _614;
    }
    out.m_33.x = _229;
    out.m_33.y = _235;
    out.m_33.z = _237;
    if (!_233)
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
    int _58 = as_type<int>(_47) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _62 = _58 != 0;
    float _64 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _66 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _68 = _53 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _70 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _64);
    int _72 = as_type<int>(_47);
    bool _74 = _62;
    if (!_62)
    {
        float _76 = as_type<float>(in.m_23.y);
        _72 = as_type<int>(_76);
    }
    int _78 = _72;
    bool _80 = false;
    if (_62)
    {
        _80 = false;
    }
    bool _82 = _80;
    float _84 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _66);
    float _86 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _70);
    float _88 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].x, _68);
    float _90 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _84);
    float _92 = _86 * _86;
    float _94 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[8].z, _88);
    float _96 = fma(_90, _90, _92);
    int _98 = 0;
    bool _100 = _82;
    if (!_62)
    {
        int _102 = _78 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _104 = _102 != 0;
        _98 = _104 ? (-1) : 0;
    }
    int _106 = _98;
    uint _109 = uint(int(uint(as_type<int>(_49)) >> uint(5)));
    int _111 = int(_109) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _113 = _106;
    if (!_62)
    {
        int _115 = ~_106;
        _100 = _115 != 0;
    }
    bool _117 = _100;
    int _119 = _111 << 4;
    int _121 = _119 + 224;
    int _123 = as_type<int>(_49) & 31;
    bool _125 = uint(_123) < 32u;
    int _127 = 1 << _123;
    int _129 = _125 ? _127 : 0;
    uint _131 = uint(int(uint(_121) >> uint(2)));
    uint _133 = uint(int(uint(int(_131)) >> uint(2)));
    int _135 = int(_131) & 3;
    float _137 = (*spvDescriptorSet0.vp_c3)._m0[int(_133)][_135];
    int _139 = _111;
    if (_117)
    {
        float _141 = as_type<float>(in.m_23.z);
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    if (!_117)
    {
        _74 = false;
    }
    bool _145 = _74;
    bool _147 = _145;
    if (_117)
    {
        int _149 = _143 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _151 = _149 != 0;
        _113 = _151 ? (-1) : 0;
    }
    int _153 = _113;
    float _155 = in.m_30.x;
    float _157 = in.m_30.y;
    float _159 = in.m_30.z;
    int _161 = _153;
    if (_117)
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
    bool _173 = false;
    if (!_165)
    {
        _173 = false;
    }
    bool _175 = _173;
    int _177 = _129 & as_type<int>(_137);
    bool _179 = _177 != 0;
    float _181 = fma(_94, _94, _96);
    float _183 = rsqrt(_181);
    float _185 = _157 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _187 = _157 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _189 = _157 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _191 = _157 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _193 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[2].x, _185);
    float _195 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[3].x, _187);
    float _197 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[4].x, _189);
    float _199 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[5].x, _191);
    float _201 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[2].z, _193);
    float _203 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[3].z, _195);
    float _205 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[4].z, _197);
    float _207 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[5].z, _199);
    float _209 = _201 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _211 = _203 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _213 = _205 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    int _215 = as_type<int>(_205);
    bool _217 = _175;
    if (_165)
    {
        int _219 = _171 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _221 = _219 != 0;
        _161 = _221 ? (-1) : 0;
    }
    int _223 = _161;
    float _225 = _207 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    if (!_179)
    {
        _215 = -1082130432;
    }
    int _227 = _215;
    float _229 = _90 * _183;
    if (_165)
    {
        int _231 = ~_223;
        _217 = _231 != 0;
    }
    bool _233 = _217;
    float _235 = _86 * _183;
    float _237 = _94 * _183;
    out.gl_Position.x = _209;
    out.gl_Position.y = _211;
    out.gl_Position.z = _213;
    out.gl_Position.w = _225;
    if (!_179)
    {
        float _614 = as_type<float>(_227);
        out.gl_Position.w = _614;
    }
    out.m_33.x = _229;
    out.m_33.y = _235;
    out.m_33.z = _237;
    if (!_233)
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
    int _58 = as_type<int>(_47) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _62 = _58 != 0;
    float _64 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _66 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _68 = _53 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _70 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _64);
    int _72 = as_type<int>(_47);
    bool _74 = _62;
    if (!_62)
    {
        float _76 = as_type<float>(in.m_23.y);
        _72 = as_type<int>(_76);
    }
    int _78 = _72;
    bool _80 = false;
    if (_62)
    {
        _80 = false;
    }
    bool _82 = _80;
    float _84 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _66);
    float _86 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _70);
    float _88 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].x, _68);
    float _90 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _84);
    float _92 = _86 * _86;
    float _94 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[8].z, _88);
    float _96 = fma(_90, _90, _92);
    int _98 = 0;
    bool _100 = _82;
    if (!_62)
    {
        int _102 = _78 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _104 = _102 != 0;
        _98 = _104 ? (-1) : 0;
    }
    int _106 = _98;
    uint _109 = uint(int(uint(as_type<int>(_49)) >> uint(5)));
    int _111 = int(_109) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _113 = _106;
    if (!_62)
    {
        int _115 = ~_106;
        _100 = _115 != 0;
    }
    bool _117 = _100;
    int _119 = _111 << 4;
    int _121 = _119 + 224;
    int _123 = as_type<int>(_49) & 31;
    bool _125 = uint(_123) < 32u;
    int _127 = 1 << _123;
    int _129 = _125 ? _127 : 0;
    uint _131 = uint(int(uint(_121) >> uint(2)));
    uint _133 = uint(int(uint(int(_131)) >> uint(2)));
    int _135 = int(_131) & 3;
    float _137 = (*spvDescriptorSet0.vp_c3)._m0[int(_133)][_135];
    int _139 = _111;
    if (_117)
    {
        float _141 = as_type<float>(in.m_23.z);
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    if (!_117)
    {
        _74 = false;
    }
    bool _145 = _74;
    bool _147 = _145;
    if (_117)
    {
        int _149 = _143 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _151 = _149 != 0;
        _113 = _151 ? (-1) : 0;
    }
    int _153 = _113;
    float _155 = in.m_30.x;
    float _157 = in.m_30.y;
    float _159 = in.m_30.z;
    int _161 = _153;
    if (_117)
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
    bool _173 = false;
    if (!_165)
    {
        _173 = false;
    }
    bool _175 = _173;
    int _177 = _129 & as_type<int>(_137);
    bool _179 = _177 != 0;
    float _181 = fma(_94, _94, _96);
    float _183 = rsqrt(_181);
    float _185 = _157 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _187 = _157 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _189 = _157 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _191 = _157 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _193 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[2].x, _185);
    float _195 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[3].x, _187);
    float _197 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[4].x, _189);
    float _199 = fma(_155, (*spvDescriptorSet0.vp_c3)._m0[5].x, _191);
    float _201 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[2].z, _193);
    float _203 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[3].z, _195);
    float _205 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[4].z, _197);
    float _207 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[5].z, _199);
    float _209 = _201 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _211 = _203 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _213 = _205 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    int _215 = as_type<int>(_205);
    bool _217 = _175;
    if (_165)
    {
        int _219 = _171 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _221 = _219 != 0;
        _161 = _221 ? (-1) : 0;
    }
    int _223 = _161;
    float _225 = _207 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    if (!_179)
    {
        _215 = -1082130432;
    }
    int _227 = _215;
    float _229 = _90 * _183;
    if (_165)
    {
        int _231 = ~_223;
        _217 = _231 != 0;
    }
    bool _233 = _217;
    float _235 = _86 * _183;
    float _237 = _94 * _183;
    out.gl_Position.x = _209;
    out.gl_Position.y = _211;
    out.gl_Position.z = _213;
    out.gl_Position.w = _225;
    if (!_179)
    {
        float _614 = as_type<float>(_227);
        out.gl_Position.w = _614;
    }
    out.m_33.x = _229;
    out.m_33.y = _235;
    out.m_33.z = _237;
    if (!_233)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

