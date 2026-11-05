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
    constant _16* vp_c7 [[id(0)]];
    constant _16* vp_c4 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
};

struct main0_out
{
    float4 m_31 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(0)]];
    float4 m_28 [[attribute(8)]];
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
    float _45 = (*spvDescriptorSet0.vp_c7)._m0[1].y * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _47 = fma((*spvDescriptorSet0.vp_c7)._m0[0].y, (*spvDescriptorSet0.vp_c7)._m0[0].y, _45);
    float _49 = (*spvDescriptorSet0.vp_c7)._m0[1].x * (*spvDescriptorSet0.vp_c7)._m0[1].x;
    float _51 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, (*spvDescriptorSet0.vp_c7)._m0[0].x, _49);
    float _53 = fma((*spvDescriptorSet0.vp_c7)._m0[2].y, (*spvDescriptorSet0.vp_c7)._m0[2].y, _47);
    float _55 = (*spvDescriptorSet0.vp_c7)._m0[1].z * (*spvDescriptorSet0.vp_c7)._m0[1].z;
    float _57 = in.m_26.x;
    float _59 = in.m_26.y;
    float _61 = in.m_26.z;
    float _63 = fma((*spvDescriptorSet0.vp_c7)._m0[2].x, (*spvDescriptorSet0.vp_c7)._m0[2].x, _51);
    float _65 = fma((*spvDescriptorSet0.vp_c7)._m0[0].z, (*spvDescriptorSet0.vp_c7)._m0[0].z, _55);
    float _67 = sqrt(_53);
    float _69 = fma((*spvDescriptorSet0.vp_c7)._m0[2].z, (*spvDescriptorSet0.vp_c7)._m0[2].z, _65);
    float _71 = sqrt(_63);
    float _73 = sqrt(_69);
    float _75 = fma(_67, (*spvDescriptorSet0.vp_c4)._m0[13].y, 9.9999997473787516355514526367188e-06);
    float _77 = fma(_67, (*spvDescriptorSet0.vp_c4)._m0[11].y, 9.9999997473787516355514526367188e-06);
    float _79 = fma(_67, (*spvDescriptorSet0.vp_c4)._m0[12].y, 9.9999997473787516355514526367188e-06);
    float _81 = _75 * _59;
    float _83 = _77 * _59;
    float _85 = _79 * _59;
    float _87 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[13].x, 9.9999997473787516355514526367188e-06);
    float _89 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[11].x, 9.9999997473787516355514526367188e-06);
    float _91 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[12].x, 9.9999997473787516355514526367188e-06);
    float _93 = fma(_87, _57, _81);
    float _95 = fma(_89, _57, _83);
    float _97 = fma(_91, _57, _85);
    float _99 = fma(_73, (*spvDescriptorSet0.vp_c4)._m0[13].z, 9.9999997473787516355514526367188e-06);
    float _101 = fma(_73, (*spvDescriptorSet0.vp_c4)._m0[11].z, 9.9999997473787516355514526367188e-06);
    float _103 = fma(_73, (*spvDescriptorSet0.vp_c4)._m0[12].z, 9.9999997473787516355514526367188e-06);
    float _105 = fma(_99, _61, _93);
    float _107 = fma(_101, _61, _95);
    float _109 = fma(_103, _61, _97);
    float _111 = _105 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _113 = _107 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _115 = _109 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _117 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _119 = _111 + _117;
    float _121 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _123 = _113 + _121;
    float _125 = _119 * _119;
    float _127 = fma(_123, _123, _125);
    float _129 = sqrt(_127);
    bool _133 = _129 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _135 = _61;
    float _137 = _57;
    float _139 = _115;
    if (!_133)
    {
        _135 = _113;
    }
    float _141 = _135;
    float _143 = _141;
    if (!_133)
    {
        _137 = _111;
    }
    float _145 = _137;
    bool _147 = !_133;
    float _149 = _145;
    if (!_147)
    {
        float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _153 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _155 = _129 + _153;
        float _157 = _115 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _159 = rsqrt(_127);
        float _161 = _155 * _151;
        float _163 = _161 * 0.15915493667125701904296875;
        float _165 = _163 * 6.283185482025146484375;
        float _167 = cos(_165);
        float _169 = _163 * 6.283185482025146484375;
        float _171 = sin(_169);
        float _173 = _167 + (-1.0);
        float _175 = _173 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _177 = fma(_171, _157, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _179 = fma(_115, _167, _175);
        float _181 = _159 * _177;
        float _183 = fma(_123, _181, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _185 = fma(_119, _181, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _139 = _179;
        _143 = _183;
        _149 = _185;
    }
    float _187 = _139;
    float _189 = _143;
    float _191 = _149;
    float _193 = _187 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _195 = _187 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _197 = _187 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _199 = in.m_28.x;
    float _201 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[1].x, _193);
    float _203 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[0].x, _195);
    float _205 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[2].x, _197);
    float _207 = in.m_28.y;
    float _209 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[1].z, _201);
    float _211 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[0].z, _203);
    float _213 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[2].z, _205);
    float _215 = _209 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _217 = _211 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _219 = _213 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _221 = _215 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _223 = _215 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _225 = _215 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _227 = _215 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _229 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[8].x, _221);
    float _231 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[7].x, _223);
    float _233 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[9].x, _225);
    float _235 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[10].x, _227);
    float _237 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[8].z, _229);
    float _239 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[7].z, _231);
    float _241 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[9].z, _233);
    float _243 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[10].z, _235);
    float _245 = _237 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _247 = _239 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _249 = _241 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _251 = _243 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_31.x = _199;
    out.m_31.y = _207;
    out.gl_Position.x = _247;
    out.gl_Position.y = _245;
    out.gl_Position.z = _249;
    out.gl_Position.w = _251;
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
    float _45 = (*spvDescriptorSet0.vp_c7)._m0[1].y * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _47 = fma((*spvDescriptorSet0.vp_c7)._m0[0].y, (*spvDescriptorSet0.vp_c7)._m0[0].y, _45);
    float _49 = (*spvDescriptorSet0.vp_c7)._m0[1].x * (*spvDescriptorSet0.vp_c7)._m0[1].x;
    float _51 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, (*spvDescriptorSet0.vp_c7)._m0[0].x, _49);
    float _53 = fma((*spvDescriptorSet0.vp_c7)._m0[2].y, (*spvDescriptorSet0.vp_c7)._m0[2].y, _47);
    float _55 = (*spvDescriptorSet0.vp_c7)._m0[1].z * (*spvDescriptorSet0.vp_c7)._m0[1].z;
    float _57 = in.m_26.x;
    float _59 = in.m_26.y;
    float _61 = in.m_26.z;
    float _63 = fma((*spvDescriptorSet0.vp_c7)._m0[2].x, (*spvDescriptorSet0.vp_c7)._m0[2].x, _51);
    float _65 = fma((*spvDescriptorSet0.vp_c7)._m0[0].z, (*spvDescriptorSet0.vp_c7)._m0[0].z, _55);
    float _67 = sqrt(_53);
    float _69 = fma((*spvDescriptorSet0.vp_c7)._m0[2].z, (*spvDescriptorSet0.vp_c7)._m0[2].z, _65);
    float _71 = sqrt(_63);
    float _73 = sqrt(_69);
    float _75 = fma(_67, (*spvDescriptorSet0.vp_c4)._m0[13].y, 9.9999997473787516355514526367188e-06);
    float _77 = fma(_67, (*spvDescriptorSet0.vp_c4)._m0[11].y, 9.9999997473787516355514526367188e-06);
    float _79 = fma(_67, (*spvDescriptorSet0.vp_c4)._m0[12].y, 9.9999997473787516355514526367188e-06);
    float _81 = _75 * _59;
    float _83 = _77 * _59;
    float _85 = _79 * _59;
    float _87 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[13].x, 9.9999997473787516355514526367188e-06);
    float _89 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[11].x, 9.9999997473787516355514526367188e-06);
    float _91 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[12].x, 9.9999997473787516355514526367188e-06);
    float _93 = fma(_87, _57, _81);
    float _95 = fma(_89, _57, _83);
    float _97 = fma(_91, _57, _85);
    float _99 = fma(_73, (*spvDescriptorSet0.vp_c4)._m0[13].z, 9.9999997473787516355514526367188e-06);
    float _101 = fma(_73, (*spvDescriptorSet0.vp_c4)._m0[11].z, 9.9999997473787516355514526367188e-06);
    float _103 = fma(_73, (*spvDescriptorSet0.vp_c4)._m0[12].z, 9.9999997473787516355514526367188e-06);
    float _105 = fma(_99, _61, _93);
    float _107 = fma(_101, _61, _95);
    float _109 = fma(_103, _61, _97);
    float _111 = _105 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _113 = _107 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _115 = _109 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _117 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _119 = _111 + _117;
    float _121 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _123 = _113 + _121;
    float _125 = _119 * _119;
    float _127 = fma(_123, _123, _125);
    float _129 = sqrt(_127);
    bool _133 = _129 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _135 = _61;
    float _137 = _57;
    float _139 = _115;
    if (!_133)
    {
        _135 = _113;
    }
    float _141 = _135;
    float _143 = _141;
    if (!_133)
    {
        _137 = _111;
    }
    float _145 = _137;
    bool _147 = !_133;
    float _149 = _145;
    if (!_147)
    {
        float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _153 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _155 = _129 + _153;
        float _157 = _115 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _159 = rsqrt(_127);
        float _161 = _155 * _151;
        float _163 = _161 * 0.15915493667125701904296875;
        float _165 = _163 * 6.283185482025146484375;
        float _167 = cos(_165);
        float _169 = _163 * 6.283185482025146484375;
        float _171 = sin(_169);
        float _173 = _167 + (-1.0);
        float _175 = _173 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _177 = fma(_171, _157, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _179 = fma(_115, _167, _175);
        float _181 = _159 * _177;
        float _183 = fma(_123, _181, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _185 = fma(_119, _181, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _139 = _179;
        _143 = _183;
        _149 = _185;
    }
    float _187 = _139;
    float _189 = _143;
    float _191 = _149;
    float _193 = _187 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _195 = _187 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _197 = _187 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _199 = in.m_28.x;
    float _201 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[1].x, _193);
    float _203 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[0].x, _195);
    float _205 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[2].x, _197);
    float _207 = in.m_28.y;
    float _209 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[1].z, _201);
    float _211 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[0].z, _203);
    float _213 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[2].z, _205);
    float _215 = _209 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _217 = _211 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _219 = _213 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _221 = _215 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _223 = _215 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _225 = _215 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _227 = _215 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _229 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[8].x, _221);
    float _231 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[7].x, _223);
    float _233 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[9].x, _225);
    float _235 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[10].x, _227);
    float _237 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[8].z, _229);
    float _239 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[7].z, _231);
    float _241 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[9].z, _233);
    float _243 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[10].z, _235);
    float _245 = _237 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _247 = _239 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _249 = _241 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _251 = _243 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_31.x = _199;
    out.m_31.y = _207;
    out.gl_Position.x = _247;
    out.gl_Position.y = _245;
    out.gl_Position.z = _249;
    out.gl_Position.w = _251;
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
    float _45 = (*spvDescriptorSet0.vp_c7)._m0[1].y * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _47 = fma((*spvDescriptorSet0.vp_c7)._m0[0].y, (*spvDescriptorSet0.vp_c7)._m0[0].y, _45);
    float _49 = (*spvDescriptorSet0.vp_c7)._m0[1].x * (*spvDescriptorSet0.vp_c7)._m0[1].x;
    float _51 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, (*spvDescriptorSet0.vp_c7)._m0[0].x, _49);
    float _53 = fma((*spvDescriptorSet0.vp_c7)._m0[2].y, (*spvDescriptorSet0.vp_c7)._m0[2].y, _47);
    float _55 = (*spvDescriptorSet0.vp_c7)._m0[1].z * (*spvDescriptorSet0.vp_c7)._m0[1].z;
    float _57 = in.m_26.x;
    float _59 = in.m_26.y;
    float _61 = in.m_26.z;
    float _63 = fma((*spvDescriptorSet0.vp_c7)._m0[2].x, (*spvDescriptorSet0.vp_c7)._m0[2].x, _51);
    float _65 = fma((*spvDescriptorSet0.vp_c7)._m0[0].z, (*spvDescriptorSet0.vp_c7)._m0[0].z, _55);
    float _67 = sqrt(_53);
    float _69 = fma((*spvDescriptorSet0.vp_c7)._m0[2].z, (*spvDescriptorSet0.vp_c7)._m0[2].z, _65);
    float _71 = sqrt(_63);
    float _73 = sqrt(_69);
    float _75 = fma(_67, (*spvDescriptorSet0.vp_c4)._m0[13].y, 9.9999997473787516355514526367188e-06);
    float _77 = fma(_67, (*spvDescriptorSet0.vp_c4)._m0[11].y, 9.9999997473787516355514526367188e-06);
    float _79 = fma(_67, (*spvDescriptorSet0.vp_c4)._m0[12].y, 9.9999997473787516355514526367188e-06);
    float _81 = _75 * _59;
    float _83 = _77 * _59;
    float _85 = _79 * _59;
    float _87 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[13].x, 9.9999997473787516355514526367188e-06);
    float _89 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[11].x, 9.9999997473787516355514526367188e-06);
    float _91 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[12].x, 9.9999997473787516355514526367188e-06);
    float _93 = fma(_87, _57, _81);
    float _95 = fma(_89, _57, _83);
    float _97 = fma(_91, _57, _85);
    float _99 = fma(_73, (*spvDescriptorSet0.vp_c4)._m0[13].z, 9.9999997473787516355514526367188e-06);
    float _101 = fma(_73, (*spvDescriptorSet0.vp_c4)._m0[11].z, 9.9999997473787516355514526367188e-06);
    float _103 = fma(_73, (*spvDescriptorSet0.vp_c4)._m0[12].z, 9.9999997473787516355514526367188e-06);
    float _105 = fma(_99, _61, _93);
    float _107 = fma(_101, _61, _95);
    float _109 = fma(_103, _61, _97);
    float _111 = _105 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _113 = _107 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _115 = _109 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _117 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _119 = _111 + _117;
    float _121 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _123 = _113 + _121;
    float _125 = _119 * _119;
    float _127 = fma(_123, _123, _125);
    float _129 = sqrt(_127);
    bool _133 = _129 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _135 = _61;
    float _137 = _57;
    float _139 = _115;
    if (!_133)
    {
        _135 = _113;
    }
    float _141 = _135;
    float _143 = _141;
    if (!_133)
    {
        _137 = _111;
    }
    float _145 = _137;
    bool _147 = !_133;
    float _149 = _145;
    if (!_147)
    {
        float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _153 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _155 = _129 + _153;
        float _157 = _115 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _159 = rsqrt(_127);
        float _161 = _155 * _151;
        float _163 = _161 * 0.15915493667125701904296875;
        float _165 = _163 * 6.283185482025146484375;
        float _167 = cos(_165);
        float _169 = _163 * 6.283185482025146484375;
        float _171 = sin(_169);
        float _173 = _167 + (-1.0);
        float _175 = _173 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _177 = fma(_171, _157, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _179 = fma(_115, _167, _175);
        float _181 = _159 * _177;
        float _183 = fma(_123, _181, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _185 = fma(_119, _181, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _139 = _179;
        _143 = _183;
        _149 = _185;
    }
    float _187 = _139;
    float _189 = _143;
    float _191 = _149;
    float _193 = _187 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _195 = _187 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _197 = _187 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _199 = in.m_28.x;
    float _201 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[1].x, _193);
    float _203 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[0].x, _195);
    float _205 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[2].x, _197);
    float _207 = in.m_28.y;
    float _209 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[1].z, _201);
    float _211 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[0].z, _203);
    float _213 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[2].z, _205);
    float _215 = _209 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _217 = _211 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _219 = _213 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _221 = _215 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _223 = _215 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _225 = _215 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _227 = _215 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _229 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[8].x, _221);
    float _231 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[7].x, _223);
    float _233 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[9].x, _225);
    float _235 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[10].x, _227);
    float _237 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[8].z, _229);
    float _239 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[7].z, _231);
    float _241 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[9].z, _233);
    float _243 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[10].z, _235);
    float _245 = _237 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _247 = _239 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _249 = _241 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _251 = _243 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_31.x = _199;
    out.m_31.y = _207;
    out.gl_Position.x = _247;
    out.gl_Position.y = _245;
    out.gl_Position.z = _249;
    out.gl_Position.w = _251;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

