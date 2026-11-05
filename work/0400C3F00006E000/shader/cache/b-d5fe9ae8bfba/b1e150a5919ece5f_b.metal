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
    float _42 = (*spvDescriptorSet0.vp_c9)._m0[983].y * (*spvDescriptorSet0.vp_c11)._m0[41].z;
    float _44 = _42 * (-2.094395160675048828125);
    float _46 = _42 * 2.094395160675048828125;
    float _48 = _44 * 0.15915493667125701904296875;
    float _50 = _46 * 0.15915493667125701904296875;
    float _52 = in.m_28.x;
    float _54 = in.m_28.y;
    float _56 = in.m_28.z;
    float _58 = _48 * 6.283185482025146484375;
    float _60 = sin(_58);
    float _62 = _50 * 6.283185482025146484375;
    float _64 = sin(_62);
    float _66 = _50 * 6.283185482025146484375;
    float _68 = cos(_66);
    float _70 = _60 * _56;
    float _72 = _48 * 6.283185482025146484375;
    float _74 = cos(_72);
    float _76 = fma(_60, _64, 9.9999997473787516355514526367188e-05);
    float _78 = _64 * _52;
    float _80 = _76 * _54;
    float _82 = fma(_68, _52, _80);
    float _84 = fma(_60, _68, 9.9999997473787516355514526367188e-05);
    float _86 = -_78;
    float _88 = fma(_84, _54, _86);
    float _90 = fma(_74, _64, 9.9999997473787516355514526367188e-05);
    float _92 = -_70;
    float _94 = fma(_74, _54, _92);
    float _96 = fma(_74, _68, 9.9999997473787516355514526367188e-05);
    float _98 = fma(_90, _56, _82);
    float _100 = _94 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _102 = fma(_96, _56, _88);
    float _104 = _94 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _106 = _94 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _108 = fma(_98, (*spvDescriptorSet0.vp_c7)._m0[2].x, _100);
    float _110 = fma(_98, (*spvDescriptorSet0.vp_c7)._m0[0].x, _104);
    float _112 = fma(_98, (*spvDescriptorSet0.vp_c7)._m0[1].x, _106);
    float _114 = fma(_102, (*spvDescriptorSet0.vp_c7)._m0[2].z, _108);
    float _116 = fma(_102, (*spvDescriptorSet0.vp_c7)._m0[0].z, _110);
    float _118 = fma(_102, (*spvDescriptorSet0.vp_c7)._m0[1].z, _112);
    float _120 = _114 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _122 = _116 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _124 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _126 = _120 + _124;
    float _128 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _130 = _122 + _128;
    float _132 = _126 * _126;
    float _134 = fma(_130, _130, _132);
    float _136 = _118 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _138 = sqrt(_134);
    float _140 = _136 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _142 = fma(_122, (*spvDescriptorSet0.vp_c4)._m0[2].x, _140);
    float _144 = fma(_120, (*spvDescriptorSet0.vp_c4)._m0[2].z, _142);
    float _146 = _144 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _150 = _138 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _152 = _102;
    float _154 = _136;
    float _156 = _122;
    float _158 = _146;
    if (!_150)
    {
        _152 = _120;
    }
    float _160 = _152;
    bool _162 = !_150;
    float _164 = _160;
    if (!_162)
    {
        float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _168 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _170 = _138 + _168;
        float _172 = rsqrt(_134);
        float _174 = _170 * _166;
        float _176 = _136 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _178 = _174 * 0.15915493667125701904296875;
        float _180 = _178 * 6.283185482025146484375;
        float _182 = cos(_180);
        float _184 = _178 * 6.283185482025146484375;
        float _186 = sin(_184);
        float _188 = _182 + (-1.0);
        float _190 = _188 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _192 = fma(_186, _176, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _194 = fma(_136, _182, _190);
        float _196 = _172 * _192;
        float _198 = _194 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _200 = fma(_130, _196, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _202 = fma(_126, _196, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _204 = fma(_200, (*spvDescriptorSet0.vp_c4)._m0[2].x, _198);
        float _206 = fma(_202, (*spvDescriptorSet0.vp_c4)._m0[2].z, _204);
        float _208 = _206 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _154 = _194;
        _156 = _200;
        _164 = _202;
        _158 = _208;
    }
    float _210 = _154;
    float _212 = _156;
    float _214 = _164;
    float _216 = _158;
    float _218 = _210 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _220 = _210 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _222 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[1].x, _218);
    float _224 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[0].x, _220);
    float _226 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[1].z, _222);
    float _228 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[0].z, _224);
    float _230 = _226 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _232 = _228 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _234 = _230 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _236 = _230 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _238 = _230 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _240 = _230 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _242 = fma(_232, (*spvDescriptorSet0.vp_c4)._m0[8].x, _234);
    float _244 = fma(_232, (*spvDescriptorSet0.vp_c4)._m0[7].x, _236);
    float _246 = fma(_232, (*spvDescriptorSet0.vp_c4)._m0[9].x, _238);
    float _248 = fma(_232, (*spvDescriptorSet0.vp_c4)._m0[10].x, _240);
    float _250 = fma(_216, (*spvDescriptorSet0.vp_c4)._m0[8].z, _242);
    float _252 = fma(_216, (*spvDescriptorSet0.vp_c4)._m0[7].z, _244);
    float _254 = fma(_216, (*spvDescriptorSet0.vp_c4)._m0[9].z, _246);
    float _256 = fma(_216, (*spvDescriptorSet0.vp_c4)._m0[10].z, _248);
    float _258 = _250 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _260 = _252 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _262 = _254 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _264 = _256 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _260;
    out.gl_Position.y = _258;
    out.gl_Position.z = _262;
    out.gl_Position.w = _264;
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
    float _42 = (*spvDescriptorSet0.vp_c9)._m0[983].y * (*spvDescriptorSet0.vp_c11)._m0[41].z;
    float _44 = _42 * (-2.094395160675048828125);
    float _46 = _42 * 2.094395160675048828125;
    float _48 = _44 * 0.15915493667125701904296875;
    float _50 = _46 * 0.15915493667125701904296875;
    float _52 = in.m_28.x;
    float _54 = in.m_28.y;
    float _56 = in.m_28.z;
    float _58 = _48 * 6.283185482025146484375;
    float _60 = sin(_58);
    float _62 = _50 * 6.283185482025146484375;
    float _64 = sin(_62);
    float _66 = _50 * 6.283185482025146484375;
    float _68 = cos(_66);
    float _70 = _60 * _56;
    float _72 = _48 * 6.283185482025146484375;
    float _74 = cos(_72);
    float _76 = fma(_60, _64, 9.9999997473787516355514526367188e-05);
    float _78 = _64 * _52;
    float _80 = _76 * _54;
    float _82 = fma(_68, _52, _80);
    float _84 = fma(_60, _68, 9.9999997473787516355514526367188e-05);
    float _86 = -_78;
    float _88 = fma(_84, _54, _86);
    float _90 = fma(_74, _64, 9.9999997473787516355514526367188e-05);
    float _92 = -_70;
    float _94 = fma(_74, _54, _92);
    float _96 = fma(_74, _68, 9.9999997473787516355514526367188e-05);
    float _98 = fma(_90, _56, _82);
    float _100 = _94 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _102 = fma(_96, _56, _88);
    float _104 = _94 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _106 = _94 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _108 = fma(_98, (*spvDescriptorSet0.vp_c7)._m0[2].x, _100);
    float _110 = fma(_98, (*spvDescriptorSet0.vp_c7)._m0[0].x, _104);
    float _112 = fma(_98, (*spvDescriptorSet0.vp_c7)._m0[1].x, _106);
    float _114 = fma(_102, (*spvDescriptorSet0.vp_c7)._m0[2].z, _108);
    float _116 = fma(_102, (*spvDescriptorSet0.vp_c7)._m0[0].z, _110);
    float _118 = fma(_102, (*spvDescriptorSet0.vp_c7)._m0[1].z, _112);
    float _120 = _114 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _122 = _116 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _124 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _126 = _120 + _124;
    float _128 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _130 = _122 + _128;
    float _132 = _126 * _126;
    float _134 = fma(_130, _130, _132);
    float _136 = _118 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _138 = sqrt(_134);
    float _140 = _136 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _142 = fma(_122, (*spvDescriptorSet0.vp_c4)._m0[2].x, _140);
    float _144 = fma(_120, (*spvDescriptorSet0.vp_c4)._m0[2].z, _142);
    float _146 = _144 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _150 = _138 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _152 = _102;
    float _154 = _136;
    float _156 = _122;
    float _158 = _146;
    if (!_150)
    {
        _152 = _120;
    }
    float _160 = _152;
    bool _162 = !_150;
    float _164 = _160;
    if (!_162)
    {
        float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _168 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _170 = _138 + _168;
        float _172 = rsqrt(_134);
        float _174 = _170 * _166;
        float _176 = _136 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _178 = _174 * 0.15915493667125701904296875;
        float _180 = _178 * 6.283185482025146484375;
        float _182 = cos(_180);
        float _184 = _178 * 6.283185482025146484375;
        float _186 = sin(_184);
        float _188 = _182 + (-1.0);
        float _190 = _188 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _192 = fma(_186, _176, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _194 = fma(_136, _182, _190);
        float _196 = _172 * _192;
        float _198 = _194 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _200 = fma(_130, _196, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _202 = fma(_126, _196, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _204 = fma(_200, (*spvDescriptorSet0.vp_c4)._m0[2].x, _198);
        float _206 = fma(_202, (*spvDescriptorSet0.vp_c4)._m0[2].z, _204);
        float _208 = _206 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _154 = _194;
        _156 = _200;
        _164 = _202;
        _158 = _208;
    }
    float _210 = _154;
    float _212 = _156;
    float _214 = _164;
    float _216 = _158;
    float _218 = _210 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _220 = _210 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _222 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[1].x, _218);
    float _224 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[0].x, _220);
    float _226 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[1].z, _222);
    float _228 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[0].z, _224);
    float _230 = _226 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _232 = _228 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _234 = _230 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _236 = _230 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _238 = _230 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _240 = _230 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _242 = fma(_232, (*spvDescriptorSet0.vp_c4)._m0[8].x, _234);
    float _244 = fma(_232, (*spvDescriptorSet0.vp_c4)._m0[7].x, _236);
    float _246 = fma(_232, (*spvDescriptorSet0.vp_c4)._m0[9].x, _238);
    float _248 = fma(_232, (*spvDescriptorSet0.vp_c4)._m0[10].x, _240);
    float _250 = fma(_216, (*spvDescriptorSet0.vp_c4)._m0[8].z, _242);
    float _252 = fma(_216, (*spvDescriptorSet0.vp_c4)._m0[7].z, _244);
    float _254 = fma(_216, (*spvDescriptorSet0.vp_c4)._m0[9].z, _246);
    float _256 = fma(_216, (*spvDescriptorSet0.vp_c4)._m0[10].z, _248);
    float _258 = _250 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _260 = _252 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _262 = _254 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _264 = _256 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _260;
    out.gl_Position.y = _258;
    out.gl_Position.z = _262;
    out.gl_Position.w = _264;
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
    float _42 = (*spvDescriptorSet0.vp_c9)._m0[983].y * (*spvDescriptorSet0.vp_c11)._m0[41].z;
    float _44 = _42 * (-2.094395160675048828125);
    float _46 = _42 * 2.094395160675048828125;
    float _48 = _44 * 0.15915493667125701904296875;
    float _50 = _46 * 0.15915493667125701904296875;
    float _52 = in.m_28.x;
    float _54 = in.m_28.y;
    float _56 = in.m_28.z;
    float _58 = _48 * 6.283185482025146484375;
    float _60 = sin(_58);
    float _62 = _50 * 6.283185482025146484375;
    float _64 = sin(_62);
    float _66 = _50 * 6.283185482025146484375;
    float _68 = cos(_66);
    float _70 = _60 * _56;
    float _72 = _48 * 6.283185482025146484375;
    float _74 = cos(_72);
    float _76 = fma(_60, _64, 9.9999997473787516355514526367188e-05);
    float _78 = _64 * _52;
    float _80 = _76 * _54;
    float _82 = fma(_68, _52, _80);
    float _84 = fma(_60, _68, 9.9999997473787516355514526367188e-05);
    float _86 = -_78;
    float _88 = fma(_84, _54, _86);
    float _90 = fma(_74, _64, 9.9999997473787516355514526367188e-05);
    float _92 = -_70;
    float _94 = fma(_74, _54, _92);
    float _96 = fma(_74, _68, 9.9999997473787516355514526367188e-05);
    float _98 = fma(_90, _56, _82);
    float _100 = _94 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _102 = fma(_96, _56, _88);
    float _104 = _94 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _106 = _94 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _108 = fma(_98, (*spvDescriptorSet0.vp_c7)._m0[2].x, _100);
    float _110 = fma(_98, (*spvDescriptorSet0.vp_c7)._m0[0].x, _104);
    float _112 = fma(_98, (*spvDescriptorSet0.vp_c7)._m0[1].x, _106);
    float _114 = fma(_102, (*spvDescriptorSet0.vp_c7)._m0[2].z, _108);
    float _116 = fma(_102, (*spvDescriptorSet0.vp_c7)._m0[0].z, _110);
    float _118 = fma(_102, (*spvDescriptorSet0.vp_c7)._m0[1].z, _112);
    float _120 = _114 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _122 = _116 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _124 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _126 = _120 + _124;
    float _128 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _130 = _122 + _128;
    float _132 = _126 * _126;
    float _134 = fma(_130, _130, _132);
    float _136 = _118 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _138 = sqrt(_134);
    float _140 = _136 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _142 = fma(_122, (*spvDescriptorSet0.vp_c4)._m0[2].x, _140);
    float _144 = fma(_120, (*spvDescriptorSet0.vp_c4)._m0[2].z, _142);
    float _146 = _144 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _150 = _138 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _152 = _102;
    float _154 = _136;
    float _156 = _122;
    float _158 = _146;
    if (!_150)
    {
        _152 = _120;
    }
    float _160 = _152;
    bool _162 = !_150;
    float _164 = _160;
    if (!_162)
    {
        float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _168 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _170 = _138 + _168;
        float _172 = rsqrt(_134);
        float _174 = _170 * _166;
        float _176 = _136 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _178 = _174 * 0.15915493667125701904296875;
        float _180 = _178 * 6.283185482025146484375;
        float _182 = cos(_180);
        float _184 = _178 * 6.283185482025146484375;
        float _186 = sin(_184);
        float _188 = _182 + (-1.0);
        float _190 = _188 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _192 = fma(_186, _176, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _194 = fma(_136, _182, _190);
        float _196 = _172 * _192;
        float _198 = _194 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _200 = fma(_130, _196, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _202 = fma(_126, _196, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _204 = fma(_200, (*spvDescriptorSet0.vp_c4)._m0[2].x, _198);
        float _206 = fma(_202, (*spvDescriptorSet0.vp_c4)._m0[2].z, _204);
        float _208 = _206 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _154 = _194;
        _156 = _200;
        _164 = _202;
        _158 = _208;
    }
    float _210 = _154;
    float _212 = _156;
    float _214 = _164;
    float _216 = _158;
    float _218 = _210 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _220 = _210 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _222 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[1].x, _218);
    float _224 = fma(_212, (*spvDescriptorSet0.vp_c4)._m0[0].x, _220);
    float _226 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[1].z, _222);
    float _228 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[0].z, _224);
    float _230 = _226 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _232 = _228 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _234 = _230 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _236 = _230 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _238 = _230 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _240 = _230 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _242 = fma(_232, (*spvDescriptorSet0.vp_c4)._m0[8].x, _234);
    float _244 = fma(_232, (*spvDescriptorSet0.vp_c4)._m0[7].x, _236);
    float _246 = fma(_232, (*spvDescriptorSet0.vp_c4)._m0[9].x, _238);
    float _248 = fma(_232, (*spvDescriptorSet0.vp_c4)._m0[10].x, _240);
    float _250 = fma(_216, (*spvDescriptorSet0.vp_c4)._m0[8].z, _242);
    float _252 = fma(_216, (*spvDescriptorSet0.vp_c4)._m0[7].z, _244);
    float _254 = fma(_216, (*spvDescriptorSet0.vp_c4)._m0[9].z, _246);
    float _256 = fma(_216, (*spvDescriptorSet0.vp_c4)._m0[10].z, _248);
    float _258 = _250 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _260 = _252 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _262 = _254 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _264 = _256 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _260;
    out.gl_Position.y = _258;
    out.gl_Position.z = _262;
    out.gl_Position.w = _264;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

