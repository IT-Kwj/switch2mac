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
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.z;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _43;
    float _65 = _63 * _49;
    float _67 = _63 * _55;
    float _69 = _63 * _61;
    float _71 = _65 * _65;
    float _73 = fma(_67, _67, _71);
    float _75 = fma(_69, _69, _73);
    float _77 = rsqrt(_75);
    float _79 = _65 * _77;
    float _81 = _67 * _77;
    float _83 = _69 * _77;
    float _85 = _79 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _87 = _79 * (*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _89 = fma(_81, (*spvDescriptorSet0.fp_c4)._m0[2].x, _85);
    float _91 = fma(_83, (*spvDescriptorSet0.fp_c4)._m0[2].z, _89);
    float _93 = fma(_87, 0.5, 0.5);
    float _95 = fma(_91, 0.5, 0.5);
    float2 _267 = float2(_95, _93);
    float4 _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_267, float2(0.0), isnan(_267))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_267, float2(0.0), isnan(_267))).xyzw;
    float _100 = _98.x;
    float _102 = _98.y;
    float _104 = _98.z;
    float _106 = _98.w;
    float _108 = 0.0 + _87;
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = in.m_33.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = abs(_110);
    float _120 = log2(_118);
    float _122 = -(*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _124 = _122 + (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _126 = _120 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _128 = exp2(_126);
    float _130 = _63 * _116;
    float _132 = fma(_128, _124, (*spvDescriptorSet0.fp_c3)._m0[10].w);
    float _134 = _132 * _130;
    float _136 = _106 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _138 = precise::clamp(_136, 0.0, 1.0);
    float _140 = -(*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _142 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[13].x, _140);
    float _144 = -(*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _146 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[13].x, _144);
    float _148 = -(*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _150 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[13].x, _148);
    float _152 = fma(_138, _142, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _154 = fma(_138, _146, (*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _156 = fma(_138, _150, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _158 = -_152;
    float _160 = _158 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _162 = -_154;
    float _164 = _162 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _166 = -_156;
    float _168 = _166 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _170 = fma(_134, _160, _152);
    float _172 = fma(_134, _164, _154);
    float _174 = fma(_134, _168, _156);
    out.m_36.x = _172;
    out.m_36.y = _170;
    out.m_36.z = _174;
    out.m_36.w = 1.0;
    return out;
}

