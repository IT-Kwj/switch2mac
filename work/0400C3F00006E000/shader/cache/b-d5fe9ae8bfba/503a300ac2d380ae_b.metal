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

struct spvDescriptorSetBuffer0
{
    texture2d<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
    sampler fp_t_tcb_8Smplr_w [[id(2)]];
    constant dm_border_t* dm_border [[id(3)]];
};

struct main0_out
{
    float4 m_30 [[color(0)]];
};

struct main0_in
{
    float4 m_27 [[user(locn0)]];
    float4 m_23 [[user(locn1)]];
    float4 m_25 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _37 = gl_FragCoord.w;
    float _39 = in.m_23.y;
    float _41 = gl_FragCoord.w;
    float _43 = _39 * _41;
    float _45 = in.m_23.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_25.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_23.z;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_25.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_27.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_27.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_25.z;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_27.z;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = 1.0 / _37;
    float _95 = _93 * _43;
    float _97 = _93 * _49;
    float _99 = _93 * _55;
    float _101 = _93 * _61;
    float _103 = _93 * _67;
    float _105 = _93 * _73;
    float2 _316 = float2(_97, _95);
    float4 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_316, float2(0.0), isnan(_316))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_316, float2(0.0), isnan(_316))).xyzw;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    float _116 = _108.w;
    float _118 = _93 * _79;
    float _120 = _93 * _85;
    float _122 = _93 * _91;
    float2 _345 = float2(_99, _103);
    float4 _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_345, float2(0.0), isnan(_345))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_345, float2(0.0), isnan(_345))).xyzw;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _124.z;
    float _132 = _124.w;
    float2 _361 = float2(_105, _118);
    float4 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_361, float2(0.0), isnan(_361))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_361, float2(0.0), isnan(_361))).xyzw;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _134.z;
    float _142 = _134.w;
    float2 _377 = float2(_105, _122);
    float4 _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_377, float2(0.0), isnan(_377))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_377, float2(0.0), isnan(_377))).xyzw;
    float _146 = _144.x;
    float _148 = _144.y;
    float _150 = _144.z;
    float _152 = _144.w;
    float2 _393 = float2(_97, _101);
    float4 _154 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_393, float2(0.0), isnan(_393))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_393, float2(0.0), isnan(_393))).xyzw;
    float _156 = _154.x;
    float _158 = _154.y;
    float _160 = _154.z;
    float _162 = _154.w;
    float2 _409 = float2(_99, _120);
    float4 _164 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_409, float2(0.0), isnan(_409))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_409, float2(0.0), isnan(_409))).xyzw;
    float _166 = _164.x;
    float _168 = _164.y;
    float _170 = _164.z;
    float _172 = _164.w;
    float _174 = _112 * 0.1611328125;
    float _176 = _114 * 0.1611328125;
    float _178 = _110 * 0.1611328125;
    float _180 = _116 * 0.1611328125;
    float _182 = fma(_128, 0.0107421875, _174);
    float _184 = fma(_130, 0.0107421875, _176);
    float _186 = fma(_126, 0.0107421875, _178);
    float _188 = fma(_132, 0.0107421875, _180);
    float _190 = fma(_138, 0.328125, _182);
    float _192 = fma(_140, 0.328125, _184);
    float _194 = fma(_136, 0.328125, _186);
    float _196 = fma(_142, 0.328125, _188);
    float _198 = fma(_148, 0.328125, _190);
    float _200 = fma(_150, 0.328125, _192);
    float _202 = fma(_146, 0.328125, _194);
    float _204 = fma(_152, 0.328125, _196);
    float _206 = fma(_158, 0.1611328125, _198);
    float _208 = fma(_160, 0.1611328125, _200);
    float _210 = fma(_156, 0.1611328125, _202);
    float _212 = fma(_162, 0.1611328125, _204);
    float _214 = fma(_168, 0.0107421875, _206);
    float _216 = fma(_170, 0.0107421875, _208);
    float _218 = fma(_166, 0.0107421875, _210);
    float _220 = fma(_172, 0.0107421875, _212);
    out.m_30.x = _218;
    out.m_30.y = _214;
    out.m_30.z = _216;
    out.m_30.w = _220;
    return out;
}

