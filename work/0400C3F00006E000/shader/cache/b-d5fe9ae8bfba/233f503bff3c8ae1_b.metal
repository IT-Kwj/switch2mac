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
    uint4 m_23 [[attribute(2)]];
    uint4 m_25 [[attribute(4)]];
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
    int _47 = as_type<int>(_42) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].y);
    int _49 = as_type<int>(_44) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _53 = _49 != 0;
    int _55 = _47 << 4;
    int _57 = _55 + 224;
    uint _60 = uint(int(uint(_57) >> uint(2)));
    uint _62 = uint(int(uint(int(_60)) >> uint(2)));
    int _64 = int(_60) & 3;
    float _66 = (*spvDescriptorSet0.vp_c3)._m0[int(_62)][_64];
    int _68 = _47;
    bool _70 = _53;
    if (!_53)
    {
        float _72 = as_type<float>(in.m_25.y);
        _68 = as_type<int>(_72);
    }
    int _74 = _68;
    bool _76 = false;
    if (_53)
    {
        _76 = false;
    }
    bool _78 = _76;
    int _80 = 0;
    bool _82 = _78;
    if (!_53)
    {
        int _84 = _74 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _86 = _84 != 0;
        _80 = _86 ? (-1) : 0;
    }
    int _88 = _80;
    int _90 = _88;
    if (!_53)
    {
        int _92 = ~_88;
        _82 = _92 != 0;
    }
    bool _94 = _82;
    int _96 = as_type<int>(_44);
    if (_94)
    {
        float _98 = as_type<float>(in.m_25.z);
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    if (!_94)
    {
        _70 = false;
    }
    bool _102 = _70;
    uint _104 = uint(int(uint(as_type<int>(_66)) >> uint(5)));
    int _106 = int(_104) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _108 = as_type<int>(_66) & 31;
    bool _110 = uint(_108) < 32u;
    int _112 = 1 << _108;
    int _114 = _110 ? _112 : 0;
    int _116 = _106 << 4;
    int _118 = _116 + 224;
    uint _120 = uint(int(uint(_118) >> uint(2)));
    uint _122 = uint(int(uint(int(_120)) >> uint(2)));
    int _124 = int(_120) & 3;
    float _126 = (*spvDescriptorSet0.vp_c3)._m0[int(_122)][_124];
    bool _128 = _102;
    int _130 = as_type<int>(_66);
    if (_94)
    {
        int _132 = _100 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _134 = _132 != 0;
        _90 = _134 ? (-1) : 0;
    }
    int _136 = _90;
    float _138 = in.m_28.x;
    float _140 = in.m_28.y;
    float _142 = in.m_28.z;
    int _144 = _136;
    if (_94)
    {
        int _146 = ~_136;
        _128 = _146 != 0;
    }
    bool _148 = _128;
    int _150 = 0;
    if (_148)
    {
        float _152 = as_type<float>(in.m_25.w);
        _150 = as_type<int>(_152);
    }
    int _154 = _150;
    bool _156 = false;
    if (!_148)
    {
        _156 = false;
    }
    bool _158 = _156;
    float _160 = _140 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _162 = _140 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _164 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[2].x, _160);
    float _166 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[4].x, _162);
    float _168 = fma(_142, (*spvDescriptorSet0.vp_c3)._m0[2].z, _164);
    float _170 = fma(_142, (*spvDescriptorSet0.vp_c3)._m0[4].z, _166);
    int _172 = _114 & as_type<int>(_126);
    bool _174 = _172 != 0;
    float _176 = _140 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _178 = _140 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    bool _180 = _158;
    if (_148)
    {
        int _182 = _154 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _184 = _182 != 0;
        _144 = _184 ? (-1) : 0;
    }
    int _186 = _144;
    float _188 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[3].x, _176);
    float _190 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[5].x, _178);
    float _192 = _168 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    if (_148)
    {
        int _194 = ~_186;
        _180 = _194 != 0;
    }
    bool _196 = _180;
    float _198 = fma(_142, (*spvDescriptorSet0.vp_c3)._m0[3].z, _188);
    float _200 = fma(_142, (*spvDescriptorSet0.vp_c3)._m0[5].z, _190);
    float _202 = _170 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _204 = _198 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _206 = _200 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    if (!_174)
    {
        _130 = -1082130432;
    }
    int _208 = _130;
    out.gl_Position.x = _192;
    out.gl_Position.y = _204;
    out.gl_Position.z = _202;
    out.gl_Position.w = _206;
    if (!_174)
    {
        float _537 = as_type<float>(_208);
        out.gl_Position.w = _537;
    }
    if (!_196)
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
    int _47 = as_type<int>(_42) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].y);
    int _49 = as_type<int>(_44) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _53 = _49 != 0;
    int _55 = _47 << 4;
    int _57 = _55 + 224;
    uint _60 = uint(int(uint(_57) >> uint(2)));
    uint _62 = uint(int(uint(int(_60)) >> uint(2)));
    int _64 = int(_60) & 3;
    float _66 = (*spvDescriptorSet0.vp_c3)._m0[int(_62)][_64];
    int _68 = _47;
    bool _70 = _53;
    if (!_53)
    {
        float _72 = as_type<float>(in.m_25.y);
        _68 = as_type<int>(_72);
    }
    int _74 = _68;
    bool _76 = false;
    if (_53)
    {
        _76 = false;
    }
    bool _78 = _76;
    int _80 = 0;
    bool _82 = _78;
    if (!_53)
    {
        int _84 = _74 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _86 = _84 != 0;
        _80 = _86 ? (-1) : 0;
    }
    int _88 = _80;
    int _90 = _88;
    if (!_53)
    {
        int _92 = ~_88;
        _82 = _92 != 0;
    }
    bool _94 = _82;
    int _96 = as_type<int>(_44);
    if (_94)
    {
        float _98 = as_type<float>(in.m_25.z);
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    if (!_94)
    {
        _70 = false;
    }
    bool _102 = _70;
    uint _104 = uint(int(uint(as_type<int>(_66)) >> uint(5)));
    int _106 = int(_104) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _108 = as_type<int>(_66) & 31;
    bool _110 = uint(_108) < 32u;
    int _112 = 1 << _108;
    int _114 = _110 ? _112 : 0;
    int _116 = _106 << 4;
    int _118 = _116 + 224;
    uint _120 = uint(int(uint(_118) >> uint(2)));
    uint _122 = uint(int(uint(int(_120)) >> uint(2)));
    int _124 = int(_120) & 3;
    float _126 = (*spvDescriptorSet0.vp_c3)._m0[int(_122)][_124];
    bool _128 = _102;
    int _130 = as_type<int>(_66);
    if (_94)
    {
        int _132 = _100 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _134 = _132 != 0;
        _90 = _134 ? (-1) : 0;
    }
    int _136 = _90;
    float _138 = in.m_28.x;
    float _140 = in.m_28.y;
    float _142 = in.m_28.z;
    int _144 = _136;
    if (_94)
    {
        int _146 = ~_136;
        _128 = _146 != 0;
    }
    bool _148 = _128;
    int _150 = 0;
    if (_148)
    {
        float _152 = as_type<float>(in.m_25.w);
        _150 = as_type<int>(_152);
    }
    int _154 = _150;
    bool _156 = false;
    if (!_148)
    {
        _156 = false;
    }
    bool _158 = _156;
    float _160 = _140 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _162 = _140 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _164 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[2].x, _160);
    float _166 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[4].x, _162);
    float _168 = fma(_142, (*spvDescriptorSet0.vp_c3)._m0[2].z, _164);
    float _170 = fma(_142, (*spvDescriptorSet0.vp_c3)._m0[4].z, _166);
    int _172 = _114 & as_type<int>(_126);
    bool _174 = _172 != 0;
    float _176 = _140 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _178 = _140 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    bool _180 = _158;
    if (_148)
    {
        int _182 = _154 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _184 = _182 != 0;
        _144 = _184 ? (-1) : 0;
    }
    int _186 = _144;
    float _188 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[3].x, _176);
    float _190 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[5].x, _178);
    float _192 = _168 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    if (_148)
    {
        int _194 = ~_186;
        _180 = _194 != 0;
    }
    bool _196 = _180;
    float _198 = fma(_142, (*spvDescriptorSet0.vp_c3)._m0[3].z, _188);
    float _200 = fma(_142, (*spvDescriptorSet0.vp_c3)._m0[5].z, _190);
    float _202 = _170 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _204 = _198 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _206 = _200 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    if (!_174)
    {
        _130 = -1082130432;
    }
    int _208 = _130;
    out.gl_Position.x = _192;
    out.gl_Position.y = _204;
    out.gl_Position.z = _202;
    out.gl_Position.w = _206;
    if (!_174)
    {
        float _537 = as_type<float>(_208);
        out.gl_Position.w = _537;
    }
    if (!_196)
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
    int _47 = as_type<int>(_42) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].y);
    int _49 = as_type<int>(_44) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _53 = _49 != 0;
    int _55 = _47 << 4;
    int _57 = _55 + 224;
    uint _60 = uint(int(uint(_57) >> uint(2)));
    uint _62 = uint(int(uint(int(_60)) >> uint(2)));
    int _64 = int(_60) & 3;
    float _66 = (*spvDescriptorSet0.vp_c3)._m0[int(_62)][_64];
    int _68 = _47;
    bool _70 = _53;
    if (!_53)
    {
        float _72 = as_type<float>(in.m_25.y);
        _68 = as_type<int>(_72);
    }
    int _74 = _68;
    bool _76 = false;
    if (_53)
    {
        _76 = false;
    }
    bool _78 = _76;
    int _80 = 0;
    bool _82 = _78;
    if (!_53)
    {
        int _84 = _74 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _86 = _84 != 0;
        _80 = _86 ? (-1) : 0;
    }
    int _88 = _80;
    int _90 = _88;
    if (!_53)
    {
        int _92 = ~_88;
        _82 = _92 != 0;
    }
    bool _94 = _82;
    int _96 = as_type<int>(_44);
    if (_94)
    {
        float _98 = as_type<float>(in.m_25.z);
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    if (!_94)
    {
        _70 = false;
    }
    bool _102 = _70;
    uint _104 = uint(int(uint(as_type<int>(_66)) >> uint(5)));
    int _106 = int(_104) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _108 = as_type<int>(_66) & 31;
    bool _110 = uint(_108) < 32u;
    int _112 = 1 << _108;
    int _114 = _110 ? _112 : 0;
    int _116 = _106 << 4;
    int _118 = _116 + 224;
    uint _120 = uint(int(uint(_118) >> uint(2)));
    uint _122 = uint(int(uint(int(_120)) >> uint(2)));
    int _124 = int(_120) & 3;
    float _126 = (*spvDescriptorSet0.vp_c3)._m0[int(_122)][_124];
    bool _128 = _102;
    int _130 = as_type<int>(_66);
    if (_94)
    {
        int _132 = _100 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _134 = _132 != 0;
        _90 = _134 ? (-1) : 0;
    }
    int _136 = _90;
    float _138 = in.m_28.x;
    float _140 = in.m_28.y;
    float _142 = in.m_28.z;
    int _144 = _136;
    if (_94)
    {
        int _146 = ~_136;
        _128 = _146 != 0;
    }
    bool _148 = _128;
    int _150 = 0;
    if (_148)
    {
        float _152 = as_type<float>(in.m_25.w);
        _150 = as_type<int>(_152);
    }
    int _154 = _150;
    bool _156 = false;
    if (!_148)
    {
        _156 = false;
    }
    bool _158 = _156;
    float _160 = _140 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _162 = _140 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _164 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[2].x, _160);
    float _166 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[4].x, _162);
    float _168 = fma(_142, (*spvDescriptorSet0.vp_c3)._m0[2].z, _164);
    float _170 = fma(_142, (*spvDescriptorSet0.vp_c3)._m0[4].z, _166);
    int _172 = _114 & as_type<int>(_126);
    bool _174 = _172 != 0;
    float _176 = _140 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _178 = _140 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    bool _180 = _158;
    if (_148)
    {
        int _182 = _154 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _184 = _182 != 0;
        _144 = _184 ? (-1) : 0;
    }
    int _186 = _144;
    float _188 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[3].x, _176);
    float _190 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[5].x, _178);
    float _192 = _168 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    if (_148)
    {
        int _194 = ~_186;
        _180 = _194 != 0;
    }
    bool _196 = _180;
    float _198 = fma(_142, (*spvDescriptorSet0.vp_c3)._m0[3].z, _188);
    float _200 = fma(_142, (*spvDescriptorSet0.vp_c3)._m0[5].z, _190);
    float _202 = _170 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _204 = _198 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _206 = _200 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    if (!_174)
    {
        _130 = -1082130432;
    }
    int _208 = _130;
    out.gl_Position.x = _192;
    out.gl_Position.y = _204;
    out.gl_Position.z = _202;
    out.gl_Position.w = _206;
    if (!_174)
    {
        float _537 = as_type<float>(_208);
        out.gl_Position.w = _537;
    }
    if (!_196)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

