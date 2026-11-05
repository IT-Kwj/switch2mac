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
    int _64 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].y);
    int _66 = _64 << 4;
    int _68 = _66 + 224;
    float _70 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _72 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _74 = _53 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    int _76 = _64;
    bool _78 = _62;
    if (!_62)
    {
        float _80 = as_type<float>(in.m_23.y);
        _76 = as_type<int>(_80);
    }
    int _82 = _76;
    uint _85 = uint(int(uint(_68) >> uint(2)));
    uint _87 = uint(int(uint(int(_85)) >> uint(2)));
    int _89 = int(_85) & 3;
    float _91 = (*spvDescriptorSet0.vp_c3)._m0[int(_87)][_89];
    bool _93 = false;
    if (_62)
    {
        _93 = false;
    }
    bool _95 = _93;
    float _97 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _70);
    float _99 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _72);
    float _101 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].x, _74);
    float _103 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _97);
    float _105 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _99);
    float _107 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[8].z, _101);
    float _109 = _103 * _103;
    float _111 = fma(_105, _105, _109);
    float _113 = fma(_107, _107, _111);
    int _115 = 0;
    bool _117 = _95;
    if (!_62)
    {
        int _119 = _82 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _121 = _119 != 0;
        _115 = _121 ? (-1) : 0;
    }
    int _123 = _115;
    int _125 = _123;
    if (!_62)
    {
        int _127 = ~_123;
        _117 = _127 != 0;
    }
    bool _129 = _117;
    int _131 = as_type<int>(_47);
    if (_129)
    {
        float _133 = as_type<float>(in.m_23.z);
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    if (!_129)
    {
        _78 = false;
    }
    bool _137 = _78;
    uint _139 = uint(int(uint(as_type<int>(_91)) >> uint(5)));
    int _141 = int(_139) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _143 = as_type<int>(_91) & 31;
    bool _145 = uint(_143) < 32u;
    int _147 = 1 << _143;
    int _149 = _145 ? _147 : 0;
    int _151 = _141 << 4;
    int _153 = _151 + 224;
    uint _155 = uint(int(uint(_153) >> uint(2)));
    uint _157 = uint(int(uint(int(_155)) >> uint(2)));
    int _159 = int(_155) & 3;
    float _161 = (*spvDescriptorSet0.vp_c3)._m0[int(_157)][_159];
    bool _163 = _137;
    if (_129)
    {
        int _165 = _135 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _167 = _165 != 0;
        _125 = _167 ? (-1) : 0;
    }
    int _169 = _125;
    float _171 = rsqrt(_113);
    float _173 = in.m_30.x;
    float _175 = in.m_30.y;
    float _177 = in.m_30.z;
    int _179 = _169;
    if (_129)
    {
        int _181 = ~_169;
        _163 = _181 != 0;
    }
    bool _183 = _163;
    int _185 = 0;
    if (_183)
    {
        float _187 = as_type<float>(in.m_23.w);
        _185 = as_type<int>(_187);
    }
    int _189 = _185;
    bool _191 = false;
    if (!_183)
    {
        _191 = false;
    }
    bool _193 = _191;
    float _195 = _105 * _171;
    float _197 = _107 * _171;
    float _199 = _175 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _201 = _175 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _203 = _175 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _205 = _175 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _207 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[2].x, _199);
    float _209 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[3].x, _201);
    float _211 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[4].x, _203);
    float _213 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[5].x, _205);
    float _215 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[2].z, _207);
    float _217 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[3].z, _209);
    float _219 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[4].z, _211);
    float _221 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[5].z, _213);
    float _223 = _215 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _225 = _217 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    int _227 = _149 & as_type<int>(_161);
    bool _229 = _227 != 0;
    float _231 = _219 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _233 = _193;
    int _235 = as_type<int>(_219);
    if (_183)
    {
        int _237 = _189 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _239 = _237 != 0;
        _179 = _239 ? (-1) : 0;
    }
    int _241 = _179;
    float _243 = _221 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _245 = _103 * _171;
    if (_183)
    {
        int _247 = ~_241;
        _233 = _247 != 0;
    }
    bool _249 = _233;
    out.gl_Position.x = _223;
    out.gl_Position.y = _225;
    out.gl_Position.z = _231;
    out.gl_Position.w = _243;
    out.m_33.x = _195;
    out.m_33.y = _245;
    out.m_33.z = _197;
    if (!_229)
    {
        _235 = -1082130432;
    }
    int _251 = _235;
    if (!_229)
    {
        float _659 = as_type<float>(_251);
        out.gl_Position.w = _659;
    }
    if (!_249)
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
    int _64 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].y);
    int _66 = _64 << 4;
    int _68 = _66 + 224;
    float _70 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _72 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _74 = _53 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    int _76 = _64;
    bool _78 = _62;
    if (!_62)
    {
        float _80 = as_type<float>(in.m_23.y);
        _76 = as_type<int>(_80);
    }
    int _82 = _76;
    uint _85 = uint(int(uint(_68) >> uint(2)));
    uint _87 = uint(int(uint(int(_85)) >> uint(2)));
    int _89 = int(_85) & 3;
    float _91 = (*spvDescriptorSet0.vp_c3)._m0[int(_87)][_89];
    bool _93 = false;
    if (_62)
    {
        _93 = false;
    }
    bool _95 = _93;
    float _97 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _70);
    float _99 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _72);
    float _101 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].x, _74);
    float _103 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _97);
    float _105 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _99);
    float _107 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[8].z, _101);
    float _109 = _103 * _103;
    float _111 = fma(_105, _105, _109);
    float _113 = fma(_107, _107, _111);
    int _115 = 0;
    bool _117 = _95;
    if (!_62)
    {
        int _119 = _82 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _121 = _119 != 0;
        _115 = _121 ? (-1) : 0;
    }
    int _123 = _115;
    int _125 = _123;
    if (!_62)
    {
        int _127 = ~_123;
        _117 = _127 != 0;
    }
    bool _129 = _117;
    int _131 = as_type<int>(_47);
    if (_129)
    {
        float _133 = as_type<float>(in.m_23.z);
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    if (!_129)
    {
        _78 = false;
    }
    bool _137 = _78;
    uint _139 = uint(int(uint(as_type<int>(_91)) >> uint(5)));
    int _141 = int(_139) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _143 = as_type<int>(_91) & 31;
    bool _145 = uint(_143) < 32u;
    int _147 = 1 << _143;
    int _149 = _145 ? _147 : 0;
    int _151 = _141 << 4;
    int _153 = _151 + 224;
    uint _155 = uint(int(uint(_153) >> uint(2)));
    uint _157 = uint(int(uint(int(_155)) >> uint(2)));
    int _159 = int(_155) & 3;
    float _161 = (*spvDescriptorSet0.vp_c3)._m0[int(_157)][_159];
    bool _163 = _137;
    if (_129)
    {
        int _165 = _135 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _167 = _165 != 0;
        _125 = _167 ? (-1) : 0;
    }
    int _169 = _125;
    float _171 = rsqrt(_113);
    float _173 = in.m_30.x;
    float _175 = in.m_30.y;
    float _177 = in.m_30.z;
    int _179 = _169;
    if (_129)
    {
        int _181 = ~_169;
        _163 = _181 != 0;
    }
    bool _183 = _163;
    int _185 = 0;
    if (_183)
    {
        float _187 = as_type<float>(in.m_23.w);
        _185 = as_type<int>(_187);
    }
    int _189 = _185;
    bool _191 = false;
    if (!_183)
    {
        _191 = false;
    }
    bool _193 = _191;
    float _195 = _105 * _171;
    float _197 = _107 * _171;
    float _199 = _175 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _201 = _175 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _203 = _175 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _205 = _175 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _207 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[2].x, _199);
    float _209 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[3].x, _201);
    float _211 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[4].x, _203);
    float _213 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[5].x, _205);
    float _215 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[2].z, _207);
    float _217 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[3].z, _209);
    float _219 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[4].z, _211);
    float _221 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[5].z, _213);
    float _223 = _215 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _225 = _217 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    int _227 = _149 & as_type<int>(_161);
    bool _229 = _227 != 0;
    float _231 = _219 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _233 = _193;
    int _235 = as_type<int>(_219);
    if (_183)
    {
        int _237 = _189 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _239 = _237 != 0;
        _179 = _239 ? (-1) : 0;
    }
    int _241 = _179;
    float _243 = _221 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _245 = _103 * _171;
    if (_183)
    {
        int _247 = ~_241;
        _233 = _247 != 0;
    }
    bool _249 = _233;
    out.gl_Position.x = _223;
    out.gl_Position.y = _225;
    out.gl_Position.z = _231;
    out.gl_Position.w = _243;
    out.m_33.x = _195;
    out.m_33.y = _245;
    out.m_33.z = _197;
    if (!_229)
    {
        _235 = -1082130432;
    }
    int _251 = _235;
    if (!_229)
    {
        float _659 = as_type<float>(_251);
        out.gl_Position.w = _659;
    }
    if (!_249)
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
    int _64 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].y);
    int _66 = _64 << 4;
    int _68 = _66 + 224;
    float _70 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _72 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _74 = _53 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    int _76 = _64;
    bool _78 = _62;
    if (!_62)
    {
        float _80 = as_type<float>(in.m_23.y);
        _76 = as_type<int>(_80);
    }
    int _82 = _76;
    uint _85 = uint(int(uint(_68) >> uint(2)));
    uint _87 = uint(int(uint(int(_85)) >> uint(2)));
    int _89 = int(_85) & 3;
    float _91 = (*spvDescriptorSet0.vp_c3)._m0[int(_87)][_89];
    bool _93 = false;
    if (_62)
    {
        _93 = false;
    }
    bool _95 = _93;
    float _97 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _70);
    float _99 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _72);
    float _101 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].x, _74);
    float _103 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _97);
    float _105 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _99);
    float _107 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[8].z, _101);
    float _109 = _103 * _103;
    float _111 = fma(_105, _105, _109);
    float _113 = fma(_107, _107, _111);
    int _115 = 0;
    bool _117 = _95;
    if (!_62)
    {
        int _119 = _82 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _121 = _119 != 0;
        _115 = _121 ? (-1) : 0;
    }
    int _123 = _115;
    int _125 = _123;
    if (!_62)
    {
        int _127 = ~_123;
        _117 = _127 != 0;
    }
    bool _129 = _117;
    int _131 = as_type<int>(_47);
    if (_129)
    {
        float _133 = as_type<float>(in.m_23.z);
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    if (!_129)
    {
        _78 = false;
    }
    bool _137 = _78;
    uint _139 = uint(int(uint(as_type<int>(_91)) >> uint(5)));
    int _141 = int(_139) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _143 = as_type<int>(_91) & 31;
    bool _145 = uint(_143) < 32u;
    int _147 = 1 << _143;
    int _149 = _145 ? _147 : 0;
    int _151 = _141 << 4;
    int _153 = _151 + 224;
    uint _155 = uint(int(uint(_153) >> uint(2)));
    uint _157 = uint(int(uint(int(_155)) >> uint(2)));
    int _159 = int(_155) & 3;
    float _161 = (*spvDescriptorSet0.vp_c3)._m0[int(_157)][_159];
    bool _163 = _137;
    if (_129)
    {
        int _165 = _135 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _167 = _165 != 0;
        _125 = _167 ? (-1) : 0;
    }
    int _169 = _125;
    float _171 = rsqrt(_113);
    float _173 = in.m_30.x;
    float _175 = in.m_30.y;
    float _177 = in.m_30.z;
    int _179 = _169;
    if (_129)
    {
        int _181 = ~_169;
        _163 = _181 != 0;
    }
    bool _183 = _163;
    int _185 = 0;
    if (_183)
    {
        float _187 = as_type<float>(in.m_23.w);
        _185 = as_type<int>(_187);
    }
    int _189 = _185;
    bool _191 = false;
    if (!_183)
    {
        _191 = false;
    }
    bool _193 = _191;
    float _195 = _105 * _171;
    float _197 = _107 * _171;
    float _199 = _175 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _201 = _175 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _203 = _175 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _205 = _175 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _207 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[2].x, _199);
    float _209 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[3].x, _201);
    float _211 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[4].x, _203);
    float _213 = fma(_173, (*spvDescriptorSet0.vp_c3)._m0[5].x, _205);
    float _215 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[2].z, _207);
    float _217 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[3].z, _209);
    float _219 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[4].z, _211);
    float _221 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[5].z, _213);
    float _223 = _215 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _225 = _217 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    int _227 = _149 & as_type<int>(_161);
    bool _229 = _227 != 0;
    float _231 = _219 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _233 = _193;
    int _235 = as_type<int>(_219);
    if (_183)
    {
        int _237 = _189 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _239 = _237 != 0;
        _179 = _239 ? (-1) : 0;
    }
    int _241 = _179;
    float _243 = _221 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _245 = _103 * _171;
    if (_183)
    {
        int _247 = ~_241;
        _233 = _247 != 0;
    }
    bool _249 = _233;
    out.gl_Position.x = _223;
    out.gl_Position.y = _225;
    out.gl_Position.z = _231;
    out.gl_Position.w = _243;
    out.m_33.x = _195;
    out.m_33.y = _245;
    out.m_33.z = _197;
    if (!_229)
    {
        _235 = -1082130432;
    }
    int _251 = _235;
    if (!_229)
    {
        float _659 = as_type<float>(_251);
        out.gl_Position.w = _659;
    }
    if (!_249)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

