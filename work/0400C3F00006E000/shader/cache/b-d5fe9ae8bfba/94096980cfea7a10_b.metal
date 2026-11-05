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
    float _58 = sin(_56);
    float _60 = _54 * 6.283185482025146484375;
    float _62 = cos(_60);
    float _64 = _48 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _66 = _58 * _50;
    float _68 = _58 * _46;
    float _70 = fma(_62, _46, _66);
    float _72 = -_68;
    float _74 = fma(_62, _50, _72);
    float _76 = _48 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _78 = _48 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _80 = fma(_70, (*spvDescriptorSet0.vp_c7)._m0[2].x, _64);
    float _82 = fma(_70, (*spvDescriptorSet0.vp_c7)._m0[0].x, _76);
    float _84 = fma(_70, (*spvDescriptorSet0.vp_c7)._m0[1].x, _78);
    float _86 = fma(_74, (*spvDescriptorSet0.vp_c7)._m0[2].z, _80);
    float _88 = fma(_74, (*spvDescriptorSet0.vp_c7)._m0[0].z, _82);
    float _90 = fma(_74, (*spvDescriptorSet0.vp_c7)._m0[1].z, _84);
    float _92 = _86 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _94 = _88 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _96 = _90 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _98 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _100 = _92 + _98;
    float _102 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _104 = _94 + _102;
    float _106 = _96 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _108 = _100 * _100;
    float _110 = fma(_94, (*spvDescriptorSet0.vp_c4)._m0[2].x, _106);
    float _112 = fma(_104, _104, _108);
    float _114 = fma(_92, (*spvDescriptorSet0.vp_c4)._m0[2].z, _110);
    float _116 = sqrt(_112);
    float _118 = _114 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _122 = _116 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _124 = _114;
    float _126 = _96;
    float _128 = _94;
    float _130 = _118;
    if (!_122)
    {
        _124 = _92;
    }
    float _132 = _124;
    bool _134 = !_122;
    float _136 = _132;
    if (!_134)
    {
        float _138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _140 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _142 = _116 + _140;
        float _144 = rsqrt(_112);
        float _146 = _142 * _138;
        float _148 = _96 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _150 = _146 * 0.15915493667125701904296875;
        float _152 = _150 * 6.283185482025146484375;
        float _154 = cos(_152);
        float _156 = _150 * 6.283185482025146484375;
        float _158 = sin(_156);
        float _160 = _154 + (-1.0);
        float _162 = _160 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _164 = fma(_158, _148, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _166 = fma(_96, _154, _162);
        float _168 = _144 * _164;
        float _170 = _166 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _172 = fma(_104, _168, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _174 = fma(_100, _168, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _176 = fma(_172, (*spvDescriptorSet0.vp_c4)._m0[2].x, _170);
        float _178 = fma(_174, (*spvDescriptorSet0.vp_c4)._m0[2].z, _176);
        float _180 = _178 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _126 = _166;
        _128 = _172;
        _136 = _174;
        _130 = _180;
    }
    float _182 = _126;
    float _184 = _128;
    float _186 = _136;
    float _188 = _130;
    float _190 = _182 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _192 = _182 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _194 = fma(_184, (*spvDescriptorSet0.vp_c4)._m0[1].x, _190);
    float _196 = fma(_184, (*spvDescriptorSet0.vp_c4)._m0[0].x, _192);
    float _198 = fma(_186, (*spvDescriptorSet0.vp_c4)._m0[1].z, _194);
    float _200 = fma(_186, (*spvDescriptorSet0.vp_c4)._m0[0].z, _196);
    float _202 = _198 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _204 = _200 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _206 = _202 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _208 = _202 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _210 = _202 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _212 = _202 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _214 = fma(_204, (*spvDescriptorSet0.vp_c4)._m0[8].x, _206);
    float _216 = fma(_204, (*spvDescriptorSet0.vp_c4)._m0[7].x, _208);
    float _218 = fma(_204, (*spvDescriptorSet0.vp_c4)._m0[9].x, _210);
    float _220 = fma(_204, (*spvDescriptorSet0.vp_c4)._m0[10].x, _212);
    float _222 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[8].z, _214);
    float _224 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[7].z, _216);
    float _226 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[9].z, _218);
    float _228 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[10].z, _220);
    float _230 = _222 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _232 = _224 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _234 = _226 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _236 = _228 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _232;
    out.gl_Position.y = _230;
    out.gl_Position.z = _234;
    out.gl_Position.w = _236;
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
    float _58 = sin(_56);
    float _60 = _54 * 6.283185482025146484375;
    float _62 = cos(_60);
    float _64 = _48 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _66 = _58 * _50;
    float _68 = _58 * _46;
    float _70 = fma(_62, _46, _66);
    float _72 = -_68;
    float _74 = fma(_62, _50, _72);
    float _76 = _48 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _78 = _48 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _80 = fma(_70, (*spvDescriptorSet0.vp_c7)._m0[2].x, _64);
    float _82 = fma(_70, (*spvDescriptorSet0.vp_c7)._m0[0].x, _76);
    float _84 = fma(_70, (*spvDescriptorSet0.vp_c7)._m0[1].x, _78);
    float _86 = fma(_74, (*spvDescriptorSet0.vp_c7)._m0[2].z, _80);
    float _88 = fma(_74, (*spvDescriptorSet0.vp_c7)._m0[0].z, _82);
    float _90 = fma(_74, (*spvDescriptorSet0.vp_c7)._m0[1].z, _84);
    float _92 = _86 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _94 = _88 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _96 = _90 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _98 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _100 = _92 + _98;
    float _102 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _104 = _94 + _102;
    float _106 = _96 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _108 = _100 * _100;
    float _110 = fma(_94, (*spvDescriptorSet0.vp_c4)._m0[2].x, _106);
    float _112 = fma(_104, _104, _108);
    float _114 = fma(_92, (*spvDescriptorSet0.vp_c4)._m0[2].z, _110);
    float _116 = sqrt(_112);
    float _118 = _114 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _122 = _116 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _124 = _114;
    float _126 = _96;
    float _128 = _94;
    float _130 = _118;
    if (!_122)
    {
        _124 = _92;
    }
    float _132 = _124;
    bool _134 = !_122;
    float _136 = _132;
    if (!_134)
    {
        float _138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _140 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _142 = _116 + _140;
        float _144 = rsqrt(_112);
        float _146 = _142 * _138;
        float _148 = _96 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _150 = _146 * 0.15915493667125701904296875;
        float _152 = _150 * 6.283185482025146484375;
        float _154 = cos(_152);
        float _156 = _150 * 6.283185482025146484375;
        float _158 = sin(_156);
        float _160 = _154 + (-1.0);
        float _162 = _160 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _164 = fma(_158, _148, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _166 = fma(_96, _154, _162);
        float _168 = _144 * _164;
        float _170 = _166 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _172 = fma(_104, _168, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _174 = fma(_100, _168, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _176 = fma(_172, (*spvDescriptorSet0.vp_c4)._m0[2].x, _170);
        float _178 = fma(_174, (*spvDescriptorSet0.vp_c4)._m0[2].z, _176);
        float _180 = _178 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _126 = _166;
        _128 = _172;
        _136 = _174;
        _130 = _180;
    }
    float _182 = _126;
    float _184 = _128;
    float _186 = _136;
    float _188 = _130;
    float _190 = _182 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _192 = _182 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _194 = fma(_184, (*spvDescriptorSet0.vp_c4)._m0[1].x, _190);
    float _196 = fma(_184, (*spvDescriptorSet0.vp_c4)._m0[0].x, _192);
    float _198 = fma(_186, (*spvDescriptorSet0.vp_c4)._m0[1].z, _194);
    float _200 = fma(_186, (*spvDescriptorSet0.vp_c4)._m0[0].z, _196);
    float _202 = _198 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _204 = _200 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _206 = _202 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _208 = _202 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _210 = _202 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _212 = _202 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _214 = fma(_204, (*spvDescriptorSet0.vp_c4)._m0[8].x, _206);
    float _216 = fma(_204, (*spvDescriptorSet0.vp_c4)._m0[7].x, _208);
    float _218 = fma(_204, (*spvDescriptorSet0.vp_c4)._m0[9].x, _210);
    float _220 = fma(_204, (*spvDescriptorSet0.vp_c4)._m0[10].x, _212);
    float _222 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[8].z, _214);
    float _224 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[7].z, _216);
    float _226 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[9].z, _218);
    float _228 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[10].z, _220);
    float _230 = _222 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _232 = _224 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _234 = _226 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _236 = _228 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _232;
    out.gl_Position.y = _230;
    out.gl_Position.z = _234;
    out.gl_Position.w = _236;
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
    float _58 = sin(_56);
    float _60 = _54 * 6.283185482025146484375;
    float _62 = cos(_60);
    float _64 = _48 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _66 = _58 * _50;
    float _68 = _58 * _46;
    float _70 = fma(_62, _46, _66);
    float _72 = -_68;
    float _74 = fma(_62, _50, _72);
    float _76 = _48 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _78 = _48 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _80 = fma(_70, (*spvDescriptorSet0.vp_c7)._m0[2].x, _64);
    float _82 = fma(_70, (*spvDescriptorSet0.vp_c7)._m0[0].x, _76);
    float _84 = fma(_70, (*spvDescriptorSet0.vp_c7)._m0[1].x, _78);
    float _86 = fma(_74, (*spvDescriptorSet0.vp_c7)._m0[2].z, _80);
    float _88 = fma(_74, (*spvDescriptorSet0.vp_c7)._m0[0].z, _82);
    float _90 = fma(_74, (*spvDescriptorSet0.vp_c7)._m0[1].z, _84);
    float _92 = _86 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _94 = _88 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _96 = _90 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _98 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _100 = _92 + _98;
    float _102 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _104 = _94 + _102;
    float _106 = _96 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _108 = _100 * _100;
    float _110 = fma(_94, (*spvDescriptorSet0.vp_c4)._m0[2].x, _106);
    float _112 = fma(_104, _104, _108);
    float _114 = fma(_92, (*spvDescriptorSet0.vp_c4)._m0[2].z, _110);
    float _116 = sqrt(_112);
    float _118 = _114 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _122 = _116 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _124 = _114;
    float _126 = _96;
    float _128 = _94;
    float _130 = _118;
    if (!_122)
    {
        _124 = _92;
    }
    float _132 = _124;
    bool _134 = !_122;
    float _136 = _132;
    if (!_134)
    {
        float _138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _140 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _142 = _116 + _140;
        float _144 = rsqrt(_112);
        float _146 = _142 * _138;
        float _148 = _96 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _150 = _146 * 0.15915493667125701904296875;
        float _152 = _150 * 6.283185482025146484375;
        float _154 = cos(_152);
        float _156 = _150 * 6.283185482025146484375;
        float _158 = sin(_156);
        float _160 = _154 + (-1.0);
        float _162 = _160 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _164 = fma(_158, _148, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _166 = fma(_96, _154, _162);
        float _168 = _144 * _164;
        float _170 = _166 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _172 = fma(_104, _168, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _174 = fma(_100, _168, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _176 = fma(_172, (*spvDescriptorSet0.vp_c4)._m0[2].x, _170);
        float _178 = fma(_174, (*spvDescriptorSet0.vp_c4)._m0[2].z, _176);
        float _180 = _178 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _126 = _166;
        _128 = _172;
        _136 = _174;
        _130 = _180;
    }
    float _182 = _126;
    float _184 = _128;
    float _186 = _136;
    float _188 = _130;
    float _190 = _182 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _192 = _182 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _194 = fma(_184, (*spvDescriptorSet0.vp_c4)._m0[1].x, _190);
    float _196 = fma(_184, (*spvDescriptorSet0.vp_c4)._m0[0].x, _192);
    float _198 = fma(_186, (*spvDescriptorSet0.vp_c4)._m0[1].z, _194);
    float _200 = fma(_186, (*spvDescriptorSet0.vp_c4)._m0[0].z, _196);
    float _202 = _198 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _204 = _200 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _206 = _202 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _208 = _202 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _210 = _202 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _212 = _202 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _214 = fma(_204, (*spvDescriptorSet0.vp_c4)._m0[8].x, _206);
    float _216 = fma(_204, (*spvDescriptorSet0.vp_c4)._m0[7].x, _208);
    float _218 = fma(_204, (*spvDescriptorSet0.vp_c4)._m0[9].x, _210);
    float _220 = fma(_204, (*spvDescriptorSet0.vp_c4)._m0[10].x, _212);
    float _222 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[8].z, _214);
    float _224 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[7].z, _216);
    float _226 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[9].z, _218);
    float _228 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[10].z, _220);
    float _230 = _222 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _232 = _224 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _234 = _226 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _236 = _228 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _232;
    out.gl_Position.y = _230;
    out.gl_Position.z = _234;
    out.gl_Position.w = _236;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

