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
    float4 m_30 [[user(locn0)]];
    float4 m_26 [[user(locn1)]];
    float4 m_28 [[user(locn2)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_37 [[attribute(0)]];
    float4 m_33 [[attribute(1)]];
    float4 m_39 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_41 [[attribute(4)]];
    float4 m_43 [[attribute(5)]];
    uint4 m_23 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_30 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_26 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_28 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _57 = as_type<float>(in.m_23.x);
    int _60 = as_type<int>(_57) & 2147483647;
    bool _64 = as_type<int>(_57) < 0;
    int _66 = _60 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    bool _68 = _66 != 0;
    bool _70 = !_64;
    int _72 = _70 ? 0 : 1065353216;
    out.m_26.x = as_type<float>(_72);
    int _74 = 0;
    if (!_68)
    {
        _74 = 1073741824;
    }
    int _76 = _74;
    if (!_68)
    {
        out.m_28.x = 0.0;
    }
    int _78 = 0;
    if (!_68)
    {
        _78 = 1065353216;
    }
    int _80 = _78;
    if (!_68)
    {
        out.m_30.x = 0.0;
    }
    if (!_68)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _291 = as_type<float>(_76);
        out.gl_Position.z = _291;
        float _294 = as_type<float>(_80);
        out.gl_Position.w = _294;
    }
    if (!_68)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _82 = in.m_33.x;
    float _84 = in.m_33.y;
    float _86 = in.m_33.z;
    float _88 = in.m_35.x;
    float _90 = in.m_35.y;
    float _92 = in.m_35.z;
    float _94 = in.m_37.x;
    float _96 = in.m_37.y;
    float _98 = in.m_37.z;
    float _100 = in.m_39.x;
    float _102 = in.m_39.y;
    float _104 = in.m_39.z;
    float _106 = in.m_41.x;
    float _108 = in.m_41.y;
    float _110 = in.m_41.z;
    float _112 = in.m_35.w;
    float _114 = in.m_39.w;
    float _116 = in.m_41.w;
    float _118 = _84 * _90;
    float _120 = _90 * _96;
    float _122 = in.m_43.x;
    float _124 = _84 * _102;
    float _126 = _102 * _96;
    float _128 = fma(_88, _94, _120);
    float _130 = _84 * _108;
    float _132 = _108 * _96;
    float _134 = fma(_100, _94, _126);
    float _136 = fma(_92, _98, _128);
    float _138 = fma(_82, _88, _118);
    float _140 = fma(_106, _94, _132);
    float _142 = fma(_104, _98, _134);
    float _144 = _136 + _112;
    float _146 = fma(_82, _106, _130);
    float _148 = fma(_110, _98, _140);
    float _150 = _142 + _114;
    float _152 = _144 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _154 = _144 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _156 = _148 + _116;
    float _158 = fma(_86, _92, _138);
    float _160 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[1].x, _152);
    float _162 = _144 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _164 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[0].x, _154);
    float _166 = in.m_43.y;
    float _168 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[1].z, _160);
    float _170 = fma(_82, _100, _124);
    float _172 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[2].x, _162);
    float _174 = in.m_43.z;
    float _176 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[0].z, _164);
    float _178 = _168 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _180 = fma(_86, _104, _170);
    float _182 = in.m_43.w;
    float _184 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[2].z, _172);
    float _186 = _176 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _188 = _178 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _190 = _178 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _192 = _178 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _194 = _178 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _196 = _184 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _198 = fma(_186, (*spvDescriptorSet0.vp_c3)._m0[5].x, _188);
    float _200 = fma(_186, (*spvDescriptorSet0.vp_c3)._m0[3].x, _190);
    float _202 = fma(_186, (*spvDescriptorSet0.vp_c3)._m0[4].x, _192);
    float _204 = fma(_186, (*spvDescriptorSet0.vp_c3)._m0[6].x, _194);
    float _206 = fma(_86, _110, _146);
    float _208 = fma(_196, (*spvDescriptorSet0.vp_c3)._m0[5].z, _198);
    float _210 = fma(_196, (*spvDescriptorSet0.vp_c3)._m0[3].z, _200);
    float _212 = fma(_196, (*spvDescriptorSet0.vp_c3)._m0[4].z, _202);
    float _214 = fma(_196, (*spvDescriptorSet0.vp_c3)._m0[6].z, _204);
    float _216 = _208 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _218 = _210 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _220 = _212 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _222 = _214 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    out.m_30.x = _122;
    out.m_30.y = _166;
    out.m_30.z = _174;
    out.m_30.w = _182;
    out.m_28.x = _180;
    out.m_28.y = _158;
    out.m_28.z = _206;
    out.gl_Position.x = _218;
    out.gl_Position.y = _220;
    out.gl_Position.z = _216;
    out.gl_Position.w = _222;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_30 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_26 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_28 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _57 = as_type<float>(in.m_23.x);
    int _60 = as_type<int>(_57) & 2147483647;
    bool _64 = as_type<int>(_57) < 0;
    int _66 = _60 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    bool _68 = _66 != 0;
    bool _70 = !_64;
    int _72 = _70 ? 0 : 1065353216;
    out.m_26.x = as_type<float>(_72);
    int _74 = 0;
    if (!_68)
    {
        _74 = 1073741824;
    }
    int _76 = _74;
    if (!_68)
    {
        out.m_28.x = 0.0;
    }
    int _78 = 0;
    if (!_68)
    {
        _78 = 1065353216;
    }
    int _80 = _78;
    if (!_68)
    {
        out.m_30.x = 0.0;
    }
    if (!_68)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _291 = as_type<float>(_76);
        out.gl_Position.z = _291;
        float _294 = as_type<float>(_80);
        out.gl_Position.w = _294;
    }
    if (!_68)
    {
        return out;
    }
    float _82 = in.m_33.x;
    float _84 = in.m_33.y;
    float _86 = in.m_33.z;
    float _88 = in.m_35.x;
    float _90 = in.m_35.y;
    float _92 = in.m_35.z;
    float _94 = in.m_37.x;
    float _96 = in.m_37.y;
    float _98 = in.m_37.z;
    float _100 = in.m_39.x;
    float _102 = in.m_39.y;
    float _104 = in.m_39.z;
    float _106 = in.m_41.x;
    float _108 = in.m_41.y;
    float _110 = in.m_41.z;
    float _112 = in.m_35.w;
    float _114 = in.m_39.w;
    float _116 = in.m_41.w;
    float _118 = _84 * _90;
    float _120 = _90 * _96;
    float _122 = in.m_43.x;
    float _124 = _84 * _102;
    float _126 = _102 * _96;
    float _128 = fma(_88, _94, _120);
    float _130 = _84 * _108;
    float _132 = _108 * _96;
    float _134 = fma(_100, _94, _126);
    float _136 = fma(_92, _98, _128);
    float _138 = fma(_82, _88, _118);
    float _140 = fma(_106, _94, _132);
    float _142 = fma(_104, _98, _134);
    float _144 = _136 + _112;
    float _146 = fma(_82, _106, _130);
    float _148 = fma(_110, _98, _140);
    float _150 = _142 + _114;
    float _152 = _144 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _154 = _144 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _156 = _148 + _116;
    float _158 = fma(_86, _92, _138);
    float _160 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[1].x, _152);
    float _162 = _144 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _164 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[0].x, _154);
    float _166 = in.m_43.y;
    float _168 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[1].z, _160);
    float _170 = fma(_82, _100, _124);
    float _172 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[2].x, _162);
    float _174 = in.m_43.z;
    float _176 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[0].z, _164);
    float _178 = _168 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _180 = fma(_86, _104, _170);
    float _182 = in.m_43.w;
    float _184 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[2].z, _172);
    float _186 = _176 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _188 = _178 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _190 = _178 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _192 = _178 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _194 = _178 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _196 = _184 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _198 = fma(_186, (*spvDescriptorSet0.vp_c3)._m0[5].x, _188);
    float _200 = fma(_186, (*spvDescriptorSet0.vp_c3)._m0[3].x, _190);
    float _202 = fma(_186, (*spvDescriptorSet0.vp_c3)._m0[4].x, _192);
    float _204 = fma(_186, (*spvDescriptorSet0.vp_c3)._m0[6].x, _194);
    float _206 = fma(_86, _110, _146);
    float _208 = fma(_196, (*spvDescriptorSet0.vp_c3)._m0[5].z, _198);
    float _210 = fma(_196, (*spvDescriptorSet0.vp_c3)._m0[3].z, _200);
    float _212 = fma(_196, (*spvDescriptorSet0.vp_c3)._m0[4].z, _202);
    float _214 = fma(_196, (*spvDescriptorSet0.vp_c3)._m0[6].z, _204);
    float _216 = _208 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _218 = _210 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _220 = _212 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _222 = _214 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    out.m_30.x = _122;
    out.m_30.y = _166;
    out.m_30.z = _174;
    out.m_30.w = _182;
    out.m_28.x = _180;
    out.m_28.y = _158;
    out.m_28.z = _206;
    out.gl_Position.x = _218;
    out.gl_Position.y = _220;
    out.gl_Position.z = _216;
    out.gl_Position.w = _222;
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
    out.m_30 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_26 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_28 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _57 = as_type<float>(in.m_23.x);
    int _60 = as_type<int>(_57) & 2147483647;
    bool _64 = as_type<int>(_57) < 0;
    int _66 = _60 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    bool _68 = _66 != 0;
    bool _70 = !_64;
    int _72 = _70 ? 0 : 1065353216;
    out.m_26.x = as_type<float>(_72);
    int _74 = 0;
    if (!_68)
    {
        _74 = 1073741824;
    }
    int _76 = _74;
    if (!_68)
    {
        out.m_28.x = 0.0;
    }
    int _78 = 0;
    if (!_68)
    {
        _78 = 1065353216;
    }
    int _80 = _78;
    if (!_68)
    {
        out.m_30.x = 0.0;
    }
    if (!_68)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _291 = as_type<float>(_76);
        out.gl_Position.z = _291;
        float _294 = as_type<float>(_80);
        out.gl_Position.w = _294;
    }
    if (!_68)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_30.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_30.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_30.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_30.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_26.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_26.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_26.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_26.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_28.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_28.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_28.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_28.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _82 = in.m_33.x;
    float _84 = in.m_33.y;
    float _86 = in.m_33.z;
    float _88 = in.m_35.x;
    float _90 = in.m_35.y;
    float _92 = in.m_35.z;
    float _94 = in.m_37.x;
    float _96 = in.m_37.y;
    float _98 = in.m_37.z;
    float _100 = in.m_39.x;
    float _102 = in.m_39.y;
    float _104 = in.m_39.z;
    float _106 = in.m_41.x;
    float _108 = in.m_41.y;
    float _110 = in.m_41.z;
    float _112 = in.m_35.w;
    float _114 = in.m_39.w;
    float _116 = in.m_41.w;
    float _118 = _84 * _90;
    float _120 = _90 * _96;
    float _122 = in.m_43.x;
    float _124 = _84 * _102;
    float _126 = _102 * _96;
    float _128 = fma(_88, _94, _120);
    float _130 = _84 * _108;
    float _132 = _108 * _96;
    float _134 = fma(_100, _94, _126);
    float _136 = fma(_92, _98, _128);
    float _138 = fma(_82, _88, _118);
    float _140 = fma(_106, _94, _132);
    float _142 = fma(_104, _98, _134);
    float _144 = _136 + _112;
    float _146 = fma(_82, _106, _130);
    float _148 = fma(_110, _98, _140);
    float _150 = _142 + _114;
    float _152 = _144 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _154 = _144 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _156 = _148 + _116;
    float _158 = fma(_86, _92, _138);
    float _160 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[1].x, _152);
    float _162 = _144 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _164 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[0].x, _154);
    float _166 = in.m_43.y;
    float _168 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[1].z, _160);
    float _170 = fma(_82, _100, _124);
    float _172 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[2].x, _162);
    float _174 = in.m_43.z;
    float _176 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[0].z, _164);
    float _178 = _168 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _180 = fma(_86, _104, _170);
    float _182 = in.m_43.w;
    float _184 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[2].z, _172);
    float _186 = _176 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _188 = _178 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _190 = _178 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _192 = _178 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _194 = _178 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _196 = _184 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _198 = fma(_186, (*spvDescriptorSet0.vp_c3)._m0[5].x, _188);
    float _200 = fma(_186, (*spvDescriptorSet0.vp_c3)._m0[3].x, _190);
    float _202 = fma(_186, (*spvDescriptorSet0.vp_c3)._m0[4].x, _192);
    float _204 = fma(_186, (*spvDescriptorSet0.vp_c3)._m0[6].x, _194);
    float _206 = fma(_86, _110, _146);
    float _208 = fma(_196, (*spvDescriptorSet0.vp_c3)._m0[5].z, _198);
    float _210 = fma(_196, (*spvDescriptorSet0.vp_c3)._m0[3].z, _200);
    float _212 = fma(_196, (*spvDescriptorSet0.vp_c3)._m0[4].z, _202);
    float _214 = fma(_196, (*spvDescriptorSet0.vp_c3)._m0[6].z, _204);
    float _216 = _208 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _218 = _210 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _220 = _212 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _222 = _214 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    out.m_30.x = _122;
    out.m_30.y = _166;
    out.m_30.z = _174;
    out.m_30.w = _182;
    out.m_28.x = _180;
    out.m_28.y = _158;
    out.m_28.z = _206;
    out.gl_Position.x = _218;
    out.gl_Position.y = _220;
    out.gl_Position.z = _216;
    out.gl_Position.w = _222;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_30.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_30.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_30.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_30.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_26.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_26.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_26.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_26.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_28.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_28.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_28.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_28.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

