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
    float2 _393 = float2(_89, _91);
    float4 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_393, float2(0.0), isnan(_393))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_393, float2(0.0), isnan(_393))).xyzw;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float _110 = _102.w;
    float2 _412 = float2(_93, _95);
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_412, float2(0.0), isnan(_412))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_412, float2(0.0), isnan(_412))).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float2 _428 = float2(_97, _99);
    float4 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_428, float2(0.0), isnan(_428))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_428, float2(0.0), isnan(_428))).xyzw;
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
    float _149 = in.m_39.y;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = precise::max(_110, _120);
    float _157 = _104 * 2.0;
    float _159 = _155;
    if (_143)
    {
        float _161 = precise::min(_110, _120);
        _159 = _161;
    }
    float _163 = _159;
    float _165 = -_116;
    float _167 = _165 + 1.0;
    float _169 = in.m_39.z;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_39.x;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = precise::max(_163, _130);
    float _183 = _114 * _157;
    float _185 = _181;
    float _187 = _183;
    if (_147)
    {
        float _189 = precise::min(_163, _130);
        _185 = _189;
    }
    float _191 = _185;
    float _193 = -_118;
    float _195 = _193 + 1.0;
    bool _197 = _104 >= 0.5;
    bool _199 = isnan(_104);
    bool _201 = _197 || _199;
    bool _203 = isnan(0.5);
    bool _205 = _201 || _203;
    float _207 = _106 * 2.0;
    bool _209 = _106 >= 0.5;
    bool _211 = isnan(_106);
    bool _213 = _209 || _211;
    bool _215 = isnan(0.5);
    bool _217 = _213 || _215;
    float _219 = _108 * 2.0;
    bool _221 = _108 >= 0.5;
    bool _223 = isnan(_108);
    bool _225 = _221 || _223;
    bool _227 = isnan(0.5);
    bool _229 = _225 || _227;
    float _231 = -_114;
    float _233 = _231 + 1.0;
    float _235 = _116 * _207;
    float _237 = _118 * _219;
    float _239 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _241 = _87 * _136;
    float _243 = -_157;
    float _245 = _243 + 2.0;
    float _247 = -_207;
    float _249 = _247 + 2.0;
    float _251 = -_219;
    float _253 = _251 + 2.0;
    float _255 = _239 * _241;
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = _235;
    float _261 = _237;
    if (_205)
    {
        float _263 = -_245;
        float _265 = fma(_263, _233, 1.0);
        _187 = _265;
    }
    float _267 = _187;
    if (_217)
    {
        float _269 = -_249;
        float _271 = fma(_269, _167, 1.0);
        _259 = _271;
    }
    float _273 = _259;
    if (_229)
    {
        float _275 = -_253;
        float _277 = fma(_275, _195, 1.0);
        _261 = _277;
    }
    float _279 = _261;
    bool _281 = _257 != 0.0;
    bool _283 = isnan(_257);
    bool _285 = _281 || _283;
    bool _287 = isnan(0.0);
    bool _289 = _285 || _287;
    float _291 = fma(_126, _130, _273);
    float _293 = fma(_124, _130, _267);
    float _295 = fma(_128, _130, _279);
    float _297 = _87 * _153;
    float _299 = fma(_293, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _301 = _87 * _173;
    float _303 = fma(_291, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _305 = _87 * _179;
    float _307 = fma(_295, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _309 = _303 * _297;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = _299 * _305;
    float _315 = precise::clamp(_313, 0.0, 1.0);
    float _317 = _307 * _301;
    float _319 = precise::clamp(_317, 0.0, 1.0);
    if (_289)
    {
        out.m_42.x = _315;
        out.m_42.y = _311;
        out.m_42.z = _319;
        out.m_42.w = _257;
        return out;
    }
    discard_fragment();
    return out;
}

