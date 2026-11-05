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
    float4 m_38 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _215 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_215, float2(0.0), isnan(_215))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_215, float2(0.0), isnan(_215))).x;
    bool _69 = _65 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_69)
    {
        discard_fragment();
    }
    float2 _235 = float2(_61, _63);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_235, float2(0.0), isnan(_235))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_235, float2(0.0), isnan(_235))).x;
    if (_69)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _73 = in.m_38.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_38.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_38.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _93 = precise::clamp(_91, 0.0, 1.0);
    float _95 = precise::max(_71, _93);
    float _97 = _59 * _77;
    float _99 = _59 * _83;
    float _101 = _59 * _89;
    float _103 = precise::max(_95, _97);
    bool _105 = _103 != 0.0;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan(0.0);
    bool _113 = _109 || _111;
    float _115 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _121 = precise::clamp(_119, 0.0, 1.0);
    float _123 = precise::min(_117, _121);
    bool _125 = !_113;
    if (!_125)
    {
        float _127 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _129 = fma(_103, _127, 1.0);
        float _131 = log2(_129);
        float _133 = _131 + (-1.0);
        float2 _344 = float2(_61, _63);
        float3 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_344, float2(0.0), isnan(_344)), level(_133)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_344, float2(0.0), isnan(_344)), level(_133)).xyz;
        float _139 = _137.x;
        float _141 = _137.y;
        float _143 = _137.z;
        float _145 = 0.0 + _131;
        float _147 = precise::clamp(_145, 0.0, 1.0);
        float _149 = fma(_101, _147, _99);
        float _151 = _147 * _101;
        float _153 = 1.0 / _149;
        float _155 = -_143;
        float _157 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[13].z, _155);
        float _159 = -_141;
        float _161 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[13].y, _159);
        float _163 = -_139;
        float _165 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[13].x, _163);
        float _167 = fma(_123, _157, _143);
        float _169 = _153 * _151;
        float _171 = fma(_123, _161, _141);
        float _173 = fma(_123, _165, _139);
        float _175 = _167 * _151;
        float _177 = _171 * _169;
        float _179 = _173 * _169;
        float _181 = _175 * _153;
        out.m_36.x = _179;
        out.m_36.y = _177;
        out.m_36.z = _181;
        out.m_36.w = _149;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _99;
    return out;
}

