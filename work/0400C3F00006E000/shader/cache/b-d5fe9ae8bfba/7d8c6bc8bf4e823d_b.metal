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
    device _23* cp_s1 [[id(2)]];
    texture2d<float> cp_t_tcb_C [[id(3)]];
    sampler cp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> cp_t_tcb_E [[id(5)]];
    sampler cp_t_tcb_ESmplr [[id(6)]];
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_A [[id(9)]];
    sampler cp_t_tcb_ASmplr [[id(10)]];
    sampler cp_t_tcb_CSmplr_w [[id(11)]];
    sampler cp_t_tcb_ESmplr_w [[id(12)]];
    sampler cp_t_tcb_8Smplr_w [[id(13)]];
    sampler cp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    bool _237 = false;
    float _55 = as_type<float>(gl_WorkGroupID.x);
    float _57 = as_type<float>(gl_LocalInvocationID.x);
    int _60 = as_type<int>(_55) << 6;
    int _62 = _60 + as_type<int>(_57);
    int _64 = _62 * 12;
    int _66 = _64 + 8;
    uint _69 = uint(int(uint(_66) >> uint(2)));
    float _71 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_69)]);
    bool _75 = as_type<int>(_71) != 1;
    if (!_75)
    {
        int _77 = _64 + 4;
        uint _79 = uint(int(uint(_64) >> uint(2)));
        float _81 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_79)]);
        uint _83 = uint(int(uint(_77) >> uint(2)));
        float _85 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_83)]);
        float _87 = fma(_81, 6.2500002968590706586837768554688e-05, 0.5);
        float _89 = fma(_81, 6.2500002968590706586837768554688e-05, 0.500124990940093994140625);
        float _91 = fma(_85, 6.2500002968590706586837768554688e-05, 0.5);
        float _93 = fma(_85, 6.2500002968590706586837768554688e-05, 0.500124990940093994140625);
        float2 _320 = float2(_87, _91);
        float _95 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_320, float2(0.0), isnan(_320)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_320, float2(0.0), isnan(_320)), level(0.0)).x;
        float2 _331 = float2(_89, _91);
        float _97 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_331, float2(0.0), isnan(_331)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_331, float2(0.0), isnan(_331)), level(0.0)).x;
        float2 _339 = float2(_87, _93);
        float _99 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_339, float2(0.0), isnan(_339)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_339, float2(0.0), isnan(_339)), level(0.0)).x;
        float _101 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
        float _103 = _81 + _101;
        int _105 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[16].z) << 4;
        float _107 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
        float _109 = _85 + _107;
        float _111 = abs(_103);
        float _113 = abs(_109);
        float _115 = precise::max(_111, _113);
        uint _117 = uint(int(uint(_105) >> uint(2)));
        uint _119 = uint(int(uint(int(_117)) >> uint(2)));
        int _121 = int(_117) & 3;
        float _123 = (*spvDescriptorSet0.cp_c3)._m0[int(_119)][_121];
        float _125 = _115 * _123;
        float _127 = _125 * 4.0;
        float _129 = precise::max(_127, 1.0);
        float _131 = log2(_129);
        float _133 = precise::min(_131, 5.0);
        float _135 = floor(_133);
        int _137 = int(_135);
        float _139 = floor(_133);
        int _141 = _137 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[16].z);
        int _143 = _141 << 4;
        float _145 = rint(_139);
        float _147 = precise::max(_145, 0.0);
        uint _149 = uint(_147);
        uint _151 = clamp(_149, 0u, 65535u);
        uint _153 = uint(int(uint(_143) >> uint(2)));
        uint _155 = uint(int(uint(int(_153)) >> uint(2)));
        int _157 = int(_153) & 3;
        float _159 = (*spvDescriptorSet0.cp_c3)._m0[int(_155)][_157];
        float _161 = fma(_109, _159, 0.5);
        float _163 = fma(_103, _159, 0.5);
        float2 _446 = float2(_87, _91);
        float _165 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, select(_446, float2(0.0), isnan(_446)), level(_95)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, select(_446, float2(0.0), isnan(_446)), level(_95)).y;
        float2 _455 = float2(_89, _91);
        float _167 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, select(_455, float2(0.0), isnan(_455)), level(_97)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, select(_455, float2(0.0), isnan(_455)), level(_97)).y;
        float2 _464 = float2(_87, _93);
        float _169 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, select(_464, float2(0.0), isnan(_464)), level(_99)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, select(_464, float2(0.0), isnan(_464)), level(_99)).y;
        float3 _477 = float3(_163, _161, float(int(_151)));
        float3 _481 = select(_477, float3(0.0), isnan(_477));
        float _171 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _481.xy, uint(rint(_481.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _481.xy, uint(rint(_481.z)), level(0.0)).y;
        float3 _490 = float3(_163, _161, float(int(_151)));
        float3 _492 = select(_490, float3(0.0), isnan(_490));
        float2 _175 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, _492.xy, uint(rint(_492.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, _492.xy, uint(rint(_492.z)), level(0.0)).xy;
        float _177 = _175.x;
        float _179 = _175.y;
        float _181 = _165 * 2000.0;
        float _183 = _167 * 2000.0;
        float _185 = _169 * 2000.0;
        float _187 = precise::max(_181, 220.0);
        float _189 = precise::max(_183, 220.0);
        float _191 = precise::max(_185, 220.0);
        float _193 = -_187;
        float _195 = _193 + _189;
        float _197 = -_187;
        float _199 = _197 + _191;
        float _201 = _195 * 0.512000024318695068359375;
        float _203 = _199 * 0.512000024318695068359375;
        float _205 = fma(_201, _201, 0.06871949136257171630859375);
        float _207 = fma(_203, _203, _205);
        float _209 = rsqrt(_207);
        float _211 = _187 + _171;
        int _213 = _62 << 4;
        int _215 = _213 + 4;
        int _217 = _213 + 12;
        float _219 = -_201;
        float _221 = fma(_219, _209, _177);
        float _223 = -_203;
        float _225 = fma(_223, _209, _179);
        int _227 = _213 + 8;
        uint _229 = uint(int(uint(_213) >> uint(2)));
        (*spvDescriptorSet0.cp_s1)._m0[int(_229)] = as_type<uint>(_221);
        uint _231 = uint(int(uint(_215) >> uint(2)));
        (*spvDescriptorSet0.cp_s1)._m0[int(_231)] = as_type<uint>(_225);
        uint _233 = uint(int(uint(_227) >> uint(2)));
        (*spvDescriptorSet0.cp_s1)._m0[int(_233)] = as_type<uint>(_211);
        uint _235 = uint(int(uint(_217) >> uint(2)));
        (*spvDescriptorSet0.cp_s1)._m0[int(_235)] = as_type<uint>(_115);
        _237 = true;
    }
    else
    {
        int _239 = _62 << 4;
        int _241 = _239 + 12;
        uint _243 = uint(int(uint(_241) >> uint(2)));
        (*spvDescriptorSet0.cp_s1)._m0[int(_243)] = 3212836864u;
    }
    _237 = false;
    uint _245 = uint(int(uint(_66) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_245)] = 0u;
}

