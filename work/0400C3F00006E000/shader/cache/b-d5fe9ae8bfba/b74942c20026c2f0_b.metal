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
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(0)]];
    float4 m_30 [[attribute(1)]];
    float4 m_28 [[attribute(8)]];
    float4 m_32 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _65 = in.m_30.x;
    float _67 = in.m_30.y;
    float _69 = in.m_30.z;
    float _71 = in.m_28.y;
    float _73 = in.m_32.x;
    float _75 = in.m_32.y;
    float _77 = _59 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _79 = _59 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _81 = _59 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _83 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[2].x, _77);
    float _85 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[0].x, _79);
    float _87 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[1].x, _81);
    out.m_35.x = _63;
    float _89 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[2].z, _83);
    float _91 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[0].z, _85);
    float _93 = _67 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _95 = _89 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _97 = _91 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _99 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[2].x, _93);
    float _101 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _103 = _95 + _101;
    float _105 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _107 = _97 + _105;
    float _109 = _103 * _103;
    float _111 = fma(_107, _107, _109);
    float _113 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[1].z, _87);
    float _115 = sqrt(_111);
    float _117 = _113 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _119 = _117 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _121 = fma(_97, (*spvDescriptorSet0.vp_c4)._m0[2].x, _119);
    float _123 = _67 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _125 = fma(_95, (*spvDescriptorSet0.vp_c4)._m0[2].z, _121);
    float _127 = _67 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _129 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[1].x, _123);
    bool _133 = _115 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _135 = _125 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _137 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[0].x, _127);
    float _139 = fma(_69, (*spvDescriptorSet0.vp_c7)._m0[1].z, _129);
    float _141 = _125;
    float _143 = _127;
    float _145 = _129;
    float _147 = _65;
    if (!_133)
    {
        _141 = _135;
    }
    float _149 = _141;
    float _151 = _149;
    if (!_133)
    {
        _143 = _97;
    }
    float _153 = _143;
    float _155 = _153;
    if (!_133)
    {
        _145 = _117;
    }
    float _157 = _145;
    float _159 = _157;
    if (!_133)
    {
        _147 = _95;
    }
    float _161 = _147;
    bool _163 = !_133;
    float _165 = _161;
    if (!_163)
    {
        float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _169 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _171 = _115 + _169;
        float _173 = _117 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _175 = rsqrt(_111);
        float _177 = _171 * _167;
        float _179 = _177 * 0.15915493667125701904296875;
        float _181 = _179 * 6.283185482025146484375;
        float _183 = cos(_181);
        float _185 = _179 * 6.283185482025146484375;
        float _187 = sin(_185);
        float _189 = _183 + (-1.0);
        float _191 = fma(_187, _173, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _195 = _175 * _191;
        float _197 = fma(_117, _183, _193);
        float _199 = fma(_107, _195, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _201 = _197 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _203 = fma(_103, _195, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _205 = fma(_199, (*spvDescriptorSet0.vp_c4)._m0[2].x, _201);
        float _207 = fma(_203, (*spvDescriptorSet0.vp_c4)._m0[2].z, _205);
        float _209 = _207 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _159 = _197;
        _155 = _199;
        _165 = _203;
        _151 = _209;
    }
    float _211 = _159;
    float _213 = _155;
    float _215 = _165;
    float _217 = _151;
    float _219 = fma(_69, (*spvDescriptorSet0.vp_c7)._m0[0].z, _137);
    float _221 = _139 * _139;
    float _223 = _211 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _225 = fma(_69, (*spvDescriptorSet0.vp_c7)._m0[2].z, _99);
    float _227 = _211 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _229 = fma(_219, _219, _221);
    float _231 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[1].x, _223);
    out.m_35.y = _71;
    float _233 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[0].x, _227);
    float _235 = fma(_225, _225, _229);
    float _237 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[1].z, _231);
    out.m_37.z = _73;
    float _239 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[0].z, _233);
    float _241 = _237 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _243 = rsqrt(_235);
    float _245 = _239 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_37.w = _75;
    float _247 = _241 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _249 = _241 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _251 = _241 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _253 = _241 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _255 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[7].x, _247);
    float _257 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[8].x, _249);
    float _259 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[9].x, _251);
    float _261 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[10].x, _253);
    float _263 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[7].z, _255);
    float _265 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[8].z, _257);
    float _267 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[9].z, _259);
    float _269 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[10].z, _261);
    float _271 = -_135;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _275 = _271 + _273;
    float _277 = _219 * _243;
    float _279 = _139 * _243;
    float _281 = _225 * _243;
    float _283 = _275 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _285 = _263 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _287 = _265 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _289 = _267 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _291 = _269 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_39.x = _97;
    out.m_39.y = _117;
    out.m_39.z = _95;
    out.m_41.x = _277;
    out.m_41.y = _279;
    out.m_41.z = _281;
    out.m_43.w = _135;
    out.m_41.w = _283;
    out.gl_Position.x = _285;
    out.gl_Position.y = _287;
    out.gl_Position.z = _289;
    out.gl_Position.w = _291;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _65 = in.m_30.x;
    float _67 = in.m_30.y;
    float _69 = in.m_30.z;
    float _71 = in.m_28.y;
    float _73 = in.m_32.x;
    float _75 = in.m_32.y;
    float _77 = _59 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _79 = _59 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _81 = _59 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _83 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[2].x, _77);
    float _85 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[0].x, _79);
    float _87 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[1].x, _81);
    out.m_35.x = _63;
    float _89 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[2].z, _83);
    float _91 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[0].z, _85);
    float _93 = _67 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _95 = _89 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _97 = _91 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _99 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[2].x, _93);
    float _101 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _103 = _95 + _101;
    float _105 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _107 = _97 + _105;
    float _109 = _103 * _103;
    float _111 = fma(_107, _107, _109);
    float _113 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[1].z, _87);
    float _115 = sqrt(_111);
    float _117 = _113 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _119 = _117 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _121 = fma(_97, (*spvDescriptorSet0.vp_c4)._m0[2].x, _119);
    float _123 = _67 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _125 = fma(_95, (*spvDescriptorSet0.vp_c4)._m0[2].z, _121);
    float _127 = _67 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _129 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[1].x, _123);
    bool _133 = _115 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _135 = _125 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _137 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[0].x, _127);
    float _139 = fma(_69, (*spvDescriptorSet0.vp_c7)._m0[1].z, _129);
    float _141 = _125;
    float _143 = _127;
    float _145 = _129;
    float _147 = _65;
    if (!_133)
    {
        _141 = _135;
    }
    float _149 = _141;
    float _151 = _149;
    if (!_133)
    {
        _143 = _97;
    }
    float _153 = _143;
    float _155 = _153;
    if (!_133)
    {
        _145 = _117;
    }
    float _157 = _145;
    float _159 = _157;
    if (!_133)
    {
        _147 = _95;
    }
    float _161 = _147;
    bool _163 = !_133;
    float _165 = _161;
    if (!_163)
    {
        float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _169 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _171 = _115 + _169;
        float _173 = _117 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _175 = rsqrt(_111);
        float _177 = _171 * _167;
        float _179 = _177 * 0.15915493667125701904296875;
        float _181 = _179 * 6.283185482025146484375;
        float _183 = cos(_181);
        float _185 = _179 * 6.283185482025146484375;
        float _187 = sin(_185);
        float _189 = _183 + (-1.0);
        float _191 = fma(_187, _173, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _195 = _175 * _191;
        float _197 = fma(_117, _183, _193);
        float _199 = fma(_107, _195, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _201 = _197 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _203 = fma(_103, _195, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _205 = fma(_199, (*spvDescriptorSet0.vp_c4)._m0[2].x, _201);
        float _207 = fma(_203, (*spvDescriptorSet0.vp_c4)._m0[2].z, _205);
        float _209 = _207 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _159 = _197;
        _155 = _199;
        _165 = _203;
        _151 = _209;
    }
    float _211 = _159;
    float _213 = _155;
    float _215 = _165;
    float _217 = _151;
    float _219 = fma(_69, (*spvDescriptorSet0.vp_c7)._m0[0].z, _137);
    float _221 = _139 * _139;
    float _223 = _211 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _225 = fma(_69, (*spvDescriptorSet0.vp_c7)._m0[2].z, _99);
    float _227 = _211 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _229 = fma(_219, _219, _221);
    float _231 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[1].x, _223);
    out.m_35.y = _71;
    float _233 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[0].x, _227);
    float _235 = fma(_225, _225, _229);
    float _237 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[1].z, _231);
    out.m_37.z = _73;
    float _239 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[0].z, _233);
    float _241 = _237 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _243 = rsqrt(_235);
    float _245 = _239 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_37.w = _75;
    float _247 = _241 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _249 = _241 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _251 = _241 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _253 = _241 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _255 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[7].x, _247);
    float _257 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[8].x, _249);
    float _259 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[9].x, _251);
    float _261 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[10].x, _253);
    float _263 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[7].z, _255);
    float _265 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[8].z, _257);
    float _267 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[9].z, _259);
    float _269 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[10].z, _261);
    float _271 = -_135;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _275 = _271 + _273;
    float _277 = _219 * _243;
    float _279 = _139 * _243;
    float _281 = _225 * _243;
    float _283 = _275 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _285 = _263 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _287 = _265 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _289 = _267 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _291 = _269 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_39.x = _97;
    out.m_39.y = _117;
    out.m_39.z = _95;
    out.m_41.x = _277;
    out.m_41.y = _279;
    out.m_41.z = _281;
    out.m_43.w = _135;
    out.m_41.w = _283;
    out.gl_Position.x = _285;
    out.gl_Position.y = _287;
    out.gl_Position.z = _289;
    out.gl_Position.w = _291;
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
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _65 = in.m_30.x;
    float _67 = in.m_30.y;
    float _69 = in.m_30.z;
    float _71 = in.m_28.y;
    float _73 = in.m_32.x;
    float _75 = in.m_32.y;
    float _77 = _59 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _79 = _59 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _81 = _59 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _83 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[2].x, _77);
    float _85 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[0].x, _79);
    float _87 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[1].x, _81);
    out.m_35.x = _63;
    float _89 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[2].z, _83);
    float _91 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[0].z, _85);
    float _93 = _67 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _95 = _89 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _97 = _91 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _99 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[2].x, _93);
    float _101 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _103 = _95 + _101;
    float _105 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _107 = _97 + _105;
    float _109 = _103 * _103;
    float _111 = fma(_107, _107, _109);
    float _113 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[1].z, _87);
    float _115 = sqrt(_111);
    float _117 = _113 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _119 = _117 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _121 = fma(_97, (*spvDescriptorSet0.vp_c4)._m0[2].x, _119);
    float _123 = _67 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _125 = fma(_95, (*spvDescriptorSet0.vp_c4)._m0[2].z, _121);
    float _127 = _67 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _129 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[1].x, _123);
    bool _133 = _115 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _135 = _125 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _137 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[0].x, _127);
    float _139 = fma(_69, (*spvDescriptorSet0.vp_c7)._m0[1].z, _129);
    float _141 = _125;
    float _143 = _127;
    float _145 = _129;
    float _147 = _65;
    if (!_133)
    {
        _141 = _135;
    }
    float _149 = _141;
    float _151 = _149;
    if (!_133)
    {
        _143 = _97;
    }
    float _153 = _143;
    float _155 = _153;
    if (!_133)
    {
        _145 = _117;
    }
    float _157 = _145;
    float _159 = _157;
    if (!_133)
    {
        _147 = _95;
    }
    float _161 = _147;
    bool _163 = !_133;
    float _165 = _161;
    if (!_163)
    {
        float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _169 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _171 = _115 + _169;
        float _173 = _117 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _175 = rsqrt(_111);
        float _177 = _171 * _167;
        float _179 = _177 * 0.15915493667125701904296875;
        float _181 = _179 * 6.283185482025146484375;
        float _183 = cos(_181);
        float _185 = _179 * 6.283185482025146484375;
        float _187 = sin(_185);
        float _189 = _183 + (-1.0);
        float _191 = fma(_187, _173, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _195 = _175 * _191;
        float _197 = fma(_117, _183, _193);
        float _199 = fma(_107, _195, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _201 = _197 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _203 = fma(_103, _195, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _205 = fma(_199, (*spvDescriptorSet0.vp_c4)._m0[2].x, _201);
        float _207 = fma(_203, (*spvDescriptorSet0.vp_c4)._m0[2].z, _205);
        float _209 = _207 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _159 = _197;
        _155 = _199;
        _165 = _203;
        _151 = _209;
    }
    float _211 = _159;
    float _213 = _155;
    float _215 = _165;
    float _217 = _151;
    float _219 = fma(_69, (*spvDescriptorSet0.vp_c7)._m0[0].z, _137);
    float _221 = _139 * _139;
    float _223 = _211 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _225 = fma(_69, (*spvDescriptorSet0.vp_c7)._m0[2].z, _99);
    float _227 = _211 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _229 = fma(_219, _219, _221);
    float _231 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[1].x, _223);
    out.m_35.y = _71;
    float _233 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[0].x, _227);
    float _235 = fma(_225, _225, _229);
    float _237 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[1].z, _231);
    out.m_37.z = _73;
    float _239 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[0].z, _233);
    float _241 = _237 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _243 = rsqrt(_235);
    float _245 = _239 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_37.w = _75;
    float _247 = _241 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _249 = _241 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _251 = _241 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _253 = _241 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _255 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[7].x, _247);
    float _257 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[8].x, _249);
    float _259 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[9].x, _251);
    float _261 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[10].x, _253);
    float _263 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[7].z, _255);
    float _265 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[8].z, _257);
    float _267 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[9].z, _259);
    float _269 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[10].z, _261);
    float _271 = -_135;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _275 = _271 + _273;
    float _277 = _219 * _243;
    float _279 = _139 * _243;
    float _281 = _225 * _243;
    float _283 = _275 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _285 = _263 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _287 = _265 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _289 = _267 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _291 = _269 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_39.x = _97;
    out.m_39.y = _117;
    out.m_39.z = _95;
    out.m_41.x = _277;
    out.m_41.y = _279;
    out.m_41.z = _281;
    out.m_43.w = _135;
    out.m_41.w = _283;
    out.gl_Position.x = _285;
    out.gl_Position.y = _287;
    out.gl_Position.z = _289;
    out.gl_Position.w = _291;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

