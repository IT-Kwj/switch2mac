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
    constant _16* fp_c5 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
    float4 m_38 [[color(1)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _213 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_213, float2(0.0), isnan(_213))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_213, float2(0.0), isnan(_213))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = (*spvDescriptorSet0.fp_c5)._m0[0].x * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _77 = fma(_75, 0.75, 7.4999996286351233720779418945312e-05);
    float _79 = _75 + 9.9999997473787516355514526367188e-05;
    float _81 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _83 = _81 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _85 = -_77;
    float _87 = _85 + 1.0;
    float _89 = _79 * _87;
    float _91 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _93 = _75 + (-0.99989998340606689453125);
    float _95 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _91);
    float _97 = abs(_73);
    float _99 = -_97;
    float _101 = _99 + 1.0;
    float _103 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _95);
    float _105 = -_73;
    float _107 = fma(_105, (*spvDescriptorSet0.fp_c4)._m0[1].z, _95);
    float _109 = _101 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _111 = precise::clamp(_109, 0.0, 1.0);
    float _113 = fma(_103, -0.5, 0.5);
    float _115 = fma(_107, -0.5, 0.5);
    float _117 = _113 * _113;
    float _119 = _115 * _115;
    float _121 = abs(_111);
    float _123 = log2(_121);
    float _125 = fma(_117, _93, 1.0);
    float _127 = fma(_93, _119, 1.0);
    float _129 = _125 * _125;
    float _131 = _127 * _127;
    float _133 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _135 = _133 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _137 = 1.0 / _129;
    float _139 = _123 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _141 = 1.0 / _131;
    float _143 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _145 = _143 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _147 = exp2(_139);
    float _149 = _137 * _89;
    float _151 = fma(_149, _135, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _153 = _141 * _89;
    float _155 = fma(_135, _153, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _157 = fma(_149, _145, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _159 = fma(_145, _153, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _161 = fma(_149, _83, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _163 = fma(_83, _153, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _165 = fma(_147, (*spvDescriptorSet0.fp_c4)._m0[0].w, _113);
    float _167 = fma(_147, (*spvDescriptorSet0.fp_c4)._m0[0].w, _115);
    float _169 = fma(_147, (*spvDescriptorSet0.fp_c4)._m0[0].x, _151);
    float _171 = fma(_147, (*spvDescriptorSet0.fp_c4)._m0[0].x, _155);
    float _173 = fma(_147, (*spvDescriptorSet0.fp_c4)._m0[0].y, _157);
    float _175 = fma(_147, (*spvDescriptorSet0.fp_c4)._m0[0].z, _161);
    float _177 = fma(_147, (*spvDescriptorSet0.fp_c4)._m0[0].y, _159);
    float _179 = fma(_147, (*spvDescriptorSet0.fp_c4)._m0[0].z, _163);
    out.m_36.x = _169;
    out.m_36.y = _173;
    out.m_36.z = _175;
    out.m_36.w = _165;
    out.m_38.x = _171;
    out.m_38.y = _177;
    out.m_38.z = _179;
    out.m_38.w = _167;
    return out;
}

