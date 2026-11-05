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
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_35.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_35.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _254 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_254, float2(0.0), isnan(_254))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_254, float2(0.0), isnan(_254))).x;
    float _71 = in.m_37.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_37.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_37.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = _63 * _75;
    float _91 = _63 * _81;
    float _93 = _63 * _87;
    float _95 = in.m_39.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = _89 * _89;
    float _103 = fma(_93, _93, _101);
    float _105 = fma(_91, _91, _103);
    float _107 = rsqrt(_105);
    float _109 = _89 * _107;
    float _111 = _63 * _99;
    float _113 = _93 * _107;
    float _115 = _91 * _107;
    float _117 = _109 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _119 = fma(_113, (*spvDescriptorSet0.fp_c4)._m0[2].x, _117);
    float _121 = fma(_115, (*spvDescriptorSet0.fp_c4)._m0[2].z, _119);
    float _123 = fma(_121, 0.5, 0.5);
    float _125 = fma(_123, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _127 = fma(_123, _125, -0.212114393711090087890625);
    float _129 = fma(_123, _127, 1.570728778839111328125);
    float _131 = -_69;
    float _133 = fma(_131, _111, 1.0);
    float _135 = 1.0 / _133;
    float _137 = fma(_121, -0.5, 0.5);
    float _139 = sqrt(_137);
    float _141 = _135 * (*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _143 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _145 = _143 + 1.0;
    float _147 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _149 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[7].x, _147);
    float _151 = precise::clamp(_149, 0.0, 1.0);
    float _153 = -_151;
    float _155 = _153 + 1.0;
    float _157 = abs(_155);
    float _159 = log2(_157);
    float _161 = _139 * 0.636619746685028076171875;
    float _163 = -_129;
    float _165 = fma(_161, _163, 1.0);
    float _167 = _159 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _169 = exp2(_167);
    float _171 = fma(_169, _145, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _173 = fma(_171, 0.5, 0.5);
    float2 _423 = float2(_65, _67);
    float4 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_423, float2(0.0), isnan(_423))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_423, float2(0.0), isnan(_423))).xyzw;
    float _178 = _176.x;
    float _180 = _176.y;
    float _182 = _176.z;
    float _184 = _176.w;
    float2 _439 = float2(_165, _173);
    float3 _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_439, float2(0.0), isnan(_439))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_439, float2(0.0), isnan(_439))).xyz;
    float _190 = _188.x;
    float _192 = _188.y;
    float _194 = _188.z;
    float _196 = _159 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _198 = exp2(_196);
    float _200 = -_198;
    float _202 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _204 = -_178;
    float _206 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[13].x, _204);
    float _208 = -_180;
    float _210 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[13].x, _208);
    float _212 = -_182;
    float _214 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[13].x, _212);
    float _216 = fma(_202, _206, _178);
    float _218 = fma(_202, _210, _180);
    float _220 = fma(_202, _214, _182);
    out.m_42.x = _216;
    out.m_42.y = _218;
    out.m_42.z = _220;
    out.m_42.w = _184;
    return out;
}

