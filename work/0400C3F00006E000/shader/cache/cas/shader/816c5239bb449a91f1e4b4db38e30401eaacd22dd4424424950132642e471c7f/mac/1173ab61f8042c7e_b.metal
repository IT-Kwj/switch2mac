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
    constant _16* vp_c1 [[id(0)]];
    constant _16* vp_c3 [[id(1)]];
};

struct main0_out
{
    float4 m_28 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_38 [[attribute(0)]];
    float4 m_36 [[attribute(1)]];
    float4 m_34 [[attribute(2)]];
    float4 m_40 [[attribute(4)]];
    uint4 m_25 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_28 = float4(0.0, 0.0, 0.0, 1.0);
    bool _94 = false;
    bool _92 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = as_type<float>(in.m_25.x);
    int _57 = as_type<int>(_54) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    bool _61 = _57 != 0;
    int _63 = 0;
    if (!_61)
    {
        _63 = 1073741824;
    }
    int _65 = _63;
    if (!_61)
    {
        out.m_28.x = 0.0;
    }
    int _67 = 0;
    if (!_61)
    {
        _67 = 1065353216;
    }
    int _69 = _67;
    if (!_61)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _240 = as_type<float>(_65);
        out.gl_Position.z = _240;
        float _243 = as_type<float>(_69);
        out.gl_Position.w = _243;
    }
    if (!_61)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _71 = as_type<float>(int(gl_VertexIndex));
    int _73 = as_type<int>(_71) + (-1);
    uint _76 = min(uint(_73), 2u);
    int _78 = int(_76) << 2;
    uint _80 = uint(int(uint(_78) >> uint(2)));
    uint _82 = uint(int(uint(int(_80)) >> uint(2)));
    int _84 = int(_80) & 3;
    float _86 = (*spvDescriptorSet0.vp_c1)._m0[int(_82)][_84];
    bool _88 = as_type<int>(_86) == 256;
    if (!_88)
    {
        bool _90 = as_type<int>(_86) == 288;
        _92 = _90;
        if (!_92)
        {
            _94 = true;
        }
    }
    float _102;
    float _104;
    float _106;
    if (!_92)
    {
        if (!_94)
        {
            float _96 = in.m_34.x;
            float _98 = in.m_34.y;
            float _100 = in.m_34.z;
            _102 = _98;
            _104 = _96;
            _106 = _100;
        }
    }
    if ((false || _94) || _92)
    {
        if ((!_94) || _92)
        {
            _92 = false;
            float _108 = in.m_36.x;
            float _110 = in.m_36.y;
            float _112 = in.m_36.z;
            _102 = _110;
            _104 = _108;
            _106 = _112;
        }
        if (false || _94)
        {
            _94 = false;
            float _114 = in.m_38.x;
            float _116 = in.m_38.y;
            float _118 = in.m_38.z;
            _102 = _116;
            _104 = _114;
            _106 = _118;
        }
    }
    float _120 = _102;
    float _122 = _104;
    float _124 = _106;
    float _126 = _120 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _128 = _120 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _130 = _120 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _132 = in.m_40.x;
    float _134 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[1].x, _126);
    float _136 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[0].x, _128);
    float _138 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[2].x, _130);
    float _140 = in.m_40.y;
    float _142 = fma(_124, (*spvDescriptorSet0.vp_c3)._m0[1].z, _134);
    float _144 = fma(_124, (*spvDescriptorSet0.vp_c3)._m0[0].z, _136);
    float _146 = fma(_124, (*spvDescriptorSet0.vp_c3)._m0[2].z, _138);
    float _148 = in.m_40.z;
    float _150 = _142 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _152 = _144 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _154 = _146 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _156 = in.m_40.w;
    float _158 = _150 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _160 = _150 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _162 = _150 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _164 = _150 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _166 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[4].x, _158);
    float _168 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[3].x, _160);
    float _170 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[5].x, _162);
    float _172 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[6].x, _164);
    float _174 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[4].z, _166);
    float _176 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[3].z, _168);
    float _178 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[5].z, _170);
    float _180 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[6].z, _172);
    float _182 = _174 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _184 = _176 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _186 = _178 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _188 = _180 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    out.m_28.x = _132;
    out.m_28.y = _140;
    out.m_28.z = _148;
    out.m_28.w = _156;
    out.gl_Position.x = _184;
    out.gl_Position.y = _182;
    out.gl_Position.z = _186;
    out.gl_Position.w = _188;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_28 = float4(0.0, 0.0, 0.0, 1.0);
    bool _94 = false;
    bool _92 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = as_type<float>(in.m_25.x);
    int _57 = as_type<int>(_54) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    bool _61 = _57 != 0;
    int _63 = 0;
    if (!_61)
    {
        _63 = 1073741824;
    }
    int _65 = _63;
    if (!_61)
    {
        out.m_28.x = 0.0;
    }
    int _67 = 0;
    if (!_61)
    {
        _67 = 1065353216;
    }
    int _69 = _67;
    if (!_61)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _240 = as_type<float>(_65);
        out.gl_Position.z = _240;
        float _243 = as_type<float>(_69);
        out.gl_Position.w = _243;
    }
    if (!_61)
    {
        return out;
    }
    float _71 = as_type<float>(int(gl_VertexIndex));
    int _73 = as_type<int>(_71) + (-1);
    uint _76 = min(uint(_73), 2u);
    int _78 = int(_76) << 2;
    uint _80 = uint(int(uint(_78) >> uint(2)));
    uint _82 = uint(int(uint(int(_80)) >> uint(2)));
    int _84 = int(_80) & 3;
    float _86 = (*spvDescriptorSet0.vp_c1)._m0[int(_82)][_84];
    bool _88 = as_type<int>(_86) == 256;
    if (!_88)
    {
        bool _90 = as_type<int>(_86) == 288;
        _92 = _90;
        if (!_92)
        {
            _94 = true;
        }
    }
    float _102;
    float _104;
    float _106;
    if (!_92)
    {
        if (!_94)
        {
            float _96 = in.m_34.x;
            float _98 = in.m_34.y;
            float _100 = in.m_34.z;
            _102 = _98;
            _104 = _96;
            _106 = _100;
        }
    }
    if ((false || _94) || _92)
    {
        if ((!_94) || _92)
        {
            _92 = false;
            float _108 = in.m_36.x;
            float _110 = in.m_36.y;
            float _112 = in.m_36.z;
            _102 = _110;
            _104 = _108;
            _106 = _112;
        }
        if (false || _94)
        {
            _94 = false;
            float _114 = in.m_38.x;
            float _116 = in.m_38.y;
            float _118 = in.m_38.z;
            _102 = _116;
            _104 = _114;
            _106 = _118;
        }
    }
    float _120 = _102;
    float _122 = _104;
    float _124 = _106;
    float _126 = _120 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _128 = _120 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _130 = _120 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _132 = in.m_40.x;
    float _134 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[1].x, _126);
    float _136 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[0].x, _128);
    float _138 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[2].x, _130);
    float _140 = in.m_40.y;
    float _142 = fma(_124, (*spvDescriptorSet0.vp_c3)._m0[1].z, _134);
    float _144 = fma(_124, (*spvDescriptorSet0.vp_c3)._m0[0].z, _136);
    float _146 = fma(_124, (*spvDescriptorSet0.vp_c3)._m0[2].z, _138);
    float _148 = in.m_40.z;
    float _150 = _142 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _152 = _144 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _154 = _146 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _156 = in.m_40.w;
    float _158 = _150 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _160 = _150 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _162 = _150 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _164 = _150 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _166 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[4].x, _158);
    float _168 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[3].x, _160);
    float _170 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[5].x, _162);
    float _172 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[6].x, _164);
    float _174 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[4].z, _166);
    float _176 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[3].z, _168);
    float _178 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[5].z, _170);
    float _180 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[6].z, _172);
    float _182 = _174 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _184 = _176 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _186 = _178 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _188 = _180 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    out.m_28.x = _132;
    out.m_28.y = _140;
    out.m_28.z = _148;
    out.m_28.w = _156;
    out.gl_Position.x = _184;
    out.gl_Position.y = _182;
    out.gl_Position.z = _186;
    out.gl_Position.w = _188;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_28 = float4(0.0, 0.0, 0.0, 1.0);
    bool _94 = false;
    bool _92 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = as_type<float>(in.m_25.x);
    int _57 = as_type<int>(_54) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    bool _61 = _57 != 0;
    int _63 = 0;
    if (!_61)
    {
        _63 = 1073741824;
    }
    int _65 = _63;
    if (!_61)
    {
        out.m_28.x = 0.0;
    }
    int _67 = 0;
    if (!_61)
    {
        _67 = 1065353216;
    }
    int _69 = _67;
    if (!_61)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _240 = as_type<float>(_65);
        out.gl_Position.z = _240;
        float _243 = as_type<float>(_69);
        out.gl_Position.w = _243;
    }
    if (!_61)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_28.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_28.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_28.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_28.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _71 = as_type<float>(int(gl_VertexIndex));
    int _73 = as_type<int>(_71) + (-1);
    uint _76 = min(uint(_73), 2u);
    int _78 = int(_76) << 2;
    uint _80 = uint(int(uint(_78) >> uint(2)));
    uint _82 = uint(int(uint(int(_80)) >> uint(2)));
    int _84 = int(_80) & 3;
    float _86 = (*spvDescriptorSet0.vp_c1)._m0[int(_82)][_84];
    bool _88 = as_type<int>(_86) == 256;
    if (!_88)
    {
        bool _90 = as_type<int>(_86) == 288;
        _92 = _90;
        if (!_92)
        {
            _94 = true;
        }
    }
    float _102;
    float _104;
    float _106;
    if (!_92)
    {
        if (!_94)
        {
            float _96 = in.m_34.x;
            float _98 = in.m_34.y;
            float _100 = in.m_34.z;
            _102 = _98;
            _104 = _96;
            _106 = _100;
        }
    }
    if ((false || _94) || _92)
    {
        if ((!_94) || _92)
        {
            _92 = false;
            float _108 = in.m_36.x;
            float _110 = in.m_36.y;
            float _112 = in.m_36.z;
            _102 = _110;
            _104 = _108;
            _106 = _112;
        }
        if (false || _94)
        {
            _94 = false;
            float _114 = in.m_38.x;
            float _116 = in.m_38.y;
            float _118 = in.m_38.z;
            _102 = _116;
            _104 = _114;
            _106 = _118;
        }
    }
    float _120 = _102;
    float _122 = _104;
    float _124 = _106;
    float _126 = _120 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _128 = _120 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _130 = _120 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _132 = in.m_40.x;
    float _134 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[1].x, _126);
    float _136 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[0].x, _128);
    float _138 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[2].x, _130);
    float _140 = in.m_40.y;
    float _142 = fma(_124, (*spvDescriptorSet0.vp_c3)._m0[1].z, _134);
    float _144 = fma(_124, (*spvDescriptorSet0.vp_c3)._m0[0].z, _136);
    float _146 = fma(_124, (*spvDescriptorSet0.vp_c3)._m0[2].z, _138);
    float _148 = in.m_40.z;
    float _150 = _142 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _152 = _144 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _154 = _146 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _156 = in.m_40.w;
    float _158 = _150 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _160 = _150 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _162 = _150 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _164 = _150 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _166 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[4].x, _158);
    float _168 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[3].x, _160);
    float _170 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[5].x, _162);
    float _172 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[6].x, _164);
    float _174 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[4].z, _166);
    float _176 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[3].z, _168);
    float _178 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[5].z, _170);
    float _180 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[6].z, _172);
    float _182 = _174 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _184 = _176 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _186 = _178 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _188 = _180 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    out.m_28.x = _132;
    out.m_28.y = _140;
    out.m_28.z = _148;
    out.m_28.w = _156;
    out.gl_Position.x = _184;
    out.gl_Position.y = _182;
    out.gl_Position.z = _186;
    out.gl_Position.w = _188;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_28.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_28.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_28.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_28.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

