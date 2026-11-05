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
    constant _16* vp_c11 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_28 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _42 = (*spvDescriptorSet0.vp_c7)._m0[11].y * (*spvDescriptorSet0.vp_c11)._m0[41].w;
    float _44 = fma(_42, 0.00999999977648258209228515625, (*spvDescriptorSet0.vp_c9)._m0[983].y);
    float _46 = in.m_28.x;
    float _48 = in.m_28.y;
    float _50 = in.m_28.z;
    float _52 = _44 * (*spvDescriptorSet0.vp_c11)._m0[41].z;
    float _54 = _52 * 0.15915493667125701904296875;
    float _56 = _54 * 6.283185482025146484375;
    float _58 = cos(_56);
    float _60 = _54 * 6.283185482025146484375;
    float _62 = sin(_60);
    float _64 = _58 * _48;
    float _66 = _62 * _48;
    float _68 = fma(_62, _46, _64);
    float _70 = -_66;
    float _72 = fma(_58, _46, _70);
    float _74 = _68 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _76 = _68 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _78 = _68 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _80 = fma(_72, (*spvDescriptorSet0.vp_c7)._m0[2].x, _74);
    float _82 = fma(_72, (*spvDescriptorSet0.vp_c7)._m0[0].x, _76);
    float _84 = fma(_72, (*spvDescriptorSet0.vp_c7)._m0[1].x, _78);
    float _86 = fma(_50, (*spvDescriptorSet0.vp_c7)._m0[2].z, _80);
    float _88 = fma(_50, (*spvDescriptorSet0.vp_c7)._m0[0].z, _82);
    float _90 = fma(_50, (*spvDescriptorSet0.vp_c7)._m0[1].z, _84);
    float _92 = _86 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _94 = _88 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _96 = _90 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _98 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _100 = _92 + _98;
    float _102 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _104 = _94 + _102;
    float _106 = _100 * _100;
    float _108 = fma(_104, _104, _106);
    float _110 = _96 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _112 = sqrt(_108);
    float _114 = fma(_94, (*spvDescriptorSet0.vp_c4)._m0[2].x, _110);
    float _116 = fma(_92, (*spvDescriptorSet0.vp_c4)._m0[2].z, _114);
    float _118 = _116 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _122 = _112 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _124 = _116;
    float _126 = _94;
    float _128 = _96;
    float _130 = _118;
    if (!_122)
    {
        _124 = _94;
    }
    float _132 = _124;
    float _134 = _132;
    if (!_122)
    {
        _126 = _92;
    }
    float _136 = _126;
    bool _138 = !_122;
    float _140 = _136;
    if (!_138)
    {
        float _142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _144 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _146 = _112 + _144;
        float _148 = rsqrt(_108);
        float _150 = _146 * _142;
        float _152 = _96 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _154 = _150 * 0.15915493667125701904296875;
        float _156 = _154 * 6.283185482025146484375;
        float _158 = cos(_156);
        float _160 = _154 * 6.283185482025146484375;
        float _162 = sin(_160);
        float _164 = _158 + (-1.0);
        float _166 = fma(_162, _152, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _170 = _148 * _166;
        float _172 = fma(_96, _158, _168);
        float _174 = fma(_104, _170, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _176 = _172 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _178 = fma(_100, _170, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _180 = fma(_174, (*spvDescriptorSet0.vp_c4)._m0[2].x, _176);
        float _182 = fma(_178, (*spvDescriptorSet0.vp_c4)._m0[2].z, _180);
        float _184 = _182 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _128 = _172;
        _134 = _174;
        _140 = _178;
        _130 = _184;
    }
    float _186 = _128;
    float _188 = _134;
    float _190 = _140;
    float _192 = _130;
    float _194 = _186 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _196 = _186 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _198 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[1].x, _194);
    float _200 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[0].x, _196);
    float _202 = fma(_190, (*spvDescriptorSet0.vp_c4)._m0[1].z, _198);
    float _204 = fma(_190, (*spvDescriptorSet0.vp_c4)._m0[0].z, _200);
    float _206 = _202 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _208 = _204 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _210 = _206 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _212 = _206 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _214 = _206 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _216 = _206 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _218 = fma(_208, (*spvDescriptorSet0.vp_c4)._m0[8].x, _210);
    float _220 = fma(_208, (*spvDescriptorSet0.vp_c4)._m0[7].x, _212);
    float _222 = fma(_208, (*spvDescriptorSet0.vp_c4)._m0[9].x, _214);
    float _224 = fma(_208, (*spvDescriptorSet0.vp_c4)._m0[10].x, _216);
    float _226 = fma(_192, (*spvDescriptorSet0.vp_c4)._m0[8].z, _218);
    float _228 = fma(_192, (*spvDescriptorSet0.vp_c4)._m0[7].z, _220);
    float _230 = fma(_192, (*spvDescriptorSet0.vp_c4)._m0[9].z, _222);
    float _232 = fma(_192, (*spvDescriptorSet0.vp_c4)._m0[10].z, _224);
    float _234 = _226 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _236 = _228 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _238 = _230 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _240 = _232 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _236;
    out.gl_Position.y = _234;
    out.gl_Position.z = _238;
    out.gl_Position.w = _240;
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
    float _42 = (*spvDescriptorSet0.vp_c7)._m0[11].y * (*spvDescriptorSet0.vp_c11)._m0[41].w;
    float _44 = fma(_42, 0.00999999977648258209228515625, (*spvDescriptorSet0.vp_c9)._m0[983].y);
    float _46 = in.m_28.x;
    float _48 = in.m_28.y;
    float _50 = in.m_28.z;
    float _52 = _44 * (*spvDescriptorSet0.vp_c11)._m0[41].z;
    float _54 = _52 * 0.15915493667125701904296875;
    float _56 = _54 * 6.283185482025146484375;
    float _58 = cos(_56);
    float _60 = _54 * 6.283185482025146484375;
    float _62 = sin(_60);
    float _64 = _58 * _48;
    float _66 = _62 * _48;
    float _68 = fma(_62, _46, _64);
    float _70 = -_66;
    float _72 = fma(_58, _46, _70);
    float _74 = _68 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _76 = _68 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _78 = _68 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _80 = fma(_72, (*spvDescriptorSet0.vp_c7)._m0[2].x, _74);
    float _82 = fma(_72, (*spvDescriptorSet0.vp_c7)._m0[0].x, _76);
    float _84 = fma(_72, (*spvDescriptorSet0.vp_c7)._m0[1].x, _78);
    float _86 = fma(_50, (*spvDescriptorSet0.vp_c7)._m0[2].z, _80);
    float _88 = fma(_50, (*spvDescriptorSet0.vp_c7)._m0[0].z, _82);
    float _90 = fma(_50, (*spvDescriptorSet0.vp_c7)._m0[1].z, _84);
    float _92 = _86 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _94 = _88 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _96 = _90 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _98 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _100 = _92 + _98;
    float _102 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _104 = _94 + _102;
    float _106 = _100 * _100;
    float _108 = fma(_104, _104, _106);
    float _110 = _96 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _112 = sqrt(_108);
    float _114 = fma(_94, (*spvDescriptorSet0.vp_c4)._m0[2].x, _110);
    float _116 = fma(_92, (*spvDescriptorSet0.vp_c4)._m0[2].z, _114);
    float _118 = _116 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _122 = _112 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _124 = _116;
    float _126 = _94;
    float _128 = _96;
    float _130 = _118;
    if (!_122)
    {
        _124 = _94;
    }
    float _132 = _124;
    float _134 = _132;
    if (!_122)
    {
        _126 = _92;
    }
    float _136 = _126;
    bool _138 = !_122;
    float _140 = _136;
    if (!_138)
    {
        float _142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _144 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _146 = _112 + _144;
        float _148 = rsqrt(_108);
        float _150 = _146 * _142;
        float _152 = _96 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _154 = _150 * 0.15915493667125701904296875;
        float _156 = _154 * 6.283185482025146484375;
        float _158 = cos(_156);
        float _160 = _154 * 6.283185482025146484375;
        float _162 = sin(_160);
        float _164 = _158 + (-1.0);
        float _166 = fma(_162, _152, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _170 = _148 * _166;
        float _172 = fma(_96, _158, _168);
        float _174 = fma(_104, _170, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _176 = _172 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _178 = fma(_100, _170, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _180 = fma(_174, (*spvDescriptorSet0.vp_c4)._m0[2].x, _176);
        float _182 = fma(_178, (*spvDescriptorSet0.vp_c4)._m0[2].z, _180);
        float _184 = _182 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _128 = _172;
        _134 = _174;
        _140 = _178;
        _130 = _184;
    }
    float _186 = _128;
    float _188 = _134;
    float _190 = _140;
    float _192 = _130;
    float _194 = _186 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _196 = _186 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _198 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[1].x, _194);
    float _200 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[0].x, _196);
    float _202 = fma(_190, (*spvDescriptorSet0.vp_c4)._m0[1].z, _198);
    float _204 = fma(_190, (*spvDescriptorSet0.vp_c4)._m0[0].z, _200);
    float _206 = _202 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _208 = _204 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _210 = _206 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _212 = _206 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _214 = _206 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _216 = _206 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _218 = fma(_208, (*spvDescriptorSet0.vp_c4)._m0[8].x, _210);
    float _220 = fma(_208, (*spvDescriptorSet0.vp_c4)._m0[7].x, _212);
    float _222 = fma(_208, (*spvDescriptorSet0.vp_c4)._m0[9].x, _214);
    float _224 = fma(_208, (*spvDescriptorSet0.vp_c4)._m0[10].x, _216);
    float _226 = fma(_192, (*spvDescriptorSet0.vp_c4)._m0[8].z, _218);
    float _228 = fma(_192, (*spvDescriptorSet0.vp_c4)._m0[7].z, _220);
    float _230 = fma(_192, (*spvDescriptorSet0.vp_c4)._m0[9].z, _222);
    float _232 = fma(_192, (*spvDescriptorSet0.vp_c4)._m0[10].z, _224);
    float _234 = _226 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _236 = _228 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _238 = _230 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _240 = _232 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _236;
    out.gl_Position.y = _234;
    out.gl_Position.z = _238;
    out.gl_Position.w = _240;
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
    float _42 = (*spvDescriptorSet0.vp_c7)._m0[11].y * (*spvDescriptorSet0.vp_c11)._m0[41].w;
    float _44 = fma(_42, 0.00999999977648258209228515625, (*spvDescriptorSet0.vp_c9)._m0[983].y);
    float _46 = in.m_28.x;
    float _48 = in.m_28.y;
    float _50 = in.m_28.z;
    float _52 = _44 * (*spvDescriptorSet0.vp_c11)._m0[41].z;
    float _54 = _52 * 0.15915493667125701904296875;
    float _56 = _54 * 6.283185482025146484375;
    float _58 = cos(_56);
    float _60 = _54 * 6.283185482025146484375;
    float _62 = sin(_60);
    float _64 = _58 * _48;
    float _66 = _62 * _48;
    float _68 = fma(_62, _46, _64);
    float _70 = -_66;
    float _72 = fma(_58, _46, _70);
    float _74 = _68 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _76 = _68 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _78 = _68 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _80 = fma(_72, (*spvDescriptorSet0.vp_c7)._m0[2].x, _74);
    float _82 = fma(_72, (*spvDescriptorSet0.vp_c7)._m0[0].x, _76);
    float _84 = fma(_72, (*spvDescriptorSet0.vp_c7)._m0[1].x, _78);
    float _86 = fma(_50, (*spvDescriptorSet0.vp_c7)._m0[2].z, _80);
    float _88 = fma(_50, (*spvDescriptorSet0.vp_c7)._m0[0].z, _82);
    float _90 = fma(_50, (*spvDescriptorSet0.vp_c7)._m0[1].z, _84);
    float _92 = _86 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _94 = _88 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _96 = _90 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _98 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _100 = _92 + _98;
    float _102 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _104 = _94 + _102;
    float _106 = _100 * _100;
    float _108 = fma(_104, _104, _106);
    float _110 = _96 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _112 = sqrt(_108);
    float _114 = fma(_94, (*spvDescriptorSet0.vp_c4)._m0[2].x, _110);
    float _116 = fma(_92, (*spvDescriptorSet0.vp_c4)._m0[2].z, _114);
    float _118 = _116 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _122 = _112 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _124 = _116;
    float _126 = _94;
    float _128 = _96;
    float _130 = _118;
    if (!_122)
    {
        _124 = _94;
    }
    float _132 = _124;
    float _134 = _132;
    if (!_122)
    {
        _126 = _92;
    }
    float _136 = _126;
    bool _138 = !_122;
    float _140 = _136;
    if (!_138)
    {
        float _142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _144 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _146 = _112 + _144;
        float _148 = rsqrt(_108);
        float _150 = _146 * _142;
        float _152 = _96 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _154 = _150 * 0.15915493667125701904296875;
        float _156 = _154 * 6.283185482025146484375;
        float _158 = cos(_156);
        float _160 = _154 * 6.283185482025146484375;
        float _162 = sin(_160);
        float _164 = _158 + (-1.0);
        float _166 = fma(_162, _152, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _170 = _148 * _166;
        float _172 = fma(_96, _158, _168);
        float _174 = fma(_104, _170, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _176 = _172 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _178 = fma(_100, _170, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _180 = fma(_174, (*spvDescriptorSet0.vp_c4)._m0[2].x, _176);
        float _182 = fma(_178, (*spvDescriptorSet0.vp_c4)._m0[2].z, _180);
        float _184 = _182 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _128 = _172;
        _134 = _174;
        _140 = _178;
        _130 = _184;
    }
    float _186 = _128;
    float _188 = _134;
    float _190 = _140;
    float _192 = _130;
    float _194 = _186 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _196 = _186 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _198 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[1].x, _194);
    float _200 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[0].x, _196);
    float _202 = fma(_190, (*spvDescriptorSet0.vp_c4)._m0[1].z, _198);
    float _204 = fma(_190, (*spvDescriptorSet0.vp_c4)._m0[0].z, _200);
    float _206 = _202 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _208 = _204 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _210 = _206 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _212 = _206 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _214 = _206 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _216 = _206 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _218 = fma(_208, (*spvDescriptorSet0.vp_c4)._m0[8].x, _210);
    float _220 = fma(_208, (*spvDescriptorSet0.vp_c4)._m0[7].x, _212);
    float _222 = fma(_208, (*spvDescriptorSet0.vp_c4)._m0[9].x, _214);
    float _224 = fma(_208, (*spvDescriptorSet0.vp_c4)._m0[10].x, _216);
    float _226 = fma(_192, (*spvDescriptorSet0.vp_c4)._m0[8].z, _218);
    float _228 = fma(_192, (*spvDescriptorSet0.vp_c4)._m0[7].z, _220);
    float _230 = fma(_192, (*spvDescriptorSet0.vp_c4)._m0[9].z, _222);
    float _232 = fma(_192, (*spvDescriptorSet0.vp_c4)._m0[10].z, _224);
    float _234 = _226 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _236 = _228 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _238 = _230 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _240 = _232 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _236;
    out.gl_Position.y = _234;
    out.gl_Position.z = _238;
    out.gl_Position.w = _240;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

