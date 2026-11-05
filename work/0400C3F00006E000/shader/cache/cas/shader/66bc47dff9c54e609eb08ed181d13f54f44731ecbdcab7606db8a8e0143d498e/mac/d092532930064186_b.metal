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
    texture2d<float> fp_t_tcb_C [[id(2)]];
    sampler fp_t_tcb_CSmplr [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_43 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_45 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_35.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _59;
    float _87 = _85 * _65;
    float _89 = _85 * _71;
    float _91 = _85 * _77;
    float _93 = _85 * _83;
    float2 _516 = float2(_89, _93);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_516, float2(0.0), isnan(_516))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_516, float2(0.0), isnan(_516))).w;
    float2 _527 = float2(_87, _91);
    float2 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_527, float2(0.0), isnan(_527))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_527, float2(0.0), isnan(_527))).xw;
    float _101 = _99.x;
    float _103 = _99.y;
    float _105 = in.m_39.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_41.w;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_43.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = _85 * _109;
    float _125 = _85 * _115;
    float _127 = _85 * _121;
    float _129 = _103 * _95;
    float _131 = -_129;
    float _133 = _103 + _131;
    float _135 = fma(_123, _133, _129);
    bool _139 = _135 >= _125;
    bool _141 = isnan(_135);
    bool _143 = _139 || _141;
    bool _145 = isnan(_125);
    bool _147 = _143 || _145;
    float _149 = float(_147);
    float _151 = 0.0 + _149;
    float _153 = precise::clamp(_151, 0.0, 1.0);
    float _155 = _153 * _127;
    bool _157 = _155 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _159 = isnan(_155);
    bool _161 = _157 || _159;
    bool _163 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _165 = _161 || _163;
    float _167 = in.m_35.z;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_35.w;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    if (!_165)
    {
        discard_fragment();
    }
    float _179 = _85 * _171;
    float _181 = _85 * _177;
    float2 _646 = float2(_179, _181);
    float2 _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_646, float2(0.0), isnan(_646))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_646, float2(0.0), isnan(_646))).xy;
    float _185 = _183.x;
    float _187 = _183.y;
    float _189 = in.m_45.y;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_45.x;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_45.z;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_47.y;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_47.x;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_49.y;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_47.z;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_49.x;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = in.m_49.z;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = _85 * _193;
    float _245 = _85 * _199;
    float _247 = _85 * _205;
    float _249 = _243 * _243;
    float _251 = _85 * _217;
    float _253 = _85 * _223;
    float _255 = fma(_245, _245, _249);
    float _257 = _85 * _211;
    float _259 = _85 * _235;
    float _261 = _253 * _253;
    float _263 = fma(_247, _247, _255);
    float _265 = _257 * _257;
    float _267 = _85 * _229;
    float _269 = _85 * _241;
    float _271 = rsqrt(_263);
    float _273 = fma(_251, _251, _265);
    float _275 = in.m_39.z;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = fma(_267, _267, _273);
    float _283 = fma(_259, _259, _261);
    float _285 = rsqrt(_281);
    float _287 = fma(_269, _269, _283);
    float _289 = _243 * _271;
    float _291 = _245 * _271;
    float _293 = _247 * _271;
    float _295 = rsqrt(_287);
    float _297 = _289 * _289;
    float _299 = fma(_291, _291, _297);
    float _301 = fma(_293, _293, _299);
    float _303 = rsqrt(_301);
    float _305 = _269 * _295;
    float _307 = _187 * _187;
    float _309 = _295 * _187;
    float _311 = _185 * _285;
    float _313 = _187 * _305;
    float _315 = fma(_185, _185, _307);
    float _317 = precise::clamp(_315, 0.0, 1.0);
    float _319 = _253 * _309;
    float _321 = _259 * _309;
    float _323 = -_317;
    float _325 = _323 + 1.0;
    float _327 = fma(_257, _311, _319);
    float _329 = fma(_251, _311, _321);
    float _331 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _333 = fma(_267, _311, _313);
    float _335 = in.m_41.y;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = sqrt(_325);
    float _343 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _331);
    float _345 = in.m_41.z;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = _303 * _341;
    float _353 = in.m_41.x;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = fma(_289, _351, _327);
    float _361 = fma(_291, _351, _329);
    float _363 = fma(_293, _351, _333);
    float _365 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _343);
    float _367 = _359 * _359;
    float _369 = in.m_39.y;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = fma(_361, _361, _367);
    float _377 = rsqrt(_365);
    float _379 = fma(_363, _363, _375);
    float _381 = in.m_39.x;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = rsqrt(_379);
    float _389 = _377 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _391 = _377 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _393 = _377 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _395 = _359 * _387;
    float _397 = _361 * _387;
    float _399 = _363 * _387;
    float _401 = _395 * _389;
    float _403 = _395 * 0.57735025882720947265625;
    float _405 = _85 * _373;
    float _407 = fma(_397, _391, _401);
    float _409 = fma(_397, -0.57735025882720947265625, _403);
    float _411 = fma(_399, _393, _407);
    float _413 = fma(_399, 0.57735025882720947265625, _409);
    float _415 = _85 * _385;
    float _417 = fma(_411, -0.5, 0.5);
    float _419 = fma(_413, 0.5, 0.5);
    float _421 = _85 * _349;
    float _423 = fma(_101, 0.0500000007450580596923828125, -0.0500000007450580596923828125);
    float _425 = _85 * _357;
    float _427 = precise::max(0.0, _417);
    float _429 = _419 * _419;
    float _431 = precise::clamp(_429, 0.0, 1.0);
    float _433 = -_425;
    float _435 = _433 + _415;
    float _437 = precise::min(_427, 1.5);
    float _439 = fma(_437, 0.2000000178813934326171875, _431);
    float _441 = _85 * _339;
    float _443 = _85 * _279;
    float _445 = _439 + _423;
    float _447 = -_441;
    float _449 = _447 + _405;
    float _451 = -_421;
    float _453 = _451 + _443;
    float _455 = fma(_445, _435, _425);
    float _457 = fma(_445, _449, _441);
    float _459 = fma(_445, _453, _421);
    if (!_165)
    {
        out.m_52.x = _455;
        out.m_52.y = _457;
        out.m_52.z = _459;
        out.m_52.w = _149;
        return out;
    }
    float _461 = 0.0 + _155;
    float _463 = precise::clamp(_461, 0.0, 1.0);
    out.m_52.x = _455;
    out.m_52.y = _457;
    out.m_52.z = _459;
    out.m_52.w = _463;
    return out;
}

