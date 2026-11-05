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
    float4 m_30 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_27 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_30 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _44 = as_type<float>(int(gl_InstanceIndex));
    float _46 = as_type<float>(int(gl_BaseInstance));
    int _49 = as_type<int>(_44) - as_type<int>(_46);
    float _51 = in.m_27.x;
    float _53 = in.m_27.y;
    int _55 = _49 << 4;
    int _57 = _55 + 112;
    int _59 = _57 + 12;
    uint _62 = uint(int(uint(_59) >> uint(2)));
    uint _64 = uint(int(uint(int(_62)) >> uint(2)));
    int _66 = int(_62) & 3;
    float _68 = (*spvDescriptorSet0.vp_c3)._m0[int(_64)][_66];
    float _70 = _53 + 0.5;
    float _72 = _51 + 0.5;
    float _74 = -_53;
    float _76 = _74 + 0.5;
    int _78 = _57 + 8;
    uint _80 = uint(int(uint(_78) >> uint(2)));
    uint _82 = uint(int(uint(int(_80)) >> uint(2)));
    int _84 = int(_80) & 3;
    float _86 = (*spvDescriptorSet0.vp_c3)._m0[int(_82)][_84];
    int _88 = _57 + 4;
    uint _90 = uint(int(uint(_88) >> uint(2)));
    uint _92 = uint(int(uint(int(_90)) >> uint(2)));
    int _94 = int(_90) & 3;
    float _96 = (*spvDescriptorSet0.vp_c3)._m0[int(_92)][_94];
    uint _98 = uint(int(uint(_57) >> uint(2)));
    uint _100 = uint(int(uint(int(_98)) >> uint(2)));
    int _102 = int(_98) & 3;
    float _104 = (*spvDescriptorSet0.vp_c3)._m0[int(_100)][_102];
    float _106 = float2(as_type<half2>(as_type<uint>(_68))).y;
    float _108 = (-0.0) + _106;
    float _110 = float2(as_type<half2>(as_type<uint>(_68))).x;
    float _112 = (-0.0) + _110;
    float _114 = _108 * _70;
    float _116 = _112 * _72;
    int _118 = as_type<int>(_86) & 65535;
    uint _120 = uint(int(uint(as_type<int>(_86)) >> uint(16)));
    float _122 = float(_118);
    float _124 = float(int(_120));
    int _126 = as_type<int>(_96) & 65535;
    uint _128 = uint(int(uint(as_type<int>(_96)) >> uint(16)));
    float _130 = float(_126);
    float _132 = float(int(_128));
    float _134 = float2(as_type<half2>(as_type<uint>(_104))).y;
    float _136 = (-0.0) + _134;
    float _138 = -_130;
    float _140 = _138 + _122;
    float _142 = float2(as_type<half2>(as_type<uint>(_104))).x;
    float _144 = (-0.0) + _142;
    float _146 = -_132;
    float _148 = _146 + _124;
    float _150 = fma(_114, (*spvDescriptorSet0.vp_c3)._m0[5].x, _136);
    float _152 = fma(_72, _140, _130);
    float _154 = fma(_76, _148, _132);
    float _156 = fma(_116, (*spvDescriptorSet0.vp_c3)._m0[5].x, _144);
    float _158 = _150 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _160 = _150 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _162 = _150 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _164 = _150 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _166 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[0].x, _158);
    float _168 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[1].x, _160);
    float _170 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[2].x, _162);
    float _172 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[3].x, _164);
    float _174 = _152 * 1.525902189314365386962890625e-05;
    float _176 = _154 * 1.525902189314365386962890625e-05;
    float _178 = _166 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _180 = _168 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _182 = _170 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _184 = _172 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_30.x = _174;
    out.m_30.y = _176;
    out.gl_Position.x = _178;
    out.gl_Position.y = _180;
    out.gl_Position.z = _182;
    out.gl_Position.w = _184;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_30 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _44 = as_type<float>(int(gl_InstanceIndex));
    float _46 = as_type<float>(int(gl_BaseInstance));
    int _49 = as_type<int>(_44) - as_type<int>(_46);
    float _51 = in.m_27.x;
    float _53 = in.m_27.y;
    int _55 = _49 << 4;
    int _57 = _55 + 112;
    int _59 = _57 + 12;
    uint _62 = uint(int(uint(_59) >> uint(2)));
    uint _64 = uint(int(uint(int(_62)) >> uint(2)));
    int _66 = int(_62) & 3;
    float _68 = (*spvDescriptorSet0.vp_c3)._m0[int(_64)][_66];
    float _70 = _53 + 0.5;
    float _72 = _51 + 0.5;
    float _74 = -_53;
    float _76 = _74 + 0.5;
    int _78 = _57 + 8;
    uint _80 = uint(int(uint(_78) >> uint(2)));
    uint _82 = uint(int(uint(int(_80)) >> uint(2)));
    int _84 = int(_80) & 3;
    float _86 = (*spvDescriptorSet0.vp_c3)._m0[int(_82)][_84];
    int _88 = _57 + 4;
    uint _90 = uint(int(uint(_88) >> uint(2)));
    uint _92 = uint(int(uint(int(_90)) >> uint(2)));
    int _94 = int(_90) & 3;
    float _96 = (*spvDescriptorSet0.vp_c3)._m0[int(_92)][_94];
    uint _98 = uint(int(uint(_57) >> uint(2)));
    uint _100 = uint(int(uint(int(_98)) >> uint(2)));
    int _102 = int(_98) & 3;
    float _104 = (*spvDescriptorSet0.vp_c3)._m0[int(_100)][_102];
    float _106 = float2(as_type<half2>(as_type<uint>(_68))).y;
    float _108 = (-0.0) + _106;
    float _110 = float2(as_type<half2>(as_type<uint>(_68))).x;
    float _112 = (-0.0) + _110;
    float _114 = _108 * _70;
    float _116 = _112 * _72;
    int _118 = as_type<int>(_86) & 65535;
    uint _120 = uint(int(uint(as_type<int>(_86)) >> uint(16)));
    float _122 = float(_118);
    float _124 = float(int(_120));
    int _126 = as_type<int>(_96) & 65535;
    uint _128 = uint(int(uint(as_type<int>(_96)) >> uint(16)));
    float _130 = float(_126);
    float _132 = float(int(_128));
    float _134 = float2(as_type<half2>(as_type<uint>(_104))).y;
    float _136 = (-0.0) + _134;
    float _138 = -_130;
    float _140 = _138 + _122;
    float _142 = float2(as_type<half2>(as_type<uint>(_104))).x;
    float _144 = (-0.0) + _142;
    float _146 = -_132;
    float _148 = _146 + _124;
    float _150 = fma(_114, (*spvDescriptorSet0.vp_c3)._m0[5].x, _136);
    float _152 = fma(_72, _140, _130);
    float _154 = fma(_76, _148, _132);
    float _156 = fma(_116, (*spvDescriptorSet0.vp_c3)._m0[5].x, _144);
    float _158 = _150 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _160 = _150 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _162 = _150 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _164 = _150 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _166 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[0].x, _158);
    float _168 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[1].x, _160);
    float _170 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[2].x, _162);
    float _172 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[3].x, _164);
    float _174 = _152 * 1.525902189314365386962890625e-05;
    float _176 = _154 * 1.525902189314365386962890625e-05;
    float _178 = _166 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _180 = _168 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _182 = _170 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _184 = _172 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_30.x = _174;
    out.m_30.y = _176;
    out.gl_Position.x = _178;
    out.gl_Position.y = _180;
    out.gl_Position.z = _182;
    out.gl_Position.w = _184;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], uint dm_vid [[vertex_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_iid = gl_InstanceIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_30 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _44 = as_type<float>(int(gl_InstanceIndex));
    float _46 = as_type<float>(int(gl_BaseInstance));
    int _49 = as_type<int>(_44) - as_type<int>(_46);
    float _51 = in.m_27.x;
    float _53 = in.m_27.y;
    int _55 = _49 << 4;
    int _57 = _55 + 112;
    int _59 = _57 + 12;
    uint _62 = uint(int(uint(_59) >> uint(2)));
    uint _64 = uint(int(uint(int(_62)) >> uint(2)));
    int _66 = int(_62) & 3;
    float _68 = (*spvDescriptorSet0.vp_c3)._m0[int(_64)][_66];
    float _70 = _53 + 0.5;
    float _72 = _51 + 0.5;
    float _74 = -_53;
    float _76 = _74 + 0.5;
    int _78 = _57 + 8;
    uint _80 = uint(int(uint(_78) >> uint(2)));
    uint _82 = uint(int(uint(int(_80)) >> uint(2)));
    int _84 = int(_80) & 3;
    float _86 = (*spvDescriptorSet0.vp_c3)._m0[int(_82)][_84];
    int _88 = _57 + 4;
    uint _90 = uint(int(uint(_88) >> uint(2)));
    uint _92 = uint(int(uint(int(_90)) >> uint(2)));
    int _94 = int(_90) & 3;
    float _96 = (*spvDescriptorSet0.vp_c3)._m0[int(_92)][_94];
    uint _98 = uint(int(uint(_57) >> uint(2)));
    uint _100 = uint(int(uint(int(_98)) >> uint(2)));
    int _102 = int(_98) & 3;
    float _104 = (*spvDescriptorSet0.vp_c3)._m0[int(_100)][_102];
    float _106 = float2(as_type<half2>(as_type<uint>(_68))).y;
    float _108 = (-0.0) + _106;
    float _110 = float2(as_type<half2>(as_type<uint>(_68))).x;
    float _112 = (-0.0) + _110;
    float _114 = _108 * _70;
    float _116 = _112 * _72;
    int _118 = as_type<int>(_86) & 65535;
    uint _120 = uint(int(uint(as_type<int>(_86)) >> uint(16)));
    float _122 = float(_118);
    float _124 = float(int(_120));
    int _126 = as_type<int>(_96) & 65535;
    uint _128 = uint(int(uint(as_type<int>(_96)) >> uint(16)));
    float _130 = float(_126);
    float _132 = float(int(_128));
    float _134 = float2(as_type<half2>(as_type<uint>(_104))).y;
    float _136 = (-0.0) + _134;
    float _138 = -_130;
    float _140 = _138 + _122;
    float _142 = float2(as_type<half2>(as_type<uint>(_104))).x;
    float _144 = (-0.0) + _142;
    float _146 = -_132;
    float _148 = _146 + _124;
    float _150 = fma(_114, (*spvDescriptorSet0.vp_c3)._m0[5].x, _136);
    float _152 = fma(_72, _140, _130);
    float _154 = fma(_76, _148, _132);
    float _156 = fma(_116, (*spvDescriptorSet0.vp_c3)._m0[5].x, _144);
    float _158 = _150 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _160 = _150 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _162 = _150 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _164 = _150 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _166 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[0].x, _158);
    float _168 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[1].x, _160);
    float _170 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[2].x, _162);
    float _172 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[3].x, _164);
    float _174 = _152 * 1.525902189314365386962890625e-05;
    float _176 = _154 * 1.525902189314365386962890625e-05;
    float _178 = _166 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _180 = _168 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _182 = _170 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _184 = _172 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_30.x = _174;
    out.m_30.y = _176;
    out.gl_Position.x = _178;
    out.gl_Position.y = _180;
    out.gl_Position.z = _182;
    out.gl_Position.w = _184;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_30.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_30.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_30.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_30.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

