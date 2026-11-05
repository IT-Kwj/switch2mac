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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
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
    float4 m_41 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_50 [[user(locn7)]];
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
    float _73 = in.m_37.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _59;
    float _87 = _85 * _65;
    float _89 = _85 * _71;
    float _91 = _85 * _77;
    float _93 = _85 * _83;
    float2 _563 = float2(_87, _89);
    float2 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_563, float2(0.0), isnan(_563))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_563, float2(0.0), isnan(_563))).xw;
    float _99 = _97.x;
    float _101 = _97.y;
    float2 _578 = float2(_91, _93);
    float2 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_578, float2(0.0), isnan(_578))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_578, float2(0.0), isnan(_578))).xw;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = in.m_39.w;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_41.w;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_43.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = _85 * _113;
    float _129 = _85 * _119;
    float _131 = in.m_45.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_41.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_45.x;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_41.x;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = abs(_101);
    float _157 = log2(_155);
    float _159 = _157 * 0.20000000298023223876953125;
    float _161 = exp2(_159);
    float _163 = fma(_107, _161, _101);
    float _165 = _163 * _127;
    float _167 = _129 * _165;
    float _169 = _85 * _125;
    float _171 = 0.0 + _167;
    float _173 = precise::clamp(_171, 0.0, 1.0);
    float _175 = _173 * _169;
    bool _179 = _175 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _181 = isnan(_175);
    bool _183 = _179 || _181;
    bool _185 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _187 = _183 || _185;
    float _189 = in.m_45.y;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_41.y;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    if (!_187)
    {
        discard_fragment();
    }
    float _201 = fma(_105, _105, _99);
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = _85 * _135;
    float _207 = fma(_203, 2.0, -1.0);
    float _209 = 0.0 + _207;
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = _205 * _211;
    float _215 = _85 * _193;
    float _217 = _85 * _199;
    float _219 = abs(_207);
    float _221 = -_219;
    float _223 = _221 + 1.0;
    float _225 = _215 * _211;
    float _227 = _85 * _141;
    float _229 = fma(_217, _223, _225);
    float _231 = _85 * _147;
    float _233 = fma(_227, _223, _213);
    float _235 = _231 * _211;
    float _237 = _85 * _153;
    bool _239 = _229 >= _233;
    bool _241 = isnan(_229);
    bool _243 = _239 || _241;
    bool _245 = isnan(_233);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = -_233;
    float _253 = _229 + _251;
    float _255 = fma(_237, _223, _235);
    float _257 = fma(_249, _253, _233);
    float _259 = -_229;
    float _261 = _259 + _233;
    float _263 = -_255;
    float _265 = _263 + _257;
    bool _267 = _255 >= _257;
    bool _269 = isnan(_255);
    bool _271 = _267 || _269;
    bool _273 = isnan(_257);
    bool _275 = _271 || _273;
    float _277 = float(_275);
    float _279 = fma(_249, _261, _229);
    float _281 = -_257;
    float _283 = _255 + _281;
    float _285 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.5;
    float _287 = fma(_277, _265, _255);
    float _289 = fma(_277, _283, _257);
    float _291 = _285 * 0.15915493667125701904296875;
    float _293 = _249 + (-1.0);
    float _295 = precise::min(_279, _287);
    float _297 = -_249;
    float _299 = _297 + 0.666666686534881591796875;
    float _301 = -_279;
    float _303 = _301 + _287;
    float _305 = -_295;
    float _307 = _289 + _305;
    float _309 = -_299;
    float _311 = _293 + _309;
    float _313 = _291 * 6.283185482025146484375;
    float _315 = sin(_313);
    float _317 = fma(_307, 6.0, 1.0000000133514319600180897396058e-10);
    float _319 = fma(_277, _311, _299);
    float _321 = spvFAdd(_289, 1.0000000133514319600180897396058e-10);
    float _323 = 1.0 / _317;
    float _325 = 1.0 / _321;
    float _327 = fma(_303, _323, _319);
    float _329 = abs(_327);
    float _331 = fma(_315, 0.100000001490116119384765625, _329);
    float _333 = _331 + 0.666666686534881591796875;
    float _335 = _331 + 0.3333333432674407958984375;
    float _337 = floor(_331);
    float _339 = fma(_331, 6.0, 4.0);
    float _341 = fma(_331, 6.0, 2.0);
    float _343 = _307 * _325;
    float _345 = floor(_333);
    float _347 = floor(_335);
    float _349 = -_337;
    float _351 = _331 + _349;
    float _353 = fma(_351, 6.0, -3.0);
    float _355 = fma(_345, -6.0, _339);
    float _357 = abs(_353);
    float _359 = _357 + (-1.0);
    float _361 = precise::clamp(_359, 0.0, 1.0);
    float _363 = _355 + (-3.0);
    float _365 = _361 + (-1.0);
    float _367 = fma(_347, -6.0, _341);
    float _369 = abs(_363);
    float _371 = _369 + (-1.0);
    float _373 = precise::clamp(_371, 0.0, 1.0);
    float _375 = fma(_343, _365, 1.0);
    float _377 = _367 + (-3.0);
    float _379 = _373 + (-1.0);
    float _381 = abs(_377);
    float _383 = _381 + (-1.0);
    float _385 = precise::clamp(_383, 0.0, 1.0);
    float _387 = fma(_343, _379, 1.0);
    float _389 = _385 + (-1.0);
    float _391 = fma(_343, _389, 1.0);
    float _393 = _289 * _375;
    float _395 = _289 * _387;
    float _397 = _289 * _391;
    if (!_187)
    {
        out.m_48.x = _393;
        out.m_48.y = _395;
        out.m_48.z = _397;
        out.m_48.w = _167;
        return out;
    }
    float _399 = _395 * 0.715200006961822509765625;
    float _401 = in.m_50.w;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = in.m_50.z;
    float _409 = gl_FragCoord.w;
    float _411 = _407 * _409;
    float _413 = in.m_50.x;
    float _415 = gl_FragCoord.w;
    float _417 = _413 * _415;
    float _419 = fma(_393, 0.2125999927520751953125, _399);
    float _421 = in.m_50.y;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = fma(_397, 0.072200000286102294921875, _419);
    bool _429 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _431 = 1.0 / _427;
    float _433 = _431 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _435 = precise::clamp(_433, 0.0, 1.0);
    float _437 = _85 * _405;
    float _439 = fma(_435, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _441 = _85 * _411;
    float _443 = _439 * _437;
    float _445 = 0.0 + _175;
    float _447 = precise::clamp(_445, 0.0, 1.0);
    float _449 = _85 * _417;
    float _451 = _85 * _425;
    float _453 = fma(_397, _443, _441);
    float _455 = fma(_393, _443, _449);
    float _457 = fma(_395, _443, _451);
    float _459 = _441;
    if (!_429)
    {
        _459 = _447;
    }
    float _461 = _459;
    bool _463 = !_429;
    float _465 = _461;
    if (!_463)
    {
        float _467 = in.m_52.w;
        float _469 = gl_FragCoord.w;
        float _471 = _467 * _469;
        float _473 = in.m_52.z;
        float _475 = gl_FragCoord.w;
        float _477 = _473 * _475;
        float _479 = _85 * _471;
        float _481 = _85 * _477;
        float _483 = 1.0 / _479;
        float _485 = _481 * _483;
        float _487 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _489 = fma(_485, (*spvDescriptorSet0.fp_c8)._m0[30].w, _487);
        float _491 = 1.0 / _489;
        float _493 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _495 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _497 = fma(_491, _493, _495);
        float _499 = _497 * 8.0;
        float _501 = precise::clamp(_499, 0.0, 1.0);
        float _503 = _447 * _501;
        _465 = _503;
    }
    float _505 = _465;
    float _507 = 0.0 + _505;
    float _509 = precise::clamp(_507, 0.0, 1.0);
    out.m_48.x = _455;
    out.m_48.y = _457;
    out.m_48.z = _453;
    out.m_48.w = _509;
    return out;
}

