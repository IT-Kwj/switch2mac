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
    float2 _280 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_280, float2(0.0), isnan(_280))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_280, float2(0.0), isnan(_280))).x;
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
    float _123 = -_69;
    float _125 = fma(_123, _111, 1.0);
    float _127 = 1.0 / _125;
    float _129 = _127 * (*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _131 = fma(_121, 0.5, 0.5);
    float _133 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _135 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[7].x, _133);
    float _137 = precise::clamp(_135, 0.0, 1.0);
    float _139 = -_137;
    float _141 = _139 + 1.0;
    float _143 = abs(_141);
    float _145 = log2(_143);
    float _147 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _149 = _147 + 1.0;
    float _151 = _145 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _153 = exp2(_151);
    float _155 = fma(_153, _149, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _157 = fma(_155, 0.5, 0.5);
    float2 _424 = float2(_65, _67);
    float4 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_424, float2(0.0), isnan(_424))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_424, float2(0.0), isnan(_424))).xyzw;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _160.w;
    float2 _440 = float2(_131, _157);
    float3 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_440, float2(0.0), isnan(_440))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_440, float2(0.0), isnan(_440))).xyz;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    float _180 = _145 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _182 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _184 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[9].x, _182);
    float _186 = precise::clamp(_184, 0.0, 1.0);
    float _188 = exp2(_180);
    float _190 = -_186;
    float _192 = _190 + 1.0;
    float _194 = abs(_192);
    float _196 = log2(_194);
    float _198 = _196 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _200 = exp2(_198);
    float _202 = -_188;
    float _204 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _206 = (*spvDescriptorSet0.fp_c3)._m0[10].w * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _208 = -_162;
    float _210 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[13].x, _208);
    float _212 = -_164;
    float _214 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[13].x, _212);
    float _216 = -_166;
    float _218 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[13].x, _216);
    float _220 = fma(_204, _210, _162);
    float _222 = fma(_204, _214, _164);
    float _224 = fma(_204, _218, _166);
    float _226 = -_200;
    float _228 = fma(_206, _226, _206);
    float _230 = -_220;
    float _232 = _230 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _234 = -_222;
    float _236 = _234 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _238 = -_224;
    float _240 = _238 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _242 = fma(_228, _232, _220);
    float _244 = fma(_228, _236, _222);
    float _246 = fma(_228, _240, _224);
    out.m_42.x = _242;
    out.m_42.y = _244;
    out.m_42.z = _246;
    out.m_42.w = _168;
    return out;
}

