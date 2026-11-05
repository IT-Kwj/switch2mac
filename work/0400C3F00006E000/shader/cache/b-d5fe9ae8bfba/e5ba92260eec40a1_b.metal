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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
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
    float _57 = in.m_35.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_33.y;
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
    float2 _323 = float2(_91, _93);
    float4 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_323, float2(0.0), isnan(_323))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_323, float2(0.0), isnan(_323))).xyzw;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float _110 = _102.w;
    float2 _342 = float2(_89, _95);
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_342, float2(0.0), isnan(_342))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_342, float2(0.0), isnan(_342))).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float2 _358 = float2(_97, _99);
    float4 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_358, float2(0.0), isnan(_358))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_358, float2(0.0), isnan(_358))).xyzw;
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
    int _151 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 128;
    bool _155 = _151 != 0;
    int _157 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 32768;
    bool _159 = _157 != 0;
    float _161 = in.m_39.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = -_110;
    float _169 = _167 + 1.0;
    float _171 = precise::max(_120, _110);
    float _173 = _171;
    if (_155)
    {
        float _175 = precise::min(_120, _110);
        _173 = _175;
    }
    float _177 = _173;
    float _179 = _114 * _169;
    float _181 = _116 * _169;
    float _183 = _118 * _169;
    float _185 = fma(_104, _110, _179);
    float _187 = fma(_106, _110, _181);
    float _189 = fma(_108, _110, _183);
    float _191 = -_130;
    float _193 = _191 + 1.0;
    float _195 = precise::max(_177, _130);
    float _197 = _195;
    if (_159)
    {
        float _199 = precise::min(_177, _130);
        _197 = _199;
    }
    float _201 = _197;
    float _203 = _185 * _193;
    float _205 = _187 * _193;
    float _207 = _189 * _193;
    float _209 = _87 * _136;
    float _211 = fma(_201, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _213 = fma(_124, _130, _203);
    float _215 = fma(_128, _130, _207);
    float _217 = _211 * _209;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = fma(_126, _130, _205);
    float _223 = fma(_213, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _225 = _219 != 0.0;
    bool _227 = isnan(_219);
    bool _229 = _225 || _227;
    bool _231 = isnan(0.0);
    bool _233 = _229 || _231;
    float _235 = fma(_221, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _237 = _87 * _142;
    float _239 = _87 * _148;
    float _241 = _87 * _165;
    float _243 = fma(_215, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _245 = _223 * _237;
    float _247 = _235 * _239;
    float _249 = _243 * _241;
    if (_233)
    {
        out.m_42.x = _245;
        out.m_42.y = _247;
        out.m_42.z = _249;
        out.m_42.w = _219;
        return out;
    }
    discard_fragment();
    return out;
}

