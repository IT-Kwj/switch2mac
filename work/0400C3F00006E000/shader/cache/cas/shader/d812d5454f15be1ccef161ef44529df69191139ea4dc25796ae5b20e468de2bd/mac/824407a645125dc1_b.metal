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
    float4 m_35 [[user(locn1)]];
    float4 m_41 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(0)]];
    float4 m_28 [[attribute(1)]];
    float4 m_30 [[attribute(9)]];
    float4 m_32 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _57 = in.m_26.x;
    float _59 = in.m_26.y;
    float _61 = in.m_26.z;
    float _63 = in.m_28.x;
    float _65 = in.m_28.y;
    float _67 = in.m_28.z;
    float _69 = in.m_30.x;
    float _71 = in.m_30.y;
    float _73 = in.m_32.x;
    float _75 = _59 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _77 = _59 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _79 = _59 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _81 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[2].x, _75);
    float _83 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[0].x, _77);
    float _85 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[1].x, _79);
    float _87 = _65 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _89 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[2].z, _81);
    float _91 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[0].z, _83);
    float _93 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[2].x, _87);
    float _95 = _89 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _97 = _91 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _99 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _101 = _95 + _99;
    float _103 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _105 = _97 + _103;
    float _107 = _101 * _101;
    float _109 = fma(_105, _105, _107);
    float _111 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[1].z, _85);
    float _113 = sqrt(_109);
    float _115 = _111 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _117 = _115 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _119 = fma(_97, (*spvDescriptorSet0.vp_c4)._m0[2].x, _117);
    float _121 = _65 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _123 = fma(_95, (*spvDescriptorSet0.vp_c4)._m0[2].z, _119);
    float _125 = _65 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _127 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[1].x, _121);
    bool _131 = _113 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _133 = _123 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _135 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[0].x, _125);
    float _137 = fma(_67, (*spvDescriptorSet0.vp_c7)._m0[1].z, _127);
    float _139 = _123;
    float _141 = _125;
    float _143 = _127;
    float _145 = _63;
    if (!_131)
    {
        _139 = _133;
    }
    float _147 = _139;
    float _149 = _147;
    if (!_131)
    {
        _141 = _97;
    }
    float _151 = _141;
    float _153 = _151;
    if (!_131)
    {
        _143 = _115;
    }
    float _155 = _143;
    float _157 = _155;
    if (!_131)
    {
        _145 = _95;
    }
    float _159 = _145;
    bool _161 = !_131;
    float _163 = _159;
    if (!_161)
    {
        float _165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _167 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _169 = _113 + _167;
        float _171 = _115 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _173 = rsqrt(_109);
        float _175 = _169 * _165;
        float _177 = _175 * 0.15915493667125701904296875;
        float _179 = _177 * 6.283185482025146484375;
        float _181 = cos(_179);
        float _183 = _177 * 6.283185482025146484375;
        float _185 = sin(_183);
        float _187 = _181 + (-1.0);
        float _189 = fma(_185, _171, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _193 = _173 * _189;
        float _195 = fma(_115, _181, _191);
        float _197 = fma(_105, _193, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _199 = _195 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _201 = fma(_101, _193, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _203 = fma(_197, (*spvDescriptorSet0.vp_c4)._m0[2].x, _199);
        float _205 = fma(_201, (*spvDescriptorSet0.vp_c4)._m0[2].z, _203);
        float _207 = _205 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _157 = _195;
        _153 = _197;
        _163 = _201;
        _149 = _207;
    }
    float _209 = _157;
    float _211 = _153;
    float _213 = _163;
    float _215 = _149;
    float _217 = fma(_67, (*spvDescriptorSet0.vp_c7)._m0[0].z, _135);
    float _219 = _137 * _137;
    float _221 = _209 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _223 = fma(_67, (*spvDescriptorSet0.vp_c7)._m0[2].z, _93);
    float _225 = _209 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _227 = fma(_217, _217, _219);
    float _229 = fma(_211, (*spvDescriptorSet0.vp_c4)._m0[1].x, _221);
    out.m_35.z = _69;
    float _231 = fma(_211, (*spvDescriptorSet0.vp_c4)._m0[0].x, _225);
    float _233 = fma(_223, _223, _227);
    float _235 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[1].z, _229);
    out.m_35.w = _71;
    float _237 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[0].z, _231);
    float _239 = _235 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _241 = rsqrt(_233);
    float _243 = _237 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_37.x = _73;
    float _245 = _239 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _247 = _239 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _249 = _239 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _251 = _239 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _253 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[7].x, _245);
    float _255 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[8].x, _247);
    float _257 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[9].x, _249);
    float _259 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[10].x, _251);
    float _261 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[7].z, _253);
    float _263 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[8].z, _255);
    float _265 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[9].z, _257);
    float _267 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[10].z, _259);
    float _269 = _261 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _271 = _217 * _241;
    float _273 = _137 * _241;
    float _275 = _223 * _241;
    float _277 = _263 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _279 = _265 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _281 = _267 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_39.x = _97;
    out.m_39.y = _115;
    out.m_39.z = _95;
    out.m_41.x = _271;
    out.m_41.y = _273;
    out.m_41.z = _275;
    out.m_43.w = _133;
    out.gl_Position.x = _269;
    out.gl_Position.y = _277;
    out.gl_Position.z = _279;
    out.gl_Position.w = _281;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _57 = in.m_26.x;
    float _59 = in.m_26.y;
    float _61 = in.m_26.z;
    float _63 = in.m_28.x;
    float _65 = in.m_28.y;
    float _67 = in.m_28.z;
    float _69 = in.m_30.x;
    float _71 = in.m_30.y;
    float _73 = in.m_32.x;
    float _75 = _59 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _77 = _59 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _79 = _59 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _81 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[2].x, _75);
    float _83 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[0].x, _77);
    float _85 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[1].x, _79);
    float _87 = _65 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _89 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[2].z, _81);
    float _91 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[0].z, _83);
    float _93 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[2].x, _87);
    float _95 = _89 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _97 = _91 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _99 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _101 = _95 + _99;
    float _103 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _105 = _97 + _103;
    float _107 = _101 * _101;
    float _109 = fma(_105, _105, _107);
    float _111 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[1].z, _85);
    float _113 = sqrt(_109);
    float _115 = _111 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _117 = _115 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _119 = fma(_97, (*spvDescriptorSet0.vp_c4)._m0[2].x, _117);
    float _121 = _65 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _123 = fma(_95, (*spvDescriptorSet0.vp_c4)._m0[2].z, _119);
    float _125 = _65 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _127 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[1].x, _121);
    bool _131 = _113 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _133 = _123 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _135 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[0].x, _125);
    float _137 = fma(_67, (*spvDescriptorSet0.vp_c7)._m0[1].z, _127);
    float _139 = _123;
    float _141 = _125;
    float _143 = _127;
    float _145 = _63;
    if (!_131)
    {
        _139 = _133;
    }
    float _147 = _139;
    float _149 = _147;
    if (!_131)
    {
        _141 = _97;
    }
    float _151 = _141;
    float _153 = _151;
    if (!_131)
    {
        _143 = _115;
    }
    float _155 = _143;
    float _157 = _155;
    if (!_131)
    {
        _145 = _95;
    }
    float _159 = _145;
    bool _161 = !_131;
    float _163 = _159;
    if (!_161)
    {
        float _165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _167 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _169 = _113 + _167;
        float _171 = _115 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _173 = rsqrt(_109);
        float _175 = _169 * _165;
        float _177 = _175 * 0.15915493667125701904296875;
        float _179 = _177 * 6.283185482025146484375;
        float _181 = cos(_179);
        float _183 = _177 * 6.283185482025146484375;
        float _185 = sin(_183);
        float _187 = _181 + (-1.0);
        float _189 = fma(_185, _171, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _193 = _173 * _189;
        float _195 = fma(_115, _181, _191);
        float _197 = fma(_105, _193, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _199 = _195 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _201 = fma(_101, _193, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _203 = fma(_197, (*spvDescriptorSet0.vp_c4)._m0[2].x, _199);
        float _205 = fma(_201, (*spvDescriptorSet0.vp_c4)._m0[2].z, _203);
        float _207 = _205 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _157 = _195;
        _153 = _197;
        _163 = _201;
        _149 = _207;
    }
    float _209 = _157;
    float _211 = _153;
    float _213 = _163;
    float _215 = _149;
    float _217 = fma(_67, (*spvDescriptorSet0.vp_c7)._m0[0].z, _135);
    float _219 = _137 * _137;
    float _221 = _209 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _223 = fma(_67, (*spvDescriptorSet0.vp_c7)._m0[2].z, _93);
    float _225 = _209 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _227 = fma(_217, _217, _219);
    float _229 = fma(_211, (*spvDescriptorSet0.vp_c4)._m0[1].x, _221);
    out.m_35.z = _69;
    float _231 = fma(_211, (*spvDescriptorSet0.vp_c4)._m0[0].x, _225);
    float _233 = fma(_223, _223, _227);
    float _235 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[1].z, _229);
    out.m_35.w = _71;
    float _237 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[0].z, _231);
    float _239 = _235 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _241 = rsqrt(_233);
    float _243 = _237 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_37.x = _73;
    float _245 = _239 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _247 = _239 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _249 = _239 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _251 = _239 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _253 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[7].x, _245);
    float _255 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[8].x, _247);
    float _257 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[9].x, _249);
    float _259 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[10].x, _251);
    float _261 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[7].z, _253);
    float _263 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[8].z, _255);
    float _265 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[9].z, _257);
    float _267 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[10].z, _259);
    float _269 = _261 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _271 = _217 * _241;
    float _273 = _137 * _241;
    float _275 = _223 * _241;
    float _277 = _263 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _279 = _265 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _281 = _267 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_39.x = _97;
    out.m_39.y = _115;
    out.m_39.z = _95;
    out.m_41.x = _271;
    out.m_41.y = _273;
    out.m_41.z = _275;
    out.m_43.w = _133;
    out.gl_Position.x = _269;
    out.gl_Position.y = _277;
    out.gl_Position.z = _279;
    out.gl_Position.w = _281;
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
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _57 = in.m_26.x;
    float _59 = in.m_26.y;
    float _61 = in.m_26.z;
    float _63 = in.m_28.x;
    float _65 = in.m_28.y;
    float _67 = in.m_28.z;
    float _69 = in.m_30.x;
    float _71 = in.m_30.y;
    float _73 = in.m_32.x;
    float _75 = _59 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _77 = _59 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _79 = _59 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _81 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[2].x, _75);
    float _83 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[0].x, _77);
    float _85 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[1].x, _79);
    float _87 = _65 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _89 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[2].z, _81);
    float _91 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[0].z, _83);
    float _93 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[2].x, _87);
    float _95 = _89 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _97 = _91 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _99 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _101 = _95 + _99;
    float _103 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _105 = _97 + _103;
    float _107 = _101 * _101;
    float _109 = fma(_105, _105, _107);
    float _111 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[1].z, _85);
    float _113 = sqrt(_109);
    float _115 = _111 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _117 = _115 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _119 = fma(_97, (*spvDescriptorSet0.vp_c4)._m0[2].x, _117);
    float _121 = _65 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _123 = fma(_95, (*spvDescriptorSet0.vp_c4)._m0[2].z, _119);
    float _125 = _65 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _127 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[1].x, _121);
    bool _131 = _113 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _133 = _123 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _135 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[0].x, _125);
    float _137 = fma(_67, (*spvDescriptorSet0.vp_c7)._m0[1].z, _127);
    float _139 = _123;
    float _141 = _125;
    float _143 = _127;
    float _145 = _63;
    if (!_131)
    {
        _139 = _133;
    }
    float _147 = _139;
    float _149 = _147;
    if (!_131)
    {
        _141 = _97;
    }
    float _151 = _141;
    float _153 = _151;
    if (!_131)
    {
        _143 = _115;
    }
    float _155 = _143;
    float _157 = _155;
    if (!_131)
    {
        _145 = _95;
    }
    float _159 = _145;
    bool _161 = !_131;
    float _163 = _159;
    if (!_161)
    {
        float _165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _167 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _169 = _113 + _167;
        float _171 = _115 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _173 = rsqrt(_109);
        float _175 = _169 * _165;
        float _177 = _175 * 0.15915493667125701904296875;
        float _179 = _177 * 6.283185482025146484375;
        float _181 = cos(_179);
        float _183 = _177 * 6.283185482025146484375;
        float _185 = sin(_183);
        float _187 = _181 + (-1.0);
        float _189 = fma(_185, _171, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _193 = _173 * _189;
        float _195 = fma(_115, _181, _191);
        float _197 = fma(_105, _193, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _199 = _195 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _201 = fma(_101, _193, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _203 = fma(_197, (*spvDescriptorSet0.vp_c4)._m0[2].x, _199);
        float _205 = fma(_201, (*spvDescriptorSet0.vp_c4)._m0[2].z, _203);
        float _207 = _205 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _157 = _195;
        _153 = _197;
        _163 = _201;
        _149 = _207;
    }
    float _209 = _157;
    float _211 = _153;
    float _213 = _163;
    float _215 = _149;
    float _217 = fma(_67, (*spvDescriptorSet0.vp_c7)._m0[0].z, _135);
    float _219 = _137 * _137;
    float _221 = _209 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _223 = fma(_67, (*spvDescriptorSet0.vp_c7)._m0[2].z, _93);
    float _225 = _209 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _227 = fma(_217, _217, _219);
    float _229 = fma(_211, (*spvDescriptorSet0.vp_c4)._m0[1].x, _221);
    out.m_35.z = _69;
    float _231 = fma(_211, (*spvDescriptorSet0.vp_c4)._m0[0].x, _225);
    float _233 = fma(_223, _223, _227);
    float _235 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[1].z, _229);
    out.m_35.w = _71;
    float _237 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[0].z, _231);
    float _239 = _235 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _241 = rsqrt(_233);
    float _243 = _237 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_37.x = _73;
    float _245 = _239 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _247 = _239 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _249 = _239 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _251 = _239 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _253 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[7].x, _245);
    float _255 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[8].x, _247);
    float _257 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[9].x, _249);
    float _259 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[10].x, _251);
    float _261 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[7].z, _253);
    float _263 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[8].z, _255);
    float _265 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[9].z, _257);
    float _267 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[10].z, _259);
    float _269 = _261 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _271 = _217 * _241;
    float _273 = _137 * _241;
    float _275 = _223 * _241;
    float _277 = _263 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _279 = _265 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _281 = _267 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_39.x = _97;
    out.m_39.y = _115;
    out.m_39.z = _95;
    out.m_41.x = _271;
    out.m_41.y = _273;
    out.m_41.z = _275;
    out.m_43.w = _133;
    out.gl_Position.x = _269;
    out.gl_Position.y = _277;
    out.gl_Position.z = _279;
    out.gl_Position.w = _281;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

