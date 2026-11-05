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
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_35.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_35.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _280 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_280, float2(0.0), isnan(_280))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_280, float2(0.0), isnan(_280))).x;
    float _69 = in.m_37.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.z;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = _61 * _73;
    float _89 = _61 * _79;
    float _91 = _61 * _85;
    float _93 = _87 * _87;
    float _95 = fma(_89, _89, _93);
    float _97 = fma(_91, _91, _95);
    float _99 = rsqrt(_97);
    float _101 = _87 * _99;
    float _103 = _89 * _99;
    float _105 = _91 * _99;
    float _107 = _101 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _109 = fma(_103, (*spvDescriptorSet0.fp_c4)._m0[2].x, _107);
    float _111 = fma(_105, (*spvDescriptorSet0.fp_c4)._m0[2].z, _109);
    float _113 = fma(_111, 0.5, 0.5);
    float _115 = fma(_113, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _117 = fma(_113, _115, -0.212114393711090087890625);
    float _119 = fma(_113, _117, 1.570728778839111328125);
    float _121 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _123 = _121 + 1.0;
    float _125 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[5].z, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _127 = fma(_111, -0.5, 0.5);
    float _129 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _131 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[7].x, _129);
    float _133 = precise::clamp(_131, 0.0, 1.0);
    float _135 = sqrt(_127);
    float _137 = -_133;
    float _139 = _137 + 1.0;
    float _141 = abs(_139);
    float _143 = log2(_141);
    float _145 = _135 * 0.636619746685028076171875;
    float _147 = -_119;
    float _149 = fma(_145, _147, 1.0);
    float _151 = _143 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _153 = exp2(_151);
    float2 _427 = float2(_63, _65);
    float4 _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_427, float2(0.0), isnan(_427))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_427, float2(0.0), isnan(_427))).xyzw;
    float _158 = _156.x;
    float _160 = _156.y;
    float _162 = _156.z;
    float _164 = _156.w;
    float _166 = fma(_153, _123, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _168 = fma(_166, 0.5, 0.5);
    float2 _450 = float2(_149, _168);
    float3 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_450, float2(0.0), isnan(_450))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_450, float2(0.0), isnan(_450))).xyz;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    float _180 = _143 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _182 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _184 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[9].x, _182);
    float _186 = precise::clamp(_184, 0.0, 1.0);
    float _188 = exp2(_180);
    float _190 = -_186;
    float _192 = _190 + 1.0;
    float _194 = abs(_192);
    float _196 = log2(_194);
    float _198 = -_188;
    float _200 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _202 = _196 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _204 = (*spvDescriptorSet0.fp_c3)._m0[10].w * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _206 = exp2(_202);
    float _208 = -_158;
    float _210 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[13].x, _208);
    float _212 = -_160;
    float _214 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[13].x, _212);
    float _216 = -_162;
    float _218 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[13].x, _216);
    float _220 = fma(_200, _210, _158);
    float _222 = fma(_200, _214, _160);
    float _224 = fma(_200, _218, _162);
    float _226 = -_206;
    float _228 = fma(_204, _226, _204);
    float _230 = -_220;
    float _232 = _230 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _234 = -_222;
    float _236 = _234 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _238 = -_224;
    float _240 = _238 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _242 = fma(_228, _232, _220);
    float _244 = fma(_228, _236, _222);
    float _246 = fma(_228, _240, _224);
    out.m_40.x = _242;
    out.m_40.y = _244;
    out.m_40.z = _246;
    out.m_40.w = _164;
    return out;
}

