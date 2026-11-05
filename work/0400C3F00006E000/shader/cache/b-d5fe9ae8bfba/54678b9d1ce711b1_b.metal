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
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn6)]];
    float4 m_37 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(0)]];
    float4 m_28 [[attribute(8)]];
    float4 m_30 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _51 = in.m_26.x;
    float _53 = in.m_26.y;
    float _55 = in.m_26.z;
    float _57 = in.m_28.x;
    float _59 = in.m_28.y;
    float _61 = _53 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _63 = _53 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _65 = fma(_51, (*spvDescriptorSet0.vp_c7)._m0[2].x, _61);
    float _67 = fma(_51, (*spvDescriptorSet0.vp_c7)._m0[0].x, _63);
    float _69 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[2].z, _65);
    float _71 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[0].z, _67);
    float _73 = _53 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _75 = _69 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _77 = _71 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _79 = fma(_51, (*spvDescriptorSet0.vp_c7)._m0[1].x, _73);
    float _81 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _83 = _75 + _81;
    float _85 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _87 = _77 + _85;
    float _89 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[1].z, _79);
    float _91 = in.m_30.x;
    float _93 = in.m_30.y;
    float _95 = _83 * _83;
    float _97 = _89 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _99 = fma(_87, _87, _95);
    float _101 = _97 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _103 = sqrt(_99);
    float _105 = fma(_77, (*spvDescriptorSet0.vp_c4)._m0[2].x, _101);
    float _107 = fma(_75, (*spvDescriptorSet0.vp_c4)._m0[2].z, _105);
    float _109 = _107 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _113 = _103 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _115 = 0.0;
    float _117 = _55;
    float _119 = _107;
    if (!_113)
    {
        _115 = _109;
    }
    float _121 = _115;
    float _123 = 0.0;
    float _125 = _121;
    if (!_113)
    {
        _123 = _77;
    }
    float _127 = _123;
    float _129 = _127;
    if (!_113)
    {
        _117 = _97;
    }
    float _131 = _117;
    float _133 = _131;
    if (!_113)
    {
        _119 = _75;
    }
    float _135 = _119;
    bool _137 = !_113;
    float _139 = _135;
    if (!_137)
    {
        float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _143 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _145 = _103 + _143;
        float _147 = _97 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _149 = rsqrt(_99);
        float _151 = _145 * _141;
        float _153 = _151 * 0.15915493667125701904296875;
        float _155 = _153 * 6.283185482025146484375;
        float _157 = cos(_155);
        float _159 = _153 * 6.283185482025146484375;
        float _161 = sin(_159);
        float _163 = _157 + (-1.0);
        float _165 = fma(_161, _147, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _167 = _163 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _169 = _149 * _165;
        float _171 = fma(_97, _157, _167);
        float _173 = fma(_87, _169, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _175 = _171 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _177 = fma(_83, _169, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _179 = fma(_173, (*spvDescriptorSet0.vp_c4)._m0[2].x, _175);
        float _181 = fma(_177, (*spvDescriptorSet0.vp_c4)._m0[2].z, _179);
        float _183 = _181 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _133 = _171;
        _129 = _173;
        _139 = _177;
        _125 = _183;
    }
    float _185 = _133;
    float _187 = _129;
    float _189 = _139;
    float _191 = _125;
    float _193 = _185 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _195 = _185 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    out.m_33.x = _57;
    float _197 = fma(_187, (*spvDescriptorSet0.vp_c4)._m0[1].x, _193);
    float _199 = fma(_187, (*spvDescriptorSet0.vp_c4)._m0[0].x, _195);
    float _201 = _93 * (*spvDescriptorSet0.vp_c7)._m0[14].z;
    float _203 = _93 * (*spvDescriptorSet0.vp_c7)._m0[14].w;
    float _205 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[1].z, _197);
    float _207 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[0].z, _199);
    float _209 = -_201;
    float _211 = fma(_91, (*spvDescriptorSet0.vp_c7)._m0[14].w, _209);
    float _213 = fma(_91, (*spvDescriptorSet0.vp_c7)._m0[14].z, _203);
    float _215 = _205 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _217 = _207 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _219 = _211 + (*spvDescriptorSet0.vp_c7)._m0[14].x;
    out.m_33.y = _59;
    float _221 = _215 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _223 = _215 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _225 = _215 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _227 = _215 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _229 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[9].x, _221);
    float _231 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[7].x, _223);
    float _233 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[8].x, _225);
    float _235 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[10].x, _227);
    float _237 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[9].z, _229);
    float _239 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[7].z, _231);
    float _241 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[8].z, _233);
    float _243 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[10].z, _235);
    float _245 = _213 + (*spvDescriptorSet0.vp_c7)._m0[14].y;
    float _247 = _239 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _249 = _241 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _251 = _237 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _253 = _243 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_33.z = _219;
    out.m_33.w = _245;
    out.m_35.x = _77;
    out.m_35.y = _97;
    out.m_35.z = _75;
    out.m_37.w = _109;
    out.gl_Position.x = _247;
    out.gl_Position.y = _249;
    out.gl_Position.z = _251;
    out.gl_Position.w = _253;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _51 = in.m_26.x;
    float _53 = in.m_26.y;
    float _55 = in.m_26.z;
    float _57 = in.m_28.x;
    float _59 = in.m_28.y;
    float _61 = _53 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _63 = _53 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _65 = fma(_51, (*spvDescriptorSet0.vp_c7)._m0[2].x, _61);
    float _67 = fma(_51, (*spvDescriptorSet0.vp_c7)._m0[0].x, _63);
    float _69 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[2].z, _65);
    float _71 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[0].z, _67);
    float _73 = _53 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _75 = _69 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _77 = _71 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _79 = fma(_51, (*spvDescriptorSet0.vp_c7)._m0[1].x, _73);
    float _81 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _83 = _75 + _81;
    float _85 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _87 = _77 + _85;
    float _89 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[1].z, _79);
    float _91 = in.m_30.x;
    float _93 = in.m_30.y;
    float _95 = _83 * _83;
    float _97 = _89 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _99 = fma(_87, _87, _95);
    float _101 = _97 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _103 = sqrt(_99);
    float _105 = fma(_77, (*spvDescriptorSet0.vp_c4)._m0[2].x, _101);
    float _107 = fma(_75, (*spvDescriptorSet0.vp_c4)._m0[2].z, _105);
    float _109 = _107 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _113 = _103 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _115 = 0.0;
    float _117 = _55;
    float _119 = _107;
    if (!_113)
    {
        _115 = _109;
    }
    float _121 = _115;
    float _123 = 0.0;
    float _125 = _121;
    if (!_113)
    {
        _123 = _77;
    }
    float _127 = _123;
    float _129 = _127;
    if (!_113)
    {
        _117 = _97;
    }
    float _131 = _117;
    float _133 = _131;
    if (!_113)
    {
        _119 = _75;
    }
    float _135 = _119;
    bool _137 = !_113;
    float _139 = _135;
    if (!_137)
    {
        float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _143 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _145 = _103 + _143;
        float _147 = _97 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _149 = rsqrt(_99);
        float _151 = _145 * _141;
        float _153 = _151 * 0.15915493667125701904296875;
        float _155 = _153 * 6.283185482025146484375;
        float _157 = cos(_155);
        float _159 = _153 * 6.283185482025146484375;
        float _161 = sin(_159);
        float _163 = _157 + (-1.0);
        float _165 = fma(_161, _147, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _167 = _163 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _169 = _149 * _165;
        float _171 = fma(_97, _157, _167);
        float _173 = fma(_87, _169, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _175 = _171 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _177 = fma(_83, _169, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _179 = fma(_173, (*spvDescriptorSet0.vp_c4)._m0[2].x, _175);
        float _181 = fma(_177, (*spvDescriptorSet0.vp_c4)._m0[2].z, _179);
        float _183 = _181 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _133 = _171;
        _129 = _173;
        _139 = _177;
        _125 = _183;
    }
    float _185 = _133;
    float _187 = _129;
    float _189 = _139;
    float _191 = _125;
    float _193 = _185 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _195 = _185 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    out.m_33.x = _57;
    float _197 = fma(_187, (*spvDescriptorSet0.vp_c4)._m0[1].x, _193);
    float _199 = fma(_187, (*spvDescriptorSet0.vp_c4)._m0[0].x, _195);
    float _201 = _93 * (*spvDescriptorSet0.vp_c7)._m0[14].z;
    float _203 = _93 * (*spvDescriptorSet0.vp_c7)._m0[14].w;
    float _205 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[1].z, _197);
    float _207 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[0].z, _199);
    float _209 = -_201;
    float _211 = fma(_91, (*spvDescriptorSet0.vp_c7)._m0[14].w, _209);
    float _213 = fma(_91, (*spvDescriptorSet0.vp_c7)._m0[14].z, _203);
    float _215 = _205 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _217 = _207 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _219 = _211 + (*spvDescriptorSet0.vp_c7)._m0[14].x;
    out.m_33.y = _59;
    float _221 = _215 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _223 = _215 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _225 = _215 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _227 = _215 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _229 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[9].x, _221);
    float _231 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[7].x, _223);
    float _233 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[8].x, _225);
    float _235 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[10].x, _227);
    float _237 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[9].z, _229);
    float _239 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[7].z, _231);
    float _241 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[8].z, _233);
    float _243 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[10].z, _235);
    float _245 = _213 + (*spvDescriptorSet0.vp_c7)._m0[14].y;
    float _247 = _239 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _249 = _241 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _251 = _237 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _253 = _243 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_33.z = _219;
    out.m_33.w = _245;
    out.m_35.x = _77;
    out.m_35.y = _97;
    out.m_35.z = _75;
    out.m_37.w = _109;
    out.gl_Position.x = _247;
    out.gl_Position.y = _249;
    out.gl_Position.z = _251;
    out.gl_Position.w = _253;
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
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _51 = in.m_26.x;
    float _53 = in.m_26.y;
    float _55 = in.m_26.z;
    float _57 = in.m_28.x;
    float _59 = in.m_28.y;
    float _61 = _53 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _63 = _53 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _65 = fma(_51, (*spvDescriptorSet0.vp_c7)._m0[2].x, _61);
    float _67 = fma(_51, (*spvDescriptorSet0.vp_c7)._m0[0].x, _63);
    float _69 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[2].z, _65);
    float _71 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[0].z, _67);
    float _73 = _53 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _75 = _69 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _77 = _71 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _79 = fma(_51, (*spvDescriptorSet0.vp_c7)._m0[1].x, _73);
    float _81 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _83 = _75 + _81;
    float _85 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _87 = _77 + _85;
    float _89 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[1].z, _79);
    float _91 = in.m_30.x;
    float _93 = in.m_30.y;
    float _95 = _83 * _83;
    float _97 = _89 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _99 = fma(_87, _87, _95);
    float _101 = _97 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _103 = sqrt(_99);
    float _105 = fma(_77, (*spvDescriptorSet0.vp_c4)._m0[2].x, _101);
    float _107 = fma(_75, (*spvDescriptorSet0.vp_c4)._m0[2].z, _105);
    float _109 = _107 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _113 = _103 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _115 = 0.0;
    float _117 = _55;
    float _119 = _107;
    if (!_113)
    {
        _115 = _109;
    }
    float _121 = _115;
    float _123 = 0.0;
    float _125 = _121;
    if (!_113)
    {
        _123 = _77;
    }
    float _127 = _123;
    float _129 = _127;
    if (!_113)
    {
        _117 = _97;
    }
    float _131 = _117;
    float _133 = _131;
    if (!_113)
    {
        _119 = _75;
    }
    float _135 = _119;
    bool _137 = !_113;
    float _139 = _135;
    if (!_137)
    {
        float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _143 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _145 = _103 + _143;
        float _147 = _97 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _149 = rsqrt(_99);
        float _151 = _145 * _141;
        float _153 = _151 * 0.15915493667125701904296875;
        float _155 = _153 * 6.283185482025146484375;
        float _157 = cos(_155);
        float _159 = _153 * 6.283185482025146484375;
        float _161 = sin(_159);
        float _163 = _157 + (-1.0);
        float _165 = fma(_161, _147, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _167 = _163 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _169 = _149 * _165;
        float _171 = fma(_97, _157, _167);
        float _173 = fma(_87, _169, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _175 = _171 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _177 = fma(_83, _169, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _179 = fma(_173, (*spvDescriptorSet0.vp_c4)._m0[2].x, _175);
        float _181 = fma(_177, (*spvDescriptorSet0.vp_c4)._m0[2].z, _179);
        float _183 = _181 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _133 = _171;
        _129 = _173;
        _139 = _177;
        _125 = _183;
    }
    float _185 = _133;
    float _187 = _129;
    float _189 = _139;
    float _191 = _125;
    float _193 = _185 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _195 = _185 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    out.m_33.x = _57;
    float _197 = fma(_187, (*spvDescriptorSet0.vp_c4)._m0[1].x, _193);
    float _199 = fma(_187, (*spvDescriptorSet0.vp_c4)._m0[0].x, _195);
    float _201 = _93 * (*spvDescriptorSet0.vp_c7)._m0[14].z;
    float _203 = _93 * (*spvDescriptorSet0.vp_c7)._m0[14].w;
    float _205 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[1].z, _197);
    float _207 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[0].z, _199);
    float _209 = -_201;
    float _211 = fma(_91, (*spvDescriptorSet0.vp_c7)._m0[14].w, _209);
    float _213 = fma(_91, (*spvDescriptorSet0.vp_c7)._m0[14].z, _203);
    float _215 = _205 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _217 = _207 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _219 = _211 + (*spvDescriptorSet0.vp_c7)._m0[14].x;
    out.m_33.y = _59;
    float _221 = _215 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _223 = _215 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _225 = _215 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _227 = _215 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _229 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[9].x, _221);
    float _231 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[7].x, _223);
    float _233 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[8].x, _225);
    float _235 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[10].x, _227);
    float _237 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[9].z, _229);
    float _239 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[7].z, _231);
    float _241 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[8].z, _233);
    float _243 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[10].z, _235);
    float _245 = _213 + (*spvDescriptorSet0.vp_c7)._m0[14].y;
    float _247 = _239 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _249 = _241 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _251 = _237 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _253 = _243 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_33.z = _219;
    out.m_33.w = _245;
    out.m_35.x = _77;
    out.m_35.y = _97;
    out.m_35.z = _75;
    out.m_37.w = _109;
    out.gl_Position.x = _247;
    out.gl_Position.y = _249;
    out.gl_Position.z = _251;
    out.gl_Position.w = _253;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

