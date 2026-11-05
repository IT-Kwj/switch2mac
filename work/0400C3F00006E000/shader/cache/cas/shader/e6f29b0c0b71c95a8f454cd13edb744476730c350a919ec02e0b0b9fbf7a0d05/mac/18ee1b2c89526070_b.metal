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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c5 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_35.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_35.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _223 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_223, float2(0.0), isnan(_223))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_223, float2(0.0), isnan(_223))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _79 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _81 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _77);
    float _83 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _79);
    float _85 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _81);
    float _87 = fma(_83, -0.5, 0.5);
    float _89 = fma(_85, -0.5, 0.5);
    float2 _280 = float2(_87, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_280, float2(0.0), isnan(_280))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_280, float2(0.0), isnan(_280))).x;
    float2 _290 = float2(_89, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_290, float2(0.0), isnan(_290))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_290, float2(0.0), isnan(_290))).x;
    float _95 = abs(_73);
    float _97 = -_95;
    float _99 = _97 + 1.0;
    float _101 = 0.0 + _87;
    float _103 = precise::clamp(_101, 0.0, 1.0);
    float _105 = _99 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _107 = precise::clamp(_105, 0.0, 1.0);
    float _109 = _89 + _103;
    float _111 = precise::clamp(_109, 0.0, 1.0);
    float _113 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _115 = _113 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _117 = abs(_107);
    float _119 = log2(_117);
    float _121 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _123 = _121 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _125 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _127 = _125 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _129 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _131 = _129 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _133 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _135 = _133 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _137 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _139 = _137 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _141 = _119 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _143 = exp2(_141);
    float _145 = fma(_143, (*spvDescriptorSet0.fp_c4)._m0[0].w, _111);
    float _147 = precise::clamp(_145, 0.0, 1.0);
    float _149 = fma(_91, _115, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _151 = precise::clamp(_149, 0.0, 1.0);
    float _153 = fma(_93, _123, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _155 = fma(_91, _131, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = fma(_91, _139, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _161 = precise::clamp(_159, 0.0, 1.0);
    float _163 = fma(_93, _127, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _165 = fma(_93, _135, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _167 = _153 + _151;
    float _169 = precise::clamp(_167, 0.0, 1.0);
    float _171 = _163 + _157;
    float _173 = precise::clamp(_171, 0.0, 1.0);
    float _175 = _165 + _161;
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = fma(_143, (*spvDescriptorSet0.fp_c4)._m0[0].x, _169);
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = fma(_143, (*spvDescriptorSet0.fp_c4)._m0[0].y, _173);
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = fma(_143, (*spvDescriptorSet0.fp_c4)._m0[0].z, _177);
    float _189 = precise::clamp(_187, 0.0, 1.0);
    out.m_38.x = _181;
    out.m_38.y = _185;
    out.m_38.z = _189;
    out.m_38.w = _147;
    return out;
}

