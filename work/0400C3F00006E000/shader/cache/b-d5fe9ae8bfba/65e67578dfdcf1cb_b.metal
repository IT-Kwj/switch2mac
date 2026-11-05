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
    float _40 = as_type<float>(int(gl_InstanceIndex));
    float _42 = as_type<float>(int(gl_BaseInstance));
    int _45 = as_type<int>(_40) - as_type<int>(_42);
    int _47 = abs(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
    float _49 = float(uint(_47));
    int _51 = -_47;
    int _53 = -_47;
    float _55 = 1.0 / _49;
    int _57 = abs(_45);
    float _59 = float(uint(_57));
    int _61 = as_type<int>(_55) + (-2);
    float _63 = as_type<float>(int(gl_VertexIndex));
    float _65 = as_type<float>(_61) * _59;
    float _67 = trunc(_65);
    float _69 = precise::max(_67, 0.0);
    uint _72 = uint(_69);
    int _74 = _51 * int(_72);
    int _76 = _74 + _57;
    float _78 = float(uint(_76));
    float _80 = as_type<float>(_61) * _78;
    float _82 = trunc(_80);
    float _84 = precise::max(_82, 0.0);
    uint _86 = uint(_84);
    int _88 = int(_72) + int(_86);
    int _90 = _45 ^ as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
    int _92 = _53 * _88;
    int _94 = _92 + _57;
    uint _96 = uint(int(uint(_90) >> uint(31)));
    bool _100 = uint(_94) >= uint(_47);
    int _102 = -int(_96);
    int _104 = as_type<int>(_63) >> 31;
    bool _106 = !_100;
    int _108 = _106 ? 0 : (-1);
    bool _110 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z) == 0;
    int _112 = ~_108;
    int _114 = _88 + _112;
    int _116 = _114 + 1;
    int _118 = _104 & 1;
    int _120 = _116 ^ _102;
    float _122 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].w));
    int _124 = as_type<int>(_63) + _118;
    int _126 = as_type<int>(_63) & 1;
    int _128 = -_102;
    int _130 = _120 + _128;
    float _132 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
    float _134 = 1.0 / _122;
    int _136 = _124 >> 1;
    bool _138 = !_110;
    int _140 = _138 ? _130 : (-1);
    float _142 = float(_126);
    float _144 = float(_136);
    float _146 = 1.0 / _132;
    int _148 = -_140;
    float _150 = float(_140);
    int _152 = _148 * as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
    int _154 = _152 + _45;
    float _156 = _144 + _150;
    float _158 = _134 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _160 = float(_154);
    float _162 = _158 * _156;
    float _164 = fma(2.0, (*spvDescriptorSet0.vp_c3)._m0[7].z, -1.0);
    float _166 = _142 + _160;
    float _168 = _146 * (*spvDescriptorSet0.vp_c3)._m0[7].x;
    float _170 = fma(_162, -2.0, 1.0);
    float _172 = _168 * _166;
    float _174 = fma(_172, 2.0, -1.0);
    out.gl_Position.x = _174;
    out.gl_Position.y = _170;
    out.gl_Position.z = _164;
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
    float _40 = as_type<float>(int(gl_InstanceIndex));
    float _42 = as_type<float>(int(gl_BaseInstance));
    int _45 = as_type<int>(_40) - as_type<int>(_42);
    int _47 = abs(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
    float _49 = float(uint(_47));
    int _51 = -_47;
    int _53 = -_47;
    float _55 = 1.0 / _49;
    int _57 = abs(_45);
    float _59 = float(uint(_57));
    int _61 = as_type<int>(_55) + (-2);
    float _63 = as_type<float>(int(gl_VertexIndex));
    float _65 = as_type<float>(_61) * _59;
    float _67 = trunc(_65);
    float _69 = precise::max(_67, 0.0);
    uint _72 = uint(_69);
    int _74 = _51 * int(_72);
    int _76 = _74 + _57;
    float _78 = float(uint(_76));
    float _80 = as_type<float>(_61) * _78;
    float _82 = trunc(_80);
    float _84 = precise::max(_82, 0.0);
    uint _86 = uint(_84);
    int _88 = int(_72) + int(_86);
    int _90 = _45 ^ as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
    int _92 = _53 * _88;
    int _94 = _92 + _57;
    uint _96 = uint(int(uint(_90) >> uint(31)));
    bool _100 = uint(_94) >= uint(_47);
    int _102 = -int(_96);
    int _104 = as_type<int>(_63) >> 31;
    bool _106 = !_100;
    int _108 = _106 ? 0 : (-1);
    bool _110 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z) == 0;
    int _112 = ~_108;
    int _114 = _88 + _112;
    int _116 = _114 + 1;
    int _118 = _104 & 1;
    int _120 = _116 ^ _102;
    float _122 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].w));
    int _124 = as_type<int>(_63) + _118;
    int _126 = as_type<int>(_63) & 1;
    int _128 = -_102;
    int _130 = _120 + _128;
    float _132 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
    float _134 = 1.0 / _122;
    int _136 = _124 >> 1;
    bool _138 = !_110;
    int _140 = _138 ? _130 : (-1);
    float _142 = float(_126);
    float _144 = float(_136);
    float _146 = 1.0 / _132;
    int _148 = -_140;
    float _150 = float(_140);
    int _152 = _148 * as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
    int _154 = _152 + _45;
    float _156 = _144 + _150;
    float _158 = _134 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _160 = float(_154);
    float _162 = _158 * _156;
    float _164 = fma(2.0, (*spvDescriptorSet0.vp_c3)._m0[7].z, -1.0);
    float _166 = _142 + _160;
    float _168 = _146 * (*spvDescriptorSet0.vp_c3)._m0[7].x;
    float _170 = fma(_162, -2.0, 1.0);
    float _172 = _168 * _166;
    float _174 = fma(_172, 2.0, -1.0);
    out.gl_Position.x = _174;
    out.gl_Position.y = _170;
    out.gl_Position.z = _164;
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
    float _40 = as_type<float>(int(gl_InstanceIndex));
    float _42 = as_type<float>(int(gl_BaseInstance));
    int _45 = as_type<int>(_40) - as_type<int>(_42);
    int _47 = abs(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
    float _49 = float(uint(_47));
    int _51 = -_47;
    int _53 = -_47;
    float _55 = 1.0 / _49;
    int _57 = abs(_45);
    float _59 = float(uint(_57));
    int _61 = as_type<int>(_55) + (-2);
    float _63 = as_type<float>(int(gl_VertexIndex));
    float _65 = as_type<float>(_61) * _59;
    float _67 = trunc(_65);
    float _69 = precise::max(_67, 0.0);
    uint _72 = uint(_69);
    int _74 = _51 * int(_72);
    int _76 = _74 + _57;
    float _78 = float(uint(_76));
    float _80 = as_type<float>(_61) * _78;
    float _82 = trunc(_80);
    float _84 = precise::max(_82, 0.0);
    uint _86 = uint(_84);
    int _88 = int(_72) + int(_86);
    int _90 = _45 ^ as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
    int _92 = _53 * _88;
    int _94 = _92 + _57;
    uint _96 = uint(int(uint(_90) >> uint(31)));
    bool _100 = uint(_94) >= uint(_47);
    int _102 = -int(_96);
    int _104 = as_type<int>(_63) >> 31;
    bool _106 = !_100;
    int _108 = _106 ? 0 : (-1);
    bool _110 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z) == 0;
    int _112 = ~_108;
    int _114 = _88 + _112;
    int _116 = _114 + 1;
    int _118 = _104 & 1;
    int _120 = _116 ^ _102;
    float _122 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].w));
    int _124 = as_type<int>(_63) + _118;
    int _126 = as_type<int>(_63) & 1;
    int _128 = -_102;
    int _130 = _120 + _128;
    float _132 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
    float _134 = 1.0 / _122;
    int _136 = _124 >> 1;
    bool _138 = !_110;
    int _140 = _138 ? _130 : (-1);
    float _142 = float(_126);
    float _144 = float(_136);
    float _146 = 1.0 / _132;
    int _148 = -_140;
    float _150 = float(_140);
    int _152 = _148 * as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
    int _154 = _152 + _45;
    float _156 = _144 + _150;
    float _158 = _134 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _160 = float(_154);
    float _162 = _158 * _156;
    float _164 = fma(2.0, (*spvDescriptorSet0.vp_c3)._m0[7].z, -1.0);
    float _166 = _142 + _160;
    float _168 = _146 * (*spvDescriptorSet0.vp_c3)._m0[7].x;
    float _170 = fma(_162, -2.0, 1.0);
    float _172 = _168 * _166;
    float _174 = fma(_172, 2.0, -1.0);
    out.gl_Position.x = _174;
    out.gl_Position.y = _170;
    out.gl_Position.z = _164;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

