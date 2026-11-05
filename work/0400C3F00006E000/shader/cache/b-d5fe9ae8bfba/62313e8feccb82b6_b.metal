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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_51 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_43 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_56 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_39.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_39.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float2 _459 = float2(_79, _81);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_459, float2(0.0), isnan(_459))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_459, float2(0.0), isnan(_459))).x;
    float _85 = in.m_41.w;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_43.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_45.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_45.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_41.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_41.y;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = _77 * _89;
    float _123 = _77 * _95;
    float _125 = _77 * _101;
    float _127 = _77 * _107;
    float _129 = 1.0 / _121;
    float _131 = fma(_123, -0.25, 0.25);
    float _133 = _77 * _113;
    float _135 = _77 * _119;
    float _137 = _133 * _129;
    float _139 = _135 * _129;
    float _141 = fma(_83, _131, _125);
    float2 _547 = float2(_141, _127);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_547, float2(0.0), isnan(_547))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_547, float2(0.0), isnan(_547))).x;
    float2 _555 = float2(_137, _139);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_555, float2(0.0), isnan(_555))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_555, float2(0.0), isnan(_555))).x;
    float _147 = in.m_41.z;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_47.w;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_49.w;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = _77 * _151;
    float _167 = _165 * _129;
    float _169 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _171 = fma(_167, (*spvDescriptorSet0.fp_c8)._m0[30].w, _169);
    float _173 = _77 * _157;
    float _175 = in.m_51.x;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = 1.0 / _171;
    float _183 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _185 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _187 = _181 * _185;
    float _189 = _143 * _143;
    float _191 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _193 = fma(_145, (*spvDescriptorSet0.fp_c8)._m0[30].w, _191);
    float _195 = _173 + 0.300000011920928955078125;
    float _197 = precise::max(_173, _189);
    float _199 = 1.0 / _193;
    float _201 = precise::min(_195, _197);
    float _203 = -_173;
    float _205 = _203 + _201;
    float _207 = _77 * _163;
    float _209 = _205 * 3.3333332538604736328125;
    float _211 = _209 * _209;
    float _213 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _215 = -_187;
    float _217 = fma(_199, _213, _215);
    float _219 = _207 * _211;
    float _221 = _217 * _183;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = _77 * _179;
    float _227 = 0.0 + _219;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = _229 * _223;
    float _233 = _231 * _225;
    bool _237 = _233 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _239 = isnan(_233);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _245 = _241 || _243;
    float _247 = in.m_45.z;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = _187;
    if (!_245)
    {
        discard_fragment();
    }
    float _255 = _77 * _251;
    float _257 = fma(_83, _131, _255);
    float _259 = in.m_45.w;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = _77 * _263;
    float2 _734 = float2(_257, _265);
    float _267 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_734, float2(0.0), isnan(_734))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_734, float2(0.0), isnan(_734))).w;
    float _269 = in.m_49.x;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_47.x;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_49.y;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = in.m_47.y;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = in.m_49.z;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = in.m_47.z;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = -_189;
    float _307 = _305 + 1.0;
    float _309 = _77 * _273;
    float _311 = _77 * _279;
    float _313 = _77 * _285;
    float _315 = _77 * _291;
    float _317 = _77 * _297;
    float _319 = _77 * _303;
    float _321 = -_309;
    float _323 = _321 + _311;
    float _325 = -_313;
    float _327 = _325 + _315;
    float _329 = -_317;
    float _331 = _329 + _319;
    float _333 = _267 + _307;
    float _335 = precise::clamp(_333, 0.0, 1.0);
    float _337 = fma(_335, _323, _309);
    float _339 = fma(_335, _327, _313);
    float _341 = fma(_335, _331, _317);
    if (!_245)
    {
        out.m_54.x = _337;
        out.m_54.y = _339;
        out.m_54.z = _341;
        out.m_54.w = _219;
        return out;
    }
    float _343 = _339 * 0.715200006961822509765625;
    float _345 = in.m_56.w;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = in.m_56.x;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = in.m_56.y;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = fma(_337, 0.2125999927520751953125, _343);
    float _365 = in.m_56.z;
    float _367 = gl_FragCoord.w;
    float _369 = _365 * _367;
    float _371 = fma(_341, 0.072200000286102294921875, _363);
    bool _373 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _375 = 1.0 / _371;
    float _377 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_373)
    {
        float _379 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _381 = _187 + _379;
        _253 = _381;
    }
    float _383 = _253;
    float _385 = _375 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _387 = precise::clamp(_385, 0.0, 1.0);
    float _389 = fma(_387, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _391 = _77 * _349;
    if (_373)
    {
        float _393 = _383 * 8.0;
        float _395 = precise::clamp(_393, 0.0, 1.0);
        _377 = _395;
    }
    float _397 = _377;
    float _399 = _77 * _361;
    float _401 = _389 * _391;
    float _403 = 0.0 + _233;
    float _405 = precise::clamp(_403, 0.0, 1.0);
    float _407 = _77 * _355;
    float _409 = _77 * _369;
    float _411 = fma(_339, _401, _399);
    float _413 = _405;
    if (_373)
    {
        float _415 = _405 * _397;
        _413 = _415;
    }
    float _417 = _413;
    float _419 = fma(_337, _401, _407);
    float _421 = fma(_341, _401, _409);
    float _423 = 0.0 + _417;
    float _425 = precise::clamp(_423, 0.0, 1.0);
    out.m_54.x = _419;
    out.m_54.y = _411;
    out.m_54.z = _421;
    out.m_54.w = _425;
    return out;
}

