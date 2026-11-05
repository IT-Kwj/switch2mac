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

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c3 [[id(0)]];
    const device _21* vp_s0 [[id(1)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

vertex main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = as_type<float>(int(gl_InstanceIndex));
    float _47 = as_type<float>(int(gl_BaseInstance));
    int _50 = as_type<int>(_45) - as_type<int>(_47);
    int _52 = _50 << 4;
    uint _55 = uint(int(uint(_52) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_55)];
    float _57 = as_type<float>(_dmw0.x);
    int _59 = _52 + 4;
    uint _61 = uint(int(uint(_59) >> uint(2)));
    float _63 = as_type<float>(_dmw0.y);
    int _65 = _52 + 8;
    uint _67 = uint(int(uint(_65) >> uint(2)));
    float _69 = as_type<float>(_dmw0.z);
    int _71 = _52 + 12;
    uint _73 = uint(int(uint(_71) >> uint(2)));
    float _75 = as_type<float>(_dmw0.w);
    float _77 = float(as_type<int>(_63));
    float _79 = float(as_type<int>(_57));
    bool _83 = _77 > (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _85 = float(as_type<int>(_69));
    bool _87 = _79 > (*spvDescriptorSet0.vp_c3)._m0[2].x;
    bool _89 = _87 || _83;
    float _91 = float(as_type<int>(_75));
    bool _93 = _85 > (*spvDescriptorSet0.vp_c3)._m0[2].z;
    bool _95 = _93 || _89;
    bool _97 = _91 > (*spvDescriptorSet0.vp_c3)._m0[2].w;
    bool _99 = _97 || _95;
    float _101 = fma(2.0, (*spvDescriptorSet0.vp_c3)._m0[7].z, -1.0);
    int _103 = as_type<int>(_57);
    int _105 = as_type<int>(_63);
    if (_99)
    {
        _103 = -971227136;
    }
    int _107 = _103;
    int _109 = _107;
    if (_99)
    {
        _105 = -971227136;
    }
    int _111 = _105;
    int _113 = _111;
    if (!_99)
    {
        int _115 = abs(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
        int _117 = abs(_50);
        float _119 = float(uint(_115));
        float _121 = float(uint(_117));
        float _123 = 1.0 / _119;
        int _125 = as_type<int>(_123) + (-2);
        float _127 = as_type<float>(int(gl_VertexIndex));
        float _129 = as_type<float>(_125) * _121;
        float _131 = trunc(_129);
        float _133 = precise::max(_131, 0.0);
        uint _135 = uint(_133);
        int _137 = -int(_135);
        int _139 = _137 * _115;
        int _141 = _139 + _117;
        float _143 = float(uint(_141));
        float _145 = as_type<float>(_125) * _143;
        float _147 = trunc(_145);
        float _149 = precise::max(_147, 0.0);
        uint _151 = uint(_149);
        float _153 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].w));
        int _155 = int(_135) + int(_151);
        int _157 = _50 ^ as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _159 = -_155;
        uint _161 = uint(int(uint(_157) >> uint(31)));
        int _163 = _159 * _115;
        int _165 = _163 + _117;
        float _167 = 1.0 / _153;
        bool _169 = uint(_165) >= uint(_115);
        int _171 = -int(_161);
        int _173 = as_type<int>(_127) >> 31;
        bool _175 = !_169;
        int _177 = _175 ? 0 : (-1);
        bool _179 = 0 == as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _181 = _173 & 1;
        int _183 = -_177;
        int _185 = _155 + _183;
        float _187 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
        int _189 = as_type<int>(_127) + _181;
        int _191 = _185 ^ _171;
        float _193 = 1.0 / _187;
        int _195 = as_type<int>(_127) & 1;
        int _197 = -_171;
        int _199 = _191 + _197;
        int _201 = _189 >> 1;
        float _203 = float(_195);
        bool _205 = !_179;
        int _207 = _205 ? _199 : (-1);
        float _209 = float(_201);
        float _211 = float(_207);
        int _213 = -_207;
        int _215 = _213 * as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _217 = _215 + _50;
        float _219 = _209 + _211;
        float _221 = _167 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
        float _223 = float(_217);
        float _225 = _221 * _219;
        float _227 = _203 + _223;
        float _229 = _193 * (*spvDescriptorSet0.vp_c3)._m0[7].x;
        float _231 = fma(_225, -2.0, 1.0);
        float _233 = _229 * _227;
        float _235 = fma(_233, 2.0, -1.0);
        _109 = as_type<int>(_235);
        _113 = as_type<int>(_231);
    }
    int _237 = _109;
    int _239 = _113;
    float _556 = as_type<float>(_237);
    out.gl_Position.x = _556;
    float _559 = as_type<float>(_239);
    out.gl_Position.y = _559;
    out.gl_Position.z = _101;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = as_type<float>(int(gl_InstanceIndex));
    float _47 = as_type<float>(int(gl_BaseInstance));
    int _50 = as_type<int>(_45) - as_type<int>(_47);
    int _52 = _50 << 4;
    uint _55 = uint(int(uint(_52) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_55)];
    float _57 = as_type<float>(_dmw0.x);
    int _59 = _52 + 4;
    uint _61 = uint(int(uint(_59) >> uint(2)));
    float _63 = as_type<float>(_dmw0.y);
    int _65 = _52 + 8;
    uint _67 = uint(int(uint(_65) >> uint(2)));
    float _69 = as_type<float>(_dmw0.z);
    int _71 = _52 + 12;
    uint _73 = uint(int(uint(_71) >> uint(2)));
    float _75 = as_type<float>(_dmw0.w);
    float _77 = float(as_type<int>(_63));
    float _79 = float(as_type<int>(_57));
    bool _83 = _77 > (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _85 = float(as_type<int>(_69));
    bool _87 = _79 > (*spvDescriptorSet0.vp_c3)._m0[2].x;
    bool _89 = _87 || _83;
    float _91 = float(as_type<int>(_75));
    bool _93 = _85 > (*spvDescriptorSet0.vp_c3)._m0[2].z;
    bool _95 = _93 || _89;
    bool _97 = _91 > (*spvDescriptorSet0.vp_c3)._m0[2].w;
    bool _99 = _97 || _95;
    float _101 = fma(2.0, (*spvDescriptorSet0.vp_c3)._m0[7].z, -1.0);
    int _103 = as_type<int>(_57);
    int _105 = as_type<int>(_63);
    if (_99)
    {
        _103 = -971227136;
    }
    int _107 = _103;
    int _109 = _107;
    if (_99)
    {
        _105 = -971227136;
    }
    int _111 = _105;
    int _113 = _111;
    if (!_99)
    {
        int _115 = abs(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
        int _117 = abs(_50);
        float _119 = float(uint(_115));
        float _121 = float(uint(_117));
        float _123 = 1.0 / _119;
        int _125 = as_type<int>(_123) + (-2);
        float _127 = as_type<float>(int(gl_VertexIndex));
        float _129 = as_type<float>(_125) * _121;
        float _131 = trunc(_129);
        float _133 = precise::max(_131, 0.0);
        uint _135 = uint(_133);
        int _137 = -int(_135);
        int _139 = _137 * _115;
        int _141 = _139 + _117;
        float _143 = float(uint(_141));
        float _145 = as_type<float>(_125) * _143;
        float _147 = trunc(_145);
        float _149 = precise::max(_147, 0.0);
        uint _151 = uint(_149);
        float _153 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].w));
        int _155 = int(_135) + int(_151);
        int _157 = _50 ^ as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _159 = -_155;
        uint _161 = uint(int(uint(_157) >> uint(31)));
        int _163 = _159 * _115;
        int _165 = _163 + _117;
        float _167 = 1.0 / _153;
        bool _169 = uint(_165) >= uint(_115);
        int _171 = -int(_161);
        int _173 = as_type<int>(_127) >> 31;
        bool _175 = !_169;
        int _177 = _175 ? 0 : (-1);
        bool _179 = 0 == as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _181 = _173 & 1;
        int _183 = -_177;
        int _185 = _155 + _183;
        float _187 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
        int _189 = as_type<int>(_127) + _181;
        int _191 = _185 ^ _171;
        float _193 = 1.0 / _187;
        int _195 = as_type<int>(_127) & 1;
        int _197 = -_171;
        int _199 = _191 + _197;
        int _201 = _189 >> 1;
        float _203 = float(_195);
        bool _205 = !_179;
        int _207 = _205 ? _199 : (-1);
        float _209 = float(_201);
        float _211 = float(_207);
        int _213 = -_207;
        int _215 = _213 * as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _217 = _215 + _50;
        float _219 = _209 + _211;
        float _221 = _167 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
        float _223 = float(_217);
        float _225 = _221 * _219;
        float _227 = _203 + _223;
        float _229 = _193 * (*spvDescriptorSet0.vp_c3)._m0[7].x;
        float _231 = fma(_225, -2.0, 1.0);
        float _233 = _229 * _227;
        float _235 = fma(_233, 2.0, -1.0);
        _109 = as_type<int>(_235);
        _113 = as_type<int>(_231);
    }
    int _237 = _109;
    int _239 = _113;
    float _556 = as_type<float>(_237);
    out.gl_Position.x = _556;
    float _559 = as_type<float>(_239);
    out.gl_Position.y = _559;
    out.gl_Position.z = _101;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], uint gl_VertexIndex [[vertex_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint dm_iid = gl_InstanceIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = as_type<float>(int(gl_InstanceIndex));
    float _47 = as_type<float>(int(gl_BaseInstance));
    int _50 = as_type<int>(_45) - as_type<int>(_47);
    int _52 = _50 << 4;
    uint _55 = uint(int(uint(_52) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_55)];
    float _57 = as_type<float>(_dmw0.x);
    int _59 = _52 + 4;
    uint _61 = uint(int(uint(_59) >> uint(2)));
    float _63 = as_type<float>(_dmw0.y);
    int _65 = _52 + 8;
    uint _67 = uint(int(uint(_65) >> uint(2)));
    float _69 = as_type<float>(_dmw0.z);
    int _71 = _52 + 12;
    uint _73 = uint(int(uint(_71) >> uint(2)));
    float _75 = as_type<float>(_dmw0.w);
    float _77 = float(as_type<int>(_63));
    float _79 = float(as_type<int>(_57));
    bool _83 = _77 > (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _85 = float(as_type<int>(_69));
    bool _87 = _79 > (*spvDescriptorSet0.vp_c3)._m0[2].x;
    bool _89 = _87 || _83;
    float _91 = float(as_type<int>(_75));
    bool _93 = _85 > (*spvDescriptorSet0.vp_c3)._m0[2].z;
    bool _95 = _93 || _89;
    bool _97 = _91 > (*spvDescriptorSet0.vp_c3)._m0[2].w;
    bool _99 = _97 || _95;
    float _101 = fma(2.0, (*spvDescriptorSet0.vp_c3)._m0[7].z, -1.0);
    int _103 = as_type<int>(_57);
    int _105 = as_type<int>(_63);
    if (_99)
    {
        _103 = -971227136;
    }
    int _107 = _103;
    int _109 = _107;
    if (_99)
    {
        _105 = -971227136;
    }
    int _111 = _105;
    int _113 = _111;
    if (!_99)
    {
        int _115 = abs(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
        int _117 = abs(_50);
        float _119 = float(uint(_115));
        float _121 = float(uint(_117));
        float _123 = 1.0 / _119;
        int _125 = as_type<int>(_123) + (-2);
        float _127 = as_type<float>(int(gl_VertexIndex));
        float _129 = as_type<float>(_125) * _121;
        float _131 = trunc(_129);
        float _133 = precise::max(_131, 0.0);
        uint _135 = uint(_133);
        int _137 = -int(_135);
        int _139 = _137 * _115;
        int _141 = _139 + _117;
        float _143 = float(uint(_141));
        float _145 = as_type<float>(_125) * _143;
        float _147 = trunc(_145);
        float _149 = precise::max(_147, 0.0);
        uint _151 = uint(_149);
        float _153 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].w));
        int _155 = int(_135) + int(_151);
        int _157 = _50 ^ as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _159 = -_155;
        uint _161 = uint(int(uint(_157) >> uint(31)));
        int _163 = _159 * _115;
        int _165 = _163 + _117;
        float _167 = 1.0 / _153;
        bool _169 = uint(_165) >= uint(_115);
        int _171 = -int(_161);
        int _173 = as_type<int>(_127) >> 31;
        bool _175 = !_169;
        int _177 = _175 ? 0 : (-1);
        bool _179 = 0 == as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _181 = _173 & 1;
        int _183 = -_177;
        int _185 = _155 + _183;
        float _187 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
        int _189 = as_type<int>(_127) + _181;
        int _191 = _185 ^ _171;
        float _193 = 1.0 / _187;
        int _195 = as_type<int>(_127) & 1;
        int _197 = -_171;
        int _199 = _191 + _197;
        int _201 = _189 >> 1;
        float _203 = float(_195);
        bool _205 = !_179;
        int _207 = _205 ? _199 : (-1);
        float _209 = float(_201);
        float _211 = float(_207);
        int _213 = -_207;
        int _215 = _213 * as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _217 = _215 + _50;
        float _219 = _209 + _211;
        float _221 = _167 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
        float _223 = float(_217);
        float _225 = _221 * _219;
        float _227 = _203 + _223;
        float _229 = _193 * (*spvDescriptorSet0.vp_c3)._m0[7].x;
        float _231 = fma(_225, -2.0, 1.0);
        float _233 = _229 * _227;
        float _235 = fma(_233, 2.0, -1.0);
        _109 = as_type<int>(_235);
        _113 = as_type<int>(_231);
    }
    int _237 = _109;
    int _239 = _113;
    float _556 = as_type<float>(_237);
    out.gl_Position.x = _556;
    float _559 = as_type<float>(_239);
    out.gl_Position.y = _559;
    out.gl_Position.z = _101;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

