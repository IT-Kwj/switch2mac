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
    float2 _214 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_214, float2(0.0), isnan(_214))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_214, float2(0.0), isnan(_214))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = _57 * _69;
    float _79 = _57 * _75;
    float _81 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _83 = precise::clamp(_81, 0.0, 1.0);
    bool _87 = _83 != 0.0;
    bool _89 = isnan(_83);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.0);
    bool _95 = _91 || _93;
    bool _97 = !_95;
    if (!_97)
    {
        float2 _274 = float2(_77, _79);
        float2 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_274, float2(0.0), isnan(_274))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_274, float2(0.0), isnan(_274))).xy;
        float _103 = _101.x;
        float _105 = _101.y;
        float _107 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[1].z;
        float _109 = _105 + (-0.5);
        float _111 = _103 + (-0.5);
        float _113 = _109 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
        float _115 = _111 * _107;
        float _117 = _113 * _113;
        float _119 = _83 * _115;
        float _121 = _83 * _113;
        float _123 = fma(_115, _115, _117);
        float _125 = rsqrt(_123);
        float _127 = _115 * _125;
        float _129 = _113 * _125;
        float _131 = _127 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        float _133 = _129 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
        float _135 = fma(_131, 4.0, _119);
        float _137 = fma(_133, 4.0, _121);
        float _139 = _59 + _135;
        float _141 = _61 + _137;
        float2 _345 = float2(_139, _141);
        float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_345, float2(0.0), isnan(_345))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_345, float2(0.0), isnan(_345))).x;
        float _145 = _63 + (-0.001000000047497451305389404296875);
        float _147 = (*spvDescriptorSet0.fp_c3)._m0[0].y + (-1.0);
        float _149 = fma(_83, _147, 1.0);
        float _151 = log2(_149);
        bool _153 = _143 >= _145;
        bool _155 = isnan(_143);
        bool _157 = _153 || _155;
        bool _159 = isnan(_145);
        bool _161 = _157 || _159;
        float _163 = float(_161);
        float _165 = fma(_163, _119, _59);
        float _167 = precise::clamp(_165, 0.0, 1.0);
        float _169 = fma(_163, _121, _61);
        float _171 = precise::clamp(_169, 0.0, 1.0);
        float2 _392 = float2(_167, _171);
        float3 _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_392, float2(0.0), isnan(_392)), bias(_151)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_392, float2(0.0), isnan(_392)), bias(_151)).xyz;
        float _177 = _175.x;
        float _179 = _175.y;
        float _181 = _175.z;
        out.m_36.x = _177;
        out.m_36.y = _179;
        out.m_36.z = _181;
        out.m_36.w = 1.0;
        return out;
    }
    discard_fragment();
    return out;
}

