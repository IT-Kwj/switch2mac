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
    device _23* cp_s0 [[id(1)]];
    texture2d<float> cp_t_tcb_8 [[id(2)]];
    sampler cp_t_tcb_8Smplr [[id(3)]];
    sampler cp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _44 = as_type<float>(gl_WorkGroupID.x);
    int _47 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].x) + 1;
    float _49 = as_type<float>(gl_LocalInvocationID.x);
    float _51 = float(uint(_47));
    int _53 = -_47;
    float _55 = 1.0 / _51;
    int _57 = as_type<int>(_44) * 32;
    int _59 = _57 + as_type<int>(_49);
    int _61 = as_type<int>(_55) + (-2);
    float _63 = float(uint(_59));
    float _65 = as_type<float>(_61) * _63;
    float _67 = trunc(_65);
    float _69 = precise::max(_67, 0.0);
    uint _72 = uint(_69);
    int _74 = _53 * int(_72);
    int _76 = _74 + _59;
    float _78 = float(uint(_76));
    float _80 = as_type<float>(_61) * _78;
    int _82 = -_47;
    float _84 = trunc(_80);
    float _86 = precise::max(_84, 0.0);
    uint _88 = uint(_86);
    int _90 = int(_72) + int(_88);
    int _92 = _82 * _90;
    int _94 = _92 + _59;
    bool _98 = uint(_94) >= uint(_47);
    bool _100 = !_98;
    int _102 = _100 ? 0 : (-1);
    bool _104 = 0 == _47;
    int _106 = -_102;
    int _108 = _90 + _106;
    bool _110 = !_104;
    int _112 = _110 ? _108 : (-1);
    int _114 = ~_112;
    int _116 = _114 + 1;
    float _118 = float(uint(_112));
    int _120 = _116 * _47;
    int _122 = _120 + _59;
    float _124 = _118 * (*spvDescriptorSet0.cp_c3)._m0[40].w;
    float _126 = float(uint(_122));
    float _128 = _126 * (*spvDescriptorSet0.cp_c3)._m0[40].z;
    float2 _272 = float2(_128, _124);
    float _130 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_272, float2(0.0), isnan(_272)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_272, float2(0.0), isnan(_272)), level(0.0)).x;
    int _132 = _59 << 2;
    int _134 = _132 + 19456;
    uint _136 = uint(int(uint(_134) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_136)] = as_type<uint>(_130);
}

