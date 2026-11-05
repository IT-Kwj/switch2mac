#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

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
    constant _16* vp_c4 [[id(0)]];
    constant _16* vp_c5 [[id(1)]];
    constant _16* vp_c3 [[id(2)]];
    texture2d_array<float> vp_t_tcb_8 [[id(3)]];
    sampler vp_t_tcb_8Smplr [[id(4)]];
    sampler vp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_38 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_31 [[attribute(0)]];
    float4 m_33 [[attribute(1)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _52 = float(as_type<int>((*spvDescriptorSet0.vp_c5)._m0[0].w));
    int _55 = as_type<int>((*spvDescriptorSet0.vp_c5)._m0[0].w) + as_type<int>((*spvDescriptorSet0.vp_c4)._m0[16].z);
    float _57 = rint(_52);
    float _59 = precise::max(_57, 0.0);
    uint _62 = uint(_59);
    uint _64 = clamp(_62, 0u, 65535u);
    int _66 = _55 << 4;
    float _68 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
    float _70 = (*spvDescriptorSet0.vp_c3)._m0[0].x + _68;
    uint _72 = uint(int(uint(_66) >> uint(2)));
    uint _74 = uint(int(uint(int(_72)) >> uint(2)));
    int _76 = int(_72) & 3;
    float _78 = (*spvDescriptorSet0.vp_c4)._m0[int(_74)][_76];
    float _80 = -(*spvDescriptorSet0.vp_c4)._m0[16].y;
    float _82 = (*spvDescriptorSet0.vp_c3)._m0[0].y + _80;
    float _84 = fma(_70, _78, 0.5);
    float _86 = fma(_82, _78, 0.5);
    float3 _245 = float3(_84, _86, float(int(_64)));
    float3 _250 = select(_245, float3(0.0), isnan(_245));
    float2 _90 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _250.xy, uint(rint(_250.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _250.xy, uint(rint(_250.z)), level(0.0)).xw;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = in.m_31.x;
    float _98 = in.m_31.y;
    float _100 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _102 = in.m_33.x;
    float _104 = _98 * (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _106 = _96 * (*spvDescriptorSet0.vp_c3)._m0[0].z;
    float _108 = -(*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _110 = _104 * _108;
    float _112 = _104 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
    float _114 = -_110;
    float _116 = fma(_106, (*spvDescriptorSet0.vp_c3)._m0[1].x, _114);
    float _118 = -(*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _120 = fma(_106, _118, _112);
    float _122 = in.m_33.y;
    float _124 = _116 + (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _126 = _120 + (*spvDescriptorSet0.vp_c3)._m0[0].x;
    out.m_36.x = _102;
    float _128 = -(*spvDescriptorSet0.vp_c4)._m0[16].y;
    float _130 = _124 + _128;
    float _132 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
    float _134 = _126 + _132;
    float _136 = _130 * _78;
    float _138 = _136 * 2.0;
    float _140 = _134 * _78;
    float _142 = _140 * 2.0;
    float _144 = -_138;
    float _146 = _144 + (-0.0);
    out.gl_Position.x = _142;
    out.gl_Position.y = _146;
    out.m_36.y = _122;
    float _148 = _92 * 100.0;
    float _150 = -_94;
    float _152 = _150 + 1.0;
    float _154 = _148 * _100;
    float _156 = _154 * 2.0;
    float _158 = precise::clamp(_156, 0.0, 1.0);
    float _160 = _158 * (*spvDescriptorSet0.vp_c3)._m0[1].z;
    float _162 = _152 * _160;
    out.m_38.x = _162;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _52 = float(as_type<int>((*spvDescriptorSet0.vp_c5)._m0[0].w));
    int _55 = as_type<int>((*spvDescriptorSet0.vp_c5)._m0[0].w) + as_type<int>((*spvDescriptorSet0.vp_c4)._m0[16].z);
    float _57 = rint(_52);
    float _59 = precise::max(_57, 0.0);
    uint _62 = uint(_59);
    uint _64 = clamp(_62, 0u, 65535u);
    int _66 = _55 << 4;
    float _68 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
    float _70 = (*spvDescriptorSet0.vp_c3)._m0[0].x + _68;
    uint _72 = uint(int(uint(_66) >> uint(2)));
    uint _74 = uint(int(uint(int(_72)) >> uint(2)));
    int _76 = int(_72) & 3;
    float _78 = (*spvDescriptorSet0.vp_c4)._m0[int(_74)][_76];
    float _80 = -(*spvDescriptorSet0.vp_c4)._m0[16].y;
    float _82 = (*spvDescriptorSet0.vp_c3)._m0[0].y + _80;
    float _84 = fma(_70, _78, 0.5);
    float _86 = fma(_82, _78, 0.5);
    float3 _245 = float3(_84, _86, float(int(_64)));
    float3 _250 = select(_245, float3(0.0), isnan(_245));
    float2 _90 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _250.xy, uint(rint(_250.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _250.xy, uint(rint(_250.z)), level(0.0)).xw;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = in.m_31.x;
    float _98 = in.m_31.y;
    float _100 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _102 = in.m_33.x;
    float _104 = _98 * (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _106 = _96 * (*spvDescriptorSet0.vp_c3)._m0[0].z;
    float _108 = -(*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _110 = _104 * _108;
    float _112 = _104 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
    float _114 = -_110;
    float _116 = fma(_106, (*spvDescriptorSet0.vp_c3)._m0[1].x, _114);
    float _118 = -(*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _120 = fma(_106, _118, _112);
    float _122 = in.m_33.y;
    float _124 = _116 + (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _126 = _120 + (*spvDescriptorSet0.vp_c3)._m0[0].x;
    out.m_36.x = _102;
    float _128 = -(*spvDescriptorSet0.vp_c4)._m0[16].y;
    float _130 = _124 + _128;
    float _132 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
    float _134 = _126 + _132;
    float _136 = _130 * _78;
    float _138 = _136 * 2.0;
    float _140 = _134 * _78;
    float _142 = _140 * 2.0;
    float _144 = -_138;
    float _146 = _144 + (-0.0);
    out.gl_Position.x = _142;
    out.gl_Position.y = _146;
    out.m_36.y = _122;
    float _148 = _92 * 100.0;
    float _150 = -_94;
    float _152 = _150 + 1.0;
    float _154 = _148 * _100;
    float _156 = _154 * 2.0;
    float _158 = precise::clamp(_156, 0.0, 1.0);
    float _160 = _158 * (*spvDescriptorSet0.vp_c3)._m0[1].z;
    float _162 = _152 * _160;
    out.m_38.x = _162;
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
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _52 = float(as_type<int>((*spvDescriptorSet0.vp_c5)._m0[0].w));
    int _55 = as_type<int>((*spvDescriptorSet0.vp_c5)._m0[0].w) + as_type<int>((*spvDescriptorSet0.vp_c4)._m0[16].z);
    float _57 = rint(_52);
    float _59 = precise::max(_57, 0.0);
    uint _62 = uint(_59);
    uint _64 = clamp(_62, 0u, 65535u);
    int _66 = _55 << 4;
    float _68 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
    float _70 = (*spvDescriptorSet0.vp_c3)._m0[0].x + _68;
    uint _72 = uint(int(uint(_66) >> uint(2)));
    uint _74 = uint(int(uint(int(_72)) >> uint(2)));
    int _76 = int(_72) & 3;
    float _78 = (*spvDescriptorSet0.vp_c4)._m0[int(_74)][_76];
    float _80 = -(*spvDescriptorSet0.vp_c4)._m0[16].y;
    float _82 = (*spvDescriptorSet0.vp_c3)._m0[0].y + _80;
    float _84 = fma(_70, _78, 0.5);
    float _86 = fma(_82, _78, 0.5);
    float3 _245 = float3(_84, _86, float(int(_64)));
    float3 _250 = select(_245, float3(0.0), isnan(_245));
    float2 _90 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _250.xy, uint(rint(_250.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _250.xy, uint(rint(_250.z)), level(0.0)).xw;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = in.m_31.x;
    float _98 = in.m_31.y;
    float _100 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _102 = in.m_33.x;
    float _104 = _98 * (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _106 = _96 * (*spvDescriptorSet0.vp_c3)._m0[0].z;
    float _108 = -(*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _110 = _104 * _108;
    float _112 = _104 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
    float _114 = -_110;
    float _116 = fma(_106, (*spvDescriptorSet0.vp_c3)._m0[1].x, _114);
    float _118 = -(*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _120 = fma(_106, _118, _112);
    float _122 = in.m_33.y;
    float _124 = _116 + (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _126 = _120 + (*spvDescriptorSet0.vp_c3)._m0[0].x;
    out.m_36.x = _102;
    float _128 = -(*spvDescriptorSet0.vp_c4)._m0[16].y;
    float _130 = _124 + _128;
    float _132 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
    float _134 = _126 + _132;
    float _136 = _130 * _78;
    float _138 = _136 * 2.0;
    float _140 = _134 * _78;
    float _142 = _140 * 2.0;
    float _144 = -_138;
    float _146 = _144 + (-0.0);
    out.gl_Position.x = _142;
    out.gl_Position.y = _146;
    out.m_36.y = _122;
    float _148 = _92 * 100.0;
    float _150 = -_94;
    float _152 = _150 + 1.0;
    float _154 = _148 * _100;
    float _156 = _154 * 2.0;
    float _158 = precise::clamp(_156, 0.0, 1.0);
    float _160 = _158 * (*spvDescriptorSet0.vp_c3)._m0[1].z;
    float _162 = _152 * _160;
    out.m_38.x = _162;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

