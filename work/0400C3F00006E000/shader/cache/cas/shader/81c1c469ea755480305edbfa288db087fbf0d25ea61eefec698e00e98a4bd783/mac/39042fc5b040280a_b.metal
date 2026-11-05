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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_43 [[user(locn5), flat]];
    float4 m_41 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_53 [[user(locn8)]];
    float4 m_60 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _67 = gl_FragCoord.w;
    float _69 = in.m_39.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _67;
    float _83 = _81 * _73;
    float _85 = _81 * _79;
    float2 _503 = float2(_85, _83);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_503, float2(0.0), isnan(_503))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_503, float2(0.0), isnan(_503))).w;
    float _89 = in.m_41.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_43.x;
    float _97 = in.m_41.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_41.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_39.w;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_39.z;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = _81 * _93;
    float _123 = -_95;
    float _125 = _123 + 1.0;
    float _127 = _81 * _101;
    float _129 = _81 * _107;
    float _131 = _81 * _113;
    float _133 = fma(_125, _125, 0.4000000059604644775390625);
    float _135 = 1.0 / _121;
    float _137 = _127 * _135;
    float _139 = _129 * _135;
    float2 _581 = float2(_137, _139);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_581, float2(0.0), isnan(_581))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_581, float2(0.0), isnan(_581))).x;
    float _143 = _87 * (-0.300000011920928955078125);
    float _145 = fma(_143, _133, _131);
    float _147 = _81 * _119;
    float2 _599 = float2(_147, _145);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_599, float2(0.0), isnan(_599))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_599, float2(0.0), isnan(_599))).w;
    float _151 = in.m_45.w;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_41.z;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_47.w;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_49.w;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _177 = _81 * _155;
    float _179 = _81 * _161;
    float _181 = _179 * _135;
    float _183 = abs(_177);
    float _185 = log2(_183);
    float _187 = _81 * _167;
    float _189 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _191 = fma(_181, (*spvDescriptorSet0.fp_c8)._m0[30].w, _189);
    float _193 = in.m_51.x;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = _187 + (-1.0);
    float _201 = 1.0 / _191;
    float _203 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _205 = fma(_141, (*spvDescriptorSet0.fp_c8)._m0[30].w, _203);
    float _207 = _185 * 0.5;
    float _209 = 1.0 / _205;
    float _211 = exp2(_207);
    float _213 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _215 = _81 * _173;
    float _217 = fma(_149, _211, _199);
    float _219 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _221 = _201 * _219;
    float _223 = _81 * _197;
    float _225 = _217 * _175;
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = fma(_227, -2.0, 3.0);
    float _231 = _227 * _227;
    float _233 = _229 * _231;
    float _235 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _237 = -_221;
    float _239 = fma(_209, _235, _237);
    float _241 = _215 * _233;
    float _243 = _239 * _213;
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = 0.0 + _241;
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = _249 * _245;
    float _253 = _251 * _223;
    bool _257 = _253 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _259 = isnan(_253);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _265 = _261 || _263;
    float _267 = in.m_53.x;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = in.m_53.y;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = _221;
    if (!_265)
    {
        discard_fragment();
    }
    float _281 = _81 * _271;
    float _283 = _81 * _277;
    float2 _795 = float2(_281, _283);
    float _285 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_795, float2(0.0), isnan(_795))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_795, float2(0.0), isnan(_795))).x;
    float _287 = in.m_55.y;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = in.m_49.y;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = in.m_49.x;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = in.m_47.x;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = in.m_47.y;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = in.m_49.z;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = in.m_47.z;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = _81 * _291;
    float _331 = 0.0 + _329;
    float _333 = precise::clamp(_331, 0.0, 1.0);
    float _335 = fma(_333, -2.0, 3.0);
    float _337 = _333 * _333;
    float _339 = _335 * _337;
    float _341 = _81 * _297;
    float _343 = fma(_285, 0.5, 0.5);
    float _345 = -_339;
    float _347 = _345 + _343;
    float _349 = fma(_347, 0.300000011920928955078125, _339);
    float _351 = precise::clamp(_349, 0.0, 1.0);
    float _353 = _81 * _303;
    float _355 = _81 * _309;
    float _357 = _81 * _315;
    float _359 = fma(_351, -2.0, 3.0);
    float _361 = _351 * _351;
    float _363 = _81 * _321;
    float _365 = _81 * _327;
    float _367 = -_353;
    float _369 = _367 + _355;
    float _371 = _359 * _361;
    float _373 = -_341;
    float _375 = _373 + _357;
    float _377 = -_363;
    float _379 = _377 + _365;
    float _381 = fma(_371, _369, _353);
    float _383 = fma(_371, _375, _341);
    float _385 = fma(_371, _379, _363);
    if (!_265)
    {
        out.m_58.x = _381;
        out.m_58.y = _383;
        out.m_58.z = _385;
        out.m_58.w = _241;
        return out;
    }
    float _387 = _383 * 0.715200006961822509765625;
    float _389 = in.m_60.w;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = in.m_60.x;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = in.m_60.y;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = fma(_381, 0.2125999927520751953125, _387);
    float _409 = in.m_60.z;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    bool _415 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _417 = fma(_385, 0.072200000286102294921875, _407);
    float _419 = 1.0 / _417;
    if (_415)
    {
        float _421 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _423 = _221 + _421;
        _279 = _423;
    }
    float _425 = _279;
    float _427 = _419 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _429 = precise::clamp(_427, 0.0, 1.0);
    float _431 = fma(_429, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _433 = _81 * _393;
    float _435 = _393;
    if (_415)
    {
        float _437 = _425 * 8.0;
        float _439 = precise::clamp(_437, 0.0, 1.0);
        _435 = _439;
    }
    float _441 = _435;
    float _443 = _81 * _405;
    float _445 = _431 * _433;
    float _447 = 0.0 + _253;
    float _449 = precise::clamp(_447, 0.0, 1.0);
    float _451 = _81 * _399;
    float _453 = _81 * _413;
    float _455 = fma(_383, _445, _443);
    float _457 = _449;
    if (_415)
    {
        float _459 = _449 * _441;
        _457 = _459;
    }
    float _461 = _457;
    float _463 = fma(_381, _445, _451);
    float _465 = fma(_385, _445, _453);
    float _467 = 0.0 + _461;
    float _469 = precise::clamp(_467, 0.0, 1.0);
    out.m_58.x = _463;
    out.m_58.y = _455;
    out.m_58.z = _465;
    out.m_58.w = _469;
    return out;
}

