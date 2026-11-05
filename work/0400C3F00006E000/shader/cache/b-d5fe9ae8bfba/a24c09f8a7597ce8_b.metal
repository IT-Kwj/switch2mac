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
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.z;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _45;
    float _79 = _77 * _51;
    float _81 = _77 * _57;
    float _83 = _77 * _63;
    float _85 = _79 * _79;
    float _87 = fma(_81, _81, _85);
    float _89 = fma(_83, _83, _87);
    float _91 = rsqrt(_89);
    float _93 = _79 * _91;
    float _95 = _81 * _91;
    float _97 = _83 * _91;
    float _99 = _93 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _101 = _93 * (*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _103 = fma(_95, (*spvDescriptorSet0.fp_c4)._m0[2].x, _99);
    float _105 = fma(_101, 0.5, 0.5);
    float _107 = _77 * _69;
    float _109 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[2].z, _103);
    float _111 = fma(_109, -0.5, 0.5);
    float _113 = fma(_109, 0.5, 0.5);
    float _115 = fma(_113, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _117 = sqrt(_111);
    float _119 = fma(_113, _115, -0.212114393711090087890625);
    float _121 = fma(_113, _119, 1.570728778839111328125);
    float _123 = _117 * 0.636619746685028076171875;
    float _125 = _77 * _75;
    float _127 = -_121;
    float _129 = fma(_123, _127, 1.0);
    float2 _322 = float2(_129, _105);
    float4 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_322, float2(0.0), isnan(_322))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_322, float2(0.0), isnan(_322))).xyzw;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = _132.w;
    float2 _342 = float2(_107, _125);
    float4 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_342, float2(0.0), isnan(_342))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_342, float2(0.0), isnan(_342))).xyzw;
    float _144 = _142.x;
    float _146 = _142.y;
    float _148 = _142.z;
    float _150 = _142.w;
    float _152 = -(*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _154 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[13].x, _152);
    float _156 = _140 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _158 = precise::clamp(_156, 0.0, 1.0);
    float _160 = -(*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _162 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[13].x, _160);
    float _164 = -(*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _166 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[13].x, _164);
    float _168 = fma(_158, _154, (*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _170 = fma(_158, _162, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _172 = fma(_158, _166, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _174 = _168 * _150;
    float _176 = _170 * _150;
    float _178 = _172 * _150;
    float _180 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[13].y, _174);
    float _182 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[13].y, _176);
    float _184 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[13].y, _178);
    out.m_38.x = _180;
    out.m_38.y = _182;
    out.m_38.z = _184;
    out.m_38.w = 1.0;
    return out;
}

