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
    float _44 = in.m_28.x;
    float _46 = in.m_28.y;
    float _48 = in.m_28.z;
    float _50 = _42 * (*spvDescriptorSet0.vp_c7)._m0[10].x;
    float _52 = _50 * 0.15915493667125701904296875;
    float _54 = _42 * (*spvDescriptorSet0.vp_c7)._m0[10].y;
    float _56 = fma(_42, (*spvDescriptorSet0.vp_c7)._m0[10].z, _46);
    float _58 = _52 * 6.283185482025146484375;
    float _60 = sin(_58);
    float _62 = _54 * 0.15915493667125701904296875;
    float _64 = _52 * 6.283185482025146484375;
    float _66 = cos(_64);
    float _68 = _62 * 6.283185482025146484375;
    float _70 = cos(_68);
    float _72 = _60 * _48;
    float _74 = _62 * 6.283185482025146484375;
    float _76 = sin(_74);
    float _78 = -_72;
    float _80 = fma(_56, _66, _78);
    float _82 = _66 * _48;
    float _84 = fma(_56, _60, _82);
    float _86 = _80 * _70;
    float _88 = _80 * _76;
    float _90 = fma(_76, _44, _86);
    float _92 = -_88;
    float _94 = fma(_70, _44, _92);
    float _96 = _90 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _98 = _90 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _100 = fma(_94, (*spvDescriptorSet0.vp_c7)._m0[2].x, _96);
    float _102 = fma(_94, (*spvDescriptorSet0.vp_c7)._m0[0].x, _98);
    float _104 = fma(_84, (*spvDescriptorSet0.vp_c7)._m0[2].z, _100);
    float _106 = fma(_84, (*spvDescriptorSet0.vp_c7)._m0[0].z, _102);
    float _108 = _104 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _110 = _106 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _112 = _90 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _114 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _116 = _108 + _114;
    float _118 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _120 = _110 + _118;
    float _122 = fma(_94, (*spvDescriptorSet0.vp_c7)._m0[1].x, _112);
    float _124 = _116 * _116;
    float _126 = fma(_84, (*spvDescriptorSet0.vp_c7)._m0[1].z, _122);
    float _128 = fma(_120, _120, _124);
    float _130 = _126 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _132 = sqrt(_128);
    float _134 = _130 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _136 = fma(_110, (*spvDescriptorSet0.vp_c4)._m0[2].x, _134);
    float _138 = fma(_108, (*spvDescriptorSet0.vp_c4)._m0[2].z, _136);
    float _140 = _138 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _144 = _132 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _146 = _134;
    float _148 = _110;
    float _150 = _108;
    float _152 = _140;
    if (!_144)
    {
        _146 = _110;
    }
    float _154 = _146;
    float _156 = _154;
    if (!_144)
    {
        _148 = _130;
    }
    float _158 = _148;
    bool _160 = !_144;
    float _162 = _158;
    if (!_160)
    {
        float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _166 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _168 = _132 + _166;
        float _170 = _130 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _172 = rsqrt(_128);
        float _174 = _168 * _164;
        float _176 = _174 * 0.15915493667125701904296875;
        float _178 = _176 * 6.283185482025146484375;
        float _180 = cos(_178);
        float _182 = _176 * 6.283185482025146484375;
        float _184 = sin(_182);
        float _186 = _180 + (-1.0);
        float _188 = fma(_184, _170, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _192 = _172 * _188;
        float _194 = fma(_130, _180, _190);
        float _196 = fma(_120, _192, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _198 = _194 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _200 = fma(_116, _192, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _202 = fma(_196, (*spvDescriptorSet0.vp_c4)._m0[2].x, _198);
        float _204 = fma(_200, (*spvDescriptorSet0.vp_c4)._m0[2].z, _202);
        float _206 = _204 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _162 = _194;
        _156 = _196;
        _150 = _200;
        _152 = _206;
    }
    float _208 = _162;
    float _210 = _156;
    float _212 = _150;
    float _214 = _152;
    float _216 = _208 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _218 = _208 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _220 = fma(_210, (*spvDescriptorSet0.vp_c4)._m0[1].x, _216);
    float _222 = fma(_210, (*spvDescriptorSet0.vp_c4)._m0[0].x, _218);
    float _224 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[1].z, _220);
    float _226 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[0].z, _222);
    float _228 = _224 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _230 = _226 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _232 = _228 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _234 = _228 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _236 = _228 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _238 = _228 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _240 = fma(_230, (*spvDescriptorSet0.vp_c4)._m0[8].x, _232);
    float _242 = fma(_230, (*spvDescriptorSet0.vp_c4)._m0[7].x, _234);
    float _244 = fma(_230, (*spvDescriptorSet0.vp_c4)._m0[9].x, _236);
    float _246 = fma(_230, (*spvDescriptorSet0.vp_c4)._m0[10].x, _238);
    float _248 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[8].z, _240);
    float _250 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[7].z, _242);
    float _252 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[9].z, _244);
    float _254 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[10].z, _246);
    float _256 = _248 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _258 = _250 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _260 = _252 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _262 = _254 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _258;
    out.gl_Position.y = _256;
    out.gl_Position.z = _260;
    out.gl_Position.w = _262;
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
    float _44 = in.m_28.x;
    float _46 = in.m_28.y;
    float _48 = in.m_28.z;
    float _50 = _42 * (*spvDescriptorSet0.vp_c7)._m0[10].x;
    float _52 = _50 * 0.15915493667125701904296875;
    float _54 = _42 * (*spvDescriptorSet0.vp_c7)._m0[10].y;
    float _56 = fma(_42, (*spvDescriptorSet0.vp_c7)._m0[10].z, _46);
    float _58 = _52 * 6.283185482025146484375;
    float _60 = sin(_58);
    float _62 = _54 * 0.15915493667125701904296875;
    float _64 = _52 * 6.283185482025146484375;
    float _66 = cos(_64);
    float _68 = _62 * 6.283185482025146484375;
    float _70 = cos(_68);
    float _72 = _60 * _48;
    float _74 = _62 * 6.283185482025146484375;
    float _76 = sin(_74);
    float _78 = -_72;
    float _80 = fma(_56, _66, _78);
    float _82 = _66 * _48;
    float _84 = fma(_56, _60, _82);
    float _86 = _80 * _70;
    float _88 = _80 * _76;
    float _90 = fma(_76, _44, _86);
    float _92 = -_88;
    float _94 = fma(_70, _44, _92);
    float _96 = _90 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _98 = _90 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _100 = fma(_94, (*spvDescriptorSet0.vp_c7)._m0[2].x, _96);
    float _102 = fma(_94, (*spvDescriptorSet0.vp_c7)._m0[0].x, _98);
    float _104 = fma(_84, (*spvDescriptorSet0.vp_c7)._m0[2].z, _100);
    float _106 = fma(_84, (*spvDescriptorSet0.vp_c7)._m0[0].z, _102);
    float _108 = _104 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _110 = _106 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _112 = _90 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _114 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _116 = _108 + _114;
    float _118 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _120 = _110 + _118;
    float _122 = fma(_94, (*spvDescriptorSet0.vp_c7)._m0[1].x, _112);
    float _124 = _116 * _116;
    float _126 = fma(_84, (*spvDescriptorSet0.vp_c7)._m0[1].z, _122);
    float _128 = fma(_120, _120, _124);
    float _130 = _126 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _132 = sqrt(_128);
    float _134 = _130 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _136 = fma(_110, (*spvDescriptorSet0.vp_c4)._m0[2].x, _134);
    float _138 = fma(_108, (*spvDescriptorSet0.vp_c4)._m0[2].z, _136);
    float _140 = _138 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _144 = _132 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _146 = _134;
    float _148 = _110;
    float _150 = _108;
    float _152 = _140;
    if (!_144)
    {
        _146 = _110;
    }
    float _154 = _146;
    float _156 = _154;
    if (!_144)
    {
        _148 = _130;
    }
    float _158 = _148;
    bool _160 = !_144;
    float _162 = _158;
    if (!_160)
    {
        float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _166 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _168 = _132 + _166;
        float _170 = _130 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _172 = rsqrt(_128);
        float _174 = _168 * _164;
        float _176 = _174 * 0.15915493667125701904296875;
        float _178 = _176 * 6.283185482025146484375;
        float _180 = cos(_178);
        float _182 = _176 * 6.283185482025146484375;
        float _184 = sin(_182);
        float _186 = _180 + (-1.0);
        float _188 = fma(_184, _170, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _192 = _172 * _188;
        float _194 = fma(_130, _180, _190);
        float _196 = fma(_120, _192, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _198 = _194 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _200 = fma(_116, _192, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _202 = fma(_196, (*spvDescriptorSet0.vp_c4)._m0[2].x, _198);
        float _204 = fma(_200, (*spvDescriptorSet0.vp_c4)._m0[2].z, _202);
        float _206 = _204 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _162 = _194;
        _156 = _196;
        _150 = _200;
        _152 = _206;
    }
    float _208 = _162;
    float _210 = _156;
    float _212 = _150;
    float _214 = _152;
    float _216 = _208 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _218 = _208 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _220 = fma(_210, (*spvDescriptorSet0.vp_c4)._m0[1].x, _216);
    float _222 = fma(_210, (*spvDescriptorSet0.vp_c4)._m0[0].x, _218);
    float _224 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[1].z, _220);
    float _226 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[0].z, _222);
    float _228 = _224 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _230 = _226 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _232 = _228 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _234 = _228 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _236 = _228 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _238 = _228 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _240 = fma(_230, (*spvDescriptorSet0.vp_c4)._m0[8].x, _232);
    float _242 = fma(_230, (*spvDescriptorSet0.vp_c4)._m0[7].x, _234);
    float _244 = fma(_230, (*spvDescriptorSet0.vp_c4)._m0[9].x, _236);
    float _246 = fma(_230, (*spvDescriptorSet0.vp_c4)._m0[10].x, _238);
    float _248 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[8].z, _240);
    float _250 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[7].z, _242);
    float _252 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[9].z, _244);
    float _254 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[10].z, _246);
    float _256 = _248 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _258 = _250 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _260 = _252 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _262 = _254 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _258;
    out.gl_Position.y = _256;
    out.gl_Position.z = _260;
    out.gl_Position.w = _262;
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
    float _44 = in.m_28.x;
    float _46 = in.m_28.y;
    float _48 = in.m_28.z;
    float _50 = _42 * (*spvDescriptorSet0.vp_c7)._m0[10].x;
    float _52 = _50 * 0.15915493667125701904296875;
    float _54 = _42 * (*spvDescriptorSet0.vp_c7)._m0[10].y;
    float _56 = fma(_42, (*spvDescriptorSet0.vp_c7)._m0[10].z, _46);
    float _58 = _52 * 6.283185482025146484375;
    float _60 = sin(_58);
    float _62 = _54 * 0.15915493667125701904296875;
    float _64 = _52 * 6.283185482025146484375;
    float _66 = cos(_64);
    float _68 = _62 * 6.283185482025146484375;
    float _70 = cos(_68);
    float _72 = _60 * _48;
    float _74 = _62 * 6.283185482025146484375;
    float _76 = sin(_74);
    float _78 = -_72;
    float _80 = fma(_56, _66, _78);
    float _82 = _66 * _48;
    float _84 = fma(_56, _60, _82);
    float _86 = _80 * _70;
    float _88 = _80 * _76;
    float _90 = fma(_76, _44, _86);
    float _92 = -_88;
    float _94 = fma(_70, _44, _92);
    float _96 = _90 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _98 = _90 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _100 = fma(_94, (*spvDescriptorSet0.vp_c7)._m0[2].x, _96);
    float _102 = fma(_94, (*spvDescriptorSet0.vp_c7)._m0[0].x, _98);
    float _104 = fma(_84, (*spvDescriptorSet0.vp_c7)._m0[2].z, _100);
    float _106 = fma(_84, (*spvDescriptorSet0.vp_c7)._m0[0].z, _102);
    float _108 = _104 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _110 = _106 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _112 = _90 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _114 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _116 = _108 + _114;
    float _118 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _120 = _110 + _118;
    float _122 = fma(_94, (*spvDescriptorSet0.vp_c7)._m0[1].x, _112);
    float _124 = _116 * _116;
    float _126 = fma(_84, (*spvDescriptorSet0.vp_c7)._m0[1].z, _122);
    float _128 = fma(_120, _120, _124);
    float _130 = _126 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _132 = sqrt(_128);
    float _134 = _130 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _136 = fma(_110, (*spvDescriptorSet0.vp_c4)._m0[2].x, _134);
    float _138 = fma(_108, (*spvDescriptorSet0.vp_c4)._m0[2].z, _136);
    float _140 = _138 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _144 = _132 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _146 = _134;
    float _148 = _110;
    float _150 = _108;
    float _152 = _140;
    if (!_144)
    {
        _146 = _110;
    }
    float _154 = _146;
    float _156 = _154;
    if (!_144)
    {
        _148 = _130;
    }
    float _158 = _148;
    bool _160 = !_144;
    float _162 = _158;
    if (!_160)
    {
        float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _166 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _168 = _132 + _166;
        float _170 = _130 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _172 = rsqrt(_128);
        float _174 = _168 * _164;
        float _176 = _174 * 0.15915493667125701904296875;
        float _178 = _176 * 6.283185482025146484375;
        float _180 = cos(_178);
        float _182 = _176 * 6.283185482025146484375;
        float _184 = sin(_182);
        float _186 = _180 + (-1.0);
        float _188 = fma(_184, _170, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _192 = _172 * _188;
        float _194 = fma(_130, _180, _190);
        float _196 = fma(_120, _192, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _198 = _194 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _200 = fma(_116, _192, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _202 = fma(_196, (*spvDescriptorSet0.vp_c4)._m0[2].x, _198);
        float _204 = fma(_200, (*spvDescriptorSet0.vp_c4)._m0[2].z, _202);
        float _206 = _204 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _162 = _194;
        _156 = _196;
        _150 = _200;
        _152 = _206;
    }
    float _208 = _162;
    float _210 = _156;
    float _212 = _150;
    float _214 = _152;
    float _216 = _208 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _218 = _208 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _220 = fma(_210, (*spvDescriptorSet0.vp_c4)._m0[1].x, _216);
    float _222 = fma(_210, (*spvDescriptorSet0.vp_c4)._m0[0].x, _218);
    float _224 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[1].z, _220);
    float _226 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[0].z, _222);
    float _228 = _224 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _230 = _226 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _232 = _228 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _234 = _228 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _236 = _228 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _238 = _228 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _240 = fma(_230, (*spvDescriptorSet0.vp_c4)._m0[8].x, _232);
    float _242 = fma(_230, (*spvDescriptorSet0.vp_c4)._m0[7].x, _234);
    float _244 = fma(_230, (*spvDescriptorSet0.vp_c4)._m0[9].x, _236);
    float _246 = fma(_230, (*spvDescriptorSet0.vp_c4)._m0[10].x, _238);
    float _248 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[8].z, _240);
    float _250 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[7].z, _242);
    float _252 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[9].z, _244);
    float _254 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[10].z, _246);
    float _256 = _248 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _258 = _250 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _260 = _252 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _262 = _254 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _258;
    out.gl_Position.y = _256;
    out.gl_Position.z = _260;
    out.gl_Position.w = _262;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

