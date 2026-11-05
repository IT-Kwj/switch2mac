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
    texture2d_array<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d_array<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.z;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_31.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_31.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _41;
    float _69 = _67 * _47;
    float _71 = _67 * _53;
    float _73 = _67 * _59;
    float _75 = _67 * _65;
    float _77 = rint(_69);
    float _79 = precise::max(_77, 0.0);
    uint _82 = uint(_79);
    uint _84 = clamp(_82, 0u, 65535u);
    float3 _199 = float3(_71, _73, float(int(_84)));
    float3 _204 = select(_199, float3(0.0), isnan(_199));
    float4 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _204.xy, uint(rint(_204.z)), level(_75)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _204.xy, uint(rint(_204.z)), level(_75)).xyzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = _87.w;
    float3 _222 = float3(_71, _73, float(int(_84)));
    float3 _224 = select(_222, float3(0.0), isnan(_222));
    float4 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _224.xy, uint(rint(_224.z)), level(_75)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _224.xy, uint(rint(_224.z)), level(_75)).xyzw;
    float _99 = _97.x;
    float _101 = _97.y;
    float _103 = _97.z;
    float _105 = _97.w;
    float _107 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[7].x);
    float _109 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[7].y);
    float _111 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[6].z, (*spvDescriptorSet0.fp_c3)._m0[7].z);
    float _113 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[6].w, (*spvDescriptorSet0.fp_c3)._m0[7].w);
    float _115 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[5].x, _107);
    float _117 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[5].y, _109);
    float _119 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[5].z, _111);
    float _121 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[5].w, _113);
    float _123 = _115 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _125 = _117 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _127 = _119 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _129 = _121 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    out.m_34.x = _123;
    out.m_34.y = _125;
    out.m_34.z = _127;
    out.m_34.w = _129;
    return out;
}

