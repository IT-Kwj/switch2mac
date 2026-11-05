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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    constant _16* cp_c0 [[id(1)]];
    device _23* cp_s0 [[id(2)]];
    texture2d<float> cp_t_tcb_8 [[id(3)]];
    sampler cp_t_tcb_8Smplr [[id(4)]];
    sampler cp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _44 = as_type<float>(gl_WorkGroupID.x);
    float _46 = as_type<float>(gl_LocalInvocationID.x);
    float _48 = as_type<float>(gl_WorkGroupID.y);
    float _50 = as_type<float>(gl_LocalInvocationID.y);
    int _53 = as_type<int>(_44) * 8;
    int _55 = _53 + as_type<int>(_46);
    bool _59 = uint(_55) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _61 = as_type<int>(_48) * 8;
    int _63 = _61 + as_type<int>(_50);
    bool _65 = uint(_63) < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    bool _67 = !_59;
    bool _69 = _65 && _67;
    if (!_69)
    {
        return;
    }
    float _71 = float(as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y));
    float _73 = float(as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x));
    float _75 = 1.0 / _71;
    float _77 = float(uint(_63));
    float _79 = float(uint(_55));
    float _81 = _77 + 0.5;
    float _83 = 1.0 / _73;
    float _85 = _79 + 0.5;
    float _87 = _81 * _75;
    float _89 = _85 * _83;
    float2 _189 = float2(_89, _87);
    float _91 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_189, float2(0.0), isnan(_189)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_189, float2(0.0), isnan(_189)), level(0.0)).x;
    int _93 = _63 << 3;
    int _95 = _93 * as_type<int>((*spvDescriptorSet0.cp_c0)._m0[0].y);
    int _97 = _95 + _55;
    int _99 = _97 << 2;
    uint _102 = uint(int(uint(_99) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_102)] = as_type<uint>(_91);
}

