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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_45 [[user(locn6)]];
    float4 m_50 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_35.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_37.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_37.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _57;
    float _91 = _89 * _63;
    float _93 = _89 * _69;
    float _95 = _89 * _75;
    float _97 = 1.0 / _91;
    float _99 = _93 * _97;
    float _101 = _95 * _97;
    float _103 = _89 * _81;
    float _105 = _89 * _87;
    float2 _565 = float2(_99, _101);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_565, float2(0.0), isnan(_565))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_565, float2(0.0), isnan(_565))).x;
    float2 _576 = float2(_103, _105);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_576, float2(0.0), isnan(_576))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_576, float2(0.0), isnan(_576))).w;
    float _111 = in.m_35.z;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_39.w;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_41.w;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_43.x;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = _89 * _115;
    float _137 = _135 * _97;
    float _139 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _141 = fma(_137, (*spvDescriptorSet0.fp_c8)._m0[30].w, _139);
    float _143 = 1.0 / _141;
    float _145 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _147 = (*spvDescriptorSet0.fp_c9)._m0[191].y + _145;
    float _149 = 1.0 / _147;
    float _151 = _89 * _133;
    float _153 = -(*spvDescriptorSet0.fp_c9)._m0[123].x;
    float _155 = (*spvDescriptorSet0.fp_c9)._m0[124].x + _153;
    float _157 = -(*spvDescriptorSet0.fp_c9)._m0[123].y;
    float _159 = (*spvDescriptorSet0.fp_c9)._m0[124].y + _157;
    float _161 = -(*spvDescriptorSet0.fp_c9)._m0[123].z;
    float _163 = (*spvDescriptorSet0.fp_c9)._m0[124].z + _161;
    float _165 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _167 = fma(_107, (*spvDescriptorSet0.fp_c8)._m0[30].w, _165);
    float _169 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _171 = _143 * _169;
    float _173 = _89 * _121;
    float _175 = 1.0 / _167;
    float _177 = -_173;
    float _179 = _109 + _177;
    float _181 = _179 * 4.0;
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _187 = -_171;
    float _189 = fma(_175, _185, _187);
    float _191 = _89 * _127;
    float _193 = _109 + _189;
    float _195 = _183 * _191;
    float _197 = precise::max(_193, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _199 = precise::min(_197, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _201 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _203 = _199 + _201;
    float _205 = _203 * _149;
    float _207 = _195 * _205;
    float _209 = 0.0 + _207;
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = _211 * _151;
    bool _217 = _213 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _219 = isnan(_213);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _225 = _221 || _223;
    float _227 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _229 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _227;
    float _231 = _171;
    if (!_225)
    {
        discard_fragment();
    }
    float _233 = -(*spvDescriptorSet0.fp_c9)._m0[123].w;
    float _235 = (*spvDescriptorSet0.fp_c9)._m0[124].w + _233;
    float _237 = 1.0 / _229;
    float _239 = 0.0 + _109;
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _245 = _241 + _243;
    bool _247 = _241 >= (*spvDescriptorSet0.fp_c9)._m0[123].w;
    bool _249 = isnan(_241);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.fp_c9)._m0[123].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = 1.0 / _235;
    float _261 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _263 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _261;
    bool _265 = _241 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _267 = isnan(_241);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = _245 * _237;
    float _279 = -(*spvDescriptorSet0.fp_c9)._m0[123].w;
    float _281 = _241 + _279;
    float _283 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _285 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _283;
    float _287 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _289 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _287;
    float _291 = fma(_263, _277, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    bool _293 = _241 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _295 = isnan(_241);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = _281 * _259;
    float _307 = fma(_285, _277, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _309 = fma(_289, _277, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _311 = in.m_45.w;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    bool _317 = _241 >= (*spvDescriptorSet0.fp_c9)._m0[124].w;
    bool _319 = isnan(_241);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.fp_c9)._m0[124].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -_303;
    float _331 = _329 + 1.0;
    float _333 = fma(_155, _305, (*spvDescriptorSet0.fp_c9)._m0[123].x);
    float _335 = fma(_159, _305, (*spvDescriptorSet0.fp_c9)._m0[123].y);
    float _337 = fma(_163, _305, (*spvDescriptorSet0.fp_c9)._m0[123].z);
    float _339 = -_327;
    float _341 = _339 + 1.0;
    float _343 = _275 * _331;
    float _345 = -_275;
    float _347 = _345 + 1.0;
    float _349 = _257 * _341;
    float _351 = _307 * _343;
    float _353 = _309 * _343;
    float _355 = -_257;
    float _357 = _355 + 1.0;
    float _359 = _333 * _349;
    float _361 = _335 * _349;
    float _363 = _291 * _343;
    float _365 = _337 * _349;
    float _367 = fma(_347, (*spvDescriptorSet0.fp_c9)._m0[107].x, _351);
    float _369 = fma(_347, (*spvDescriptorSet0.fp_c9)._m0[107].y, _353);
    float _371 = fma(_357, (*spvDescriptorSet0.fp_c9)._m0[123].x, _359);
    float _373 = fma(_357, (*spvDescriptorSet0.fp_c9)._m0[123].y, _361);
    float _375 = fma(_347, (*spvDescriptorSet0.fp_c9)._m0[107].z, _363);
    float _377 = fma(_357, (*spvDescriptorSet0.fp_c9)._m0[123].z, _365);
    float _379 = fma(_303, (*spvDescriptorSet0.fp_c9)._m0[108].x, _367);
    float _381 = fma(_303, (*spvDescriptorSet0.fp_c9)._m0[108].y, _369);
    float _383 = fma(_327, (*spvDescriptorSet0.fp_c9)._m0[124].x, _371);
    float _385 = fma(_327, (*spvDescriptorSet0.fp_c9)._m0[124].y, _373);
    float _387 = fma(_303, (*spvDescriptorSet0.fp_c9)._m0[108].z, _375);
    float _389 = fma(_327, (*spvDescriptorSet0.fp_c9)._m0[124].z, _377);
    float _391 = -_381;
    float _393 = _391 + _385;
    float _395 = _89 * _315;
    float _397 = -_379;
    float _399 = _397 + _383;
    float _401 = -_387;
    float _403 = _401 + _389;
    float _405 = fma(_395, _393, _381);
    float _407 = fma(_395, _399, _379);
    float _409 = fma(_395, _403, _387);
    if (!_225)
    {
        out.m_48.x = _407;
        out.m_48.y = _405;
        out.m_48.z = _409;
        out.m_48.w = _207;
        return out;
    }
    float _411 = _405 * 0.715200006961822509765625;
    float _413 = in.m_50.w;
    float _415 = gl_FragCoord.w;
    float _417 = _413 * _415;
    float _419 = in.m_50.x;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = in.m_50.y;
    float _427 = gl_FragCoord.w;
    float _429 = _425 * _427;
    float _431 = fma(_407, 0.2125999927520751953125, _411);
    float _433 = in.m_50.z;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = fma(_409, 0.072200000286102294921875, _431);
    bool _441 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _443 = 1.0 / _439;
    float _445 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_441)
    {
        float _447 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _449 = _171 + _447;
        _231 = _449;
    }
    float _451 = _231;
    float _453 = _443 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _455 = precise::clamp(_453, 0.0, 1.0);
    float _457 = fma(_455, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _459 = _89 * _417;
    if (_441)
    {
        float _461 = _451 * 8.0;
        float _463 = precise::clamp(_461, 0.0, 1.0);
        _445 = _463;
    }
    float _465 = _445;
    float _467 = _89 * _429;
    float _469 = _457 * _459;
    float _471 = 0.0 + _213;
    float _473 = precise::clamp(_471, 0.0, 1.0);
    float _475 = _89 * _423;
    float _477 = _89 * _437;
    float _479 = fma(_405, _469, _467);
    float _481 = _473;
    if (_441)
    {
        float _483 = _473 * _465;
        _481 = _483;
    }
    float _485 = _481;
    float _487 = fma(_407, _469, _475);
    float _489 = fma(_409, _469, _477);
    float _491 = 0.0 + _485;
    float _493 = precise::clamp(_491, 0.0, 1.0);
    out.m_48.x = _487;
    out.m_48.y = _479;
    out.m_48.z = _489;
    out.m_48.w = _493;
    return out;
}

