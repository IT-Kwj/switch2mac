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
    constant _16* vp_c11 [[id(0)]];
    constant _16* vp_c7 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
};

struct main0_out
{
    float4 m_33 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_28 [[attribute(0)]];
    float4 m_30 [[attribute(8)]];
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
    float _47 = in.m_28.x;
    float _49 = in.m_28.y;
    float _51 = in.m_28.z;
    float _53 = _49 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _55 = _49 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _57 = _49 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _59 = fma(_47, (*spvDescriptorSet0.vp_c7)._m0[2].x, _53);
    float _61 = fma(_47, (*spvDescriptorSet0.vp_c7)._m0[0].x, _55);
    float _63 = fma(_47, (*spvDescriptorSet0.vp_c7)._m0[1].x, _57);
    float _65 = fma(_51, (*spvDescriptorSet0.vp_c7)._m0[2].z, _59);
    float _67 = fma(_51, (*spvDescriptorSet0.vp_c7)._m0[0].z, _61);
    float _69 = fma(_51, (*spvDescriptorSet0.vp_c7)._m0[1].z, _63);
    float _71 = _65 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _73 = _67 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _75 = _69 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _77 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _79 = _71 + _77;
    float _81 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _83 = _73 + _81;
    float _85 = _75 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _87 = _79 * _79;
    float _89 = fma(_73, (*spvDescriptorSet0.vp_c4)._m0[2].x, _85);
    float _91 = fma(_83, _83, _87);
    float _93 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[2].z, _89);
    float _95 = sqrt(_91);
    float _97 = _93 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _101 = _95 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _103 = _51;
    float _105 = _93;
    float _107 = _75;
    float _109 = _97;
    if (!_101)
    {
        _103 = _73;
    }
    float _111 = _103;
    float _113 = _111;
    if (!_101)
    {
        _105 = _71;
    }
    float _115 = _105;
    bool _117 = !_101;
    float _119 = _115;
    if (!_117)
    {
        float _121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _123 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _125 = _95 + _123;
        float _127 = rsqrt(_91);
        float _129 = _125 * _121;
        float _131 = _75 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _133 = _129 * 0.15915493667125701904296875;
        float _135 = _133 * 6.283185482025146484375;
        float _137 = cos(_135);
        float _139 = _133 * 6.283185482025146484375;
        float _141 = sin(_139);
        float _143 = _137 + (-1.0);
        float _145 = _143 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _147 = fma(_141, _131, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _149 = fma(_75, _137, _145);
        float _151 = _127 * _147;
        float _153 = _149 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _155 = fma(_83, _151, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _157 = fma(_79, _151, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _159 = fma(_155, (*spvDescriptorSet0.vp_c4)._m0[2].x, _153);
        float _161 = fma(_157, (*spvDescriptorSet0.vp_c4)._m0[2].z, _159);
        float _163 = _161 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _107 = _149;
        _113 = _155;
        _119 = _157;
        _109 = _163;
    }
    float _165 = _107;
    float _167 = _113;
    float _169 = _119;
    float _171 = _109;
    float _173 = _165 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _175 = _165 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _177 = in.m_30.x;
    float _179 = in.m_30.y;
    float _181 = fma(_167, (*spvDescriptorSet0.vp_c4)._m0[1].x, _173);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c4)._m0[0].x, _175);
    float _185 = fma(_169, (*spvDescriptorSet0.vp_c4)._m0[1].z, _181);
    float _187 = fma(_169, (*spvDescriptorSet0.vp_c4)._m0[0].z, _183);
    float _189 = _185 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _191 = _187 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _193 = _189 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _195 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[9].x, _193);
    float _197 = _189 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _199 = fma(_171, (*spvDescriptorSet0.vp_c4)._m0[9].z, _195);
    float _201 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[10].x, _197);
    float _203 = _179 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    float _205 = _179 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _207 = _199 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _209 = fma(_171, (*spvDescriptorSet0.vp_c4)._m0[10].z, _201);
    float _211 = fma(_177, (*spvDescriptorSet0.vp_c11)._m0[21].z, _205);
    float _213 = _207 * 10000.0;
    float _215 = precise::clamp(_213, 0.0, 1.0);
    float _217 = _209 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _219 = _215 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _221 = _189 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _223 = _189 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _225 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[10].z, _217);
    float _227 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[7].x, _221);
    float _229 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[8].x, _223);
    float _231 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[9].z, _207);
    float _233 = 1.0 / _225;
    float _235 = -_203;
    float _237 = fma(_177, (*spvDescriptorSet0.vp_c11)._m0[21].w, _235);
    float _239 = fma(_171, (*spvDescriptorSet0.vp_c4)._m0[7].z, _227);
    float _241 = fma(_171, (*spvDescriptorSet0.vp_c4)._m0[8].z, _229);
    float _243 = _237 + (*spvDescriptorSet0.vp_c11)._m0[21].x;
    float _245 = _239 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _247 = _241 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _249 = _211 + (*spvDescriptorSet0.vp_c11)._m0[21].y;
    out.m_33.x = _243;
    out.m_33.y = _249;
    float _251 = _217 * _233;
    float _253 = _231 * _251;
    out.gl_Position.x = _245;
    out.gl_Position.y = _247;
    out.gl_Position.z = _253;
    out.gl_Position.w = _217;
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
    float _47 = in.m_28.x;
    float _49 = in.m_28.y;
    float _51 = in.m_28.z;
    float _53 = _49 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _55 = _49 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _57 = _49 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _59 = fma(_47, (*spvDescriptorSet0.vp_c7)._m0[2].x, _53);
    float _61 = fma(_47, (*spvDescriptorSet0.vp_c7)._m0[0].x, _55);
    float _63 = fma(_47, (*spvDescriptorSet0.vp_c7)._m0[1].x, _57);
    float _65 = fma(_51, (*spvDescriptorSet0.vp_c7)._m0[2].z, _59);
    float _67 = fma(_51, (*spvDescriptorSet0.vp_c7)._m0[0].z, _61);
    float _69 = fma(_51, (*spvDescriptorSet0.vp_c7)._m0[1].z, _63);
    float _71 = _65 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _73 = _67 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _75 = _69 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _77 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _79 = _71 + _77;
    float _81 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _83 = _73 + _81;
    float _85 = _75 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _87 = _79 * _79;
    float _89 = fma(_73, (*spvDescriptorSet0.vp_c4)._m0[2].x, _85);
    float _91 = fma(_83, _83, _87);
    float _93 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[2].z, _89);
    float _95 = sqrt(_91);
    float _97 = _93 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _101 = _95 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _103 = _51;
    float _105 = _93;
    float _107 = _75;
    float _109 = _97;
    if (!_101)
    {
        _103 = _73;
    }
    float _111 = _103;
    float _113 = _111;
    if (!_101)
    {
        _105 = _71;
    }
    float _115 = _105;
    bool _117 = !_101;
    float _119 = _115;
    if (!_117)
    {
        float _121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _123 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _125 = _95 + _123;
        float _127 = rsqrt(_91);
        float _129 = _125 * _121;
        float _131 = _75 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _133 = _129 * 0.15915493667125701904296875;
        float _135 = _133 * 6.283185482025146484375;
        float _137 = cos(_135);
        float _139 = _133 * 6.283185482025146484375;
        float _141 = sin(_139);
        float _143 = _137 + (-1.0);
        float _145 = _143 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _147 = fma(_141, _131, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _149 = fma(_75, _137, _145);
        float _151 = _127 * _147;
        float _153 = _149 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _155 = fma(_83, _151, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _157 = fma(_79, _151, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _159 = fma(_155, (*spvDescriptorSet0.vp_c4)._m0[2].x, _153);
        float _161 = fma(_157, (*spvDescriptorSet0.vp_c4)._m0[2].z, _159);
        float _163 = _161 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _107 = _149;
        _113 = _155;
        _119 = _157;
        _109 = _163;
    }
    float _165 = _107;
    float _167 = _113;
    float _169 = _119;
    float _171 = _109;
    float _173 = _165 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _175 = _165 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _177 = in.m_30.x;
    float _179 = in.m_30.y;
    float _181 = fma(_167, (*spvDescriptorSet0.vp_c4)._m0[1].x, _173);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c4)._m0[0].x, _175);
    float _185 = fma(_169, (*spvDescriptorSet0.vp_c4)._m0[1].z, _181);
    float _187 = fma(_169, (*spvDescriptorSet0.vp_c4)._m0[0].z, _183);
    float _189 = _185 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _191 = _187 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _193 = _189 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _195 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[9].x, _193);
    float _197 = _189 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _199 = fma(_171, (*spvDescriptorSet0.vp_c4)._m0[9].z, _195);
    float _201 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[10].x, _197);
    float _203 = _179 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    float _205 = _179 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _207 = _199 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _209 = fma(_171, (*spvDescriptorSet0.vp_c4)._m0[10].z, _201);
    float _211 = fma(_177, (*spvDescriptorSet0.vp_c11)._m0[21].z, _205);
    float _213 = _207 * 10000.0;
    float _215 = precise::clamp(_213, 0.0, 1.0);
    float _217 = _209 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _219 = _215 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _221 = _189 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _223 = _189 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _225 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[10].z, _217);
    float _227 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[7].x, _221);
    float _229 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[8].x, _223);
    float _231 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[9].z, _207);
    float _233 = 1.0 / _225;
    float _235 = -_203;
    float _237 = fma(_177, (*spvDescriptorSet0.vp_c11)._m0[21].w, _235);
    float _239 = fma(_171, (*spvDescriptorSet0.vp_c4)._m0[7].z, _227);
    float _241 = fma(_171, (*spvDescriptorSet0.vp_c4)._m0[8].z, _229);
    float _243 = _237 + (*spvDescriptorSet0.vp_c11)._m0[21].x;
    float _245 = _239 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _247 = _241 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _249 = _211 + (*spvDescriptorSet0.vp_c11)._m0[21].y;
    out.m_33.x = _243;
    out.m_33.y = _249;
    float _251 = _217 * _233;
    float _253 = _231 * _251;
    out.gl_Position.x = _245;
    out.gl_Position.y = _247;
    out.gl_Position.z = _253;
    out.gl_Position.w = _217;
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
    float _47 = in.m_28.x;
    float _49 = in.m_28.y;
    float _51 = in.m_28.z;
    float _53 = _49 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _55 = _49 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _57 = _49 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _59 = fma(_47, (*spvDescriptorSet0.vp_c7)._m0[2].x, _53);
    float _61 = fma(_47, (*spvDescriptorSet0.vp_c7)._m0[0].x, _55);
    float _63 = fma(_47, (*spvDescriptorSet0.vp_c7)._m0[1].x, _57);
    float _65 = fma(_51, (*spvDescriptorSet0.vp_c7)._m0[2].z, _59);
    float _67 = fma(_51, (*spvDescriptorSet0.vp_c7)._m0[0].z, _61);
    float _69 = fma(_51, (*spvDescriptorSet0.vp_c7)._m0[1].z, _63);
    float _71 = _65 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _73 = _67 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _75 = _69 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _77 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _79 = _71 + _77;
    float _81 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _83 = _73 + _81;
    float _85 = _75 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _87 = _79 * _79;
    float _89 = fma(_73, (*spvDescriptorSet0.vp_c4)._m0[2].x, _85);
    float _91 = fma(_83, _83, _87);
    float _93 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[2].z, _89);
    float _95 = sqrt(_91);
    float _97 = _93 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _101 = _95 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _103 = _51;
    float _105 = _93;
    float _107 = _75;
    float _109 = _97;
    if (!_101)
    {
        _103 = _73;
    }
    float _111 = _103;
    float _113 = _111;
    if (!_101)
    {
        _105 = _71;
    }
    float _115 = _105;
    bool _117 = !_101;
    float _119 = _115;
    if (!_117)
    {
        float _121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _123 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _125 = _95 + _123;
        float _127 = rsqrt(_91);
        float _129 = _125 * _121;
        float _131 = _75 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _133 = _129 * 0.15915493667125701904296875;
        float _135 = _133 * 6.283185482025146484375;
        float _137 = cos(_135);
        float _139 = _133 * 6.283185482025146484375;
        float _141 = sin(_139);
        float _143 = _137 + (-1.0);
        float _145 = _143 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _147 = fma(_141, _131, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _149 = fma(_75, _137, _145);
        float _151 = _127 * _147;
        float _153 = _149 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _155 = fma(_83, _151, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _157 = fma(_79, _151, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _159 = fma(_155, (*spvDescriptorSet0.vp_c4)._m0[2].x, _153);
        float _161 = fma(_157, (*spvDescriptorSet0.vp_c4)._m0[2].z, _159);
        float _163 = _161 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _107 = _149;
        _113 = _155;
        _119 = _157;
        _109 = _163;
    }
    float _165 = _107;
    float _167 = _113;
    float _169 = _119;
    float _171 = _109;
    float _173 = _165 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _175 = _165 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _177 = in.m_30.x;
    float _179 = in.m_30.y;
    float _181 = fma(_167, (*spvDescriptorSet0.vp_c4)._m0[1].x, _173);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c4)._m0[0].x, _175);
    float _185 = fma(_169, (*spvDescriptorSet0.vp_c4)._m0[1].z, _181);
    float _187 = fma(_169, (*spvDescriptorSet0.vp_c4)._m0[0].z, _183);
    float _189 = _185 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _191 = _187 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _193 = _189 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _195 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[9].x, _193);
    float _197 = _189 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _199 = fma(_171, (*spvDescriptorSet0.vp_c4)._m0[9].z, _195);
    float _201 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[10].x, _197);
    float _203 = _179 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    float _205 = _179 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _207 = _199 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _209 = fma(_171, (*spvDescriptorSet0.vp_c4)._m0[10].z, _201);
    float _211 = fma(_177, (*spvDescriptorSet0.vp_c11)._m0[21].z, _205);
    float _213 = _207 * 10000.0;
    float _215 = precise::clamp(_213, 0.0, 1.0);
    float _217 = _209 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _219 = _215 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _221 = _189 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _223 = _189 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _225 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[10].z, _217);
    float _227 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[7].x, _221);
    float _229 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[8].x, _223);
    float _231 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[9].z, _207);
    float _233 = 1.0 / _225;
    float _235 = -_203;
    float _237 = fma(_177, (*spvDescriptorSet0.vp_c11)._m0[21].w, _235);
    float _239 = fma(_171, (*spvDescriptorSet0.vp_c4)._m0[7].z, _227);
    float _241 = fma(_171, (*spvDescriptorSet0.vp_c4)._m0[8].z, _229);
    float _243 = _237 + (*spvDescriptorSet0.vp_c11)._m0[21].x;
    float _245 = _239 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _247 = _241 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _249 = _211 + (*spvDescriptorSet0.vp_c11)._m0[21].y;
    out.m_33.x = _243;
    out.m_33.y = _249;
    float _251 = _217 * _233;
    float _253 = _231 * _251;
    out.gl_Position.x = _245;
    out.gl_Position.y = _247;
    out.gl_Position.z = _253;
    out.gl_Position.w = _217;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

