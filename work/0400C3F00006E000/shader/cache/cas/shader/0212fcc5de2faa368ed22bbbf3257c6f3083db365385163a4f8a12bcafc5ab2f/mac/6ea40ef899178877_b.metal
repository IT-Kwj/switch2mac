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
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(0)]];
    float4 m_28 [[attribute(1)]];
    uint4 m_23 [[attribute(2)]];
    uint4 m_25 [[attribute(3)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
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
    int _60 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].z);
    int _62 = _60 << 4;
    int _64 = _62 + 208;
    int _66 = ~as_type<int>(_51);
    int _68 = _66 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _72 = _68 != 0;
    uint _75 = uint(int(uint(_64) >> uint(2)));
    uint _77 = uint(int(uint(int(_75)) >> uint(2)));
    int _79 = int(_75) & 3;
    float _81 = (*spvDescriptorSet0.vp_c3)._m0[int(_77)][_79];
    float _83 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _85 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _87 = _55 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _89 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _83);
    float _91 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _85);
    float _93 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].x, _87);
    float _95 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].z, _89);
    float _97 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].z, _91);
    int _99 = 0;
    if (!_72)
    {
        float _101 = as_type<float>(in.m_25.y);
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    float _105 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[7].z, _93);
    bool _107 = false;
    if (_72)
    {
        _107 = false;
    }
    bool _109 = _107;
    int _111 = 0;
    bool _113 = _109;
    if (!_72)
    {
        int _115 = ~_103;
        int _117 = _115 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _119 = _117 != 0;
        _111 = _119 ? (-1) : 0;
    }
    int _121 = _111;
    if (!_72)
    {
        int _123 = ~_121;
        _113 = _123 != 0;
    }
    bool _125 = _113;
    int _127 = as_type<int>(_81) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _129 = _127 << 4;
    int _131 = _129 + 208;
    uint _133 = uint(int(uint(as_type<int>(_81)) >> uint(5)));
    int _135 = int(_133) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _137 = uint(int(uint(_131) >> uint(2)));
    uint _139 = uint(int(uint(int(_137)) >> uint(2)));
    int _141 = int(_137) & 3;
    float _143 = (*spvDescriptorSet0.vp_c3)._m0[int(_139)][_141];
    int _145 = _131 & 3;
    int _147 = _145 << 3;
    uint _149 = uint(int(uint(as_type<int>(_143)) >> uint(_147)));
    int _151 = int(_149) & 255;
    int _153 = _135 << 4;
    int _155 = _153 + 208;
    float _157 = in.m_30.x;
    float _159 = in.m_30.y;
    float _161 = in.m_30.z;
    uint _163 = uint(int(uint(_131) >> uint(2)));
    uint _165 = uint(int(uint(int(_163)) >> uint(2)));
    int _167 = int(_163) & 3;
    float _169 = (*spvDescriptorSet0.vp_c3)._m0[int(_165)][_167];
    uint _171 = uint(int(uint(_155) >> uint(2)));
    uint _173 = uint(int(uint(int(_171)) >> uint(2)));
    int _175 = int(_171) & 3;
    float _177 = (*spvDescriptorSet0.vp_c3)._m0[int(_173)][_175];
    float _179 = _95 * _95;
    float _181 = fma(_97, _97, _179);
    float _183 = fma(_105, _105, _181);
    float _185 = _159 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _187 = _159 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _189 = _159 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _191 = _159 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _193 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[1].x, _185);
    float _195 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[2].x, _187);
    float _197 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[3].x, _189);
    float _199 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[4].x, _191);
    int _201 = as_type<int>(_81) & 31;
    bool _203 = uint(_201) < 32u;
    int _205 = 1 << _201;
    int _207 = _203 ? _205 : 0;
    float _209 = rsqrt(_183);
    float _211 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[1].z, _193);
    float _213 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[2].z, _195);
    float _215 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[3].z, _197);
    float _217 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[4].z, _199);
    float _219 = _213 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _221 = _215 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    uint _223 = extract_bits(uint(_151), 0u, 8u);
    float _225 = float(_223);
    float _227 = _97 * _209;
    float _229 = _95 * _209;
    float _231 = _105 * _209;
    uint _233 = extract_bits(as_type<uint>(_169), 24u, 8u);
    float _235 = float(_233);
    out.m_33.x = _227;
    out.m_33.y = _229;
    out.m_33.z = _231;
    uint _237 = extract_bits(as_type<uint>(_169), 16u, 8u);
    float _239 = float(_237);
    int _241 = _207 & as_type<int>(_177);
    bool _243 = _241 != 0;
    float _245 = _211 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _247 = _217 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _249 = _225 * 0.0039215688593685626983642578125;
    uint _251 = extract_bits(as_type<uint>(_169), 8u, 8u);
    float _253 = float(_251);
    float _255 = _235 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _245;
    out.gl_Position.y = _219;
    out.gl_Position.z = _221;
    out.gl_Position.w = _247;
    int _257 = as_type<int>(_215);
    if (!_243)
    {
        _257 = -1082130432;
    }
    int _259 = _257;
    float _261 = _239 * 0.0039215688593685626983642578125;
    if (!_243)
    {
        float _678 = as_type<float>(_259);
        out.gl_Position.w = _678;
    }
    float _263 = _253 * 0.0039215688593685626983642578125;
    out.m_35.x = _255;
    out.m_35.y = _261;
    out.m_35.z = _263;
    out.m_35.w = _249;
    if (!_125)
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
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
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
    int _60 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].z);
    int _62 = _60 << 4;
    int _64 = _62 + 208;
    int _66 = ~as_type<int>(_51);
    int _68 = _66 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _72 = _68 != 0;
    uint _75 = uint(int(uint(_64) >> uint(2)));
    uint _77 = uint(int(uint(int(_75)) >> uint(2)));
    int _79 = int(_75) & 3;
    float _81 = (*spvDescriptorSet0.vp_c3)._m0[int(_77)][_79];
    float _83 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _85 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _87 = _55 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _89 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _83);
    float _91 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _85);
    float _93 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].x, _87);
    float _95 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].z, _89);
    float _97 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].z, _91);
    int _99 = 0;
    if (!_72)
    {
        float _101 = as_type<float>(in.m_25.y);
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    float _105 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[7].z, _93);
    bool _107 = false;
    if (_72)
    {
        _107 = false;
    }
    bool _109 = _107;
    int _111 = 0;
    bool _113 = _109;
    if (!_72)
    {
        int _115 = ~_103;
        int _117 = _115 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _119 = _117 != 0;
        _111 = _119 ? (-1) : 0;
    }
    int _121 = _111;
    if (!_72)
    {
        int _123 = ~_121;
        _113 = _123 != 0;
    }
    bool _125 = _113;
    int _127 = as_type<int>(_81) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _129 = _127 << 4;
    int _131 = _129 + 208;
    uint _133 = uint(int(uint(as_type<int>(_81)) >> uint(5)));
    int _135 = int(_133) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _137 = uint(int(uint(_131) >> uint(2)));
    uint _139 = uint(int(uint(int(_137)) >> uint(2)));
    int _141 = int(_137) & 3;
    float _143 = (*spvDescriptorSet0.vp_c3)._m0[int(_139)][_141];
    int _145 = _131 & 3;
    int _147 = _145 << 3;
    uint _149 = uint(int(uint(as_type<int>(_143)) >> uint(_147)));
    int _151 = int(_149) & 255;
    int _153 = _135 << 4;
    int _155 = _153 + 208;
    float _157 = in.m_30.x;
    float _159 = in.m_30.y;
    float _161 = in.m_30.z;
    uint _163 = uint(int(uint(_131) >> uint(2)));
    uint _165 = uint(int(uint(int(_163)) >> uint(2)));
    int _167 = int(_163) & 3;
    float _169 = (*spvDescriptorSet0.vp_c3)._m0[int(_165)][_167];
    uint _171 = uint(int(uint(_155) >> uint(2)));
    uint _173 = uint(int(uint(int(_171)) >> uint(2)));
    int _175 = int(_171) & 3;
    float _177 = (*spvDescriptorSet0.vp_c3)._m0[int(_173)][_175];
    float _179 = _95 * _95;
    float _181 = fma(_97, _97, _179);
    float _183 = fma(_105, _105, _181);
    float _185 = _159 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _187 = _159 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _189 = _159 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _191 = _159 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _193 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[1].x, _185);
    float _195 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[2].x, _187);
    float _197 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[3].x, _189);
    float _199 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[4].x, _191);
    int _201 = as_type<int>(_81) & 31;
    bool _203 = uint(_201) < 32u;
    int _205 = 1 << _201;
    int _207 = _203 ? _205 : 0;
    float _209 = rsqrt(_183);
    float _211 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[1].z, _193);
    float _213 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[2].z, _195);
    float _215 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[3].z, _197);
    float _217 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[4].z, _199);
    float _219 = _213 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _221 = _215 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    uint _223 = extract_bits(uint(_151), 0u, 8u);
    float _225 = float(_223);
    float _227 = _97 * _209;
    float _229 = _95 * _209;
    float _231 = _105 * _209;
    uint _233 = extract_bits(as_type<uint>(_169), 24u, 8u);
    float _235 = float(_233);
    out.m_33.x = _227;
    out.m_33.y = _229;
    out.m_33.z = _231;
    uint _237 = extract_bits(as_type<uint>(_169), 16u, 8u);
    float _239 = float(_237);
    int _241 = _207 & as_type<int>(_177);
    bool _243 = _241 != 0;
    float _245 = _211 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _247 = _217 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _249 = _225 * 0.0039215688593685626983642578125;
    uint _251 = extract_bits(as_type<uint>(_169), 8u, 8u);
    float _253 = float(_251);
    float _255 = _235 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _245;
    out.gl_Position.y = _219;
    out.gl_Position.z = _221;
    out.gl_Position.w = _247;
    int _257 = as_type<int>(_215);
    if (!_243)
    {
        _257 = -1082130432;
    }
    int _259 = _257;
    float _261 = _239 * 0.0039215688593685626983642578125;
    if (!_243)
    {
        float _678 = as_type<float>(_259);
        out.gl_Position.w = _678;
    }
    float _263 = _253 * 0.0039215688593685626983642578125;
    out.m_35.x = _255;
    out.m_35.y = _261;
    out.m_35.z = _263;
    out.m_35.w = _249;
    if (!_125)
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
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
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
    int _60 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].z);
    int _62 = _60 << 4;
    int _64 = _62 + 208;
    int _66 = ~as_type<int>(_51);
    int _68 = _66 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    bool _72 = _68 != 0;
    uint _75 = uint(int(uint(_64) >> uint(2)));
    uint _77 = uint(int(uint(int(_75)) >> uint(2)));
    int _79 = int(_75) & 3;
    float _81 = (*spvDescriptorSet0.vp_c3)._m0[int(_77)][_79];
    float _83 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _85 = _55 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _87 = _55 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _89 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _83);
    float _91 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _85);
    float _93 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].x, _87);
    float _95 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].z, _89);
    float _97 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[5].z, _91);
    int _99 = 0;
    if (!_72)
    {
        float _101 = as_type<float>(in.m_25.y);
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    float _105 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[7].z, _93);
    bool _107 = false;
    if (_72)
    {
        _107 = false;
    }
    bool _109 = _107;
    int _111 = 0;
    bool _113 = _109;
    if (!_72)
    {
        int _115 = ~_103;
        int _117 = _115 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
        bool _119 = _117 != 0;
        _111 = _119 ? (-1) : 0;
    }
    int _121 = _111;
    if (!_72)
    {
        int _123 = ~_121;
        _113 = _123 != 0;
    }
    bool _125 = _113;
    int _127 = as_type<int>(_81) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
    int _129 = _127 << 4;
    int _131 = _129 + 208;
    uint _133 = uint(int(uint(as_type<int>(_81)) >> uint(5)));
    int _135 = int(_133) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].y);
    uint _137 = uint(int(uint(_131) >> uint(2)));
    uint _139 = uint(int(uint(int(_137)) >> uint(2)));
    int _141 = int(_137) & 3;
    float _143 = (*spvDescriptorSet0.vp_c3)._m0[int(_139)][_141];
    int _145 = _131 & 3;
    int _147 = _145 << 3;
    uint _149 = uint(int(uint(as_type<int>(_143)) >> uint(_147)));
    int _151 = int(_149) & 255;
    int _153 = _135 << 4;
    int _155 = _153 + 208;
    float _157 = in.m_30.x;
    float _159 = in.m_30.y;
    float _161 = in.m_30.z;
    uint _163 = uint(int(uint(_131) >> uint(2)));
    uint _165 = uint(int(uint(int(_163)) >> uint(2)));
    int _167 = int(_163) & 3;
    float _169 = (*spvDescriptorSet0.vp_c3)._m0[int(_165)][_167];
    uint _171 = uint(int(uint(_155) >> uint(2)));
    uint _173 = uint(int(uint(int(_171)) >> uint(2)));
    int _175 = int(_171) & 3;
    float _177 = (*spvDescriptorSet0.vp_c3)._m0[int(_173)][_175];
    float _179 = _95 * _95;
    float _181 = fma(_97, _97, _179);
    float _183 = fma(_105, _105, _181);
    float _185 = _159 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _187 = _159 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _189 = _159 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _191 = _159 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _193 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[1].x, _185);
    float _195 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[2].x, _187);
    float _197 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[3].x, _189);
    float _199 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[4].x, _191);
    int _201 = as_type<int>(_81) & 31;
    bool _203 = uint(_201) < 32u;
    int _205 = 1 << _201;
    int _207 = _203 ? _205 : 0;
    float _209 = rsqrt(_183);
    float _211 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[1].z, _193);
    float _213 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[2].z, _195);
    float _215 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[3].z, _197);
    float _217 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[4].z, _199);
    float _219 = _213 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _221 = _215 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    uint _223 = extract_bits(uint(_151), 0u, 8u);
    float _225 = float(_223);
    float _227 = _97 * _209;
    float _229 = _95 * _209;
    float _231 = _105 * _209;
    uint _233 = extract_bits(as_type<uint>(_169), 24u, 8u);
    float _235 = float(_233);
    out.m_33.x = _227;
    out.m_33.y = _229;
    out.m_33.z = _231;
    uint _237 = extract_bits(as_type<uint>(_169), 16u, 8u);
    float _239 = float(_237);
    int _241 = _207 & as_type<int>(_177);
    bool _243 = _241 != 0;
    float _245 = _211 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _247 = _217 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _249 = _225 * 0.0039215688593685626983642578125;
    uint _251 = extract_bits(as_type<uint>(_169), 8u, 8u);
    float _253 = float(_251);
    float _255 = _235 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _245;
    out.gl_Position.y = _219;
    out.gl_Position.z = _221;
    out.gl_Position.w = _247;
    int _257 = as_type<int>(_215);
    if (!_243)
    {
        _257 = -1082130432;
    }
    int _259 = _257;
    float _261 = _239 * 0.0039215688593685626983642578125;
    if (!_243)
    {
        float _678 = as_type<float>(_259);
        out.gl_Position.w = _678;
    }
    float _263 = _253 * 0.0039215688593685626983642578125;
    out.m_35.x = _255;
    out.m_35.y = _261;
    out.m_35.z = _263;
    out.m_35.w = _249;
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

