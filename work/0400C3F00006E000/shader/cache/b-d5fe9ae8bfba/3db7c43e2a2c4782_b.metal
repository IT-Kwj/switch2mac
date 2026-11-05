#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_50 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.w;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.z;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _59;
    float _87 = _85 * _65;
    float _89 = _85 * _71;
    float _91 = _85 * _77;
    float _93 = _85 * _83;
    float2 _568 = float2(_87, _89);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_568, float2(0.0), isnan(_568))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_568, float2(0.0), isnan(_568))).w;
    float2 _579 = float2(_93, _91);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_579, float2(0.0), isnan(_579))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_579, float2(0.0), isnan(_579))).w;
    float _99 = in.m_39.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_41.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_43.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = (*spvDescriptorSet0.fp_c10)._m0[13].z * (*spvDescriptorSet0.fp_c10)._m0[13].z;
    float _119 = _85 * _103;
    float _121 = _85 * _115;
    float _123 = in.m_45.y;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_41.z;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_41.x;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_39.x;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = _95 + _97;
    float _149 = _117 * _117;
    float _151 = _147 + (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _153 = precise::clamp(_151, 0.0, 1.0);
    float _155 = _85 * _109;
    float _157 = -_119;
    float _159 = _153 + _157;
    float _161 = _155 * _159;
    float _163 = _161 * _149;
    float _165 = precise::clamp(_163, 0.0, 1.0);
    float _167 = _165 * _121;
    bool _171 = _167 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _173 = isnan(_167);
    bool _175 = _171 || _173;
    bool _177 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _179 = _175 || _177;
    if (!_179)
    {
        discard_fragment();
    }
    float _181 = in.m_41.y;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = _85 * _127;
    float _189 = in.m_39.y;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_39.z;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = _85 * _133;
    float _203 = precise::max(_187, 0.5);
    float _205 = precise::min(_203, 1.0);
    float _207 = fma(_205, 2.0, -1.0);
    float _209 = _207 * _207;
    float _211 = _209 * _209;
    float _213 = _153 + _211;
    float _215 = _211 * 3.0;
    float _217 = _85 * _145;
    float _219 = _85 * _185;
    float _221 = -_213;
    float _223 = _221 + 1.0;
    float _225 = _85 * _193;
    float _227 = _85 * _199;
    float _229 = _219 * _223;
    float _231 = _201 * _223;
    float _233 = _85 * _139;
    float _235 = fma(_213, _225, _229);
    float _237 = fma(_213, _227, _231);
    float _239 = _233 * _223;
    float _241 = fma(_235, _215, _235);
    float _243 = fma(_237, _215, _237);
    float _245 = fma(_213, _217, _239);
    float _247 = -_243;
    float _249 = _241 + _247;
    bool _251 = _241 >= _243;
    bool _253 = isnan(_241);
    bool _255 = _251 || _253;
    bool _257 = isnan(_243);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = fma(_245, _215, _245);
    float _265 = fma(_261, _249, _243);
    float _267 = -_241;
    float _269 = _267 + _243;
    float _271 = -_263;
    float _273 = _271 + _265;
    bool _275 = _263 >= _265;
    bool _277 = isnan(_263);
    bool _279 = _275 || _277;
    bool _281 = isnan(_265);
    bool _283 = _279 || _281;
    float _285 = float(_283);
    float _287 = fma(_261, _269, _241);
    float _289 = fma(_285, _273, _263);
    float _291 = -_265;
    float _293 = _263 + _291;
    float _295 = precise::min(_287, _289);
    float _297 = fma(_285, _293, _265);
    float _299 = -_287;
    float _301 = _299 + _289;
    float _303 = -_295;
    float _305 = _297 + _303;
    float _307 = fma(_305, 6.0, 1.0000000133514319600180897396058e-10);
    float _309 = _261 + (-1.0);
    float _311 = -_261;
    float _313 = _311 + 0.666666686534881591796875;
    float _315 = 1.0 / _307;
    float _317 = -_313;
    float _319 = _309 + _317;
    float _321 = fma(_285, _319, _313);
    float _323 = precise::max(0.0, (*spvDescriptorSet0.fp_c10)._m0[2].x);
    float _325 = precise::min(_323, 20.0);
    float _327 = fma(_301, _315, _321);
    float _329 = abs(_327);
    float _331 = fma(_325, 0.0500000007450580596923828125, _329);
    float _333 = spvFAdd(_297, 1.0000000133514319600180897396058e-10);
    float _335 = _331 + 0.666666686534881591796875;
    float _337 = _331 + 0.3333333432674407958984375;
    float _339 = floor(_331);
    float _341 = fma(_331, 6.0, 4.0);
    float _343 = fma(_331, 6.0, 2.0);
    float _345 = floor(_335);
    float _347 = floor(_337);
    float _349 = -_339;
    float _351 = _331 + _349;
    float _353 = fma(_351, 6.0, -3.0);
    float _355 = 1.0 / _333;
    float _357 = fma(_345, -6.0, _341);
    float _359 = abs(_353);
    float _361 = _359 + (-1.0);
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = _357 + (-3.0);
    float _367 = _363 + (-1.0);
    float _369 = fma(_347, -6.0, _343);
    float _371 = abs(_365);
    float _373 = _371 + (-1.0);
    float _375 = precise::clamp(_373, 0.0, 1.0);
    float _377 = _369 + (-3.0);
    float _379 = _375 + (-1.0);
    float _381 = abs(_377);
    float _383 = _381 + (-1.0);
    float _385 = precise::clamp(_383, 0.0, 1.0);
    float _387 = _305 * _355;
    float _389 = _385 + (-1.0);
    float _391 = fma(_387, _367, 1.0);
    float _393 = fma(_387, _379, 1.0);
    float _395 = fma(_387, _389, 1.0);
    float _397 = _297 * _391;
    float _399 = _297 * _393;
    float _401 = _297 * _395;
    if (!_179)
    {
        out.m_48.x = _397;
        out.m_48.y = _399;
        out.m_48.z = _401;
        out.m_48.w = _165;
        return out;
    }
    float _403 = _399 * 0.715200006961822509765625;
    float _405 = in.m_50.w;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = in.m_50.z;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_50.x;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = fma(_397, 0.2125999927520751953125, _403);
    float _425 = in.m_50.y;
    float _427 = gl_FragCoord.w;
    float _429 = _425 * _427;
    float _431 = fma(_401, 0.072200000286102294921875, _423);
    bool _433 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _435 = 1.0 / _431;
    float _437 = _435 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _439 = precise::clamp(_437, 0.0, 1.0);
    float _441 = _85 * _409;
    float _443 = fma(_439, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _445 = _85 * _415;
    float _447 = _443 * _441;
    float _449 = 0.0 + _167;
    float _451 = precise::clamp(_449, 0.0, 1.0);
    float _453 = _85 * _421;
    float _455 = _85 * _429;
    float _457 = fma(_401, _447, _445);
    float _459 = fma(_397, _447, _453);
    float _461 = fma(_399, _447, _455);
    float _463 = _445;
    if (!_433)
    {
        _463 = _451;
    }
    float _465 = _463;
    bool _467 = !_433;
    float _469 = _465;
    if (!_467)
    {
        float _471 = in.m_52.w;
        float _473 = gl_FragCoord.w;
        float _475 = _471 * _473;
        float _477 = in.m_52.z;
        float _479 = gl_FragCoord.w;
        float _481 = _477 * _479;
        float _483 = _85 * _475;
        float _485 = _85 * _481;
        float _487 = 1.0 / _483;
        float _489 = _485 * _487;
        float _491 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _493 = fma(_489, (*spvDescriptorSet0.fp_c8)._m0[30].w, _491);
        float _495 = 1.0 / _493;
        float _497 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _499 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _501 = fma(_495, _497, _499);
        float _503 = _501 * 8.0;
        float _505 = precise::clamp(_503, 0.0, 1.0);
        float _507 = _451 * _505;
        _469 = _507;
    }
    float _509 = _469;
    float _511 = 0.0 + _509;
    float _513 = precise::clamp(_511, 0.0, 1.0);
    out.m_48.x = _459;
    out.m_48.y = _461;
    out.m_48.z = _457;
    out.m_48.w = _513;
    return out;
}

