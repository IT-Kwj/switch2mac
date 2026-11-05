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
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_33.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_33.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_33.z;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _47;
    float _81 = _79 * _53;
    float _83 = _79 * _59;
    float _85 = _79 * _65;
    float _87 = _81 * _81;
    float _89 = fma(_83, _83, _87);
    float _91 = fma(_85, _85, _89);
    float _93 = rsqrt(_91);
    float _95 = _81 * _93;
    float _97 = _83 * _93;
    float _99 = _85 * _93;
    float _101 = _95 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _103 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[2].x, _101);
    float _105 = _95 * (*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _107 = _79 * _71;
    float _109 = fma(_99, (*spvDescriptorSet0.fp_c4)._m0[2].z, _103);
    float _111 = fma(_105, 0.5, 0.5);
    float _113 = fma(_109, -0.5, 0.5);
    float _115 = fma(_109, 0.5, 0.5);
    float _117 = fma(_115, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _119 = sqrt(_113);
    float _121 = fma(_115, _117, -0.212114393711090087890625);
    float _123 = fma(_115, _121, 1.570728778839111328125);
    float _125 = _119 * 0.636619746685028076171875;
    float _127 = -_123;
    float _129 = fma(_125, _127, 1.0);
    float _131 = _79 * _77;
    float2 _370 = float2(_129, _111);
    float4 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_370, float2(0.0), isnan(_370))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_370, float2(0.0), isnan(_370))).xyzw;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _134.z;
    float _142 = _134.w;
    float2 _390 = float2(_107, _131);
    float4 _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_390, float2(0.0), isnan(_390))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_390, float2(0.0), isnan(_390))).xyzw;
    float _146 = _144.x;
    float _148 = _144.y;
    float _150 = _144.z;
    float _152 = _144.w;
    float _154 = 0.0 + _105;
    float _156 = precise::clamp(_154, 0.0, 1.0);
    float _158 = in.m_37.x;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = abs(_156);
    float _166 = log2(_164);
    float _168 = -(*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _170 = _168 + (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _172 = _166 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _174 = exp2(_172);
    float _176 = fma(_174, _170, (*spvDescriptorSet0.fp_c3)._m0[10].w);
    float _178 = -(*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _180 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[13].x, _178);
    float _182 = _142 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _184 = precise::clamp(_182, 0.0, 1.0);
    float _186 = -(*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _188 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[13].x, _186);
    float _190 = -(*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _192 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[13].x, _190);
    float _194 = fma(_184, _180, (*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _196 = fma(_184, _188, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _198 = fma(_184, _192, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _200 = _79 * _162;
    float _202 = _194 * _152;
    float _204 = _196 * _152;
    float _206 = _198 * _152;
    float _208 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[13].y, _202);
    float _210 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[13].y, _204);
    float _212 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[13].y, _206);
    float _214 = _176 * _200;
    float _216 = -_208;
    float _218 = _216 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _220 = -_210;
    float _222 = _220 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _224 = -_212;
    float _226 = _224 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _228 = fma(_214, _218, _208);
    float _230 = fma(_214, _222, _210);
    float _232 = fma(_214, _226, _212);
    out.m_40.x = _228;
    out.m_40.y = _230;
    out.m_40.z = _232;
    out.m_40.w = 1.0;
    return out;
}

