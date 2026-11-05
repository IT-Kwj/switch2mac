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
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0), center_no_perspective]];
    float4 m_33 [[user(locn2), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _45 = in.m_33.x;
    float _47 = in.m_33.y;
    float2 _215 = float2(_45, _47);
    float _49 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_215, float2(0.0), isnan(_215))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_215, float2(0.0), isnan(_215))).x;
    float _51 = in.m_35.w;
    float _53 = in.m_35.x;
    float _55 = in.m_35.y;
    float _57 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _59 = -_57;
    float _61 = fma(_59, _51, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _63 = -_57;
    float _65 = fma(_63, _53, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _67 = -_57;
    float _69 = fma(_67, _55, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _71 = 1.0 / _61;
    float _73 = fma(_65, _71, (*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _75 = fma(_69, _71, (*spvDescriptorSet0.fp_c4)._m0[18].y);
    float _77 = _73 * (*spvDescriptorSet0.fp_c4)._m0[18].z;
    float _79 = _75 * (*spvDescriptorSet0.fp_c4)._m0[18].w;
    float2 _289 = float2(_45, _47);
    float3 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_289, float2(0.0), isnan(_289))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_289, float2(0.0), isnan(_289))).xyz;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = _83.z;
    float2 _303 = float2(_77, _79);
    float3 _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_303, float2(0.0), isnan(_303))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_303, float2(0.0), isnan(_303))).xyz;
    float _93 = _91.x;
    float _95 = _91.y;
    float _97 = _91.z;
    float _99 = in.m_35.z;
    float _101 = precise::min(_65, _69);
    float _103 = precise::max(_65, _69);
    bool _107 = _101 >= 0.0;
    bool _109 = isnan(_101);
    bool _111 = _107 || _109;
    bool _113 = isnan(0.0);
    bool _115 = _111 || _113;
    bool _117 = _61 >= _103;
    bool _119 = isnan(_61);
    bool _121 = _117 || _119;
    bool _123 = isnan(_103);
    bool _125 = _121 || _123;
    bool _127 = _125 && _115;
    float _129 = float(_127);
    float _131 = -_57;
    float _133 = fma(_131, _99, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _135 = fma(_133, -0.5, 0.5);
    bool _137 = _135 <= 1.0;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = float(_145);
    float _149 = _135 * _147;
    float _151 = precise::clamp(_149, 0.0, 1.0);
    float _153 = abs(_151);
    float _155 = log2(_153);
    float _157 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _159 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _157);
    float _161 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _159);
    float _163 = rsqrt(_161);
    float _165 = _155 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _167 = exp2(_165);
    float _169 = _129 * _167;
    float _171 = fma(_87, 2.0, -1.0);
    float _173 = fma(_85, 2.0, -1.0);
    float _175 = fma(_89, 2.0, -1.0);
    float _177 = _171 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _179 = fma(_173, (*spvDescriptorSet0.fp_c4)._m0[15].x, _177);
    float _181 = _169 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _183 = fma(_175, (*spvDescriptorSet0.fp_c4)._m0[15].z, _179);
    float _185 = -_163;
    float _187 = fma(_185, _183, 0.0);
    float _189 = precise::clamp(_187, 0.0, 1.0);
    float _191 = _93 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _193 = _95 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _195 = _181 * _189;
    float _197 = _97 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _199 = _191 * _195;
    float _201 = _193 * _195;
    float _203 = _197 * _195;
    out.m_38.x = _199;
    out.m_38.y = _201;
    out.m_38.z = _203;
    out.m_38.w = 0.0;
    return out;
}

