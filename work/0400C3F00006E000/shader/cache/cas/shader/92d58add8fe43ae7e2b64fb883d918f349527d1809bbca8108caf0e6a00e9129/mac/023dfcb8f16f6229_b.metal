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
    float2 _238 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_238, float2(0.0), isnan(_238))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_238, float2(0.0), isnan(_238))).x;
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
    float _113 = fma(_111, -0.5, 0.5);
    float _115 = fma(_111, 0.5, 0.5);
    float _117 = fma(_115, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _119 = sqrt(_113);
    float _121 = fma(_115, _117, -0.212114393711090087890625);
    float _123 = fma(_115, _121, 1.570728778839111328125);
    float _125 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _127 = _125 + 1.0;
    float _129 = _119 * 0.636619746685028076171875;
    float _131 = -_123;
    float _133 = fma(_129, _131, 1.0);
    float _135 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[5].z, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _137 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _139 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[7].x, _137);
    float _141 = precise::clamp(_139, 0.0, 1.0);
    float _143 = -_141;
    float _145 = _143 + 1.0;
    float _147 = abs(_145);
    float _149 = log2(_147);
    float _151 = _149 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _153 = exp2(_151);
    float _155 = fma(_153, _127, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _157 = fma(_155, 0.5, 0.5);
    float2 _392 = float2(_63, _65);
    float4 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_392, float2(0.0), isnan(_392))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_392, float2(0.0), isnan(_392))).xyzw;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _160.w;
    float2 _408 = float2(_133, _157);
    float3 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_408, float2(0.0), isnan(_408))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_408, float2(0.0), isnan(_408))).xyz;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    float _180 = _149 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _182 = exp2(_180);
    float _184 = -_182;
    float _186 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _188 = -_162;
    float _190 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[13].x, _188);
    float _192 = -_164;
    float _194 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[13].x, _192);
    float _196 = -_166;
    float _198 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[13].x, _196);
    float _200 = fma(_186, _190, _162);
    float _202 = fma(_186, _194, _164);
    float _204 = fma(_186, _198, _166);
    out.m_40.x = _200;
    out.m_40.y = _202;
    out.m_40.z = _204;
    out.m_40.w = _168;
    return out;
}

