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
    constant _16* cp_c3 [[id(0)]];
    texture2d<float> cp_t_tcb_8 [[id(1)]];
    sampler cp_t_tcb_8Smplr [[id(2)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(3)]];
    sampler cp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    float _41 = as_type<float>(gl_LocalInvocationID.x);
    float _43 = as_type<float>(gl_WorkGroupID.x);
    float _45 = (*spvDescriptorSet0.cp_c3)._m0[1].z * 0.5;
    float _47 = as_type<float>(gl_WorkGroupID.y);
    uint _50 = uint(int(uint(as_type<int>(_41)) >> uint(3)));
    uint _52 = uint(int(uint(as_type<int>(_41)) >> uint(1)));
    uint _54 = extract_bits(_50, 0u, 3u);
    uint _56 = extract_bits(_52, 0u, 3u);
    int _59 = 1 & as_type<int>(_41);
    int _61 = (-2) & int(_54);
    int _63 = _59 | _61;
    int _65 = as_type<int>(_43) * 16;
    int _67 = _65 + int(_56);
    int _69 = as_type<int>(_47) << 4;
    int _71 = _69 + _63;
    int _73 = _67 + 8;
    float _75 = (*spvDescriptorSet0.cp_c3)._m0[1].w * (-0.5);
    int _77 = _71 + 8;
    float _79 = float(uint(_67));
    float _81 = float(uint(_71));
    float _83 = float(uint(_73));
    float _85 = fma(_79, (*spvDescriptorSet0.cp_c3)._m0[0].x, (*spvDescriptorSet0.cp_c3)._m0[0].z);
    float _87 = float(uint(_77));
    float _89 = fma(_81, (*spvDescriptorSet0.cp_c3)._m0[0].y, (*spvDescriptorSet0.cp_c3)._m0[0].w);
    float _91 = fma(_83, (*spvDescriptorSet0.cp_c3)._m0[0].x, (*spvDescriptorSet0.cp_c3)._m0[0].z);
    float _93 = fma(_85, (*spvDescriptorSet0.cp_c3)._m0[1].x, _45);
    float _95 = fma(_87, (*spvDescriptorSet0.cp_c3)._m0[0].y, (*spvDescriptorSet0.cp_c3)._m0[0].w);
    float _97 = fma(_89, (*spvDescriptorSet0.cp_c3)._m0[1].y, _75);
    float _99 = fma(_91, (*spvDescriptorSet0.cp_c3)._m0[1].x, _45);
    float _101 = fma(_95, (*spvDescriptorSet0.cp_c3)._m0[1].y, _75);
    float2 _271 = float2(_93, _97);
    float4 _104 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_271, float2(0.0), isnan(_271)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_271, float2(0.0), isnan(_271)), level(0.0)).xyzw;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = _104.w;
    float2 _291 = float2(_99, _97);
    float4 _114 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_291, float2(0.0), isnan(_291)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_291, float2(0.0), isnan(_291)), level(0.0)).xyzw;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float _122 = _114.w;
    float2 _307 = float2(_99, _101);
    float4 _124 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_307, float2(0.0), isnan(_307)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_307, float2(0.0), isnan(_307)), level(0.0)).xyzw;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _124.z;
    float _132 = _124.w;
    float2 _323 = float2(_93, _101);
    float4 _134 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_323, float2(0.0), isnan(_323)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_323, float2(0.0), isnan(_323)), level(0.0)).xyzw;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _134.z;
    float _142 = _134.w;
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_106, _108, _110, _112), uint2(int2(_67, _71)));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_116, _118, _120, _122), uint2(int2(_73, _71)));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_126, _128, _130, _132), uint2(int2(_73, _77)));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_136, _138, _140, _142), uint2(int2(_67, _77)));
}

