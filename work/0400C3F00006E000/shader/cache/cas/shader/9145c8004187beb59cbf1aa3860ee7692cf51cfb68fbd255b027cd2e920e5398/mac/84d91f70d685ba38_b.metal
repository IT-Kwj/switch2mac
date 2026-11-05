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
    float _51 = in.m_33.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_35.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_33.x;
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
    float2 _397 = float2(_95, _89);
    float4 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_397, float2(0.0), isnan(_397))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_397, float2(0.0), isnan(_397))).xyzw;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float _110 = _102.w;
    float2 _416 = float2(_91, _93);
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_416, float2(0.0), isnan(_416))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_416, float2(0.0), isnan(_416))).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float2 _432 = float2(_99, _97);
    float4 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_432, float2(0.0), isnan(_432))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_432, float2(0.0), isnan(_432))).xyzw;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = _122.z;
    float _130 = _122.w;
    float _132 = in.m_39.z;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    int _139 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 128;
    bool _143 = _139 != 0;
    int _145 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 32768;
    bool _147 = _145 != 0;
    float _149 = precise::max(_110, _120);
    float _151 = -_120;
    float _153 = _151 + 1.0;
    float _155 = _149;
    if (_143)
    {
        float _157 = precise::min(_110, _120);
        _155 = _157;
    }
    float _159 = _155;
    float _161 = in.m_39.w;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = _104 * _153;
    float _169 = precise::max(_159, _130);
    float _171 = _106 * _153;
    float _173 = _169;
    if (_147)
    {
        float _175 = precise::min(_159, _130);
        _173 = _175;
    }
    float _177 = _173;
    float _179 = _108 * _153;
    float _181 = in.m_39.x;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_39.y;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = fma(_114, _120, _167);
    float _195 = fma(_118, _120, _179);
    float _197 = fma(_116, _120, _171);
    float _199 = -_128;
    float _201 = _199 + 1.0;
    float _203 = _193 * 2.0;
    float _205 = _195 * 2.0;
    bool _207 = _193 >= 0.5;
    bool _209 = isnan(_193);
    bool _211 = _207 || _209;
    bool _213 = isnan(0.5);
    bool _215 = _211 || _213;
    float _217 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    bool _219 = _195 >= 0.5;
    bool _221 = isnan(_195);
    bool _223 = _219 || _221;
    bool _225 = isnan(0.5);
    bool _227 = _223 || _225;
    float _229 = _128 * _205;
    bool _231 = _197 >= 0.5;
    bool _233 = isnan(_197);
    bool _235 = _231 || _233;
    bool _237 = isnan(0.5);
    bool _239 = _235 || _237;
    float _241 = _124 * _203;
    float _243 = -_124;
    float _245 = _243 + 1.0;
    float _247 = -_203;
    float _249 = _247 + 2.0;
    float _251 = _197 * 2.0;
    float _253 = -_126;
    float _255 = _253 + 1.0;
    float _257 = -_205;
    float _259 = _257 + 2.0;
    float _261 = _126 * _251;
    float _263 = _241;
    float _265 = _229;
    float _267 = _261;
    if (_215)
    {
        float _269 = -_249;
        float _271 = fma(_269, _245, 1.0);
        _263 = _271;
    }
    float _273 = _263;
    float _275 = -_251;
    float _277 = _275 + 2.0;
    if (_227)
    {
        float _279 = -_259;
        float _281 = fma(_279, _201, 1.0);
        _265 = _281;
    }
    float _283 = _265;
    float _285 = _87 * _136;
    float _287 = _87 * _165;
    if (_239)
    {
        float _289 = -_277;
        float _291 = fma(_289, _255, 1.0);
        _267 = _291;
    }
    float _293 = _267;
    float _295 = _217 * _287;
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = _87 * _185;
    float _301 = _87 * _191;
    float _303 = fma(_283, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    bool _305 = _297 != 0.0;
    bool _307 = isnan(_297);
    bool _309 = _305 || _307;
    bool _311 = isnan(0.0);
    bool _313 = _309 || _311;
    float _315 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _317 = fma(_293, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _319 = _303 * _285;
    float _321 = _315 * _299;
    float _323 = _317 * _301;
    if (_313)
    {
        out.m_42.x = _321;
        out.m_42.y = _323;
        out.m_42.z = _319;
        out.m_42.w = _297;
        return out;
    }
    discard_fragment();
    return out;
}

