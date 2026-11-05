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
    float _47 = (*spvDescriptorSet0.vp_c7)._m0[11].y * (*spvDescriptorSet0.vp_c11)._m0[41].w;
    float _49 = fma(_47, 0.00999999977648258209228515625, (*spvDescriptorSet0.vp_c9)._m0[983].y);
    float _51 = in.m_28.x;
    float _53 = in.m_28.y;
    float _55 = in.m_28.z;
    float _57 = _49 * (*spvDescriptorSet0.vp_c11)._m0[41].z;
    float _59 = _57 * 0.15915493667125701904296875;
    float _61 = _59 * 6.283185482025146484375;
    float _63 = cos(_61);
    float _65 = _59 * 6.283185482025146484375;
    float _67 = sin(_65);
    float _69 = _63 * _53;
    float _71 = _67 * _53;
    float _73 = fma(_67, _51, _69);
    float _75 = -_71;
    float _77 = fma(_63, _51, _75);
    float _79 = _73 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _81 = _73 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _83 = _73 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _85 = fma(_77, (*spvDescriptorSet0.vp_c7)._m0[2].x, _79);
    float _87 = fma(_77, (*spvDescriptorSet0.vp_c7)._m0[0].x, _81);
    float _89 = fma(_77, (*spvDescriptorSet0.vp_c7)._m0[1].x, _83);
    float _91 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[2].z, _85);
    float _93 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[0].z, _87);
    float _95 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[1].z, _89);
    float _97 = _91 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _99 = _93 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _101 = _95 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _103 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _105 = _97 + _103;
    float _107 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _109 = _99 + _107;
    float _111 = _101 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _113 = _105 * _105;
    float _115 = fma(_99, (*spvDescriptorSet0.vp_c4)._m0[2].x, _111);
    float _117 = fma(_109, _109, _113);
    float _119 = fma(_97, (*spvDescriptorSet0.vp_c4)._m0[2].z, _115);
    float _121 = sqrt(_117);
    float _123 = _119 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _127 = _121 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _129 = _111;
    float _131 = _101;
    float _133 = _97;
    float _135 = _123;
    if (!_127)
    {
        _129 = _99;
    }
    float _137 = _129;
    bool _139 = !_127;
    float _141 = _137;
    if (!_139)
    {
        float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _145 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _147 = _121 + _145;
        float _149 = rsqrt(_117);
        float _151 = _147 * _143;
        float _153 = _101 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _155 = _151 * 0.15915493667125701904296875;
        float _157 = _155 * 6.283185482025146484375;
        float _159 = cos(_157);
        float _161 = _155 * 6.283185482025146484375;
        float _163 = sin(_161);
        float _165 = _159 + (-1.0);
        float _167 = _165 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _169 = fma(_163, _153, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _171 = fma(_101, _159, _167);
        float _173 = _149 * _169;
        float _175 = _171 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _177 = fma(_109, _173, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _179 = fma(_105, _173, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _181 = fma(_177, (*spvDescriptorSet0.vp_c4)._m0[2].x, _175);
        float _183 = fma(_179, (*spvDescriptorSet0.vp_c4)._m0[2].z, _181);
        float _185 = _183 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _131 = _171;
        _141 = _177;
        _133 = _179;
        _135 = _185;
    }
    float _187 = _131;
    float _189 = _141;
    float _191 = _133;
    float _193 = _135;
    float _195 = _187 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _197 = _187 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _199 = in.m_30.x;
    float _201 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[1].x, _195);
    float _203 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[0].x, _197);
    float _205 = in.m_30.y;
    float _207 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[1].z, _201);
    float _209 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[0].z, _203);
    float _211 = _207 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _213 = _209 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _215 = _211 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _217 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[9].x, _215);
    float _219 = _211 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _221 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[9].z, _217);
    float _223 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[10].x, _219);
    out.m_33.x = _199;
    float _225 = _221 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _227 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[10].z, _223);
    out.m_33.y = _205;
    float _229 = _225 * 10000.0;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = _227 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _235 = _231 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _237 = _211 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _239 = _211 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _241 = fma(_235, (*spvDescriptorSet0.vp_c4)._m0[10].z, _233);
    float _243 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[7].x, _237);
    float _245 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[8].x, _239);
    float _247 = fma(_235, (*spvDescriptorSet0.vp_c4)._m0[9].z, _225);
    float _249 = 1.0 / _241;
    float _251 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[7].z, _243);
    float _253 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[8].z, _245);
    float _255 = _251 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _257 = _253 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _259 = _233 * _249;
    float _261 = _247 * _259;
    out.gl_Position.x = _255;
    out.gl_Position.y = _257;
    out.gl_Position.z = _261;
    out.gl_Position.w = _233;
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
    float _47 = (*spvDescriptorSet0.vp_c7)._m0[11].y * (*spvDescriptorSet0.vp_c11)._m0[41].w;
    float _49 = fma(_47, 0.00999999977648258209228515625, (*spvDescriptorSet0.vp_c9)._m0[983].y);
    float _51 = in.m_28.x;
    float _53 = in.m_28.y;
    float _55 = in.m_28.z;
    float _57 = _49 * (*spvDescriptorSet0.vp_c11)._m0[41].z;
    float _59 = _57 * 0.15915493667125701904296875;
    float _61 = _59 * 6.283185482025146484375;
    float _63 = cos(_61);
    float _65 = _59 * 6.283185482025146484375;
    float _67 = sin(_65);
    float _69 = _63 * _53;
    float _71 = _67 * _53;
    float _73 = fma(_67, _51, _69);
    float _75 = -_71;
    float _77 = fma(_63, _51, _75);
    float _79 = _73 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _81 = _73 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _83 = _73 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _85 = fma(_77, (*spvDescriptorSet0.vp_c7)._m0[2].x, _79);
    float _87 = fma(_77, (*spvDescriptorSet0.vp_c7)._m0[0].x, _81);
    float _89 = fma(_77, (*spvDescriptorSet0.vp_c7)._m0[1].x, _83);
    float _91 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[2].z, _85);
    float _93 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[0].z, _87);
    float _95 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[1].z, _89);
    float _97 = _91 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _99 = _93 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _101 = _95 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _103 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _105 = _97 + _103;
    float _107 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _109 = _99 + _107;
    float _111 = _101 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _113 = _105 * _105;
    float _115 = fma(_99, (*spvDescriptorSet0.vp_c4)._m0[2].x, _111);
    float _117 = fma(_109, _109, _113);
    float _119 = fma(_97, (*spvDescriptorSet0.vp_c4)._m0[2].z, _115);
    float _121 = sqrt(_117);
    float _123 = _119 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _127 = _121 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _129 = _111;
    float _131 = _101;
    float _133 = _97;
    float _135 = _123;
    if (!_127)
    {
        _129 = _99;
    }
    float _137 = _129;
    bool _139 = !_127;
    float _141 = _137;
    if (!_139)
    {
        float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _145 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _147 = _121 + _145;
        float _149 = rsqrt(_117);
        float _151 = _147 * _143;
        float _153 = _101 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _155 = _151 * 0.15915493667125701904296875;
        float _157 = _155 * 6.283185482025146484375;
        float _159 = cos(_157);
        float _161 = _155 * 6.283185482025146484375;
        float _163 = sin(_161);
        float _165 = _159 + (-1.0);
        float _167 = _165 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _169 = fma(_163, _153, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _171 = fma(_101, _159, _167);
        float _173 = _149 * _169;
        float _175 = _171 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _177 = fma(_109, _173, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _179 = fma(_105, _173, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _181 = fma(_177, (*spvDescriptorSet0.vp_c4)._m0[2].x, _175);
        float _183 = fma(_179, (*spvDescriptorSet0.vp_c4)._m0[2].z, _181);
        float _185 = _183 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _131 = _171;
        _141 = _177;
        _133 = _179;
        _135 = _185;
    }
    float _187 = _131;
    float _189 = _141;
    float _191 = _133;
    float _193 = _135;
    float _195 = _187 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _197 = _187 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _199 = in.m_30.x;
    float _201 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[1].x, _195);
    float _203 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[0].x, _197);
    float _205 = in.m_30.y;
    float _207 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[1].z, _201);
    float _209 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[0].z, _203);
    float _211 = _207 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _213 = _209 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _215 = _211 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _217 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[9].x, _215);
    float _219 = _211 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _221 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[9].z, _217);
    float _223 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[10].x, _219);
    out.m_33.x = _199;
    float _225 = _221 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _227 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[10].z, _223);
    out.m_33.y = _205;
    float _229 = _225 * 10000.0;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = _227 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _235 = _231 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _237 = _211 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _239 = _211 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _241 = fma(_235, (*spvDescriptorSet0.vp_c4)._m0[10].z, _233);
    float _243 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[7].x, _237);
    float _245 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[8].x, _239);
    float _247 = fma(_235, (*spvDescriptorSet0.vp_c4)._m0[9].z, _225);
    float _249 = 1.0 / _241;
    float _251 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[7].z, _243);
    float _253 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[8].z, _245);
    float _255 = _251 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _257 = _253 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _259 = _233 * _249;
    float _261 = _247 * _259;
    out.gl_Position.x = _255;
    out.gl_Position.y = _257;
    out.gl_Position.z = _261;
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = (*spvDescriptorSet0.vp_c7)._m0[11].y * (*spvDescriptorSet0.vp_c11)._m0[41].w;
    float _49 = fma(_47, 0.00999999977648258209228515625, (*spvDescriptorSet0.vp_c9)._m0[983].y);
    float _51 = in.m_28.x;
    float _53 = in.m_28.y;
    float _55 = in.m_28.z;
    float _57 = _49 * (*spvDescriptorSet0.vp_c11)._m0[41].z;
    float _59 = _57 * 0.15915493667125701904296875;
    float _61 = _59 * 6.283185482025146484375;
    float _63 = cos(_61);
    float _65 = _59 * 6.283185482025146484375;
    float _67 = sin(_65);
    float _69 = _63 * _53;
    float _71 = _67 * _53;
    float _73 = fma(_67, _51, _69);
    float _75 = -_71;
    float _77 = fma(_63, _51, _75);
    float _79 = _73 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _81 = _73 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _83 = _73 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _85 = fma(_77, (*spvDescriptorSet0.vp_c7)._m0[2].x, _79);
    float _87 = fma(_77, (*spvDescriptorSet0.vp_c7)._m0[0].x, _81);
    float _89 = fma(_77, (*spvDescriptorSet0.vp_c7)._m0[1].x, _83);
    float _91 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[2].z, _85);
    float _93 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[0].z, _87);
    float _95 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[1].z, _89);
    float _97 = _91 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _99 = _93 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _101 = _95 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _103 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _105 = _97 + _103;
    float _107 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _109 = _99 + _107;
    float _111 = _101 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _113 = _105 * _105;
    float _115 = fma(_99, (*spvDescriptorSet0.vp_c4)._m0[2].x, _111);
    float _117 = fma(_109, _109, _113);
    float _119 = fma(_97, (*spvDescriptorSet0.vp_c4)._m0[2].z, _115);
    float _121 = sqrt(_117);
    float _123 = _119 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _127 = _121 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _129 = _111;
    float _131 = _101;
    float _133 = _97;
    float _135 = _123;
    if (!_127)
    {
        _129 = _99;
    }
    float _137 = _129;
    bool _139 = !_127;
    float _141 = _137;
    if (!_139)
    {
        float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _145 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _147 = _121 + _145;
        float _149 = rsqrt(_117);
        float _151 = _147 * _143;
        float _153 = _101 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _155 = _151 * 0.15915493667125701904296875;
        float _157 = _155 * 6.283185482025146484375;
        float _159 = cos(_157);
        float _161 = _155 * 6.283185482025146484375;
        float _163 = sin(_161);
        float _165 = _159 + (-1.0);
        float _167 = _165 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _169 = fma(_163, _153, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _171 = fma(_101, _159, _167);
        float _173 = _149 * _169;
        float _175 = _171 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _177 = fma(_109, _173, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _179 = fma(_105, _173, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _181 = fma(_177, (*spvDescriptorSet0.vp_c4)._m0[2].x, _175);
        float _183 = fma(_179, (*spvDescriptorSet0.vp_c4)._m0[2].z, _181);
        float _185 = _183 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _131 = _171;
        _141 = _177;
        _133 = _179;
        _135 = _185;
    }
    float _187 = _131;
    float _189 = _141;
    float _191 = _133;
    float _193 = _135;
    float _195 = _187 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _197 = _187 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _199 = in.m_30.x;
    float _201 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[1].x, _195);
    float _203 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[0].x, _197);
    float _205 = in.m_30.y;
    float _207 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[1].z, _201);
    float _209 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[0].z, _203);
    float _211 = _207 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _213 = _209 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _215 = _211 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _217 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[9].x, _215);
    float _219 = _211 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _221 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[9].z, _217);
    float _223 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[10].x, _219);
    out.m_33.x = _199;
    float _225 = _221 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _227 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[10].z, _223);
    out.m_33.y = _205;
    float _229 = _225 * 10000.0;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = _227 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _235 = _231 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _237 = _211 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _239 = _211 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _241 = fma(_235, (*spvDescriptorSet0.vp_c4)._m0[10].z, _233);
    float _243 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[7].x, _237);
    float _245 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[8].x, _239);
    float _247 = fma(_235, (*spvDescriptorSet0.vp_c4)._m0[9].z, _225);
    float _249 = 1.0 / _241;
    float _251 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[7].z, _243);
    float _253 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[8].z, _245);
    float _255 = _251 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _257 = _253 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _259 = _233 * _249;
    float _261 = _247 * _259;
    out.gl_Position.x = _255;
    out.gl_Position.y = _257;
    out.gl_Position.z = _261;
    out.gl_Position.w = _233;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

