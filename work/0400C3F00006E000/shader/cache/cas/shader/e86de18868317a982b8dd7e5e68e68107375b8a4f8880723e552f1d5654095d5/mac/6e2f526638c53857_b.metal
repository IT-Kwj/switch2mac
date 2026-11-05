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
    int _49 = ~as_type<int>(_44);
    int _51 = _49 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _55 = _51 != 0;
    int _57 = _47 << 4;
    int _59 = _57 + 224;
    uint _62 = uint(int(uint(_59) >> uint(2)));
    uint _64 = uint(int(uint(int(_62)) >> uint(2)));
    int _66 = int(_62) & 3;
    float _68 = (*spvDescriptorSet0.vp_c3)._m0[int(_64)][_66];
    int _70 = _47;
    bool _72 = _55;
    if (!_55)
    {
        float _74 = as_type<float>(in.m_25.y);
        _70 = as_type<int>(_74);
    }
    int _76 = _70;
    bool _78 = false;
    if (_55)
    {
        _78 = false;
    }
    bool _80 = _78;
    int _82 = 0;
    bool _84 = _80;
    if (!_55)
    {
        int _86 = ~_76;
        int _88 = _86 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _90 = _88 != 0;
        _82 = _90 ? (-1) : 0;
    }
    int _92 = _82;
    int _94 = _92;
    if (!_55)
    {
        int _96 = ~_92;
        _84 = _96 != 0;
    }
    bool _98 = _84;
    int _100 = as_type<int>(_44);
    if (_98)
    {
        float _102 = as_type<float>(in.m_25.z);
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    if (!_98)
    {
        _72 = false;
    }
    bool _106 = _72;
    uint _108 = uint(int(uint(as_type<int>(_68)) >> uint(5)));
    int _110 = int(_108) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _112 = as_type<int>(_68) & 31;
    bool _114 = uint(_112) < 32u;
    int _116 = 1 << _112;
    int _118 = _114 ? _116 : 0;
    int _120 = _110 << 4;
    int _122 = _120 + 224;
    uint _124 = uint(int(uint(_122) >> uint(2)));
    uint _126 = uint(int(uint(int(_124)) >> uint(2)));
    int _128 = int(_124) & 3;
    float _130 = (*spvDescriptorSet0.vp_c3)._m0[int(_126)][_128];
    bool _132 = _106;
    int _134 = as_type<int>(_68);
    if (_98)
    {
        int _136 = ~_104;
        int _138 = _136 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _140 = _138 != 0;
        _94 = _140 ? (-1) : 0;
    }
    int _142 = _94;
    float _144 = in.m_28.x;
    float _146 = in.m_28.y;
    float _148 = in.m_28.z;
    int _150 = _142;
    if (_98)
    {
        int _152 = ~_142;
        _132 = _152 != 0;
    }
    bool _154 = _132;
    int _156 = 0;
    if (_154)
    {
        float _158 = as_type<float>(in.m_25.w);
        _156 = as_type<int>(_158);
    }
    int _160 = _156;
    bool _162 = false;
    if (!_154)
    {
        _162 = false;
    }
    bool _164 = _162;
    float _166 = _146 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _168 = _146 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _170 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[2].x, _166);
    float _172 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[4].x, _168);
    float _174 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[2].z, _170);
    float _176 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[4].z, _172);
    int _178 = _118 & as_type<int>(_130);
    bool _180 = _178 != 0;
    float _182 = _146 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _184 = _146 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    bool _186 = _164;
    if (_154)
    {
        int _188 = ~_160;
        int _190 = _188 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _192 = _190 != 0;
        _150 = _192 ? (-1) : 0;
    }
    int _194 = _150;
    float _196 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[3].x, _182);
    float _198 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[5].x, _184);
    float _200 = _174 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    if (_154)
    {
        int _202 = ~_194;
        _186 = _202 != 0;
    }
    bool _204 = _186;
    float _206 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[3].z, _196);
    float _208 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[5].z, _198);
    float _210 = _176 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _212 = _206 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _214 = _208 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    if (!_180)
    {
        _134 = -1082130432;
    }
    int _216 = _134;
    out.gl_Position.x = _200;
    out.gl_Position.y = _212;
    out.gl_Position.z = _210;
    out.gl_Position.w = _214;
    if (!_180)
    {
        float _553 = as_type<float>(_216);
        out.gl_Position.w = _553;
    }
    if (!_204)
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
    int _49 = ~as_type<int>(_44);
    int _51 = _49 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _55 = _51 != 0;
    int _57 = _47 << 4;
    int _59 = _57 + 224;
    uint _62 = uint(int(uint(_59) >> uint(2)));
    uint _64 = uint(int(uint(int(_62)) >> uint(2)));
    int _66 = int(_62) & 3;
    float _68 = (*spvDescriptorSet0.vp_c3)._m0[int(_64)][_66];
    int _70 = _47;
    bool _72 = _55;
    if (!_55)
    {
        float _74 = as_type<float>(in.m_25.y);
        _70 = as_type<int>(_74);
    }
    int _76 = _70;
    bool _78 = false;
    if (_55)
    {
        _78 = false;
    }
    bool _80 = _78;
    int _82 = 0;
    bool _84 = _80;
    if (!_55)
    {
        int _86 = ~_76;
        int _88 = _86 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _90 = _88 != 0;
        _82 = _90 ? (-1) : 0;
    }
    int _92 = _82;
    int _94 = _92;
    if (!_55)
    {
        int _96 = ~_92;
        _84 = _96 != 0;
    }
    bool _98 = _84;
    int _100 = as_type<int>(_44);
    if (_98)
    {
        float _102 = as_type<float>(in.m_25.z);
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    if (!_98)
    {
        _72 = false;
    }
    bool _106 = _72;
    uint _108 = uint(int(uint(as_type<int>(_68)) >> uint(5)));
    int _110 = int(_108) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _112 = as_type<int>(_68) & 31;
    bool _114 = uint(_112) < 32u;
    int _116 = 1 << _112;
    int _118 = _114 ? _116 : 0;
    int _120 = _110 << 4;
    int _122 = _120 + 224;
    uint _124 = uint(int(uint(_122) >> uint(2)));
    uint _126 = uint(int(uint(int(_124)) >> uint(2)));
    int _128 = int(_124) & 3;
    float _130 = (*spvDescriptorSet0.vp_c3)._m0[int(_126)][_128];
    bool _132 = _106;
    int _134 = as_type<int>(_68);
    if (_98)
    {
        int _136 = ~_104;
        int _138 = _136 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _140 = _138 != 0;
        _94 = _140 ? (-1) : 0;
    }
    int _142 = _94;
    float _144 = in.m_28.x;
    float _146 = in.m_28.y;
    float _148 = in.m_28.z;
    int _150 = _142;
    if (_98)
    {
        int _152 = ~_142;
        _132 = _152 != 0;
    }
    bool _154 = _132;
    int _156 = 0;
    if (_154)
    {
        float _158 = as_type<float>(in.m_25.w);
        _156 = as_type<int>(_158);
    }
    int _160 = _156;
    bool _162 = false;
    if (!_154)
    {
        _162 = false;
    }
    bool _164 = _162;
    float _166 = _146 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _168 = _146 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _170 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[2].x, _166);
    float _172 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[4].x, _168);
    float _174 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[2].z, _170);
    float _176 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[4].z, _172);
    int _178 = _118 & as_type<int>(_130);
    bool _180 = _178 != 0;
    float _182 = _146 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _184 = _146 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    bool _186 = _164;
    if (_154)
    {
        int _188 = ~_160;
        int _190 = _188 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _192 = _190 != 0;
        _150 = _192 ? (-1) : 0;
    }
    int _194 = _150;
    float _196 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[3].x, _182);
    float _198 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[5].x, _184);
    float _200 = _174 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    if (_154)
    {
        int _202 = ~_194;
        _186 = _202 != 0;
    }
    bool _204 = _186;
    float _206 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[3].z, _196);
    float _208 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[5].z, _198);
    float _210 = _176 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _212 = _206 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _214 = _208 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    if (!_180)
    {
        _134 = -1082130432;
    }
    int _216 = _134;
    out.gl_Position.x = _200;
    out.gl_Position.y = _212;
    out.gl_Position.z = _210;
    out.gl_Position.w = _214;
    if (!_180)
    {
        float _553 = as_type<float>(_216);
        out.gl_Position.w = _553;
    }
    if (!_204)
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
    int _49 = ~as_type<int>(_44);
    int _51 = _49 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _55 = _51 != 0;
    int _57 = _47 << 4;
    int _59 = _57 + 224;
    uint _62 = uint(int(uint(_59) >> uint(2)));
    uint _64 = uint(int(uint(int(_62)) >> uint(2)));
    int _66 = int(_62) & 3;
    float _68 = (*spvDescriptorSet0.vp_c3)._m0[int(_64)][_66];
    int _70 = _47;
    bool _72 = _55;
    if (!_55)
    {
        float _74 = as_type<float>(in.m_25.y);
        _70 = as_type<int>(_74);
    }
    int _76 = _70;
    bool _78 = false;
    if (_55)
    {
        _78 = false;
    }
    bool _80 = _78;
    int _82 = 0;
    bool _84 = _80;
    if (!_55)
    {
        int _86 = ~_76;
        int _88 = _86 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _90 = _88 != 0;
        _82 = _90 ? (-1) : 0;
    }
    int _92 = _82;
    int _94 = _92;
    if (!_55)
    {
        int _96 = ~_92;
        _84 = _96 != 0;
    }
    bool _98 = _84;
    int _100 = as_type<int>(_44);
    if (_98)
    {
        float _102 = as_type<float>(in.m_25.z);
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    if (!_98)
    {
        _72 = false;
    }
    bool _106 = _72;
    uint _108 = uint(int(uint(as_type<int>(_68)) >> uint(5)));
    int _110 = int(_108) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _112 = as_type<int>(_68) & 31;
    bool _114 = uint(_112) < 32u;
    int _116 = 1 << _112;
    int _118 = _114 ? _116 : 0;
    int _120 = _110 << 4;
    int _122 = _120 + 224;
    uint _124 = uint(int(uint(_122) >> uint(2)));
    uint _126 = uint(int(uint(int(_124)) >> uint(2)));
    int _128 = int(_124) & 3;
    float _130 = (*spvDescriptorSet0.vp_c3)._m0[int(_126)][_128];
    bool _132 = _106;
    int _134 = as_type<int>(_68);
    if (_98)
    {
        int _136 = ~_104;
        int _138 = _136 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _140 = _138 != 0;
        _94 = _140 ? (-1) : 0;
    }
    int _142 = _94;
    float _144 = in.m_28.x;
    float _146 = in.m_28.y;
    float _148 = in.m_28.z;
    int _150 = _142;
    if (_98)
    {
        int _152 = ~_142;
        _132 = _152 != 0;
    }
    bool _154 = _132;
    int _156 = 0;
    if (_154)
    {
        float _158 = as_type<float>(in.m_25.w);
        _156 = as_type<int>(_158);
    }
    int _160 = _156;
    bool _162 = false;
    if (!_154)
    {
        _162 = false;
    }
    bool _164 = _162;
    float _166 = _146 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _168 = _146 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _170 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[2].x, _166);
    float _172 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[4].x, _168);
    float _174 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[2].z, _170);
    float _176 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[4].z, _172);
    int _178 = _118 & as_type<int>(_130);
    bool _180 = _178 != 0;
    float _182 = _146 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _184 = _146 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    bool _186 = _164;
    if (_154)
    {
        int _188 = ~_160;
        int _190 = _188 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _192 = _190 != 0;
        _150 = _192 ? (-1) : 0;
    }
    int _194 = _150;
    float _196 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[3].x, _182);
    float _198 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[5].x, _184);
    float _200 = _174 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    if (_154)
    {
        int _202 = ~_194;
        _186 = _202 != 0;
    }
    bool _204 = _186;
    float _206 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[3].z, _196);
    float _208 = fma(_148, (*spvDescriptorSet0.vp_c3)._m0[5].z, _198);
    float _210 = _176 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _212 = _206 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _214 = _208 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    if (!_180)
    {
        _134 = -1082130432;
    }
    int _216 = _134;
    out.gl_Position.x = _200;
    out.gl_Position.y = _212;
    out.gl_Position.z = _210;
    out.gl_Position.w = _214;
    if (!_180)
    {
        float _553 = as_type<float>(_216);
        out.gl_Position.w = _553;
    }
    if (!_204)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

