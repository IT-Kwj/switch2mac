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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_43 [[user(locn5)]];
    float4 m_41 [[user(locn6)]];
    float4 m_54 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_37.z;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.w;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _456 = float2(_77, _79);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_456, float2(0.0), isnan(_456))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_456, float2(0.0), isnan(_456))).x;
    float _83 = in.m_39.w;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_37.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_37.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_39.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_39.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = _75 * _87;
    float _115 = _75 * _93;
    float _117 = 1.0 / _113;
    float _119 = _75 * _105;
    float _121 = fma(_81, 2.0, -1.0);
    float _123 = _75 * _99;
    float _125 = _75 * _111;
    float _127 = _119 * _117;
    float _129 = fma(_121, (*spvDescriptorSet0.fp_c9)._m0[191].y, _115);
    float _131 = fma(_121, (*spvDescriptorSet0.fp_c9)._m0[191].y, _123);
    float _133 = _125 * _117;
    float2 _544 = float2(_129, _131);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_544, float2(0.0), isnan(_544))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_544, float2(0.0), isnan(_544))).w;
    float2 _552 = float2(_127, _133);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_552, float2(0.0), isnan(_552))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_552, float2(0.0), isnan(_552))).x;
    float _139 = in.m_41.y;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_43.w;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_39.z;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_45.w;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_47.w;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = _75 * _143;
    float _171 = _75 * _149;
    float _173 = _75 * _155;
    float _175 = fma(_169, -1.66666662693023681640625, 1.66666662693023681640625);
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = _173 * _117;
    float _181 = fma(_177, -2.0, 3.0);
    float _183 = _177 * _177;
    float _185 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _187 = fma(_179, (*spvDescriptorSet0.fp_c8)._m0[30].w, _185);
    float _189 = _181 * _183;
    float _191 = 1.0 / _187;
    float _193 = in.m_45.z;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = _135 * _171;
    float _201 = _75 * _161;
    float _203 = in.m_49.x;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = _199 * _189;
    float _211 = -_201;
    float _213 = _211 + 1.0;
    float _215 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _217 = fma(_137, (*spvDescriptorSet0.fp_c8)._m0[30].w, _215);
    float _219 = -_201;
    float _221 = _219 + 1.2999999523162841796875;
    float _223 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _225 = precise::max(_213, _209);
    float _227 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _229 = _191 * _227;
    float _231 = precise::min(_221, _225);
    float _233 = 1.0 / _217;
    float _235 = -_213;
    float _237 = _235 + _231;
    float _239 = _75 * _167;
    float _241 = _237 * 3.3333339691162109375;
    float _243 = _171 * _241;
    float _245 = _239 * _243;
    float _247 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _249 = -_229;
    float _251 = fma(_233, _247, _249);
    float _253 = 0.0 + _245;
    float _255 = precise::clamp(_253, 0.0, 1.0);
    float _257 = _251 * _223;
    float _259 = precise::clamp(_257, 0.0, 1.0);
    float _261 = _75 * _207;
    float _263 = _255 * _259;
    float _265 = _263 * _261;
    bool _269 = _265 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _271 = isnan(_265);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _277 = _273 || _275;
    float _279 = in.m_47.x;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = in.m_45.x;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = in.m_47.y;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = in.m_45.y;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_47.z;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = _229;
    if (!_277)
    {
        discard_fragment();
    }
    float _311 = _75 * _283;
    float _313 = _75 * _289;
    float _315 = _75 * _295;
    float _317 = _75 * _301;
    float _319 = _75 * _307;
    float _321 = _75 * _197;
    float _323 = -_311;
    float _325 = _323 + _313;
    float _327 = -_315;
    float _329 = _327 + _317;
    float _331 = -_319;
    float _333 = _331 + _321;
    float _335 = fma(_169, _325, _311);
    float _337 = fma(_169, _329, _315);
    float _339 = fma(_169, _333, _319);
    if (!_277)
    {
        out.m_52.x = _335;
        out.m_52.y = _337;
        out.m_52.z = _339;
        out.m_52.w = _245;
        return out;
    }
    float _341 = _337 * 0.715200006961822509765625;
    float _343 = in.m_54.w;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = in.m_54.x;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = in.m_54.y;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = fma(_335, 0.2125999927520751953125, _341);
    float _363 = in.m_54.z;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = fma(_339, 0.072200000286102294921875, _361);
    bool _371 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _373 = 1.0 / _369;
    float _375 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_371)
    {
        float _377 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _379 = _229 + _377;
        _309 = _379;
    }
    float _381 = _309;
    float _383 = _373 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _385 = precise::clamp(_383, 0.0, 1.0);
    float _387 = fma(_385, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _389 = _75 * _347;
    if (_371)
    {
        float _391 = _381 * 8.0;
        float _393 = precise::clamp(_391, 0.0, 1.0);
        _375 = _393;
    }
    float _395 = _375;
    float _397 = _75 * _359;
    float _399 = _387 * _389;
    float _401 = 0.0 + _265;
    float _403 = precise::clamp(_401, 0.0, 1.0);
    float _405 = _75 * _353;
    float _407 = _75 * _367;
    float _409 = fma(_337, _399, _397);
    float _411 = _403;
    if (_371)
    {
        float _413 = _403 * _395;
        _411 = _413;
    }
    float _415 = _411;
    float _417 = fma(_335, _399, _405);
    float _419 = fma(_339, _399, _407);
    float _421 = 0.0 + _415;
    float _423 = precise::clamp(_421, 0.0, 1.0);
    out.m_52.x = _417;
    out.m_52.y = _409;
    out.m_52.z = _419;
    out.m_52.w = _423;
    return out;
}

