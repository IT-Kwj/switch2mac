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
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_33.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_33.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _49;
    float _89 = _87 * _55;
    float _91 = _87 * _61;
    float _93 = _87 * _67;
    float _95 = _87 * _73;
    float _97 = _87 * _79;
    float _99 = _87 * _85;
    float2 _309 = float2(_89, _91);
    float4 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_309, float2(0.0), isnan(_309))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_309, float2(0.0), isnan(_309))).xyzw;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float _110 = _102.w;
    float2 _328 = float2(_93, _95);
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_328, float2(0.0), isnan(_328))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_328, float2(0.0), isnan(_328))).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float2 _344 = float2(_97, _99);
    float4 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_344, float2(0.0), isnan(_344))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_344, float2(0.0), isnan(_344))).xyzw;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = _122.z;
    float _130 = _122.w;
    float _132 = in.m_39.w;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_39.x;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_39.y;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_39.z;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    int _157 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 128;
    bool _161 = _157 != 0;
    int _163 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 32768;
    bool _165 = _163 != 0;
    float _167 = precise::max(_110, _120);
    float _169 = _167;
    if (_161)
    {
        float _171 = precise::min(_110, _120);
        _169 = _171;
    }
    float _173 = _169;
    float _175 = precise::max(_173, _130);
    float _177 = _124 * _130;
    float _179 = _175;
    if (_165)
    {
        float _181 = precise::min(_173, _130);
        _179 = _181;
    }
    float _183 = _179;
    float _185 = _87 * _136;
    float _187 = _126 * _130;
    float _189 = _128 * _130;
    float _191 = fma(_104, _114, _177);
    float _193 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _195 = fma(_106, _116, _187);
    float _197 = fma(_108, _118, _189);
    float _199 = _193 * _185;
    float _201 = precise::clamp(_199, 0.0, 1.0);
    float _203 = _87 * _142;
    float _205 = _87 * _148;
    bool _207 = _201 != 0.0;
    bool _209 = isnan(_201);
    bool _211 = _207 || _209;
    bool _213 = isnan(0.0);
    bool _215 = _211 || _213;
    float _217 = _87 * _154;
    float _219 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _221 = fma(_195, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _223 = fma(_197, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _225 = _219 * _203;
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = _221 * _205;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = _223 * _217;
    float _235 = precise::clamp(_233, 0.0, 1.0);
    if (_215)
    {
        out.m_42.x = _227;
        out.m_42.y = _231;
        out.m_42.z = _235;
        out.m_42.w = _201;
        return out;
    }
    discard_fragment();
    return out;
}

