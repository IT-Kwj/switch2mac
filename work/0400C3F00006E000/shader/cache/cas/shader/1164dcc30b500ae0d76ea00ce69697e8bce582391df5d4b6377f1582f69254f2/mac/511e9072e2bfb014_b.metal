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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture3d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_36.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_36.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _221 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_221, float2(0.0), isnan(_221))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_221, float2(0.0), isnan(_221))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _239 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_239, float2(0.0), isnan(_239))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_239, float2(0.0), isnan(_239))).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = in.m_38.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _62 * _93;
    float _97 = _85 + _76;
    float _99 = _81 + _72;
    float _101 = _83 + _74;
    float _103 = _97 * _95;
    float _105 = _99 * _95;
    float _107 = _101 * _95;
    float _109 = fma(_103, 2.4300000667572021484375, 0.589999973773956298828125);
    float _111 = fma(_105, 2.4300000667572021484375, 0.589999973773956298828125);
    float _113 = fma(_107, 2.4300000667572021484375, 0.589999973773956298828125);
    float _115 = fma(_103, _109, 0.14000000059604644775390625);
    float _117 = fma(_105, _111, 0.14000000059604644775390625);
    float _119 = fma(_107, _113, 0.14000000059604644775390625);
    float _121 = fma(_103, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _123 = 1.0 / _117;
    float _125 = fma(_105, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _127 = fma(_107, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _129 = _103 * _121;
    float _131 = _105 * _125;
    float _133 = _107 * _127;
    float _135 = 1.0 / _115;
    float _137 = 1.0 / _119;
    float _139 = _131 * _123;
    float _141 = precise::clamp(_139, 0.0, 1.0);
    float _143 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _145 = _129 * _135;
    float _147 = precise::clamp(_145, 0.0, 1.0);
    float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _151 = _133 * _137;
    float _153 = precise::clamp(_151, 0.0, 1.0);
    float _155 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _361 = float3(_143, _155, _149);
    float3 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_361, float3(0.0), isnan(_361))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_361, float3(0.0), isnan(_361))).xyz;
    float _159 = _157.x;
    float _161 = _157.y;
    float _163 = _157.z;
    float _165 = abs(_159);
    float _167 = log2(_165);
    float _169 = abs(_161);
    float _171 = log2(_169);
    float _173 = abs(_163);
    float _175 = log2(_173);
    float _177 = _167 * 0.4545454680919647216796875;
    float _179 = _171 * 0.4545454680919647216796875;
    float _181 = exp2(_177);
    float _183 = _175 * 0.4545454680919647216796875;
    float _185 = exp2(_179);
    float _187 = exp2(_183);
    out.m_41.x = _181;
    out.m_41.y = _185;
    out.m_41.z = _187;
    out.m_41.w = _87;
    return out;
}

