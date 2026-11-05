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
    constant _16* fp_c3 [[id(0)]];
    texture2d_array<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.z;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_33.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_33.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_33.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _43;
    float _83 = _81 * _49;
    float _85 = _81 * _55;
    float _87 = _81 * _61;
    float _89 = _81 * _67;
    float _91 = rint(_83);
    float _93 = precise::max(_91, 0.0);
    uint _96 = uint(_93);
    uint _98 = clamp(_96, 0u, 65535u);
    float _100 = _81 * _73;
    float _102 = _81 * _79;
    float _104 = rint(_100);
    float _106 = precise::max(_104, 0.0);
    uint _108 = uint(_106);
    uint _110 = clamp(_108, 0u, 65535u);
    float3 _260 = float3(_85, _87, float(int(_98)));
    float3 _265 = select(_260, float3(0.0), isnan(_260));
    float _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _265.xy, uint(rint(_265.z)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _265.xy, uint(rint(_265.z)), level(0.0), int2(1, 0)).x;
    float3 _276 = float3(_85, _87, float(int(_98)));
    float3 _278 = select(_276, float3(0.0), isnan(_276));
    float _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _278.xy, uint(rint(_278.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _278.xy, uint(rint(_278.z)), level(0.0)).x;
    float3 _287 = float3(_85, _87, float(int(_98)));
    float3 _289 = select(_287, float3(0.0), isnan(_287));
    float _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _289.xy, uint(rint(_289.z)), level(0.0), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _289.xy, uint(rint(_289.z)), level(0.0), int2(0, 1)).x;
    float3 _299 = float3(_85, _87, float(int(_98)));
    float3 _301 = select(_299, float3(0.0), isnan(_299));
    float _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _301.xy, uint(rint(_301.z)), level(0.0), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _301.xy, uint(rint(_301.z)), level(0.0), int2(1)).x;
    float3 _311 = float3(_102, _89, float(int(_110)));
    float3 _313 = select(_311, float3(0.0), isnan(_311));
    float2 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _313.xy, uint(rint(_313.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _313.xy, uint(rint(_313.z)), level(0.0)).zw;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = (*spvDescriptorSet0.fp_c3)._m0[4].z + (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _130 = _128 * _128;
    float _132 = -_112;
    float _134 = _114 + _132;
    float _136 = -_118;
    float _138 = _116 + _136;
    float _140 = -_116;
    float _142 = _114 + _140;
    float _144 = -_118;
    float _146 = _112 + _144;
    float _148 = _134 + _138;
    float _150 = _142 + _146;
    float _152 = fma(_148, _148, _130);
    float _154 = fma(_150, _150, _152);
    float _156 = rsqrt(_154);
    float _158 = _156 * 0.5;
    float _160 = fma(_148, _158, 0.5);
    float _162 = fma(_150, _158, 0.5);
    out.m_36.x = _160;
    out.m_36.y = _162;
    out.m_36.z = _124;
    out.m_36.w = _126;
    return out;
}

