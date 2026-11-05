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

struct main0_in
{
    float4 m_28 [[attribute(0)]];
    uint4 m_25 [[attribute(2)]];
    uint4 m_23 [[attribute(4)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _42 = as_type<float>(in.m_23.x);
    float _44 = as_type<float>(in.m_25.x);
    int _47 = as_type<int>(_42) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _51 = _47 != 0;
    int _53 = as_type<int>(_42);
    bool _55 = _51;
    if (!_51)
    {
        float _57 = as_type<float>(in.m_23.y);
        _53 = as_type<int>(_57);
    }
    int _59 = _53;
    bool _61 = false;
    if (_51)
    {
        _61 = false;
    }
    bool _63 = _61;
    int _65 = 0;
    bool _67 = _63;
    if (!_51)
    {
        int _69 = _59 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _71 = _69 != 0;
        _65 = _71 ? (-1) : 0;
    }
    int _73 = _65;
    uint _76 = uint(int(uint(as_type<int>(_44)) >> uint(5)));
    int _78 = int(_76) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _80 = _73;
    if (!_51)
    {
        int _82 = ~_73;
        _67 = _82 != 0;
    }
    bool _84 = _67;
    int _86 = _78 << 4;
    int _88 = _86 + 224;
    int _90 = as_type<int>(_44) & 31;
    bool _92 = uint(_90) < 32u;
    int _94 = 1 << _90;
    int _96 = _92 ? _94 : 0;
    uint _98 = uint(int(uint(_88) >> uint(2)));
    uint _100 = uint(int(uint(int(_98)) >> uint(2)));
    int _102 = int(_98) & 3;
    float _104 = (*spvDescriptorSet0.vp_c3)._m0[int(_100)][_102];
    int _106 = 0;
    if (_84)
    {
        float _108 = as_type<float>(in.m_23.z);
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    if (!_84)
    {
        _55 = false;
    }
    bool _112 = _55;
    bool _114 = _112;
    if (_84)
    {
        int _116 = _110 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _118 = _116 != 0;
        _80 = _118 ? (-1) : 0;
    }
    int _120 = _80;
    float _122 = in.m_28.x;
    float _124 = in.m_28.y;
    float _126 = in.m_28.z;
    int _128 = _120;
    if (_84)
    {
        int _130 = ~_120;
        _114 = _130 != 0;
    }
    bool _132 = _114;
    int _134 = 0;
    if (_132)
    {
        float _136 = as_type<float>(in.m_23.w);
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    bool _140 = false;
    if (!_132)
    {
        _140 = false;
    }
    bool _142 = _140;
    int _144 = _96 & as_type<int>(_104);
    bool _146 = _144 != 0;
    float _148 = _124 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _150 = _124 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _152 = _124 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _154 = _124 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _156 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[2].x, _148);
    float _158 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[3].x, _150);
    float _160 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[4].x, _152);
    float _162 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[5].x, _154);
    float _164 = fma(_126, (*spvDescriptorSet0.vp_c3)._m0[2].z, _156);
    float _166 = fma(_126, (*spvDescriptorSet0.vp_c3)._m0[3].z, _158);
    float _168 = fma(_126, (*spvDescriptorSet0.vp_c3)._m0[4].z, _160);
    float _170 = fma(_126, (*spvDescriptorSet0.vp_c3)._m0[5].z, _162);
    float _172 = _164 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _174 = _166 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _176 = _168 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    int _178 = as_type<int>(_104);
    bool _180 = _142;
    if (_132)
    {
        int _182 = _138 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _184 = _182 != 0;
        _128 = _184 ? (-1) : 0;
    }
    int _186 = _128;
    float _188 = _170 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    if (!_146)
    {
        _178 = -1082130432;
    }
    int _190 = _178;
    if (_132)
    {
        int _192 = ~_186;
        _180 = _192 != 0;
    }
    bool _194 = _180;
    out.gl_Position.x = _172;
    out.gl_Position.y = _174;
    out.gl_Position.z = _176;
    out.gl_Position.w = _188;
    if (!_146)
    {
        float _497 = as_type<float>(_190);
        out.gl_Position.w = _497;
    }
    if (!_194)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.gl_Position.w = -1.0;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _42 = as_type<float>(in.m_23.x);
    float _44 = as_type<float>(in.m_25.x);
    int _47 = as_type<int>(_42) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _51 = _47 != 0;
    int _53 = as_type<int>(_42);
    bool _55 = _51;
    if (!_51)
    {
        float _57 = as_type<float>(in.m_23.y);
        _53 = as_type<int>(_57);
    }
    int _59 = _53;
    bool _61 = false;
    if (_51)
    {
        _61 = false;
    }
    bool _63 = _61;
    int _65 = 0;
    bool _67 = _63;
    if (!_51)
    {
        int _69 = _59 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _71 = _69 != 0;
        _65 = _71 ? (-1) : 0;
    }
    int _73 = _65;
    uint _76 = uint(int(uint(as_type<int>(_44)) >> uint(5)));
    int _78 = int(_76) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _80 = _73;
    if (!_51)
    {
        int _82 = ~_73;
        _67 = _82 != 0;
    }
    bool _84 = _67;
    int _86 = _78 << 4;
    int _88 = _86 + 224;
    int _90 = as_type<int>(_44) & 31;
    bool _92 = uint(_90) < 32u;
    int _94 = 1 << _90;
    int _96 = _92 ? _94 : 0;
    uint _98 = uint(int(uint(_88) >> uint(2)));
    uint _100 = uint(int(uint(int(_98)) >> uint(2)));
    int _102 = int(_98) & 3;
    float _104 = (*spvDescriptorSet0.vp_c3)._m0[int(_100)][_102];
    int _106 = 0;
    if (_84)
    {
        float _108 = as_type<float>(in.m_23.z);
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    if (!_84)
    {
        _55 = false;
    }
    bool _112 = _55;
    bool _114 = _112;
    if (_84)
    {
        int _116 = _110 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _118 = _116 != 0;
        _80 = _118 ? (-1) : 0;
    }
    int _120 = _80;
    float _122 = in.m_28.x;
    float _124 = in.m_28.y;
    float _126 = in.m_28.z;
    int _128 = _120;
    if (_84)
    {
        int _130 = ~_120;
        _114 = _130 != 0;
    }
    bool _132 = _114;
    int _134 = 0;
    if (_132)
    {
        float _136 = as_type<float>(in.m_23.w);
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    bool _140 = false;
    if (!_132)
    {
        _140 = false;
    }
    bool _142 = _140;
    int _144 = _96 & as_type<int>(_104);
    bool _146 = _144 != 0;
    float _148 = _124 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _150 = _124 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _152 = _124 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _154 = _124 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _156 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[2].x, _148);
    float _158 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[3].x, _150);
    float _160 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[4].x, _152);
    float _162 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[5].x, _154);
    float _164 = fma(_126, (*spvDescriptorSet0.vp_c3)._m0[2].z, _156);
    float _166 = fma(_126, (*spvDescriptorSet0.vp_c3)._m0[3].z, _158);
    float _168 = fma(_126, (*spvDescriptorSet0.vp_c3)._m0[4].z, _160);
    float _170 = fma(_126, (*spvDescriptorSet0.vp_c3)._m0[5].z, _162);
    float _172 = _164 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _174 = _166 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _176 = _168 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    int _178 = as_type<int>(_104);
    bool _180 = _142;
    if (_132)
    {
        int _182 = _138 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _184 = _182 != 0;
        _128 = _184 ? (-1) : 0;
    }
    int _186 = _128;
    float _188 = _170 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    if (!_146)
    {
        _178 = -1082130432;
    }
    int _190 = _178;
    if (_132)
    {
        int _192 = ~_186;
        _180 = _192 != 0;
    }
    bool _194 = _180;
    out.gl_Position.x = _172;
    out.gl_Position.y = _174;
    out.gl_Position.z = _176;
    out.gl_Position.w = _188;
    if (!_146)
    {
        float _497 = as_type<float>(_190);
        out.gl_Position.w = _497;
    }
    if (!_194)
    {
        return out;
    }
    out.gl_Position.w = -1.0;
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
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _42 = as_type<float>(in.m_23.x);
    float _44 = as_type<float>(in.m_25.x);
    int _47 = as_type<int>(_42) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _51 = _47 != 0;
    int _53 = as_type<int>(_42);
    bool _55 = _51;
    if (!_51)
    {
        float _57 = as_type<float>(in.m_23.y);
        _53 = as_type<int>(_57);
    }
    int _59 = _53;
    bool _61 = false;
    if (_51)
    {
        _61 = false;
    }
    bool _63 = _61;
    int _65 = 0;
    bool _67 = _63;
    if (!_51)
    {
        int _69 = _59 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _71 = _69 != 0;
        _65 = _71 ? (-1) : 0;
    }
    int _73 = _65;
    uint _76 = uint(int(uint(as_type<int>(_44)) >> uint(5)));
    int _78 = int(_76) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _80 = _73;
    if (!_51)
    {
        int _82 = ~_73;
        _67 = _82 != 0;
    }
    bool _84 = _67;
    int _86 = _78 << 4;
    int _88 = _86 + 224;
    int _90 = as_type<int>(_44) & 31;
    bool _92 = uint(_90) < 32u;
    int _94 = 1 << _90;
    int _96 = _92 ? _94 : 0;
    uint _98 = uint(int(uint(_88) >> uint(2)));
    uint _100 = uint(int(uint(int(_98)) >> uint(2)));
    int _102 = int(_98) & 3;
    float _104 = (*spvDescriptorSet0.vp_c3)._m0[int(_100)][_102];
    int _106 = 0;
    if (_84)
    {
        float _108 = as_type<float>(in.m_23.z);
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    if (!_84)
    {
        _55 = false;
    }
    bool _112 = _55;
    bool _114 = _112;
    if (_84)
    {
        int _116 = _110 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _118 = _116 != 0;
        _80 = _118 ? (-1) : 0;
    }
    int _120 = _80;
    float _122 = in.m_28.x;
    float _124 = in.m_28.y;
    float _126 = in.m_28.z;
    int _128 = _120;
    if (_84)
    {
        int _130 = ~_120;
        _114 = _130 != 0;
    }
    bool _132 = _114;
    int _134 = 0;
    if (_132)
    {
        float _136 = as_type<float>(in.m_23.w);
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    bool _140 = false;
    if (!_132)
    {
        _140 = false;
    }
    bool _142 = _140;
    int _144 = _96 & as_type<int>(_104);
    bool _146 = _144 != 0;
    float _148 = _124 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _150 = _124 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _152 = _124 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _154 = _124 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _156 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[2].x, _148);
    float _158 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[3].x, _150);
    float _160 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[4].x, _152);
    float _162 = fma(_122, (*spvDescriptorSet0.vp_c3)._m0[5].x, _154);
    float _164 = fma(_126, (*spvDescriptorSet0.vp_c3)._m0[2].z, _156);
    float _166 = fma(_126, (*spvDescriptorSet0.vp_c3)._m0[3].z, _158);
    float _168 = fma(_126, (*spvDescriptorSet0.vp_c3)._m0[4].z, _160);
    float _170 = fma(_126, (*spvDescriptorSet0.vp_c3)._m0[5].z, _162);
    float _172 = _164 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _174 = _166 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _176 = _168 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    int _178 = as_type<int>(_104);
    bool _180 = _142;
    if (_132)
    {
        int _182 = _138 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _184 = _182 != 0;
        _128 = _184 ? (-1) : 0;
    }
    int _186 = _128;
    float _188 = _170 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    if (!_146)
    {
        _178 = -1082130432;
    }
    int _190 = _178;
    if (_132)
    {
        int _192 = ~_186;
        _180 = _192 != 0;
    }
    bool _194 = _180;
    out.gl_Position.x = _172;
    out.gl_Position.y = _174;
    out.gl_Position.z = _176;
    out.gl_Position.w = _188;
    if (!_146)
    {
        float _497 = as_type<float>(_190);
        out.gl_Position.w = _497;
    }
    if (!_194)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

