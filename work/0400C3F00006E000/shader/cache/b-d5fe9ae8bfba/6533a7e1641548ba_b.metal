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
    float _124 = _114 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _126 = _118 * _118;
    float _128 = fma(_112, (*spvDescriptorSet0.vp_c4)._m0[2].x, _124);
    float _130 = fma(_122, _122, _126);
    float _132 = fma(_110, (*spvDescriptorSet0.vp_c4)._m0[2].z, _128);
    float _134 = sqrt(_130);
    float _136 = _132 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _140 = _134 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _142 = _102;
    float _144 = _132;
    float _146 = _114;
    float _148 = _136;
    if (!_140)
    {
        _142 = _112;
    }
    float _150 = _142;
    float _152 = _150;
    if (!_140)
    {
        _144 = _110;
    }
    float _154 = _144;
    bool _156 = !_140;
    float _158 = _154;
    if (!_156)
    {
        float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _162 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _164 = _134 + _162;
        float _166 = _114 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _168 = rsqrt(_130);
        float _170 = _164 * _160;
        float _172 = _170 * 0.15915493667125701904296875;
        float _174 = _172 * 6.283185482025146484375;
        float _176 = cos(_174);
        float _178 = _172 * 6.283185482025146484375;
        float _180 = sin(_178);
        float _182 = _176 + (-1.0);
        float _184 = _182 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _186 = fma(_180, _166, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _188 = fma(_114, _176, _184);
        float _190 = _168 * _186;
        float _192 = _188 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _194 = fma(_122, _190, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _196 = fma(_118, _190, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _198 = fma(_194, (*spvDescriptorSet0.vp_c4)._m0[2].x, _192);
        float _200 = fma(_196, (*spvDescriptorSet0.vp_c4)._m0[2].z, _198);
        float _202 = _200 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _146 = _188;
        _152 = _194;
        _158 = _196;
        _148 = _202;
    }
    float _204 = _146;
    float _206 = _152;
    float _208 = _158;
    float _210 = _148;
    float _212 = _204 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _214 = _204 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _216 = fma(_206, (*spvDescriptorSet0.vp_c4)._m0[1].x, _212);
    float _218 = fma(_206, (*spvDescriptorSet0.vp_c4)._m0[0].x, _214);
    float _220 = fma(_208, (*spvDescriptorSet0.vp_c4)._m0[1].z, _216);
    float _222 = fma(_208, (*spvDescriptorSet0.vp_c4)._m0[0].z, _218);
    float _224 = _220 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _226 = _222 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _228 = _224 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _230 = _224 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _232 = _224 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _234 = _224 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _236 = fma(_226, (*spvDescriptorSet0.vp_c4)._m0[8].x, _228);
    float _238 = fma(_226, (*spvDescriptorSet0.vp_c4)._m0[7].x, _230);
    float _240 = fma(_226, (*spvDescriptorSet0.vp_c4)._m0[9].x, _232);
    float _242 = fma(_226, (*spvDescriptorSet0.vp_c4)._m0[10].x, _234);
    float _244 = fma(_210, (*spvDescriptorSet0.vp_c4)._m0[8].z, _236);
    float _246 = fma(_210, (*spvDescriptorSet0.vp_c4)._m0[7].z, _238);
    float _248 = fma(_210, (*spvDescriptorSet0.vp_c4)._m0[9].z, _240);
    float _250 = fma(_210, (*spvDescriptorSet0.vp_c4)._m0[10].z, _242);
    float _252 = _244 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _254 = _246 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _256 = _248 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _258 = _250 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _254;
    out.gl_Position.y = _252;
    out.gl_Position.z = _256;
    out.gl_Position.w = _258;
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
    float _124 = _114 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _126 = _118 * _118;
    float _128 = fma(_112, (*spvDescriptorSet0.vp_c4)._m0[2].x, _124);
    float _130 = fma(_122, _122, _126);
    float _132 = fma(_110, (*spvDescriptorSet0.vp_c4)._m0[2].z, _128);
    float _134 = sqrt(_130);
    float _136 = _132 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _140 = _134 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _142 = _102;
    float _144 = _132;
    float _146 = _114;
    float _148 = _136;
    if (!_140)
    {
        _142 = _112;
    }
    float _150 = _142;
    float _152 = _150;
    if (!_140)
    {
        _144 = _110;
    }
    float _154 = _144;
    bool _156 = !_140;
    float _158 = _154;
    if (!_156)
    {
        float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _162 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _164 = _134 + _162;
        float _166 = _114 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _168 = rsqrt(_130);
        float _170 = _164 * _160;
        float _172 = _170 * 0.15915493667125701904296875;
        float _174 = _172 * 6.283185482025146484375;
        float _176 = cos(_174);
        float _178 = _172 * 6.283185482025146484375;
        float _180 = sin(_178);
        float _182 = _176 + (-1.0);
        float _184 = _182 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _186 = fma(_180, _166, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _188 = fma(_114, _176, _184);
        float _190 = _168 * _186;
        float _192 = _188 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _194 = fma(_122, _190, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _196 = fma(_118, _190, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _198 = fma(_194, (*spvDescriptorSet0.vp_c4)._m0[2].x, _192);
        float _200 = fma(_196, (*spvDescriptorSet0.vp_c4)._m0[2].z, _198);
        float _202 = _200 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _146 = _188;
        _152 = _194;
        _158 = _196;
        _148 = _202;
    }
    float _204 = _146;
    float _206 = _152;
    float _208 = _158;
    float _210 = _148;
    float _212 = _204 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _214 = _204 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _216 = fma(_206, (*spvDescriptorSet0.vp_c4)._m0[1].x, _212);
    float _218 = fma(_206, (*spvDescriptorSet0.vp_c4)._m0[0].x, _214);
    float _220 = fma(_208, (*spvDescriptorSet0.vp_c4)._m0[1].z, _216);
    float _222 = fma(_208, (*spvDescriptorSet0.vp_c4)._m0[0].z, _218);
    float _224 = _220 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _226 = _222 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _228 = _224 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _230 = _224 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _232 = _224 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _234 = _224 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _236 = fma(_226, (*spvDescriptorSet0.vp_c4)._m0[8].x, _228);
    float _238 = fma(_226, (*spvDescriptorSet0.vp_c4)._m0[7].x, _230);
    float _240 = fma(_226, (*spvDescriptorSet0.vp_c4)._m0[9].x, _232);
    float _242 = fma(_226, (*spvDescriptorSet0.vp_c4)._m0[10].x, _234);
    float _244 = fma(_210, (*spvDescriptorSet0.vp_c4)._m0[8].z, _236);
    float _246 = fma(_210, (*spvDescriptorSet0.vp_c4)._m0[7].z, _238);
    float _248 = fma(_210, (*spvDescriptorSet0.vp_c4)._m0[9].z, _240);
    float _250 = fma(_210, (*spvDescriptorSet0.vp_c4)._m0[10].z, _242);
    float _252 = _244 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _254 = _246 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _256 = _248 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _258 = _250 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _254;
    out.gl_Position.y = _252;
    out.gl_Position.z = _256;
    out.gl_Position.w = _258;
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
    float _124 = _114 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _126 = _118 * _118;
    float _128 = fma(_112, (*spvDescriptorSet0.vp_c4)._m0[2].x, _124);
    float _130 = fma(_122, _122, _126);
    float _132 = fma(_110, (*spvDescriptorSet0.vp_c4)._m0[2].z, _128);
    float _134 = sqrt(_130);
    float _136 = _132 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _140 = _134 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _142 = _102;
    float _144 = _132;
    float _146 = _114;
    float _148 = _136;
    if (!_140)
    {
        _142 = _112;
    }
    float _150 = _142;
    float _152 = _150;
    if (!_140)
    {
        _144 = _110;
    }
    float _154 = _144;
    bool _156 = !_140;
    float _158 = _154;
    if (!_156)
    {
        float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _162 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _164 = _134 + _162;
        float _166 = _114 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _168 = rsqrt(_130);
        float _170 = _164 * _160;
        float _172 = _170 * 0.15915493667125701904296875;
        float _174 = _172 * 6.283185482025146484375;
        float _176 = cos(_174);
        float _178 = _172 * 6.283185482025146484375;
        float _180 = sin(_178);
        float _182 = _176 + (-1.0);
        float _184 = _182 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _186 = fma(_180, _166, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _188 = fma(_114, _176, _184);
        float _190 = _168 * _186;
        float _192 = _188 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _194 = fma(_122, _190, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _196 = fma(_118, _190, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _198 = fma(_194, (*spvDescriptorSet0.vp_c4)._m0[2].x, _192);
        float _200 = fma(_196, (*spvDescriptorSet0.vp_c4)._m0[2].z, _198);
        float _202 = _200 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _146 = _188;
        _152 = _194;
        _158 = _196;
        _148 = _202;
    }
    float _204 = _146;
    float _206 = _152;
    float _208 = _158;
    float _210 = _148;
    float _212 = _204 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _214 = _204 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _216 = fma(_206, (*spvDescriptorSet0.vp_c4)._m0[1].x, _212);
    float _218 = fma(_206, (*spvDescriptorSet0.vp_c4)._m0[0].x, _214);
    float _220 = fma(_208, (*spvDescriptorSet0.vp_c4)._m0[1].z, _216);
    float _222 = fma(_208, (*spvDescriptorSet0.vp_c4)._m0[0].z, _218);
    float _224 = _220 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _226 = _222 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _228 = _224 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _230 = _224 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _232 = _224 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _234 = _224 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _236 = fma(_226, (*spvDescriptorSet0.vp_c4)._m0[8].x, _228);
    float _238 = fma(_226, (*spvDescriptorSet0.vp_c4)._m0[7].x, _230);
    float _240 = fma(_226, (*spvDescriptorSet0.vp_c4)._m0[9].x, _232);
    float _242 = fma(_226, (*spvDescriptorSet0.vp_c4)._m0[10].x, _234);
    float _244 = fma(_210, (*spvDescriptorSet0.vp_c4)._m0[8].z, _236);
    float _246 = fma(_210, (*spvDescriptorSet0.vp_c4)._m0[7].z, _238);
    float _248 = fma(_210, (*spvDescriptorSet0.vp_c4)._m0[9].z, _240);
    float _250 = fma(_210, (*spvDescriptorSet0.vp_c4)._m0[10].z, _242);
    float _252 = _244 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _254 = _246 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _256 = _248 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _258 = _250 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _254;
    out.gl_Position.y = _252;
    out.gl_Position.z = _256;
    out.gl_Position.w = _258;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

