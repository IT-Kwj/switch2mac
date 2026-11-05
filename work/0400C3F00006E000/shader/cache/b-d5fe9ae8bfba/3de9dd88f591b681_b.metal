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
    float4 m_28 [[attribute(0)]];
    float4 m_26 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _42 = in.m_26.x;
    float _44 = in.m_26.y;
    float _46 = (*spvDescriptorSet0.vp_c7)._m0[1].x * (*spvDescriptorSet0.vp_c7)._m0[1].x;
    float _48 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, (*spvDescriptorSet0.vp_c7)._m0[0].x, _46);
    float _50 = (*spvDescriptorSet0.vp_c7)._m0[1].z * (*spvDescriptorSet0.vp_c7)._m0[1].z;
    float _52 = fma((*spvDescriptorSet0.vp_c7)._m0[2].x, (*spvDescriptorSet0.vp_c7)._m0[2].x, _48);
    float _54 = in.m_28.x;
    float _56 = in.m_28.y;
    float _58 = in.m_28.z;
    float _60 = fma((*spvDescriptorSet0.vp_c7)._m0[0].z, (*spvDescriptorSet0.vp_c7)._m0[0].z, _50);
    float _62 = sqrt(_52);
    float _64 = fma((*spvDescriptorSet0.vp_c7)._m0[2].z, (*spvDescriptorSet0.vp_c7)._m0[2].z, _60);
    float _66 = rsqrt(_52);
    float _68 = _42 * 0.100000001490116119384765625;
    float _70 = _44 * 0.100000001490116119384765625;
    float _72 = sqrt(_64);
    float _74 = -_68;
    float _76 = _74 + _54;
    float _78 = -_70;
    float _80 = _78 + _58;
    float _82 = rsqrt(_64);
    float _84 = _56 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _86 = fma(_62, _76, _68);
    float _88 = _56 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _90 = _56 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _92 = _86 * _66;
    float _94 = fma(_72, _80, _70);
    float _96 = fma(_92, (*spvDescriptorSet0.vp_c7)._m0[2].x, _88);
    float _98 = fma(_92, (*spvDescriptorSet0.vp_c7)._m0[0].x, _84);
    float _100 = fma(_92, (*spvDescriptorSet0.vp_c7)._m0[1].x, _90);
    float _102 = _94 * _82;
    float _104 = fma(_102, (*spvDescriptorSet0.vp_c7)._m0[2].z, _96);
    float _106 = fma(_102, (*spvDescriptorSet0.vp_c7)._m0[0].z, _98);
    float _108 = fma(_102, (*spvDescriptorSet0.vp_c7)._m0[1].z, _100);
    float _110 = _104 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _112 = _106 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _114 = _108 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _116 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _118 = _110 + _116;
    float _120 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _122 = _112 + _120;
    float _124 = _118 * _118;
    float _126 = fma(_122, _122, _124);
    float _128 = sqrt(_126);
    bool _132 = _128 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _134 = _102;
    float _136 = _92;
    float _138 = _114;
    if (!_132)
    {
        _134 = _112;
    }
    float _140 = _134;
    float _142 = _140;
    if (!_132)
    {
        _136 = _110;
    }
    float _144 = _136;
    bool _146 = !_132;
    float _148 = _144;
    if (!_146)
    {
        float _150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _152 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _154 = _128 + _152;
        float _156 = rsqrt(_126);
        float _158 = _154 * _150;
        float _160 = _114 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _162 = _158 * 0.15915493667125701904296875;
        float _164 = _162 * 6.283185482025146484375;
        float _166 = cos(_164);
        float _168 = _162 * 6.283185482025146484375;
        float _170 = sin(_168);
        float _172 = _166 + (-1.0);
        float _174 = _172 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _176 = fma(_170, _160, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _178 = fma(_114, _166, _174);
        float _180 = _156 * _176;
        float _182 = fma(_122, _180, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _184 = fma(_118, _180, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _138 = _178;
        _142 = _182;
        _148 = _184;
    }
    float _186 = _138;
    float _188 = _142;
    float _190 = _148;
    float _192 = _186 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _194 = _186 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _196 = _186 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _198 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[1].x, _192);
    float _200 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[0].x, _194);
    float _202 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[2].x, _196);
    float _204 = fma(_190, (*spvDescriptorSet0.vp_c4)._m0[1].z, _198);
    float _206 = fma(_190, (*spvDescriptorSet0.vp_c4)._m0[0].z, _200);
    float _208 = fma(_190, (*spvDescriptorSet0.vp_c4)._m0[2].z, _202);
    float _210 = _204 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _212 = _206 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _214 = _208 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _216 = _210 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _218 = _210 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _220 = _210 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _222 = _210 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _224 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[8].x, _216);
    float _226 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[7].x, _218);
    float _228 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[9].x, _220);
    float _230 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[10].x, _222);
    float _232 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[8].z, _224);
    float _234 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[7].z, _226);
    float _236 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[9].z, _228);
    float _238 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[10].z, _230);
    float _240 = _232 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _242 = _234 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _244 = _236 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _246 = _238 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _242;
    out.gl_Position.y = _240;
    out.gl_Position.z = _244;
    out.gl_Position.w = _246;
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
    float _42 = in.m_26.x;
    float _44 = in.m_26.y;
    float _46 = (*spvDescriptorSet0.vp_c7)._m0[1].x * (*spvDescriptorSet0.vp_c7)._m0[1].x;
    float _48 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, (*spvDescriptorSet0.vp_c7)._m0[0].x, _46);
    float _50 = (*spvDescriptorSet0.vp_c7)._m0[1].z * (*spvDescriptorSet0.vp_c7)._m0[1].z;
    float _52 = fma((*spvDescriptorSet0.vp_c7)._m0[2].x, (*spvDescriptorSet0.vp_c7)._m0[2].x, _48);
    float _54 = in.m_28.x;
    float _56 = in.m_28.y;
    float _58 = in.m_28.z;
    float _60 = fma((*spvDescriptorSet0.vp_c7)._m0[0].z, (*spvDescriptorSet0.vp_c7)._m0[0].z, _50);
    float _62 = sqrt(_52);
    float _64 = fma((*spvDescriptorSet0.vp_c7)._m0[2].z, (*spvDescriptorSet0.vp_c7)._m0[2].z, _60);
    float _66 = rsqrt(_52);
    float _68 = _42 * 0.100000001490116119384765625;
    float _70 = _44 * 0.100000001490116119384765625;
    float _72 = sqrt(_64);
    float _74 = -_68;
    float _76 = _74 + _54;
    float _78 = -_70;
    float _80 = _78 + _58;
    float _82 = rsqrt(_64);
    float _84 = _56 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _86 = fma(_62, _76, _68);
    float _88 = _56 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _90 = _56 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _92 = _86 * _66;
    float _94 = fma(_72, _80, _70);
    float _96 = fma(_92, (*spvDescriptorSet0.vp_c7)._m0[2].x, _88);
    float _98 = fma(_92, (*spvDescriptorSet0.vp_c7)._m0[0].x, _84);
    float _100 = fma(_92, (*spvDescriptorSet0.vp_c7)._m0[1].x, _90);
    float _102 = _94 * _82;
    float _104 = fma(_102, (*spvDescriptorSet0.vp_c7)._m0[2].z, _96);
    float _106 = fma(_102, (*spvDescriptorSet0.vp_c7)._m0[0].z, _98);
    float _108 = fma(_102, (*spvDescriptorSet0.vp_c7)._m0[1].z, _100);
    float _110 = _104 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _112 = _106 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _114 = _108 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _116 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _118 = _110 + _116;
    float _120 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _122 = _112 + _120;
    float _124 = _118 * _118;
    float _126 = fma(_122, _122, _124);
    float _128 = sqrt(_126);
    bool _132 = _128 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _134 = _102;
    float _136 = _92;
    float _138 = _114;
    if (!_132)
    {
        _134 = _112;
    }
    float _140 = _134;
    float _142 = _140;
    if (!_132)
    {
        _136 = _110;
    }
    float _144 = _136;
    bool _146 = !_132;
    float _148 = _144;
    if (!_146)
    {
        float _150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _152 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _154 = _128 + _152;
        float _156 = rsqrt(_126);
        float _158 = _154 * _150;
        float _160 = _114 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _162 = _158 * 0.15915493667125701904296875;
        float _164 = _162 * 6.283185482025146484375;
        float _166 = cos(_164);
        float _168 = _162 * 6.283185482025146484375;
        float _170 = sin(_168);
        float _172 = _166 + (-1.0);
        float _174 = _172 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _176 = fma(_170, _160, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _178 = fma(_114, _166, _174);
        float _180 = _156 * _176;
        float _182 = fma(_122, _180, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _184 = fma(_118, _180, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _138 = _178;
        _142 = _182;
        _148 = _184;
    }
    float _186 = _138;
    float _188 = _142;
    float _190 = _148;
    float _192 = _186 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _194 = _186 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _196 = _186 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _198 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[1].x, _192);
    float _200 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[0].x, _194);
    float _202 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[2].x, _196);
    float _204 = fma(_190, (*spvDescriptorSet0.vp_c4)._m0[1].z, _198);
    float _206 = fma(_190, (*spvDescriptorSet0.vp_c4)._m0[0].z, _200);
    float _208 = fma(_190, (*spvDescriptorSet0.vp_c4)._m0[2].z, _202);
    float _210 = _204 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _212 = _206 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _214 = _208 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _216 = _210 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _218 = _210 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _220 = _210 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _222 = _210 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _224 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[8].x, _216);
    float _226 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[7].x, _218);
    float _228 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[9].x, _220);
    float _230 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[10].x, _222);
    float _232 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[8].z, _224);
    float _234 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[7].z, _226);
    float _236 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[9].z, _228);
    float _238 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[10].z, _230);
    float _240 = _232 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _242 = _234 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _244 = _236 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _246 = _238 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _242;
    out.gl_Position.y = _240;
    out.gl_Position.z = _244;
    out.gl_Position.w = _246;
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
    float _42 = in.m_26.x;
    float _44 = in.m_26.y;
    float _46 = (*spvDescriptorSet0.vp_c7)._m0[1].x * (*spvDescriptorSet0.vp_c7)._m0[1].x;
    float _48 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, (*spvDescriptorSet0.vp_c7)._m0[0].x, _46);
    float _50 = (*spvDescriptorSet0.vp_c7)._m0[1].z * (*spvDescriptorSet0.vp_c7)._m0[1].z;
    float _52 = fma((*spvDescriptorSet0.vp_c7)._m0[2].x, (*spvDescriptorSet0.vp_c7)._m0[2].x, _48);
    float _54 = in.m_28.x;
    float _56 = in.m_28.y;
    float _58 = in.m_28.z;
    float _60 = fma((*spvDescriptorSet0.vp_c7)._m0[0].z, (*spvDescriptorSet0.vp_c7)._m0[0].z, _50);
    float _62 = sqrt(_52);
    float _64 = fma((*spvDescriptorSet0.vp_c7)._m0[2].z, (*spvDescriptorSet0.vp_c7)._m0[2].z, _60);
    float _66 = rsqrt(_52);
    float _68 = _42 * 0.100000001490116119384765625;
    float _70 = _44 * 0.100000001490116119384765625;
    float _72 = sqrt(_64);
    float _74 = -_68;
    float _76 = _74 + _54;
    float _78 = -_70;
    float _80 = _78 + _58;
    float _82 = rsqrt(_64);
    float _84 = _56 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _86 = fma(_62, _76, _68);
    float _88 = _56 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _90 = _56 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _92 = _86 * _66;
    float _94 = fma(_72, _80, _70);
    float _96 = fma(_92, (*spvDescriptorSet0.vp_c7)._m0[2].x, _88);
    float _98 = fma(_92, (*spvDescriptorSet0.vp_c7)._m0[0].x, _84);
    float _100 = fma(_92, (*spvDescriptorSet0.vp_c7)._m0[1].x, _90);
    float _102 = _94 * _82;
    float _104 = fma(_102, (*spvDescriptorSet0.vp_c7)._m0[2].z, _96);
    float _106 = fma(_102, (*spvDescriptorSet0.vp_c7)._m0[0].z, _98);
    float _108 = fma(_102, (*spvDescriptorSet0.vp_c7)._m0[1].z, _100);
    float _110 = _104 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _112 = _106 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _114 = _108 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _116 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _118 = _110 + _116;
    float _120 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _122 = _112 + _120;
    float _124 = _118 * _118;
    float _126 = fma(_122, _122, _124);
    float _128 = sqrt(_126);
    bool _132 = _128 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _134 = _102;
    float _136 = _92;
    float _138 = _114;
    if (!_132)
    {
        _134 = _112;
    }
    float _140 = _134;
    float _142 = _140;
    if (!_132)
    {
        _136 = _110;
    }
    float _144 = _136;
    bool _146 = !_132;
    float _148 = _144;
    if (!_146)
    {
        float _150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _152 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _154 = _128 + _152;
        float _156 = rsqrt(_126);
        float _158 = _154 * _150;
        float _160 = _114 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _162 = _158 * 0.15915493667125701904296875;
        float _164 = _162 * 6.283185482025146484375;
        float _166 = cos(_164);
        float _168 = _162 * 6.283185482025146484375;
        float _170 = sin(_168);
        float _172 = _166 + (-1.0);
        float _174 = _172 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _176 = fma(_170, _160, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _178 = fma(_114, _166, _174);
        float _180 = _156 * _176;
        float _182 = fma(_122, _180, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _184 = fma(_118, _180, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _138 = _178;
        _142 = _182;
        _148 = _184;
    }
    float _186 = _138;
    float _188 = _142;
    float _190 = _148;
    float _192 = _186 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _194 = _186 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _196 = _186 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _198 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[1].x, _192);
    float _200 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[0].x, _194);
    float _202 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[2].x, _196);
    float _204 = fma(_190, (*spvDescriptorSet0.vp_c4)._m0[1].z, _198);
    float _206 = fma(_190, (*spvDescriptorSet0.vp_c4)._m0[0].z, _200);
    float _208 = fma(_190, (*spvDescriptorSet0.vp_c4)._m0[2].z, _202);
    float _210 = _204 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _212 = _206 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _214 = _208 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _216 = _210 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _218 = _210 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _220 = _210 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _222 = _210 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _224 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[8].x, _216);
    float _226 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[7].x, _218);
    float _228 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[9].x, _220);
    float _230 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[10].x, _222);
    float _232 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[8].z, _224);
    float _234 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[7].z, _226);
    float _236 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[9].z, _228);
    float _238 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[10].z, _230);
    float _240 = _232 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _242 = _234 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _244 = _236 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _246 = _238 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _242;
    out.gl_Position.y = _240;
    out.gl_Position.z = _244;
    out.gl_Position.w = _246;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

