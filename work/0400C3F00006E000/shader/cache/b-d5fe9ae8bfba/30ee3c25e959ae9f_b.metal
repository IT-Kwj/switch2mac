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
    float2 _249 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_249, float2(0.0), isnan(_249))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_249, float2(0.0), isnan(_249))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = (*spvDescriptorSet0.fp_c5)._m0[0].x * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _77 = fma(_75, 0.75, 7.4999996286351233720779418945312e-05);
    float _79 = _75 + 9.9999997473787516355514526367188e-05;
    float _81 = _75 + (-0.99989998340606689453125);
    float _83 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _85 = _83 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _87 = -_77;
    float _89 = _87 + 1.0;
    float _91 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _93 = _91 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _95 = _79 * _89;
    float _97 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _99 = abs(_73);
    float _101 = -_99;
    float _103 = _101 + 1.0;
    float _105 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _97);
    float _107 = _103 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _109 = precise::clamp(_107, 0.0, 1.0);
    float _111 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _105);
    float _113 = -_73;
    float _115 = fma(_113, (*spvDescriptorSet0.fp_c4)._m0[1].z, _105);
    float _117 = abs(_109);
    float _119 = log2(_117);
    float _121 = fma(_111, -0.5, 0.5);
    float _123 = fma(_115, -0.5, 0.5);
    float _125 = _121 * _121;
    float _127 = _123 * _123;
    float _129 = 0.0 + _123;
    float _131 = precise::clamp(_129, 0.0, 1.0);
    float _133 = fma(_125, _81, 1.0);
    float _135 = fma(_81, _127, 1.0);
    float _137 = _133 * _133;
    float _139 = _135 * _135;
    float _141 = _119 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _143 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _145 = _143 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _147 = 1.0 / _137;
    float _149 = 1.0 / _139;
    float _151 = exp2(_141);
    float _153 = _147 * _95;
    float _155 = fma(_153, _85, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = _149 * _95;
    float _161 = 0.0 + _121;
    float _163 = precise::clamp(_161, 0.0, 1.0);
    float _165 = fma(_153, _145, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = fma(_153, _93, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = fma(_145, _159, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _175 = precise::clamp(_173, 0.0, 1.0);
    float _177 = fma(_85, _159, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _179 = precise::clamp(_177, 0.0, 1.0);
    float _181 = fma(_93, _159, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = fma(_151, (*spvDescriptorSet0.fp_c4)._m0[0].w, _163);
    float _187 = precise::clamp(_185, 0.0, 1.0);
    float _189 = fma(_151, (*spvDescriptorSet0.fp_c4)._m0[0].w, _131);
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = fma(_151, (*spvDescriptorSet0.fp_c4)._m0[0].x, _167);
    float _195 = precise::clamp(_193, 0.0, 1.0);
    float _197 = fma(_151, (*spvDescriptorSet0.fp_c4)._m0[0].x, _175);
    float _199 = precise::clamp(_197, 0.0, 1.0);
    float _201 = fma(_151, (*spvDescriptorSet0.fp_c4)._m0[0].y, _157);
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = fma(_151, (*spvDescriptorSet0.fp_c4)._m0[0].z, _171);
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = fma(_151, (*spvDescriptorSet0.fp_c4)._m0[0].y, _179);
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = fma(_151, (*spvDescriptorSet0.fp_c4)._m0[0].z, _183);
    float _215 = precise::clamp(_213, 0.0, 1.0);
    out.m_36.x = _195;
    out.m_36.y = _203;
    out.m_36.z = _207;
    out.m_36.w = _187;
    out.m_38.x = _199;
    out.m_38.y = _211;
    out.m_38.z = _215;
    out.m_38.w = _191;
    return out;
}

