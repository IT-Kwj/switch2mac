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
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0), center_no_perspective]];
    float4 m_35 [[user(locn1), center_no_perspective]];
    float4 m_31 [[user(locn2), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _45 = in.m_31.x;
    float _47 = in.m_31.y;
    float2 _211 = float2(_45, _47);
    float _49 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_211, float2(0.0), isnan(_211))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_211, float2(0.0), isnan(_211))).x;
    float2 _222 = float2(_45, _47);
    float3 _53 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_222, float2(0.0), isnan(_222))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_222, float2(0.0), isnan(_222))).xyz;
    float _55 = _53.x;
    float _57 = _53.y;
    float _59 = _53.z;
    float _61 = in.m_33.w;
    float _63 = in.m_35.y;
    float _65 = in.m_33.x;
    float _67 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _69 = in.m_35.x;
    float _71 = -_67;
    float _73 = fma(_71, _61, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _75 = -_67;
    float _77 = fma(_75, _65, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _79 = in.m_35.z;
    float _81 = -_73;
    float _83 = fma(_81, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _85 = in.m_33.y;
    bool _89 = _83 <= 1.0;
    bool _91 = isnan(_83);
    bool _93 = _89 || _91;
    bool _95 = isnan(1.0);
    bool _97 = _93 || _95;
    float _99 = float(_97);
    float _101 = fma(_57, 2.0, -1.0);
    float _103 = fma(_55, 2.0, -1.0);
    float _105 = fma(_59, 2.0, -1.0);
    float _107 = _83 * _99;
    float _109 = precise::clamp(_107, 0.0, 1.0);
    float _111 = -_67;
    float _113 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _115 = fma(_111, _63, _113);
    float _117 = _115 * _115;
    float _119 = abs(_109);
    float _121 = log2(_119);
    float _123 = _101 * _115;
    float _125 = -_67;
    float _127 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _129 = fma(_125, _69, _127);
    float _131 = -_67;
    float _133 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _135 = fma(_131, _79, _133);
    float _137 = fma(_129, _129, _117);
    float _139 = _121 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _141 = fma(_103, _129, _123);
    float _143 = -_67;
    float _145 = fma(_143, _85, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _147 = fma(_135, _135, _137);
    float _149 = exp2(_139);
    float _151 = fma(_105, _135, _141);
    float _153 = precise::min(_77, _145);
    float _155 = precise::max(_77, _145);
    float _157 = rsqrt(_147);
    bool _159 = _153 >= 0.0;
    bool _161 = isnan(_153);
    bool _163 = _159 || _161;
    bool _165 = isnan(0.0);
    bool _167 = _163 || _165;
    bool _169 = _73 >= _155;
    bool _171 = isnan(_73);
    bool _173 = _169 || _171;
    bool _175 = isnan(_155);
    bool _177 = _173 || _175;
    bool _179 = _177 && _167;
    float _181 = float(_179);
    float _183 = _181 * _149;
    float _185 = _183 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _187 = -_157;
    float _189 = fma(_187, _151, 0.0);
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = _185 * _191;
    float _195 = _193 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _197 = _193 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _199 = _193 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    out.m_38.x = _195;
    out.m_38.y = _197;
    out.m_38.z = _199;
    out.m_38.w = 0.0;
    return out;
}

