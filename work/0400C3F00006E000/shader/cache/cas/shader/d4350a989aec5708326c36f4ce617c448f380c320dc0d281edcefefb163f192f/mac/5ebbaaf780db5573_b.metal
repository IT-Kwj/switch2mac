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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c11 [[id(1)]];
    constant _16* vp_c7 [[id(2)]];
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
    float _42 = in.m_28.x;
    float _44 = in.m_28.y;
    float _46 = in.m_28.z;
    float _48 = (*spvDescriptorSet0.vp_c9)._m0[983].y * (*spvDescriptorSet0.vp_c11)._m0[41].z;
    float _50 = _48 * 0.15915493667125701904296875;
    float _52 = (*spvDescriptorSet0.vp_c9)._m0[983].y * (*spvDescriptorSet0.vp_c11)._m0[41].y;
    float _54 = _50 * 6.283185482025146484375;
    float _56 = sin(_54);
    float _58 = _52 * (-0.15915493667125701904296875);
    float _60 = _58 * 6.283185482025146484375;
    float _62 = sin(_60);
    float _64 = _56 * (*spvDescriptorSet0.vp_c11)._m0[41].w;
    float _66 = _58 * 6.283185482025146484375;
    float _68 = cos(_66);
    float _70 = _64 * 0.15915493667125701904296875;
    float _72 = _62 * _46;
    float _74 = _70 * 6.283185482025146484375;
    float _76 = sin(_74);
    float _78 = _70 * 6.283185482025146484375;
    float _80 = cos(_78);
    float _82 = _68 * _46;
    float _84 = _76 * _44;
    float _86 = _80 * _44;
    float _88 = -_84;
    float _90 = fma(_80, _42, _88);
    float _92 = fma(_76, _42, _86);
    float _94 = -_72;
    float _96 = fma(_68, _90, _94);
    float _98 = fma(_62, _90, _82);
    float _100 = _92 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _102 = _92 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _104 = fma(_96, (*spvDescriptorSet0.vp_c7)._m0[2].x, _100);
    float _106 = fma(_96, (*spvDescriptorSet0.vp_c7)._m0[0].x, _102);
    float _108 = fma(_98, (*spvDescriptorSet0.vp_c7)._m0[2].z, _104);
    float _110 = fma(_98, (*spvDescriptorSet0.vp_c7)._m0[0].z, _106);
    float _112 = _108 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _114 = _110 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _116 = _92 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _118 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _120 = _112 + _118;
    float _122 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _124 = _114 + _122;
    float _126 = fma(_96, (*spvDescriptorSet0.vp_c7)._m0[1].x, _116);
    float _128 = _120 * _120;
    float _130 = fma(_98, (*spvDescriptorSet0.vp_c7)._m0[1].z, _126);
    float _132 = fma(_124, _124, _128);
    float _134 = _130 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _136 = sqrt(_132);
    float _138 = _134 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _140 = fma(_114, (*spvDescriptorSet0.vp_c4)._m0[2].x, _138);
    float _142 = fma(_112, (*spvDescriptorSet0.vp_c4)._m0[2].z, _140);
    float _144 = _142 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _148 = _136 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _150 = _138;
    float _152 = _114;
    float _154 = _112;
    float _156 = _144;
    if (!_148)
    {
        _150 = _114;
    }
    float _158 = _150;
    float _160 = _158;
    if (!_148)
    {
        _152 = _134;
    }
    float _162 = _152;
    bool _164 = !_148;
    float _166 = _162;
    if (!_164)
    {
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _170 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _172 = _136 + _170;
        float _174 = _134 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _176 = rsqrt(_132);
        float _178 = _172 * _168;
        float _180 = _178 * 0.15915493667125701904296875;
        float _182 = _180 * 6.283185482025146484375;
        float _184 = cos(_182);
        float _186 = _180 * 6.283185482025146484375;
        float _188 = sin(_186);
        float _190 = _184 + (-1.0);
        float _192 = fma(_188, _174, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _196 = _176 * _192;
        float _198 = fma(_134, _184, _194);
        float _200 = fma(_124, _196, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _202 = _198 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _204 = fma(_120, _196, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _206 = fma(_200, (*spvDescriptorSet0.vp_c4)._m0[2].x, _202);
        float _208 = fma(_204, (*spvDescriptorSet0.vp_c4)._m0[2].z, _206);
        float _210 = _208 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _166 = _198;
        _160 = _200;
        _154 = _204;
        _156 = _210;
    }
    float _212 = _166;
    float _214 = _160;
    float _216 = _154;
    float _218 = _156;
    float _220 = _212 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _222 = _212 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _224 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[1].x, _220);
    float _226 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[0].x, _222);
    float _228 = fma(_216, (*spvDescriptorSet0.vp_c4)._m0[1].z, _224);
    float _230 = fma(_216, (*spvDescriptorSet0.vp_c4)._m0[0].z, _226);
    float _232 = _228 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _234 = _230 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _236 = _232 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _238 = _232 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _240 = _232 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _242 = _232 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _244 = fma(_234, (*spvDescriptorSet0.vp_c4)._m0[8].x, _236);
    float _246 = fma(_234, (*spvDescriptorSet0.vp_c4)._m0[7].x, _238);
    float _248 = fma(_234, (*spvDescriptorSet0.vp_c4)._m0[9].x, _240);
    float _250 = fma(_234, (*spvDescriptorSet0.vp_c4)._m0[10].x, _242);
    float _252 = fma(_218, (*spvDescriptorSet0.vp_c4)._m0[8].z, _244);
    float _254 = fma(_218, (*spvDescriptorSet0.vp_c4)._m0[7].z, _246);
    float _256 = fma(_218, (*spvDescriptorSet0.vp_c4)._m0[9].z, _248);
    float _258 = fma(_218, (*spvDescriptorSet0.vp_c4)._m0[10].z, _250);
    float _260 = _252 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _262 = _254 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _264 = _256 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _266 = _258 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _262;
    out.gl_Position.y = _260;
    out.gl_Position.z = _264;
    out.gl_Position.w = _266;
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
    float _42 = in.m_28.x;
    float _44 = in.m_28.y;
    float _46 = in.m_28.z;
    float _48 = (*spvDescriptorSet0.vp_c9)._m0[983].y * (*spvDescriptorSet0.vp_c11)._m0[41].z;
    float _50 = _48 * 0.15915493667125701904296875;
    float _52 = (*spvDescriptorSet0.vp_c9)._m0[983].y * (*spvDescriptorSet0.vp_c11)._m0[41].y;
    float _54 = _50 * 6.283185482025146484375;
    float _56 = sin(_54);
    float _58 = _52 * (-0.15915493667125701904296875);
    float _60 = _58 * 6.283185482025146484375;
    float _62 = sin(_60);
    float _64 = _56 * (*spvDescriptorSet0.vp_c11)._m0[41].w;
    float _66 = _58 * 6.283185482025146484375;
    float _68 = cos(_66);
    float _70 = _64 * 0.15915493667125701904296875;
    float _72 = _62 * _46;
    float _74 = _70 * 6.283185482025146484375;
    float _76 = sin(_74);
    float _78 = _70 * 6.283185482025146484375;
    float _80 = cos(_78);
    float _82 = _68 * _46;
    float _84 = _76 * _44;
    float _86 = _80 * _44;
    float _88 = -_84;
    float _90 = fma(_80, _42, _88);
    float _92 = fma(_76, _42, _86);
    float _94 = -_72;
    float _96 = fma(_68, _90, _94);
    float _98 = fma(_62, _90, _82);
    float _100 = _92 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _102 = _92 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _104 = fma(_96, (*spvDescriptorSet0.vp_c7)._m0[2].x, _100);
    float _106 = fma(_96, (*spvDescriptorSet0.vp_c7)._m0[0].x, _102);
    float _108 = fma(_98, (*spvDescriptorSet0.vp_c7)._m0[2].z, _104);
    float _110 = fma(_98, (*spvDescriptorSet0.vp_c7)._m0[0].z, _106);
    float _112 = _108 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _114 = _110 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _116 = _92 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _118 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _120 = _112 + _118;
    float _122 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _124 = _114 + _122;
    float _126 = fma(_96, (*spvDescriptorSet0.vp_c7)._m0[1].x, _116);
    float _128 = _120 * _120;
    float _130 = fma(_98, (*spvDescriptorSet0.vp_c7)._m0[1].z, _126);
    float _132 = fma(_124, _124, _128);
    float _134 = _130 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _136 = sqrt(_132);
    float _138 = _134 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _140 = fma(_114, (*spvDescriptorSet0.vp_c4)._m0[2].x, _138);
    float _142 = fma(_112, (*spvDescriptorSet0.vp_c4)._m0[2].z, _140);
    float _144 = _142 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _148 = _136 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _150 = _138;
    float _152 = _114;
    float _154 = _112;
    float _156 = _144;
    if (!_148)
    {
        _150 = _114;
    }
    float _158 = _150;
    float _160 = _158;
    if (!_148)
    {
        _152 = _134;
    }
    float _162 = _152;
    bool _164 = !_148;
    float _166 = _162;
    if (!_164)
    {
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _170 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _172 = _136 + _170;
        float _174 = _134 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _176 = rsqrt(_132);
        float _178 = _172 * _168;
        float _180 = _178 * 0.15915493667125701904296875;
        float _182 = _180 * 6.283185482025146484375;
        float _184 = cos(_182);
        float _186 = _180 * 6.283185482025146484375;
        float _188 = sin(_186);
        float _190 = _184 + (-1.0);
        float _192 = fma(_188, _174, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _196 = _176 * _192;
        float _198 = fma(_134, _184, _194);
        float _200 = fma(_124, _196, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _202 = _198 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _204 = fma(_120, _196, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _206 = fma(_200, (*spvDescriptorSet0.vp_c4)._m0[2].x, _202);
        float _208 = fma(_204, (*spvDescriptorSet0.vp_c4)._m0[2].z, _206);
        float _210 = _208 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _166 = _198;
        _160 = _200;
        _154 = _204;
        _156 = _210;
    }
    float _212 = _166;
    float _214 = _160;
    float _216 = _154;
    float _218 = _156;
    float _220 = _212 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _222 = _212 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _224 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[1].x, _220);
    float _226 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[0].x, _222);
    float _228 = fma(_216, (*spvDescriptorSet0.vp_c4)._m0[1].z, _224);
    float _230 = fma(_216, (*spvDescriptorSet0.vp_c4)._m0[0].z, _226);
    float _232 = _228 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _234 = _230 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _236 = _232 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _238 = _232 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _240 = _232 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _242 = _232 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _244 = fma(_234, (*spvDescriptorSet0.vp_c4)._m0[8].x, _236);
    float _246 = fma(_234, (*spvDescriptorSet0.vp_c4)._m0[7].x, _238);
    float _248 = fma(_234, (*spvDescriptorSet0.vp_c4)._m0[9].x, _240);
    float _250 = fma(_234, (*spvDescriptorSet0.vp_c4)._m0[10].x, _242);
    float _252 = fma(_218, (*spvDescriptorSet0.vp_c4)._m0[8].z, _244);
    float _254 = fma(_218, (*spvDescriptorSet0.vp_c4)._m0[7].z, _246);
    float _256 = fma(_218, (*spvDescriptorSet0.vp_c4)._m0[9].z, _248);
    float _258 = fma(_218, (*spvDescriptorSet0.vp_c4)._m0[10].z, _250);
    float _260 = _252 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _262 = _254 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _264 = _256 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _266 = _258 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _262;
    out.gl_Position.y = _260;
    out.gl_Position.z = _264;
    out.gl_Position.w = _266;
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
    float _42 = in.m_28.x;
    float _44 = in.m_28.y;
    float _46 = in.m_28.z;
    float _48 = (*spvDescriptorSet0.vp_c9)._m0[983].y * (*spvDescriptorSet0.vp_c11)._m0[41].z;
    float _50 = _48 * 0.15915493667125701904296875;
    float _52 = (*spvDescriptorSet0.vp_c9)._m0[983].y * (*spvDescriptorSet0.vp_c11)._m0[41].y;
    float _54 = _50 * 6.283185482025146484375;
    float _56 = sin(_54);
    float _58 = _52 * (-0.15915493667125701904296875);
    float _60 = _58 * 6.283185482025146484375;
    float _62 = sin(_60);
    float _64 = _56 * (*spvDescriptorSet0.vp_c11)._m0[41].w;
    float _66 = _58 * 6.283185482025146484375;
    float _68 = cos(_66);
    float _70 = _64 * 0.15915493667125701904296875;
    float _72 = _62 * _46;
    float _74 = _70 * 6.283185482025146484375;
    float _76 = sin(_74);
    float _78 = _70 * 6.283185482025146484375;
    float _80 = cos(_78);
    float _82 = _68 * _46;
    float _84 = _76 * _44;
    float _86 = _80 * _44;
    float _88 = -_84;
    float _90 = fma(_80, _42, _88);
    float _92 = fma(_76, _42, _86);
    float _94 = -_72;
    float _96 = fma(_68, _90, _94);
    float _98 = fma(_62, _90, _82);
    float _100 = _92 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _102 = _92 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _104 = fma(_96, (*spvDescriptorSet0.vp_c7)._m0[2].x, _100);
    float _106 = fma(_96, (*spvDescriptorSet0.vp_c7)._m0[0].x, _102);
    float _108 = fma(_98, (*spvDescriptorSet0.vp_c7)._m0[2].z, _104);
    float _110 = fma(_98, (*spvDescriptorSet0.vp_c7)._m0[0].z, _106);
    float _112 = _108 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _114 = _110 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _116 = _92 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _118 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _120 = _112 + _118;
    float _122 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _124 = _114 + _122;
    float _126 = fma(_96, (*spvDescriptorSet0.vp_c7)._m0[1].x, _116);
    float _128 = _120 * _120;
    float _130 = fma(_98, (*spvDescriptorSet0.vp_c7)._m0[1].z, _126);
    float _132 = fma(_124, _124, _128);
    float _134 = _130 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _136 = sqrt(_132);
    float _138 = _134 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _140 = fma(_114, (*spvDescriptorSet0.vp_c4)._m0[2].x, _138);
    float _142 = fma(_112, (*spvDescriptorSet0.vp_c4)._m0[2].z, _140);
    float _144 = _142 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _148 = _136 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _150 = _138;
    float _152 = _114;
    float _154 = _112;
    float _156 = _144;
    if (!_148)
    {
        _150 = _114;
    }
    float _158 = _150;
    float _160 = _158;
    if (!_148)
    {
        _152 = _134;
    }
    float _162 = _152;
    bool _164 = !_148;
    float _166 = _162;
    if (!_164)
    {
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _170 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _172 = _136 + _170;
        float _174 = _134 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _176 = rsqrt(_132);
        float _178 = _172 * _168;
        float _180 = _178 * 0.15915493667125701904296875;
        float _182 = _180 * 6.283185482025146484375;
        float _184 = cos(_182);
        float _186 = _180 * 6.283185482025146484375;
        float _188 = sin(_186);
        float _190 = _184 + (-1.0);
        float _192 = fma(_188, _174, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _196 = _176 * _192;
        float _198 = fma(_134, _184, _194);
        float _200 = fma(_124, _196, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _202 = _198 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _204 = fma(_120, _196, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _206 = fma(_200, (*spvDescriptorSet0.vp_c4)._m0[2].x, _202);
        float _208 = fma(_204, (*spvDescriptorSet0.vp_c4)._m0[2].z, _206);
        float _210 = _208 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _166 = _198;
        _160 = _200;
        _154 = _204;
        _156 = _210;
    }
    float _212 = _166;
    float _214 = _160;
    float _216 = _154;
    float _218 = _156;
    float _220 = _212 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _222 = _212 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _224 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[1].x, _220);
    float _226 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[0].x, _222);
    float _228 = fma(_216, (*spvDescriptorSet0.vp_c4)._m0[1].z, _224);
    float _230 = fma(_216, (*spvDescriptorSet0.vp_c4)._m0[0].z, _226);
    float _232 = _228 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _234 = _230 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _236 = _232 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _238 = _232 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _240 = _232 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _242 = _232 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _244 = fma(_234, (*spvDescriptorSet0.vp_c4)._m0[8].x, _236);
    float _246 = fma(_234, (*spvDescriptorSet0.vp_c4)._m0[7].x, _238);
    float _248 = fma(_234, (*spvDescriptorSet0.vp_c4)._m0[9].x, _240);
    float _250 = fma(_234, (*spvDescriptorSet0.vp_c4)._m0[10].x, _242);
    float _252 = fma(_218, (*spvDescriptorSet0.vp_c4)._m0[8].z, _244);
    float _254 = fma(_218, (*spvDescriptorSet0.vp_c4)._m0[7].z, _246);
    float _256 = fma(_218, (*spvDescriptorSet0.vp_c4)._m0[9].z, _248);
    float _258 = fma(_218, (*spvDescriptorSet0.vp_c4)._m0[10].z, _250);
    float _260 = _252 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _262 = _254 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _264 = _256 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _266 = _258 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _262;
    out.gl_Position.y = _260;
    out.gl_Position.z = _264;
    out.gl_Position.w = _266;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

