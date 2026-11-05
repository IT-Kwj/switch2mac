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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_47 [[user(locn7)]];
    float4 m_54 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_37.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_39.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_39.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_37.x;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_37.y;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = 1.0 / _61;
    float _107 = _105 * _67;
    float _109 = _105 * _73;
    float _111 = _105 * _79;
    float _113 = _105 * _85;
    float _115 = _105 * _91;
    float _117 = _105 * _97;
    float2 _497 = float2(_109, _107);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_497, float2(0.0), isnan(_497))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_497, float2(0.0), isnan(_497))).w;
    float _121 = 1.0 / _111;
    float _123 = _105 * _103;
    float _125 = _113 * _121;
    float _127 = _115 * _121;
    float2 _519 = float2(_125, _127);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_519, float2(0.0), isnan(_519))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_519, float2(0.0), isnan(_519))).x;
    float2 _527 = float2(_117, _123);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_527, float2(0.0), isnan(_527))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_527, float2(0.0), isnan(_527))).w;
    float _133 = in.m_41.y;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_41.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = _105 * _137;
    float _147 = _119 * 0.300000011920928955078125;
    float _149 = fma(_145, 1.5, _147);
    float _151 = _105 * _143;
    float2 _563 = float2(_151, _149);
    float _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_563, float2(0.0), isnan(_563))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_563, float2(0.0), isnan(_563))).w;
    float _155 = in.m_39.z;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = _105 * _159;
    float _163 = _131 + _119;
    float _165 = in.m_43.x;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = _161 * _121;
    float _173 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _175 = fma(_171, (*spvDescriptorSet0.fp_c8)._m0[30].w, _173);
    float _177 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _179 = fma(_129, (*spvDescriptorSet0.fp_c8)._m0[30].w, _177);
    float _181 = 1.0 / _179;
    float _183 = 1.0 / _175;
    float _185 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _187 = _183 * _185;
    float _189 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _191 = -_187;
    float _193 = fma(_181, _189, _191);
    float _195 = precise::max(_163, 0.949999988079071044921875);
    bool _199 = _163 >= 1.2999999523162841796875;
    bool _201 = isnan(_163);
    bool _203 = _199 || _201;
    bool _205 = isnan(1.2999999523162841796875);
    bool _207 = _203 || _205;
    float _209 = float(_207);
    float _211 = _193 * 0.20000000298023223876953125;
    float _213 = precise::clamp(_211, 0.0, 1.0);
    float _215 = precise::min(_195, 1.14999997615814208984375);
    float _217 = fma(_215, 5.000000476837158203125, -4.750000476837158203125);
    float _219 = -_217;
    float _221 = _219 + _209;
    float _223 = _213 + _153;
    float _225 = precise::max(_223, 0.20000000298023223876953125);
    float _227 = precise::min(_225, 0.300000011920928955078125);
    float _229 = fma(_221, 0.699999988079071044921875, _217);
    float _231 = fma(_227, 9.99999904632568359375, -1.99999988079071044921875);
    float _233 = _229 * _231;
    float _235 = _105 * _169;
    float _237 = 0.0 + _233;
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = _239 * _235;
    bool _243 = _241 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _245 = isnan(_241);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _251 = _247 || _249;
    float _253 = in.m_45.x;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = in.m_47.y;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = _187;
    if (!_251)
    {
        discard_fragment();
    }
    float _267 = in.m_49.x;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = _105 * _257;
    float _275 = _105 * _263;
    float _277 = in.m_49.y;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = precise::max(0.0, _275);
    float _285 = precise::min(_283, 0.64999997615814208984375);
    float _287 = _285 * 1.53846156597137451171875;
    float _289 = _105 * _271;
    float _291 = -_287;
    float _293 = _291 + 1.0;
    float _295 = in.m_45.y;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = _289 * _293;
    float _303 = fma(_287, _273, _301);
    float _305 = _105 * _281;
    float _307 = _305 * _293;
    float _309 = in.m_49.z;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = _105 * _299;
    float _317 = fma(_287, _315, _307);
    float _319 = _105 * _313;
    float _321 = _319 * _293;
    float _323 = in.m_45.z;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = _105 * _327;
    float _331 = fma(_287, _329, _321);
    if (!_251)
    {
        out.m_52.x = _303;
        out.m_52.y = _317;
        out.m_52.z = _331;
        out.m_52.w = _233;
        return out;
    }
    float _333 = _317 * 0.715200006961822509765625;
    float _335 = in.m_54.w;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_54.x;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = in.m_54.y;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = fma(_303, 0.2125999927520751953125, _333);
    float _355 = in.m_54.z;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = fma(_331, 0.072200000286102294921875, _353);
    bool _363 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _365 = 1.0 / _361;
    float _367 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_363)
    {
        float _369 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _371 = _187 + _369;
        _265 = _371;
    }
    float _373 = _265;
    float _375 = _365 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _377 = precise::clamp(_375, 0.0, 1.0);
    float _379 = fma(_377, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _381 = _105 * _339;
    if (_363)
    {
        float _383 = _373 * 8.0;
        float _385 = precise::clamp(_383, 0.0, 1.0);
        _367 = _385;
    }
    float _387 = _367;
    float _389 = _105 * _351;
    float _391 = _379 * _381;
    float _393 = 0.0 + _241;
    float _395 = precise::clamp(_393, 0.0, 1.0);
    float _397 = _105 * _345;
    float _399 = _105 * _359;
    float _401 = fma(_317, _391, _389);
    float _403 = _395;
    if (_363)
    {
        float _405 = _395 * _387;
        _403 = _405;
    }
    float _407 = _403;
    float _409 = fma(_303, _391, _397);
    float _411 = fma(_331, _391, _399);
    float _413 = 0.0 + _407;
    float _415 = precise::clamp(_413, 0.0, 1.0);
    out.m_52.x = _409;
    out.m_52.y = _401;
    out.m_52.z = _411;
    out.m_52.w = _415;
    return out;
}

