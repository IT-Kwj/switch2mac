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
    float _75 = in.m_37.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _49;
    float _89 = _87 * _55;
    float _91 = _87 * _61;
    float _93 = _87 * _67;
    float _95 = _87 * _73;
    float _97 = _87 * _79;
    float _99 = _87 * _85;
    float2 _387 = float2(_89, _91);
    float4 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_387, float2(0.0), isnan(_387))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_387, float2(0.0), isnan(_387))).xyzw;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float _110 = _102.w;
    float2 _406 = float2(_93, _95);
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_406, float2(0.0), isnan(_406))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_406, float2(0.0), isnan(_406))).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float2 _422 = float2(_99, _97);
    float4 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_422, float2(0.0), isnan(_422))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_422, float2(0.0), isnan(_422))).xyzw;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = _122.z;
    float _130 = _122.w;
    float _132 = in.m_39.w;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    int _139 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 128;
    bool _143 = _139 != 0;
    int _145 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 32768;
    bool _147 = _145 != 0;
    float _149 = in.m_39.z;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_39.x;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = precise::max(_110, _120);
    float _163 = _104 * _114;
    float _165 = _161;
    if (_143)
    {
        float _167 = precise::min(_110, _120);
        _165 = _167;
    }
    float _169 = _165;
    float _171 = _108 * _118;
    float _173 = _106 * _116;
    float _175 = precise::max(_169, _130);
    float _177 = _171 * 2.0;
    float _179 = _175;
    if (_147)
    {
        float _181 = precise::min(_169, _130);
        _179 = _181;
    }
    float _183 = _179;
    float _185 = _163 * 2.0;
    float _187 = in.m_39.y;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    bool _193 = _163 >= 0.5;
    bool _195 = isnan(_163);
    bool _197 = _193 || _195;
    bool _199 = isnan(0.5);
    bool _201 = _197 || _199;
    float _203 = -_128;
    float _205 = _203 + 1.0;
    float _207 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _209 = _128 * _177;
    float _211 = _87 * _136;
    bool _213 = _173 >= 0.5;
    bool _215 = isnan(_173);
    bool _217 = _213 || _215;
    bool _219 = isnan(0.5);
    bool _221 = _217 || _219;
    float _223 = -_124;
    float _225 = _223 + 1.0;
    bool _227 = _171 >= 0.5;
    bool _229 = isnan(_171);
    bool _231 = _227 || _229;
    bool _233 = isnan(0.5);
    bool _235 = _231 || _233;
    float _237 = _124 * _185;
    float _239 = -_185;
    float _241 = _239 + 2.0;
    float _243 = _207 * _211;
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = _173 * 2.0;
    float _249 = -_126;
    float _251 = _249 + 1.0;
    float _253 = _237;
    float _255 = _209;
    if (_201)
    {
        float _257 = -_241;
        float _259 = fma(_257, _225, 1.0);
        _253 = _259;
    }
    float _261 = _253;
    float _263 = -_177;
    float _265 = _263 + 2.0;
    float _267 = _126 * _247;
    bool _269 = _245 != 0.0;
    bool _271 = isnan(_245);
    bool _273 = _269 || _271;
    bool _275 = isnan(0.0);
    bool _277 = _273 || _275;
    float _279 = -_247;
    float _281 = _279 + 2.0;
    float _283 = _87 * _159;
    float _285 = _267;
    if (_221)
    {
        float _287 = -_281;
        float _289 = fma(_287, _251, 1.0);
        _285 = _289;
    }
    float _291 = _285;
    if (_235)
    {
        float _293 = -_265;
        float _295 = fma(_293, _205, 1.0);
        _255 = _295;
    }
    float _297 = _255;
    float _299 = fma(_261, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _301 = fma(_291, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _303 = fma(_297, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _305 = _299 * _283;
    float _307 = _87 * _191;
    float _309 = _87 * _153;
    float _311 = _301 * _307;
    float _313 = _303 * _309;
    if (_277)
    {
        out.m_42.x = _305;
        out.m_42.y = _311;
        out.m_42.z = _313;
        out.m_42.w = _245;
        return out;
    }
    discard_fragment();
    return out;
}

