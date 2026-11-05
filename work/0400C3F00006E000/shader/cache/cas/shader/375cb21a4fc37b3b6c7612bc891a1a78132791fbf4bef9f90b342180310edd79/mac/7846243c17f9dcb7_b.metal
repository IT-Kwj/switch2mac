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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_33.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _223 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_223, float2(0.0), isnan(_223))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_223, float2(0.0), isnan(_223))).x;
    float2 _234 = float2(_59, _61);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_234, float2(0.0), isnan(_234))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_234, float2(0.0), isnan(_234))).x;
    float _67 = -_63;
    float _69 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _71 = 1.0 / _69;
    float _73 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _75 = precise::clamp(_73, 0.0, 1.0);
    float _77 = precise::max(_65, _75);
    bool _81 = _77 != 0.0;
    bool _83 = isnan(_77);
    bool _85 = _81 || _83;
    bool _87 = isnan(0.0);
    bool _89 = _85 || _87;
    bool _91 = !_89;
    if (!_91)
    {
        float _93 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _95 = fma(_77, _93, 1.0);
        float _97 = log2(_95);
        float _99 = _97 + (-1.0);
        float _101 = exp2(_99);
        float _103 = _101 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _105 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _107 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _109 = -_103;
        float _111 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _113 = -_103;
        float _115 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _117 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _119 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float _121 = -_103;
        float _123 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float2 _344 = float2(_105, _107);
        float3 _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_344, float2(0.0), isnan(_344)), level(_99)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_344, float2(0.0), isnan(_344)), level(_99)).xyz;
        float _129 = _127.x;
        float _131 = _127.y;
        float _133 = _127.z;
        float _135 = -_103;
        float _137 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float2 _366 = float2(_111, _115);
        float3 _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_366, float2(0.0), isnan(_366)), level(_99)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_366, float2(0.0), isnan(_366)), level(_99)).xyz;
        float _141 = _139.x;
        float _143 = _139.y;
        float _145 = _139.z;
        float2 _381 = float2(_117, _119);
        float3 _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_381, float2(0.0), isnan(_381)), level(_99)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_381, float2(0.0), isnan(_381)), level(_99)).xyz;
        float _149 = _147.x;
        float _151 = _147.y;
        float _153 = _147.z;
        float2 _396 = float2(_123, _137);
        float3 _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_396, float2(0.0), isnan(_396)), level(_99)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_396, float2(0.0), isnan(_396)), level(_99)).xyz;
        float _157 = _155.x;
        float _159 = _155.y;
        float _161 = _155.z;
        float _163 = 0.0 + _97;
        float _165 = precise::clamp(_163, 0.0, 1.0);
        float _167 = _129 + _141;
        float _169 = _131 + _143;
        float _171 = _133 + _145;
        float _173 = _167 + _149;
        float _175 = _169 + _151;
        float _177 = _171 + _153;
        float _179 = _173 + _157;
        float _181 = _175 + _159;
        float _183 = _177 + _161;
        float _185 = _179 * 0.25;
        float _187 = _181 * 0.25;
        float _189 = _183 * 0.25;
        out.m_36.x = _185;
        out.m_36.y = _187;
        out.m_36.z = _189;
        out.m_36.w = _165;
        return out;
    }
    discard_fragment();
    return out;
}

