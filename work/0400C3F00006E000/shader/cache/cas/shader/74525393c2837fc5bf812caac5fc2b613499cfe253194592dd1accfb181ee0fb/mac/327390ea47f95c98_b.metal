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
    float _125 = _115 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _127 = _119 * _119;
    float _129 = fma(_113, (*spvDescriptorSet0.vp_c4)._m0[2].x, _125);
    float _131 = fma(_123, _123, _127);
    float _133 = fma(_111, (*spvDescriptorSet0.vp_c4)._m0[2].z, _129);
    float _135 = sqrt(_131);
    float _137 = _133 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _141 = _135 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _143 = _61;
    float _145 = _57;
    float _147 = _115;
    float _149 = _137;
    if (!_141)
    {
        _143 = _113;
    }
    float _151 = _143;
    float _153 = _151;
    if (!_141)
    {
        _145 = _111;
    }
    float _155 = _145;
    bool _157 = !_141;
    float _159 = _155;
    if (!_157)
    {
        float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _163 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _165 = _135 + _163;
        float _167 = _115 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _169 = rsqrt(_131);
        float _171 = _165 * _161;
        float _173 = _171 * 0.15915493667125701904296875;
        float _175 = _173 * 6.283185482025146484375;
        float _177 = cos(_175);
        float _179 = _173 * 6.283185482025146484375;
        float _181 = sin(_179);
        float _183 = _177 + (-1.0);
        float _185 = _183 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _187 = fma(_181, _167, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _189 = fma(_115, _177, _185);
        float _191 = _169 * _187;
        float _193 = _189 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _195 = fma(_123, _191, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _197 = fma(_119, _191, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _199 = fma(_195, (*spvDescriptorSet0.vp_c4)._m0[2].x, _193);
        float _201 = fma(_197, (*spvDescriptorSet0.vp_c4)._m0[2].z, _199);
        float _203 = _201 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _147 = _189;
        _153 = _195;
        _159 = _197;
        _149 = _203;
    }
    float _205 = _147;
    float _207 = _153;
    float _209 = _159;
    float _211 = _149;
    float _213 = _205 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _215 = _205 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _217 = in.m_28.x;
    float _219 = fma(_207, (*spvDescriptorSet0.vp_c4)._m0[1].x, _213);
    float _221 = fma(_207, (*spvDescriptorSet0.vp_c4)._m0[0].x, _215);
    float _223 = in.m_28.y;
    float _225 = fma(_209, (*spvDescriptorSet0.vp_c4)._m0[1].z, _219);
    float _227 = fma(_209, (*spvDescriptorSet0.vp_c4)._m0[0].z, _221);
    float _229 = _225 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _231 = _227 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _233 = _229 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _235 = _229 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _237 = _229 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _239 = _229 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _241 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[8].x, _233);
    float _243 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[7].x, _235);
    float _245 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[9].x, _237);
    float _247 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[10].x, _239);
    float _249 = fma(_211, (*spvDescriptorSet0.vp_c4)._m0[8].z, _241);
    float _251 = fma(_211, (*spvDescriptorSet0.vp_c4)._m0[7].z, _243);
    float _253 = fma(_211, (*spvDescriptorSet0.vp_c4)._m0[9].z, _245);
    float _255 = fma(_211, (*spvDescriptorSet0.vp_c4)._m0[10].z, _247);
    float _257 = _251 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _259 = _249 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _261 = _253 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _263 = _255 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_31.x = _217;
    out.m_31.y = _223;
    out.gl_Position.x = _257;
    out.gl_Position.y = _259;
    out.gl_Position.z = _261;
    out.gl_Position.w = _263;
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
    float _125 = _115 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _127 = _119 * _119;
    float _129 = fma(_113, (*spvDescriptorSet0.vp_c4)._m0[2].x, _125);
    float _131 = fma(_123, _123, _127);
    float _133 = fma(_111, (*spvDescriptorSet0.vp_c4)._m0[2].z, _129);
    float _135 = sqrt(_131);
    float _137 = _133 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _141 = _135 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _143 = _61;
    float _145 = _57;
    float _147 = _115;
    float _149 = _137;
    if (!_141)
    {
        _143 = _113;
    }
    float _151 = _143;
    float _153 = _151;
    if (!_141)
    {
        _145 = _111;
    }
    float _155 = _145;
    bool _157 = !_141;
    float _159 = _155;
    if (!_157)
    {
        float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _163 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _165 = _135 + _163;
        float _167 = _115 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _169 = rsqrt(_131);
        float _171 = _165 * _161;
        float _173 = _171 * 0.15915493667125701904296875;
        float _175 = _173 * 6.283185482025146484375;
        float _177 = cos(_175);
        float _179 = _173 * 6.283185482025146484375;
        float _181 = sin(_179);
        float _183 = _177 + (-1.0);
        float _185 = _183 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _187 = fma(_181, _167, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _189 = fma(_115, _177, _185);
        float _191 = _169 * _187;
        float _193 = _189 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _195 = fma(_123, _191, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _197 = fma(_119, _191, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _199 = fma(_195, (*spvDescriptorSet0.vp_c4)._m0[2].x, _193);
        float _201 = fma(_197, (*spvDescriptorSet0.vp_c4)._m0[2].z, _199);
        float _203 = _201 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _147 = _189;
        _153 = _195;
        _159 = _197;
        _149 = _203;
    }
    float _205 = _147;
    float _207 = _153;
    float _209 = _159;
    float _211 = _149;
    float _213 = _205 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _215 = _205 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _217 = in.m_28.x;
    float _219 = fma(_207, (*spvDescriptorSet0.vp_c4)._m0[1].x, _213);
    float _221 = fma(_207, (*spvDescriptorSet0.vp_c4)._m0[0].x, _215);
    float _223 = in.m_28.y;
    float _225 = fma(_209, (*spvDescriptorSet0.vp_c4)._m0[1].z, _219);
    float _227 = fma(_209, (*spvDescriptorSet0.vp_c4)._m0[0].z, _221);
    float _229 = _225 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _231 = _227 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _233 = _229 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _235 = _229 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _237 = _229 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _239 = _229 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _241 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[8].x, _233);
    float _243 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[7].x, _235);
    float _245 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[9].x, _237);
    float _247 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[10].x, _239);
    float _249 = fma(_211, (*spvDescriptorSet0.vp_c4)._m0[8].z, _241);
    float _251 = fma(_211, (*spvDescriptorSet0.vp_c4)._m0[7].z, _243);
    float _253 = fma(_211, (*spvDescriptorSet0.vp_c4)._m0[9].z, _245);
    float _255 = fma(_211, (*spvDescriptorSet0.vp_c4)._m0[10].z, _247);
    float _257 = _251 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _259 = _249 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _261 = _253 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _263 = _255 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_31.x = _217;
    out.m_31.y = _223;
    out.gl_Position.x = _257;
    out.gl_Position.y = _259;
    out.gl_Position.z = _261;
    out.gl_Position.w = _263;
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
    float _125 = _115 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _127 = _119 * _119;
    float _129 = fma(_113, (*spvDescriptorSet0.vp_c4)._m0[2].x, _125);
    float _131 = fma(_123, _123, _127);
    float _133 = fma(_111, (*spvDescriptorSet0.vp_c4)._m0[2].z, _129);
    float _135 = sqrt(_131);
    float _137 = _133 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _141 = _135 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _143 = _61;
    float _145 = _57;
    float _147 = _115;
    float _149 = _137;
    if (!_141)
    {
        _143 = _113;
    }
    float _151 = _143;
    float _153 = _151;
    if (!_141)
    {
        _145 = _111;
    }
    float _155 = _145;
    bool _157 = !_141;
    float _159 = _155;
    if (!_157)
    {
        float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _163 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _165 = _135 + _163;
        float _167 = _115 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _169 = rsqrt(_131);
        float _171 = _165 * _161;
        float _173 = _171 * 0.15915493667125701904296875;
        float _175 = _173 * 6.283185482025146484375;
        float _177 = cos(_175);
        float _179 = _173 * 6.283185482025146484375;
        float _181 = sin(_179);
        float _183 = _177 + (-1.0);
        float _185 = _183 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _187 = fma(_181, _167, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _189 = fma(_115, _177, _185);
        float _191 = _169 * _187;
        float _193 = _189 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _195 = fma(_123, _191, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _197 = fma(_119, _191, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _199 = fma(_195, (*spvDescriptorSet0.vp_c4)._m0[2].x, _193);
        float _201 = fma(_197, (*spvDescriptorSet0.vp_c4)._m0[2].z, _199);
        float _203 = _201 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _147 = _189;
        _153 = _195;
        _159 = _197;
        _149 = _203;
    }
    float _205 = _147;
    float _207 = _153;
    float _209 = _159;
    float _211 = _149;
    float _213 = _205 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _215 = _205 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _217 = in.m_28.x;
    float _219 = fma(_207, (*spvDescriptorSet0.vp_c4)._m0[1].x, _213);
    float _221 = fma(_207, (*spvDescriptorSet0.vp_c4)._m0[0].x, _215);
    float _223 = in.m_28.y;
    float _225 = fma(_209, (*spvDescriptorSet0.vp_c4)._m0[1].z, _219);
    float _227 = fma(_209, (*spvDescriptorSet0.vp_c4)._m0[0].z, _221);
    float _229 = _225 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _231 = _227 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _233 = _229 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _235 = _229 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _237 = _229 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _239 = _229 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _241 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[8].x, _233);
    float _243 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[7].x, _235);
    float _245 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[9].x, _237);
    float _247 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[10].x, _239);
    float _249 = fma(_211, (*spvDescriptorSet0.vp_c4)._m0[8].z, _241);
    float _251 = fma(_211, (*spvDescriptorSet0.vp_c4)._m0[7].z, _243);
    float _253 = fma(_211, (*spvDescriptorSet0.vp_c4)._m0[9].z, _245);
    float _255 = fma(_211, (*spvDescriptorSet0.vp_c4)._m0[10].z, _247);
    float _257 = _251 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _259 = _249 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _261 = _253 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _263 = _255 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_31.x = _217;
    out.m_31.y = _223;
    out.gl_Position.x = _257;
    out.gl_Position.y = _259;
    out.gl_Position.z = _261;
    out.gl_Position.w = _263;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

