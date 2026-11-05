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
    float _49 = in.m_33.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_33.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _249 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_249, float2(0.0), isnan(_249))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_249, float2(0.0), isnan(_249))).x;
    float2 _260 = float2(_63, _65);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_260, float2(0.0), isnan(_260))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_260, float2(0.0), isnan(_260))).x;
    float _71 = in.m_35.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_37.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = _61 * _75;
    float _85 = _61 * _81;
    float _87 = -_67;
    float _89 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _91 = 1.0 / _89;
    float _93 = fma(_83, _91, _85);
    float _95 = precise::clamp(_93, 0.0, 1.0);
    bool _99 = _91 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _101 = !_99;
    float _103 = _101 ? _95 : 0.0;
    float _105 = precise::max(_69, _103);
    bool _107 = _105 != 0.0;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan(0.0);
    bool _115 = _111 || _113;
    bool _117 = !_115;
    if (!_117)
    {
        float _119 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _121 = fma(_105, _119, 1.0);
        float _123 = log2(_121);
        float _125 = _123 + (-1.0);
        float _127 = exp2(_125);
        float _129 = _127 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _131 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[8].x, _63);
        float _133 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[8].y, _65);
        float _135 = -_129;
        float _137 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[8].x, _63);
        float _139 = -_129;
        float _141 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[8].y, _65);
        float _143 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[8].z, _63);
        float _145 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[8].w, _65);
        float _147 = -_129;
        float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[8].z, _63);
        float2 _395 = float2(_131, _133);
        float3 _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_395, float2(0.0), isnan(_395)), level(_125)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_395, float2(0.0), isnan(_395)), level(_125)).xyz;
        float _155 = _153.x;
        float _157 = _153.y;
        float _159 = _153.z;
        float _161 = -_129;
        float _163 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[8].w, _65);
        float2 _417 = float2(_137, _141);
        float3 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_417, float2(0.0), isnan(_417)), level(_125)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_417, float2(0.0), isnan(_417)), level(_125)).xyz;
        float _167 = _165.x;
        float _169 = _165.y;
        float _171 = _165.z;
        float2 _432 = float2(_143, _145);
        float3 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_432, float2(0.0), isnan(_432)), level(_125)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_432, float2(0.0), isnan(_432)), level(_125)).xyz;
        float _175 = _173.x;
        float _177 = _173.y;
        float _179 = _173.z;
        float2 _447 = float2(_149, _163);
        float3 _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_447, float2(0.0), isnan(_447)), level(_125)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_447, float2(0.0), isnan(_447)), level(_125)).xyz;
        float _183 = _181.x;
        float _185 = _181.y;
        float _187 = _181.z;
        float _189 = 0.0 + _123;
        float _191 = precise::clamp(_189, 0.0, 1.0);
        float _193 = _155 + _167;
        float _195 = _157 + _169;
        float _197 = _159 + _171;
        float _199 = _193 + _175;
        float _201 = _195 + _177;
        float _203 = _197 + _179;
        float _205 = _199 + _183;
        float _207 = _201 + _185;
        float _209 = _203 + _187;
        float _211 = _205 * 0.25;
        float _213 = _207 * 0.25;
        float _215 = _209 * 0.25;
        out.m_40.x = _211;
        out.m_40.y = _213;
        out.m_40.z = _215;
        out.m_40.w = _191;
        return out;
    }
    discard_fragment();
    return out;
}

