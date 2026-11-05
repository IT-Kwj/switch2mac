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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_43 [[user(locn7)]];
    float4 m_56 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_37.w;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_37.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_39.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_39.z;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_39.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_39.w;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = 1.0 / _63;
    float _109 = _107 * _69;
    float _111 = _107 * _75;
    float _113 = _107 * _81;
    float _115 = _107 * _87;
    float _117 = _107 * _93;
    float _119 = _107 * _99;
    float _121 = 1.0 / _109;
    float _123 = _111 * _121;
    float _125 = _113 * _121;
    float _127 = _107 * _105;
    float2 _530 = float2(_123, _125);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_530, float2(0.0), isnan(_530))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_530, float2(0.0), isnan(_530))).x;
    float2 _541 = float2(_115, _119);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_541, float2(0.0), isnan(_541))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_541, float2(0.0), isnan(_541))).w;
    float2 _549 = float2(_117, _127);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_549, float2(0.0), isnan(_549))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_549, float2(0.0), isnan(_549))).w;
    float _135 = in.m_41.y;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_41.x;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_41.z;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_43.y;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_43.x;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_43.z;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = in.m_37.z;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _179 = _177 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _181 = _107 * _139;
    float _183 = _107 * _145;
    float _185 = _181 * _181;
    float _187 = _107 * _151;
    float _189 = fma(_183, _183, _185);
    float _191 = fma(_187, _187, _189);
    float _193 = rsqrt(_191);
    float _195 = _107 * _157;
    float _197 = _181 * _193;
    float _199 = _183 * _193;
    float _201 = _107 * _169;
    float _203 = _195 * _197;
    float _205 = _107 * _163;
    float _207 = _187 * _193;
    float _209 = 1.0 / _179;
    float _211 = in.m_45.w;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = fma(_205, _199, _203);
    float _219 = _107 * _175;
    float _221 = in.m_47.w;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_49.w;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = fma(_201, _207, _217);
    float _235 = _219 * _121;
    float _237 = abs(_233);
    float _239 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _241 = _237 + _239;
    float _243 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _245 = fma(_235, (*spvDescriptorSet0.fp_c8)._m0[30].w, _243);
    float _247 = _241 * _209;
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = 1.0 / _245;
    float _253 = in.m_51.x;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = fma(_249, -2.0, 3.0);
    float _261 = _249 * _249;
    float _263 = _259 * _261;
    float _265 = _107 * _215;
    float _267 = _107 * _231;
    float _269 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _271 = fma(_129, (*spvDescriptorSet0.fp_c8)._m0[30].w, _269);
    float _273 = _107 * _225;
    float _275 = _131 + _133;
    float _277 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _279 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _281 = _251 * _279;
    float _283 = -_265;
    float _285 = fma(_275, _273, _283);
    float _287 = _285 * 4.0;
    float _289 = precise::clamp(_287, 0.0, 1.0);
    float _291 = 1.0 / _271;
    float _293 = _267 * _289;
    float _295 = 0.0 + _293;
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _301 = -_281;
    float _303 = fma(_291, _299, _301);
    float _305 = _303 * _277;
    float _307 = precise::clamp(_305, 0.0, 1.0);
    float _309 = _297 * _307;
    float _311 = _107 * _257;
    float _313 = _309 * _263;
    float _315 = _313 * _311;
    bool _319 = _315 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _321 = isnan(_315);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _327 = _323 || _325;
    float _329 = in.m_45.y;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_45.x;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_45.z;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = _281;
    if (!_327)
    {
        discard_fragment();
    }
    float _349 = _107 * _333;
    float _351 = _107 * _339;
    float _353 = _107 * _345;
    if (!_327)
    {
        out.m_54.x = _351;
        out.m_54.y = _349;
        out.m_54.z = _353;
        out.m_54.w = _293;
        return out;
    }
    float _355 = _349 * 0.715200006961822509765625;
    float _357 = in.m_56.w;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = in.m_56.x;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_56.y;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = fma(_351, 0.2125999927520751953125, _355);
    float _377 = in.m_56.z;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float _383 = fma(_353, 0.072200000286102294921875, _375);
    bool _385 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _387 = 1.0 / _383;
    float _389 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_385)
    {
        float _391 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _393 = _281 + _391;
        _347 = _393;
    }
    float _395 = _347;
    float _397 = _387 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _399 = precise::clamp(_397, 0.0, 1.0);
    float _401 = fma(_399, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _403 = _107 * _361;
    if (_385)
    {
        float _405 = _395 * 8.0;
        float _407 = precise::clamp(_405, 0.0, 1.0);
        _389 = _407;
    }
    float _409 = _389;
    float _411 = _107 * _373;
    float _413 = _401 * _403;
    float _415 = 0.0 + _315;
    float _417 = precise::clamp(_415, 0.0, 1.0);
    float _419 = _107 * _367;
    float _421 = _107 * _381;
    float _423 = fma(_349, _413, _411);
    float _425 = _417;
    if (_385)
    {
        float _427 = _417 * _409;
        _425 = _427;
    }
    float _429 = _425;
    float _431 = fma(_351, _413, _419);
    float _433 = fma(_353, _413, _421);
    float _435 = 0.0 + _429;
    float _437 = precise::clamp(_435, 0.0, 1.0);
    out.m_54.x = _431;
    out.m_54.y = _423;
    out.m_54.z = _433;
    out.m_54.w = _437;
    return out;
}

