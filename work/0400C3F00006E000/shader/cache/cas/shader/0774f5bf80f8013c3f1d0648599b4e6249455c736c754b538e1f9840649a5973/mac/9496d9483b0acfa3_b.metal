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
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _40 = in.m_26.x;
    float _42 = in.m_26.y;
    float _44 = in.m_26.z;
    float _46 = _42 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _48 = _42 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _50 = _42 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _52 = fma(_40, (*spvDescriptorSet0.vp_c7)._m0[2].x, _46);
    float _54 = fma(_40, (*spvDescriptorSet0.vp_c7)._m0[0].x, _48);
    float _56 = fma(_40, (*spvDescriptorSet0.vp_c7)._m0[1].x, _50);
    float _58 = fma(_44, (*spvDescriptorSet0.vp_c7)._m0[2].z, _52);
    float _60 = fma(_44, (*spvDescriptorSet0.vp_c7)._m0[0].z, _54);
    float _62 = fma(_44, (*spvDescriptorSet0.vp_c7)._m0[1].z, _56);
    float _64 = _58 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _66 = _60 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _68 = _62 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _70 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _72 = _64 + _70;
    float _74 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _76 = _66 + _74;
    float _78 = _72 * _72;
    float _80 = fma(_76, _76, _78);
    float _82 = _68 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _84 = sqrt(_80);
    float _86 = fma(_66, (*spvDescriptorSet0.vp_c4)._m0[2].x, _82);
    float _88 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[2].z, _86);
    float _90 = _88 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _94 = _84 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _96 = _44;
    float _98 = _88;
    float _100 = _68;
    float _102 = _90;
    if (!_94)
    {
        _96 = _66;
    }
    float _104 = _96;
    float _106 = _104;
    if (!_94)
    {
        _98 = _64;
    }
    float _108 = _98;
    bool _110 = !_94;
    float _112 = _108;
    if (!_110)
    {
        float _114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _116 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _118 = _84 + _116;
        float _120 = _68 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _122 = rsqrt(_80);
        float _124 = _118 * _114;
        float _126 = _124 * 0.15915493667125701904296875;
        float _128 = _126 * 6.283185482025146484375;
        float _130 = cos(_128);
        float _132 = _126 * 6.283185482025146484375;
        float _134 = sin(_132);
        float _136 = _130 + (-1.0);
        float _138 = _136 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _140 = fma(_134, _120, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _142 = fma(_68, _130, _138);
        float _144 = _122 * _140;
        float _146 = _142 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _148 = fma(_76, _144, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _150 = fma(_72, _144, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _152 = fma(_148, (*spvDescriptorSet0.vp_c4)._m0[2].x, _146);
        float _154 = fma(_150, (*spvDescriptorSet0.vp_c4)._m0[2].z, _152);
        float _156 = _154 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _100 = _142;
        _106 = _148;
        _112 = _150;
        _102 = _156;
    }
    float _158 = _100;
    float _160 = _106;
    float _162 = _112;
    float _164 = _102;
    float _166 = _158 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _168 = _158 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _170 = fma(_160, (*spvDescriptorSet0.vp_c4)._m0[1].x, _166);
    float _172 = fma(_160, (*spvDescriptorSet0.vp_c4)._m0[0].x, _168);
    float _174 = fma(_162, (*spvDescriptorSet0.vp_c4)._m0[1].z, _170);
    float _176 = fma(_162, (*spvDescriptorSet0.vp_c4)._m0[0].z, _172);
    float _178 = _174 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _180 = _176 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _182 = _178 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _184 = _178 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _186 = _178 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _188 = _178 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _190 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[8].x, _182);
    float _192 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[7].x, _184);
    float _194 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[9].x, _186);
    float _196 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[10].x, _188);
    float _198 = fma(_164, (*spvDescriptorSet0.vp_c4)._m0[8].z, _190);
    float _200 = fma(_164, (*spvDescriptorSet0.vp_c4)._m0[7].z, _192);
    float _202 = fma(_164, (*spvDescriptorSet0.vp_c4)._m0[9].z, _194);
    float _204 = fma(_164, (*spvDescriptorSet0.vp_c4)._m0[10].z, _196);
    float _206 = _200 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _208 = _198 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _210 = _202 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _212 = _204 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _206;
    out.gl_Position.y = _208;
    out.gl_Position.z = _210;
    out.gl_Position.w = _212;
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
    float _40 = in.m_26.x;
    float _42 = in.m_26.y;
    float _44 = in.m_26.z;
    float _46 = _42 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _48 = _42 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _50 = _42 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _52 = fma(_40, (*spvDescriptorSet0.vp_c7)._m0[2].x, _46);
    float _54 = fma(_40, (*spvDescriptorSet0.vp_c7)._m0[0].x, _48);
    float _56 = fma(_40, (*spvDescriptorSet0.vp_c7)._m0[1].x, _50);
    float _58 = fma(_44, (*spvDescriptorSet0.vp_c7)._m0[2].z, _52);
    float _60 = fma(_44, (*spvDescriptorSet0.vp_c7)._m0[0].z, _54);
    float _62 = fma(_44, (*spvDescriptorSet0.vp_c7)._m0[1].z, _56);
    float _64 = _58 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _66 = _60 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _68 = _62 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _70 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _72 = _64 + _70;
    float _74 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _76 = _66 + _74;
    float _78 = _72 * _72;
    float _80 = fma(_76, _76, _78);
    float _82 = _68 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _84 = sqrt(_80);
    float _86 = fma(_66, (*spvDescriptorSet0.vp_c4)._m0[2].x, _82);
    float _88 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[2].z, _86);
    float _90 = _88 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _94 = _84 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _96 = _44;
    float _98 = _88;
    float _100 = _68;
    float _102 = _90;
    if (!_94)
    {
        _96 = _66;
    }
    float _104 = _96;
    float _106 = _104;
    if (!_94)
    {
        _98 = _64;
    }
    float _108 = _98;
    bool _110 = !_94;
    float _112 = _108;
    if (!_110)
    {
        float _114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _116 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _118 = _84 + _116;
        float _120 = _68 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _122 = rsqrt(_80);
        float _124 = _118 * _114;
        float _126 = _124 * 0.15915493667125701904296875;
        float _128 = _126 * 6.283185482025146484375;
        float _130 = cos(_128);
        float _132 = _126 * 6.283185482025146484375;
        float _134 = sin(_132);
        float _136 = _130 + (-1.0);
        float _138 = _136 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _140 = fma(_134, _120, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _142 = fma(_68, _130, _138);
        float _144 = _122 * _140;
        float _146 = _142 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _148 = fma(_76, _144, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _150 = fma(_72, _144, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _152 = fma(_148, (*spvDescriptorSet0.vp_c4)._m0[2].x, _146);
        float _154 = fma(_150, (*spvDescriptorSet0.vp_c4)._m0[2].z, _152);
        float _156 = _154 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _100 = _142;
        _106 = _148;
        _112 = _150;
        _102 = _156;
    }
    float _158 = _100;
    float _160 = _106;
    float _162 = _112;
    float _164 = _102;
    float _166 = _158 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _168 = _158 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _170 = fma(_160, (*spvDescriptorSet0.vp_c4)._m0[1].x, _166);
    float _172 = fma(_160, (*spvDescriptorSet0.vp_c4)._m0[0].x, _168);
    float _174 = fma(_162, (*spvDescriptorSet0.vp_c4)._m0[1].z, _170);
    float _176 = fma(_162, (*spvDescriptorSet0.vp_c4)._m0[0].z, _172);
    float _178 = _174 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _180 = _176 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _182 = _178 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _184 = _178 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _186 = _178 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _188 = _178 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _190 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[8].x, _182);
    float _192 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[7].x, _184);
    float _194 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[9].x, _186);
    float _196 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[10].x, _188);
    float _198 = fma(_164, (*spvDescriptorSet0.vp_c4)._m0[8].z, _190);
    float _200 = fma(_164, (*spvDescriptorSet0.vp_c4)._m0[7].z, _192);
    float _202 = fma(_164, (*spvDescriptorSet0.vp_c4)._m0[9].z, _194);
    float _204 = fma(_164, (*spvDescriptorSet0.vp_c4)._m0[10].z, _196);
    float _206 = _200 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _208 = _198 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _210 = _202 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _212 = _204 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _206;
    out.gl_Position.y = _208;
    out.gl_Position.z = _210;
    out.gl_Position.w = _212;
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
    float _40 = in.m_26.x;
    float _42 = in.m_26.y;
    float _44 = in.m_26.z;
    float _46 = _42 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _48 = _42 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _50 = _42 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _52 = fma(_40, (*spvDescriptorSet0.vp_c7)._m0[2].x, _46);
    float _54 = fma(_40, (*spvDescriptorSet0.vp_c7)._m0[0].x, _48);
    float _56 = fma(_40, (*spvDescriptorSet0.vp_c7)._m0[1].x, _50);
    float _58 = fma(_44, (*spvDescriptorSet0.vp_c7)._m0[2].z, _52);
    float _60 = fma(_44, (*spvDescriptorSet0.vp_c7)._m0[0].z, _54);
    float _62 = fma(_44, (*spvDescriptorSet0.vp_c7)._m0[1].z, _56);
    float _64 = _58 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _66 = _60 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _68 = _62 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _70 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _72 = _64 + _70;
    float _74 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _76 = _66 + _74;
    float _78 = _72 * _72;
    float _80 = fma(_76, _76, _78);
    float _82 = _68 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _84 = sqrt(_80);
    float _86 = fma(_66, (*spvDescriptorSet0.vp_c4)._m0[2].x, _82);
    float _88 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[2].z, _86);
    float _90 = _88 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _94 = _84 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _96 = _44;
    float _98 = _88;
    float _100 = _68;
    float _102 = _90;
    if (!_94)
    {
        _96 = _66;
    }
    float _104 = _96;
    float _106 = _104;
    if (!_94)
    {
        _98 = _64;
    }
    float _108 = _98;
    bool _110 = !_94;
    float _112 = _108;
    if (!_110)
    {
        float _114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _116 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _118 = _84 + _116;
        float _120 = _68 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _122 = rsqrt(_80);
        float _124 = _118 * _114;
        float _126 = _124 * 0.15915493667125701904296875;
        float _128 = _126 * 6.283185482025146484375;
        float _130 = cos(_128);
        float _132 = _126 * 6.283185482025146484375;
        float _134 = sin(_132);
        float _136 = _130 + (-1.0);
        float _138 = _136 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _140 = fma(_134, _120, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _142 = fma(_68, _130, _138);
        float _144 = _122 * _140;
        float _146 = _142 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _148 = fma(_76, _144, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _150 = fma(_72, _144, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _152 = fma(_148, (*spvDescriptorSet0.vp_c4)._m0[2].x, _146);
        float _154 = fma(_150, (*spvDescriptorSet0.vp_c4)._m0[2].z, _152);
        float _156 = _154 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _100 = _142;
        _106 = _148;
        _112 = _150;
        _102 = _156;
    }
    float _158 = _100;
    float _160 = _106;
    float _162 = _112;
    float _164 = _102;
    float _166 = _158 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _168 = _158 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _170 = fma(_160, (*spvDescriptorSet0.vp_c4)._m0[1].x, _166);
    float _172 = fma(_160, (*spvDescriptorSet0.vp_c4)._m0[0].x, _168);
    float _174 = fma(_162, (*spvDescriptorSet0.vp_c4)._m0[1].z, _170);
    float _176 = fma(_162, (*spvDescriptorSet0.vp_c4)._m0[0].z, _172);
    float _178 = _174 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _180 = _176 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _182 = _178 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _184 = _178 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _186 = _178 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _188 = _178 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _190 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[8].x, _182);
    float _192 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[7].x, _184);
    float _194 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[9].x, _186);
    float _196 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[10].x, _188);
    float _198 = fma(_164, (*spvDescriptorSet0.vp_c4)._m0[8].z, _190);
    float _200 = fma(_164, (*spvDescriptorSet0.vp_c4)._m0[7].z, _192);
    float _202 = fma(_164, (*spvDescriptorSet0.vp_c4)._m0[9].z, _194);
    float _204 = fma(_164, (*spvDescriptorSet0.vp_c4)._m0[10].z, _196);
    float _206 = _200 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _208 = _198 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _210 = _202 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _212 = _204 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _206;
    out.gl_Position.y = _208;
    out.gl_Position.z = _210;
    out.gl_Position.w = _212;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

