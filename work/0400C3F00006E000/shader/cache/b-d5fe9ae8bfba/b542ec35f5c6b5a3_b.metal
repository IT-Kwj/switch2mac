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
    float _49 = in.m_33.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_33.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.x;
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
    float2 _281 = float2(_87, _89);
    float4 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_281, float2(0.0), isnan(_281))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_281, float2(0.0), isnan(_281))).xyzw;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = _100.z;
    float _108 = _100.w;
    float2 _300 = float2(_93, _91);
    float4 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_300, float2(0.0), isnan(_300))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_300, float2(0.0), isnan(_300))).xyzw;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    float _118 = _110.w;
    float2 _316 = float2(_97, _95);
    float4 _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_316, float2(0.0), isnan(_316))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_316, float2(0.0), isnan(_316))).xyzw;
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = _120.z;
    float _128 = _120.w;
    int _131 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 128;
    bool _135 = _131 != 0;
    int _137 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 32768;
    bool _139 = _137 != 0;
    float _141 = precise::max(_108, _118);
    float _143 = _141;
    if (_135)
    {
        float _145 = precise::min(_108, _118);
        _143 = _145;
    }
    float _147 = _143;
    float _149 = -_118;
    float _151 = _149 + 1.0;
    float _153 = precise::max(_147, _128);
    float _155 = _102 * _151;
    float _157 = _153;
    if (_139)
    {
        float _159 = precise::min(_147, _128);
        _157 = _159;
    }
    float _161 = _157;
    float _163 = _104 * _151;
    float _165 = _106 * _151;
    float _167 = fma(_112, _118, _155);
    float _169 = -_128;
    float _171 = _169 + 1.0;
    float _173 = fma(_114, _118, _163);
    float _175 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = fma(_116, _118, _165);
    float _181 = _167 * _171;
    float _183 = _173 * _171;
    float _185 = _179 * _171;
    bool _187 = _177 != 0.0;
    bool _189 = isnan(_177);
    bool _191 = _187 || _189;
    bool _193 = isnan(0.0);
    bool _195 = _191 || _193;
    float _197 = fma(_122, _128, _181);
    float _199 = fma(_124, _128, _183);
    float _201 = fma(_126, _128, _185);
    float _203 = fma(_197, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _205 = fma(_201, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _207 = fma(_199, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    if (_195)
    {
        out.m_40.x = _203;
        out.m_40.y = _207;
        out.m_40.z = _205;
        out.m_40.w = _177;
        return out;
    }
    discard_fragment();
    return out;
}

