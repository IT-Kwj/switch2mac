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
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c4 [[id(2)]];
};

struct main0_out
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = in.m_26.x;
    float _51 = in.m_26.y;
    float _53 = in.m_26.z;
    float _55 = in.m_28.x;
    float _57 = _51 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _59 = _51 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _61 = fma(_49, (*spvDescriptorSet0.vp_c7)._m0[2].x, _57);
    float _63 = fma(_49, (*spvDescriptorSet0.vp_c7)._m0[0].x, _59);
    float _65 = fma(_53, (*spvDescriptorSet0.vp_c7)._m0[2].z, _61);
    float _67 = fma(_53, (*spvDescriptorSet0.vp_c7)._m0[0].z, _63);
    float _69 = _51 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _71 = _65 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _73 = _67 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _75 = fma(_49, (*spvDescriptorSet0.vp_c7)._m0[1].x, _69);
    float _77 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _79 = _71 + _77;
    float _81 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _83 = _73 + _81;
    float _85 = fma(_53, (*spvDescriptorSet0.vp_c7)._m0[1].z, _75);
    float _87 = _79 * _79;
    float _89 = _85 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _91 = fma(_83, _83, _87);
    float _93 = _89 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _95 = sqrt(_91);
    float _97 = fma(_73, (*spvDescriptorSet0.vp_c4)._m0[2].x, _93);
    float _99 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[2].z, _97);
    float _101 = _99 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _105 = _95 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _107 = _53;
    float _109 = _51;
    float _111 = _49;
    float _113 = _99;
    if (!_105)
    {
        _107 = _101;
    }
    float _115 = _107;
    float _117 = _115;
    if (!_105)
    {
        _109 = _73;
    }
    float _119 = _109;
    float _121 = _119;
    if (!_105)
    {
        _111 = _89;
    }
    float _123 = _111;
    float _125 = _123;
    if (!_105)
    {
        _113 = _71;
    }
    float _127 = _113;
    bool _129 = !_105;
    float _131 = _127;
    if (!_129)
    {
        float _133 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _135 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _137 = _95 + _135;
        float _139 = _89 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _141 = rsqrt(_91);
        float _143 = _137 * _133;
        float _145 = _143 * 0.15915493667125701904296875;
        float _147 = _145 * 6.283185482025146484375;
        float _149 = cos(_147);
        float _151 = _145 * 6.283185482025146484375;
        float _153 = sin(_151);
        float _155 = _149 + (-1.0);
        float _157 = fma(_153, _139, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _159 = _155 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _161 = _141 * _157;
        float _163 = fma(_89, _149, _159);
        float _165 = fma(_83, _161, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _167 = _163 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _169 = fma(_79, _161, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _171 = fma(_165, (*spvDescriptorSet0.vp_c4)._m0[2].x, _167);
        float _173 = fma(_169, (*spvDescriptorSet0.vp_c4)._m0[2].z, _171);
        float _175 = _173 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _125 = _163;
        _121 = _165;
        _131 = _169;
        _117 = _175;
    }
    float _177 = _125;
    float _179 = _121;
    float _181 = _131;
    float _183 = _117;
    float _185 = _177 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _187 = _177 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _189 = in.m_28.y;
    float _191 = fma(_179, (*spvDescriptorSet0.vp_c4)._m0[1].x, _185);
    float _193 = fma(_179, (*spvDescriptorSet0.vp_c4)._m0[0].x, _187);
    out.m_31.x = _55;
    float _195 = fma(_181, (*spvDescriptorSet0.vp_c4)._m0[1].z, _191);
    float _197 = fma(_181, (*spvDescriptorSet0.vp_c4)._m0[0].z, _193);
    out.m_33.x = _73;
    out.m_33.y = _89;
    out.m_33.z = _71;
    float _199 = _195 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _201 = _197 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_35.w = _101;
    float _203 = _199 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _205 = _199 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _207 = _199 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _209 = _199 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _211 = fma(_201, (*spvDescriptorSet0.vp_c4)._m0[7].x, _203);
    float _213 = fma(_201, (*spvDescriptorSet0.vp_c4)._m0[8].x, _205);
    float _215 = fma(_201, (*spvDescriptorSet0.vp_c4)._m0[9].x, _207);
    float _217 = fma(_201, (*spvDescriptorSet0.vp_c4)._m0[10].x, _209);
    float _219 = fma(_183, (*spvDescriptorSet0.vp_c4)._m0[7].z, _211);
    float _221 = fma(_183, (*spvDescriptorSet0.vp_c4)._m0[8].z, _213);
    float _223 = fma(_183, (*spvDescriptorSet0.vp_c4)._m0[9].z, _215);
    float _225 = fma(_183, (*spvDescriptorSet0.vp_c4)._m0[10].z, _217);
    float _227 = _219 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _229 = _221 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _231 = _223 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _233 = _225 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_31.y = _189;
    out.gl_Position.x = _227;
    out.gl_Position.y = _229;
    out.gl_Position.z = _231;
    out.gl_Position.w = _233;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = in.m_26.x;
    float _51 = in.m_26.y;
    float _53 = in.m_26.z;
    float _55 = in.m_28.x;
    float _57 = _51 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _59 = _51 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _61 = fma(_49, (*spvDescriptorSet0.vp_c7)._m0[2].x, _57);
    float _63 = fma(_49, (*spvDescriptorSet0.vp_c7)._m0[0].x, _59);
    float _65 = fma(_53, (*spvDescriptorSet0.vp_c7)._m0[2].z, _61);
    float _67 = fma(_53, (*spvDescriptorSet0.vp_c7)._m0[0].z, _63);
    float _69 = _51 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _71 = _65 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _73 = _67 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _75 = fma(_49, (*spvDescriptorSet0.vp_c7)._m0[1].x, _69);
    float _77 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _79 = _71 + _77;
    float _81 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _83 = _73 + _81;
    float _85 = fma(_53, (*spvDescriptorSet0.vp_c7)._m0[1].z, _75);
    float _87 = _79 * _79;
    float _89 = _85 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _91 = fma(_83, _83, _87);
    float _93 = _89 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _95 = sqrt(_91);
    float _97 = fma(_73, (*spvDescriptorSet0.vp_c4)._m0[2].x, _93);
    float _99 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[2].z, _97);
    float _101 = _99 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _105 = _95 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _107 = _53;
    float _109 = _51;
    float _111 = _49;
    float _113 = _99;
    if (!_105)
    {
        _107 = _101;
    }
    float _115 = _107;
    float _117 = _115;
    if (!_105)
    {
        _109 = _73;
    }
    float _119 = _109;
    float _121 = _119;
    if (!_105)
    {
        _111 = _89;
    }
    float _123 = _111;
    float _125 = _123;
    if (!_105)
    {
        _113 = _71;
    }
    float _127 = _113;
    bool _129 = !_105;
    float _131 = _127;
    if (!_129)
    {
        float _133 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _135 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _137 = _95 + _135;
        float _139 = _89 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _141 = rsqrt(_91);
        float _143 = _137 * _133;
        float _145 = _143 * 0.15915493667125701904296875;
        float _147 = _145 * 6.283185482025146484375;
        float _149 = cos(_147);
        float _151 = _145 * 6.283185482025146484375;
        float _153 = sin(_151);
        float _155 = _149 + (-1.0);
        float _157 = fma(_153, _139, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _159 = _155 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _161 = _141 * _157;
        float _163 = fma(_89, _149, _159);
        float _165 = fma(_83, _161, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _167 = _163 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _169 = fma(_79, _161, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _171 = fma(_165, (*spvDescriptorSet0.vp_c4)._m0[2].x, _167);
        float _173 = fma(_169, (*spvDescriptorSet0.vp_c4)._m0[2].z, _171);
        float _175 = _173 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _125 = _163;
        _121 = _165;
        _131 = _169;
        _117 = _175;
    }
    float _177 = _125;
    float _179 = _121;
    float _181 = _131;
    float _183 = _117;
    float _185 = _177 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _187 = _177 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _189 = in.m_28.y;
    float _191 = fma(_179, (*spvDescriptorSet0.vp_c4)._m0[1].x, _185);
    float _193 = fma(_179, (*spvDescriptorSet0.vp_c4)._m0[0].x, _187);
    out.m_31.x = _55;
    float _195 = fma(_181, (*spvDescriptorSet0.vp_c4)._m0[1].z, _191);
    float _197 = fma(_181, (*spvDescriptorSet0.vp_c4)._m0[0].z, _193);
    out.m_33.x = _73;
    out.m_33.y = _89;
    out.m_33.z = _71;
    float _199 = _195 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _201 = _197 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_35.w = _101;
    float _203 = _199 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _205 = _199 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _207 = _199 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _209 = _199 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _211 = fma(_201, (*spvDescriptorSet0.vp_c4)._m0[7].x, _203);
    float _213 = fma(_201, (*spvDescriptorSet0.vp_c4)._m0[8].x, _205);
    float _215 = fma(_201, (*spvDescriptorSet0.vp_c4)._m0[9].x, _207);
    float _217 = fma(_201, (*spvDescriptorSet0.vp_c4)._m0[10].x, _209);
    float _219 = fma(_183, (*spvDescriptorSet0.vp_c4)._m0[7].z, _211);
    float _221 = fma(_183, (*spvDescriptorSet0.vp_c4)._m0[8].z, _213);
    float _223 = fma(_183, (*spvDescriptorSet0.vp_c4)._m0[9].z, _215);
    float _225 = fma(_183, (*spvDescriptorSet0.vp_c4)._m0[10].z, _217);
    float _227 = _219 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _229 = _221 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _231 = _223 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _233 = _225 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_31.y = _189;
    out.gl_Position.x = _227;
    out.gl_Position.y = _229;
    out.gl_Position.z = _231;
    out.gl_Position.w = _233;
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = in.m_26.x;
    float _51 = in.m_26.y;
    float _53 = in.m_26.z;
    float _55 = in.m_28.x;
    float _57 = _51 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _59 = _51 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _61 = fma(_49, (*spvDescriptorSet0.vp_c7)._m0[2].x, _57);
    float _63 = fma(_49, (*spvDescriptorSet0.vp_c7)._m0[0].x, _59);
    float _65 = fma(_53, (*spvDescriptorSet0.vp_c7)._m0[2].z, _61);
    float _67 = fma(_53, (*spvDescriptorSet0.vp_c7)._m0[0].z, _63);
    float _69 = _51 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _71 = _65 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _73 = _67 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _75 = fma(_49, (*spvDescriptorSet0.vp_c7)._m0[1].x, _69);
    float _77 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _79 = _71 + _77;
    float _81 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _83 = _73 + _81;
    float _85 = fma(_53, (*spvDescriptorSet0.vp_c7)._m0[1].z, _75);
    float _87 = _79 * _79;
    float _89 = _85 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _91 = fma(_83, _83, _87);
    float _93 = _89 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _95 = sqrt(_91);
    float _97 = fma(_73, (*spvDescriptorSet0.vp_c4)._m0[2].x, _93);
    float _99 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[2].z, _97);
    float _101 = _99 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _105 = _95 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _107 = _53;
    float _109 = _51;
    float _111 = _49;
    float _113 = _99;
    if (!_105)
    {
        _107 = _101;
    }
    float _115 = _107;
    float _117 = _115;
    if (!_105)
    {
        _109 = _73;
    }
    float _119 = _109;
    float _121 = _119;
    if (!_105)
    {
        _111 = _89;
    }
    float _123 = _111;
    float _125 = _123;
    if (!_105)
    {
        _113 = _71;
    }
    float _127 = _113;
    bool _129 = !_105;
    float _131 = _127;
    if (!_129)
    {
        float _133 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _135 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _137 = _95 + _135;
        float _139 = _89 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _141 = rsqrt(_91);
        float _143 = _137 * _133;
        float _145 = _143 * 0.15915493667125701904296875;
        float _147 = _145 * 6.283185482025146484375;
        float _149 = cos(_147);
        float _151 = _145 * 6.283185482025146484375;
        float _153 = sin(_151);
        float _155 = _149 + (-1.0);
        float _157 = fma(_153, _139, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _159 = _155 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _161 = _141 * _157;
        float _163 = fma(_89, _149, _159);
        float _165 = fma(_83, _161, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _167 = _163 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _169 = fma(_79, _161, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _171 = fma(_165, (*spvDescriptorSet0.vp_c4)._m0[2].x, _167);
        float _173 = fma(_169, (*spvDescriptorSet0.vp_c4)._m0[2].z, _171);
        float _175 = _173 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _125 = _163;
        _121 = _165;
        _131 = _169;
        _117 = _175;
    }
    float _177 = _125;
    float _179 = _121;
    float _181 = _131;
    float _183 = _117;
    float _185 = _177 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _187 = _177 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _189 = in.m_28.y;
    float _191 = fma(_179, (*spvDescriptorSet0.vp_c4)._m0[1].x, _185);
    float _193 = fma(_179, (*spvDescriptorSet0.vp_c4)._m0[0].x, _187);
    out.m_31.x = _55;
    float _195 = fma(_181, (*spvDescriptorSet0.vp_c4)._m0[1].z, _191);
    float _197 = fma(_181, (*spvDescriptorSet0.vp_c4)._m0[0].z, _193);
    out.m_33.x = _73;
    out.m_33.y = _89;
    out.m_33.z = _71;
    float _199 = _195 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _201 = _197 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_35.w = _101;
    float _203 = _199 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _205 = _199 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _207 = _199 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _209 = _199 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _211 = fma(_201, (*spvDescriptorSet0.vp_c4)._m0[7].x, _203);
    float _213 = fma(_201, (*spvDescriptorSet0.vp_c4)._m0[8].x, _205);
    float _215 = fma(_201, (*spvDescriptorSet0.vp_c4)._m0[9].x, _207);
    float _217 = fma(_201, (*spvDescriptorSet0.vp_c4)._m0[10].x, _209);
    float _219 = fma(_183, (*spvDescriptorSet0.vp_c4)._m0[7].z, _211);
    float _221 = fma(_183, (*spvDescriptorSet0.vp_c4)._m0[8].z, _213);
    float _223 = fma(_183, (*spvDescriptorSet0.vp_c4)._m0[9].z, _215);
    float _225 = fma(_183, (*spvDescriptorSet0.vp_c4)._m0[10].z, _217);
    float _227 = _219 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _229 = _221 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _231 = _223 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _233 = _225 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_31.y = _189;
    out.gl_Position.x = _227;
    out.gl_Position.y = _229;
    out.gl_Position.z = _231;
    out.gl_Position.w = _233;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

