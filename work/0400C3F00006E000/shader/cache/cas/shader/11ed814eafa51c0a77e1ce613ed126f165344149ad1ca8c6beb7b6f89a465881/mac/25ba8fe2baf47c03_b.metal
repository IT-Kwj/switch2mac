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
    float2 _264 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_264, float2(0.0), isnan(_264))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_264, float2(0.0), isnan(_264))).x;
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
    float _111 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _113 = _111 + 1.0;
    float _115 = fma(_105, (*spvDescriptorSet0.fp_c4)._m0[2].z, _109);
    float _117 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[5].z, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _119 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _121 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[7].x, _119);
    float _123 = precise::clamp(_121, 0.0, 1.0);
    float _125 = fma(_115, 0.5, 0.5);
    float _127 = -_123;
    float _129 = _127 + 1.0;
    float _131 = abs(_129);
    float _133 = log2(_131);
    float _135 = _133 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _137 = exp2(_135);
    float _139 = fma(_137, _113, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _141 = fma(_139, 0.5, 0.5);
    float2 _393 = float2(_63, _65);
    float4 _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_393, float2(0.0), isnan(_393))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_393, float2(0.0), isnan(_393))).xyzw;
    float _146 = _144.x;
    float _148 = _144.y;
    float _150 = _144.z;
    float _152 = _144.w;
    float2 _409 = float2(_125, _141);
    float3 _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_409, float2(0.0), isnan(_409))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_409, float2(0.0), isnan(_409))).xyz;
    float _158 = _156.x;
    float _160 = _156.y;
    float _162 = _156.z;
    float _164 = _133 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _166 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _168 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[9].x, _166);
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float _172 = exp2(_164);
    float _174 = -_170;
    float _176 = _174 + 1.0;
    float _178 = abs(_176);
    float _180 = log2(_178);
    float _182 = _180 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _184 = -_172;
    float _186 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _188 = (*spvDescriptorSet0.fp_c3)._m0[10].w * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _190 = exp2(_182);
    float _192 = -_146;
    float _194 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[13].x, _192);
    float _196 = -_148;
    float _198 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[13].x, _196);
    float _200 = -_150;
    float _202 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[13].x, _200);
    float _204 = fma(_186, _194, _146);
    float _206 = fma(_186, _198, _148);
    float _208 = fma(_186, _202, _150);
    float _210 = -_190;
    float _212 = fma(_188, _210, _188);
    float _214 = -_204;
    float _216 = _214 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _218 = -_206;
    float _220 = _218 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _222 = -_208;
    float _224 = _222 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _226 = fma(_212, _216, _204);
    float _228 = fma(_212, _220, _206);
    float _230 = fma(_212, _224, _208);
    out.m_40.x = _226;
    out.m_40.y = _228;
    out.m_40.z = _230;
    out.m_40.w = _152;
    return out;
}

