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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_33.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_35.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_33.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _47;
    float _87 = _85 * _53;
    float _89 = _85 * _59;
    float _91 = _85 * _65;
    float _93 = _85 * _71;
    float _95 = _85 * _77;
    float _97 = _85 * _83;
    float2 _277 = float2(_93, _87);
    float4 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_277, float2(0.0), isnan(_277))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_277, float2(0.0), isnan(_277))).xyzw;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = _100.z;
    float _108 = _100.w;
    float2 _296 = float2(_89, _91);
    float4 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_296, float2(0.0), isnan(_296))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_296, float2(0.0), isnan(_296))).xyzw;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    float _118 = _110.w;
    float2 _312 = float2(_97, _95);
    float4 _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_312, float2(0.0), isnan(_312))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_312, float2(0.0), isnan(_312))).xyzw;
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = _120.z;
    float _128 = _120.w;
    int _131 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 128;
    bool _135 = _131 != 0;
    int _137 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 32768;
    bool _139 = _137 != 0;
    float _141 = precise::max(_108, _118);
    float _143 = fma(_112, _118, _102);
    float _145 = _141;
    if (_135)
    {
        float _147 = precise::min(_108, _118);
        _145 = _147;
    }
    float _149 = _145;
    float _151 = fma(_114, _118, _104);
    float _153 = fma(_116, _118, _106);
    float _155 = precise::max(_149, _128);
    float _157 = -_128;
    float _159 = _157 + 1.0;
    float _161 = _155;
    if (_139)
    {
        float _163 = precise::min(_149, _128);
        _161 = _163;
    }
    float _165 = _161;
    float _167 = _143 * _159;
    float _169 = _151 * _159;
    float _171 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _173 = precise::clamp(_171, 0.0, 1.0);
    float _175 = _153 * _159;
    float _177 = fma(_122, _128, _167);
    float _179 = fma(_124, _128, _169);
    float _181 = fma(_126, _128, _175);
    bool _183 = _173 != 0.0;
    bool _185 = isnan(_173);
    bool _187 = _183 || _185;
    bool _189 = isnan(0.0);
    bool _191 = _187 || _189;
    float _193 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _195 = precise::clamp(_193, 0.0, 1.0);
    float _197 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _199 = precise::clamp(_197, 0.0, 1.0);
    float _201 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _203 = precise::clamp(_201, 0.0, 1.0);
    if (_191)
    {
        out.m_40.x = _195;
        out.m_40.y = _199;
        out.m_40.z = _203;
        out.m_40.w = _173;
        return out;
    }
    discard_fragment();
    return out;
}

