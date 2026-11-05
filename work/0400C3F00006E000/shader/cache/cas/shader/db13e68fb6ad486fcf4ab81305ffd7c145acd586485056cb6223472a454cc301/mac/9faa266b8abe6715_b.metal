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
    float2 _248 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_248, float2(0.0), isnan(_248))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_248, float2(0.0), isnan(_248))).x;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_33.z;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_33.w;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = _61 * _73;
    float _95 = _61 * _79;
    float _97 = -_67;
    float _99 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _101 = 1.0 / _99;
    bool _105 = _101 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_105)
    {
        discard_fragment();
    }
    float _107 = fma(_93, _101, _95);
    float _109 = precise::clamp(_107, 0.0, 1.0);
    if (_105)
    {
        out.m_40.x = 0.0;
        out.m_40.y = 0.0;
        out.m_40.z = 0.0;
        out.m_40.w = 0.0;
        return out;
    }
    bool _111 = _109 != 0.0;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan(0.0);
    bool _119 = _115 || _117;
    float _121 = _61 * _85;
    float _123 = _61 * _91;
    bool _125 = !_119;
    if (!_125)
    {
        float2 _350 = float2(_121, _123);
        float2 _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_350, float2(0.0), isnan(_350))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_350, float2(0.0), isnan(_350))).xy;
        float _131 = _129.x;
        float _133 = _129.y;
        float _135 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[1].z;
        float _137 = _133 + (-0.5);
        float _139 = _131 + (-0.5);
        float _141 = _137 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
        float _143 = _139 * _135;
        float _145 = _141 * _141;
        float _147 = _109 * _141;
        float _149 = fma(_143, _143, _145);
        float _151 = rsqrt(_149);
        float _153 = _141 * _151;
        float _155 = _143 * _151;
        float _157 = _109 * _143;
        float _159 = _153 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
        float _161 = _155 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        float _163 = fma(_159, 4.0, _147);
        float _165 = fma(_161, 4.0, _157);
        float _167 = _65 + _163;
        float _169 = _63 + _165;
        float2 _421 = float2(_169, _167);
        float _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_421, float2(0.0), isnan(_421))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_421, float2(0.0), isnan(_421))).x;
        float _173 = _101 + (-0.001000000047497451305389404296875);
        float _175 = (*spvDescriptorSet0.fp_c3)._m0[0].y + (-1.0);
        float _177 = fma(_109, _175, 1.0);
        float _179 = log2(_177);
        float _181 = -_171;
        float _183 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
        float _185 = 1.0 / _183;
        bool _187 = _185 >= _173;
        bool _189 = isnan(_185);
        bool _191 = _187 || _189;
        bool _193 = isnan(_173);
        bool _195 = _191 || _193;
        float _197 = float(_195);
        float _199 = fma(_197, _157, _63);
        float _201 = precise::clamp(_199, 0.0, 1.0);
        float _203 = fma(_197, _147, _65);
        float _205 = precise::clamp(_203, 0.0, 1.0);
        float2 _478 = float2(_201, _205);
        float3 _209 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_478, float2(0.0), isnan(_478)), bias(_179)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_478, float2(0.0), isnan(_478)), bias(_179)).xyz;
        float _211 = _209.x;
        float _213 = _209.y;
        float _215 = _209.z;
        out.m_40.x = _211;
        out.m_40.y = _213;
        out.m_40.z = _215;
        out.m_40.w = 1.0;
        return out;
    }
    discard_fragment();
    return out;
}

