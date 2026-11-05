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
    constant _16* fp_c13 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_56 [[user(locn2), flat]];
    float4 m_39 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_54 [[user(locn6), flat]];
    float4 m_52 [[user(locn7)]];
    float4 m_41 [[user(locn8)]];
    float4 m_58 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_39.w;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_39.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_39.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_41.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_41.x;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_41.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_41.z;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = 1.0 / _65;
    float _111 = _109 * _71;
    float _113 = _109 * _77;
    float _115 = _109 * _83;
    float _117 = _109 * _95;
    float _119 = 1.0 / _111;
    float _121 = _109 * _101;
    float _123 = _113 * _119;
    float _125 = _115 * _119;
    float _127 = _109 * _89;
    float _129 = _109 * _107;
    float2 _490 = float2(_123, _125);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_490, float2(0.0), isnan(_490))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_490, float2(0.0), isnan(_490))).x;
    float2 _501 = float2(_117, _127);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_501, float2(0.0), isnan(_501))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_501, float2(0.0), isnan(_501))).w;
    float2 _509 = float2(_129, _121);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_509, float2(0.0), isnan(_509))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_509, float2(0.0), isnan(_509))).w;
    float _137 = in.m_39.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_43.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_45.w;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_47.x;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = _109 * _141;
    float _163 = _161 * _119;
    float _165 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _167 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _169 = fma(_163, (*spvDescriptorSet0.fp_c8)._m0[30].w, _167);
    float _171 = 1.0 / _169;
    float _173 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _175 = _171 * _173;
    float _177 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _179 = fma(_131, (*spvDescriptorSet0.fp_c8)._m0[30].w, _177);
    float _181 = _133 * _133;
    float _183 = 1.0 / _179;
    float _185 = _181 * _135;
    float _187 = _109 * _147;
    float _189 = _187 + 0.699999988079071044921875;
    float _191 = precise::max(_187, _185);
    float _193 = precise::min(_189, _191);
    float _195 = _109 * _153;
    float _197 = _133 * _195;
    float _199 = precise::clamp(_197, 0.0, 1.0);
    float _201 = -_187;
    float _203 = _201 + _193;
    float _205 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _207 = -_175;
    float _209 = fma(_183, _205, _207);
    float _211 = _109 * _159;
    float _213 = fma(_203, 1.4285714626312255859375, _199);
    float _215 = precise::clamp(_213, 0.0, 1.0);
    float _217 = _209 * _165;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = _215 * _219;
    float _223 = _221 * _211;
    bool _227 = _223 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _229 = isnan(_223);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _235 = _231 || _233;
    float _237 = in.m_43.x;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = in.m_43.y;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = in.m_43.z;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    if (!_235)
    {
        discard_fragment();
    }
    float _255 = _109 * _241;
    float _257 = _109 * _247;
    float _259 = _109 * _253;
    if (!_235)
    {
        out.m_50.x = _255;
        out.m_50.y = _257;
        out.m_50.z = _259;
        out.m_50.w = _215;
        return out;
    }
    float _261 = in.m_52.y;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = in.m_52.x;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = in.m_54.y;
    float _275 = in.m_54.x;
    float _277 = in.m_52.z;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_54.z;
    float _285 = in.m_56.x;
    float _287 = _109 * _265;
    float _289 = _109 * _271;
    float _291 = -_273;
    float _293 = _287 + _291;
    float _295 = -_275;
    float _297 = _289 + _295;
    float _299 = _109 * _281;
    float _301 = _285 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _303 = _293 * _293;
    float _305 = -_283;
    float _307 = _299 + _305;
    float _309 = in.m_58.w;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = fma(_297, _297, _303);
    float _317 = fma(_307, _307, _315);
    float _319 = -_317;
    float _321 = fma(_301, _301, _319);
    float _323 = _257 * 0.715200006961822509765625;
    float _325 = precise::max(0.0, _321);
    float _327 = fma(_255, 0.2125999927520751953125, _323);
    float _329 = sqrt(_325);
    float _331 = _109 * _313;
    float _333 = _209 + _329;
    float _335 = -_331;
    float _337 = _333 + _335;
    float _339 = _337 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _341 = _339 * (-1.44269502162933349609375);
    float _343 = fma(_259, 0.072200000286102294921875, _327);
    float _345 = exp2(_341);
    bool _347 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _349 = 1.0 / _343;
    float _351 = _329;
    if (_347)
    {
        float _353 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _355 = _175 + _353;
        _351 = _355;
    }
    float _357 = _351;
    float _359 = -_345;
    float _361 = _359 + 1.0;
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = _357;
    if (_347)
    {
        float _367 = _357 * 8.0;
        float _369 = precise::clamp(_367, 0.0, 1.0);
        _365 = _369;
    }
    float _371 = _365;
    float _373 = _223 * _363;
    float _375 = precise::clamp(_373, 0.0, 1.0);
    float _377 = _349 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _379 = precise::clamp(_377, 0.0, 1.0);
    float _381 = _375;
    if (_347)
    {
        float _383 = _375 * _371;
        _381 = _383;
    }
    float _385 = _381;
    float _387 = fma(_379, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _389 = 0.0 + _385;
    float _391 = precise::clamp(_389, 0.0, 1.0);
    float _393 = _255 * _387;
    float _395 = _257 * _387;
    float _397 = _259 * _387;
    out.m_50.x = _393;
    out.m_50.y = _395;
    out.m_50.z = _397;
    out.m_50.w = _391;
    return out;
}

