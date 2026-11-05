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
    constant _16* fp_c7 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c10 [[id(3)]];
    constant _16* fp_c15 [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_37.w;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_37.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_37.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _51;
    float _73 = _71 * _57;
    float _75 = _71 * _63;
    float _77 = _71 * _69;
    float _79 = 1.0 / _73;
    float _81 = _75 * _79;
    float _83 = _77 * _79;
    float2 _609 = float2(_81, _83);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_609, float2(0.0), isnan(_609))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_609, float2(0.0), isnan(_609))).x;
    float _87 = in.m_39.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_39.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_37.z;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = -(*spvDescriptorSet0.fp_c9)._m0[115].w;
    float _107 = _105 + (*spvDescriptorSet0.fp_c9)._m0[116].w;
    float _109 = -(*spvDescriptorSet0.fp_c9)._m0[116].w;
    float _111 = _109 + (*spvDescriptorSet0.fp_c9)._m0[117].w;
    float _113 = 1.0 / _107;
    float _115 = 1.0 / _111;
    float _117 = -(*spvDescriptorSet0.fp_c9)._m0[115].x;
    float _119 = (*spvDescriptorSet0.fp_c9)._m0[116].x + _117;
    float _121 = -(*spvDescriptorSet0.fp_c9)._m0[116].x;
    float _123 = _121 + (*spvDescriptorSet0.fp_c9)._m0[117].x;
    float _125 = _119 * _113;
    float _127 = _71 * _91;
    float _129 = 0.0 + (*spvDescriptorSet0.fp_c7)._m0[0].x;
    float _131 = precise::clamp(_129, 0.0, 1.0);
    float _133 = _71 * _97;
    float _135 = _123 * _115;
    float _137 = _127 + (-0.5);
    float _139 = -(*spvDescriptorSet0.fp_c9)._m0[115].w;
    float _141 = _131 + _139;
    bool _145 = _131 >= (*spvDescriptorSet0.fp_c9)._m0[116].w;
    bool _147 = isnan(_131);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.fp_c9)._m0[116].w);
    bool _153 = _149 || _151;
    float _155 = float(_153);
    float _157 = _133 + (-0.5);
    bool _159 = _131 >= (*spvDescriptorSet0.fp_c9)._m0[115].w;
    bool _161 = isnan(_131);
    bool _163 = _159 || _161;
    bool _165 = isnan((*spvDescriptorSet0.fp_c9)._m0[115].w);
    bool _167 = _163 || _165;
    float _169 = float(_167);
    float _171 = fma(_125, _141, (*spvDescriptorSet0.fp_c9)._m0[115].x);
    bool _173 = _131 >= (*spvDescriptorSet0.fp_c9)._m0[117].w;
    bool _175 = isnan(_131);
    bool _177 = _173 || _175;
    bool _179 = isnan((*spvDescriptorSet0.fp_c9)._m0[117].w);
    bool _181 = _177 || _179;
    float _183 = float(_181);
    float _185 = _157 * _157;
    float _187 = -_155;
    float _189 = _187 + 1.0;
    float _191 = _71 * _103;
    float _193 = -(*spvDescriptorSet0.fp_c9)._m0[116].w;
    float _195 = _131 + _193;
    float _197 = fma(_137, _137, _185);
    float _199 = _169 * _189;
    float _201 = -_183;
    float _203 = _201 + 1.0;
    float _205 = -_169;
    float _207 = _205 + 1.0;
    float _209 = sqrt(_197);
    float _211 = _171 * _199;
    float _213 = _191 * _79;
    float _215 = _155 * _203;
    float _217 = fma(_135, _195, (*spvDescriptorSet0.fp_c9)._m0[116].x);
    float _219 = fma(_207, (*spvDescriptorSet0.fp_c9)._m0[115].x, _211);
    float _221 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _223 = fma(_213, (*spvDescriptorSet0.fp_c8)._m0[30].w, _221);
    float _225 = in.m_41.x;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = fma(_217, _215, _219);
    float _233 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _235 = fma(_183, (*spvDescriptorSet0.fp_c9)._m0[117].x, _231);
    float _237 = precise::max(_209, 0.300000011920928955078125);
    float _239 = 1.0 / _223;
    float _241 = precise::min(_237, 0.4799999892711639404296875);
    float _243 = fma(_241, 5.55555629730224609375, -1.66666698455810546875);
    float _245 = -_243;
    float _247 = fma(_245, _243, 1.0);
    float _249 = _247 * _235;
    float _251 = 0.0 + _249;
    float _253 = precise::clamp(_251, 0.0, 1.0);
    float _255 = _71 * _229;
    float _257 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _259 = fma(_85, (*spvDescriptorSet0.fp_c8)._m0[30].w, _257);
    float _261 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _263 = _239 * _261;
    float _265 = 1.0 / _259;
    float _267 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _269 = -_263;
    float _271 = fma(_265, _267, _269);
    float _273 = _271 * _233;
    float _275 = precise::clamp(_273, 0.0, 1.0);
    float _277 = _253 * _275;
    float _279 = _277 * _255;
    bool _281 = _279 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _283 = isnan(_279);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _289 = _285 || _287;
    float _291 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _293 = fma(_85, (*spvDescriptorSet0.fp_c8)._m0[30].w, _291);
    float _295 = _279;
    if (!_289)
    {
        discard_fragment();
    }
    float _297 = 1.0 / _293;
    float _299 = precise::min(_237, 0.60000002384185791015625);
    float _301 = fma(_83, 2.0, -1.0);
    float _303 = fma(_81, 2.0, -1.0);
    float _305 = -(*spvDescriptorSet0.fp_c8)._m0[17].y;
    float _307 = _301 * _305;
    float _309 = fma(_303, (*spvDescriptorSet0.fp_c8)._m0[17].x, _307);
    float _311 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _313 = _297 * _311;
    float _315 = _313 * (*spvDescriptorSet0.fp_c8)._m0[30].w;
    float _317 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _319 = fma(_313, (*spvDescriptorSet0.fp_c8)._m0[30].y, _317);
    float _321 = -(*spvDescriptorSet0.fp_c8)._m0[16].y;
    float _323 = _301 * _321;
    float _325 = 1.0 / _315;
    float _327 = fma(_303, (*spvDescriptorSet0.fp_c8)._m0[16].x, _323);
    float _329 = _319 * _325;
    float _331 = fma(_329, 2.0, -1.0);
    float _333 = -(*spvDescriptorSet0.fp_c8)._m0[18].y;
    float _335 = _301 * _333;
    float _337 = -(*spvDescriptorSet0.fp_c8)._m0[19].y;
    float _339 = _301 * _337;
    float _341 = fma(_331, (*spvDescriptorSet0.fp_c8)._m0[17].z, _309);
    float _343 = fma(_303, (*spvDescriptorSet0.fp_c8)._m0[18].x, _335);
    float _345 = fma(_331, (*spvDescriptorSet0.fp_c8)._m0[16].z, _327);
    float _347 = fma(_303, (*spvDescriptorSet0.fp_c8)._m0[19].x, _339);
    float _349 = _341 + (*spvDescriptorSet0.fp_c8)._m0[17].w;
    float _351 = fma(_331, (*spvDescriptorSet0.fp_c8)._m0[18].z, _343);
    float _353 = _345 + (*spvDescriptorSet0.fp_c8)._m0[16].w;
    float _355 = fma(_331, (*spvDescriptorSet0.fp_c8)._m0[19].z, _347);
    float _357 = _349 * (*spvDescriptorSet0.fp_c8)._m0[15].y;
    float _359 = _351 + (*spvDescriptorSet0.fp_c8)._m0[18].w;
    float _361 = _349 * (*spvDescriptorSet0.fp_c8)._m0[12].y;
    float _363 = _355 + (*spvDescriptorSet0.fp_c8)._m0[19].w;
    float _365 = fma(_353, (*spvDescriptorSet0.fp_c8)._m0[15].x, _357);
    float _367 = _349 * (*spvDescriptorSet0.fp_c8)._m0[14].y;
    float _369 = fma(_353, (*spvDescriptorSet0.fp_c8)._m0[12].x, _361);
    float _371 = fma(_359, (*spvDescriptorSet0.fp_c8)._m0[15].z, _365);
    float _373 = fma(_353, (*spvDescriptorSet0.fp_c8)._m0[14].x, _367);
    float _375 = fma(_359, (*spvDescriptorSet0.fp_c8)._m0[12].z, _369);
    float _377 = fma(_363, (*spvDescriptorSet0.fp_c8)._m0[15].w, _371);
    float _379 = _349 * (*spvDescriptorSet0.fp_c8)._m0[13].y;
    float _381 = fma(_359, (*spvDescriptorSet0.fp_c8)._m0[14].z, _373);
    float _383 = fma(_363, (*spvDescriptorSet0.fp_c8)._m0[12].w, _375);
    float _385 = 1.0 / _377;
    float _387 = fma(_353, (*spvDescriptorSet0.fp_c8)._m0[13].x, _379);
    float _389 = fma(_363, (*spvDescriptorSet0.fp_c8)._m0[14].w, _381);
    float _391 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _393 = fma(_359, (*spvDescriptorSet0.fp_c8)._m0[13].z, _387);
    float _395 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _391);
    float _397 = fma(_363, (*spvDescriptorSet0.fp_c8)._m0[13].w, _393);
    float _399 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _401 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _403 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _399);
    float _405 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _401);
    float _407 = _397 * _385;
    float _409 = _383 * _385;
    float _411 = _389 * _385;
    float _413 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _403);
    float _415 = _407 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _417 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _395);
    float _419 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _405);
    float _421 = fma(_409, (*spvDescriptorSet0.fp_c8)._m0[2].x, _415);
    float _423 = _413 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _425 = _419 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _427 = fma(_411, (*spvDescriptorSet0.fp_c8)._m0[2].z, _421);
    float _429 = _427 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _431 = (*spvDescriptorSet0.fp_c10)._m0[5].x * (*spvDescriptorSet0.fp_c10)._m0[5].x;
    float _433 = _407 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _435 = fma((*spvDescriptorSet0.fp_c10)._m0[4].x, (*spvDescriptorSet0.fp_c10)._m0[4].x, _431);
    float _437 = 1.0 / _429;
    float _439 = fma(_409, (*spvDescriptorSet0.fp_c8)._m0[1].x, _433);
    float _441 = fma((*spvDescriptorSet0.fp_c10)._m0[6].x, (*spvDescriptorSet0.fp_c10)._m0[6].x, _435);
    float _443 = _407 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _445 = fma(_411, (*spvDescriptorSet0.fp_c8)._m0[1].z, _439);
    float _447 = fma(_409, (*spvDescriptorSet0.fp_c8)._m0[0].x, _443);
    float _449 = rsqrt(_441);
    float _451 = _417 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _453 = _445 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _455 = fma(_411, (*spvDescriptorSet0.fp_c8)._m0[0].z, _447);
    float _457 = _425 * _437;
    float _459 = _455 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _461 = -_451;
    float _463 = fma(_453, _457, _461);
    float _465 = -_423;
    float _467 = fma(_459, _457, _465);
    float _469 = _463 * _449;
    float _471 = _467 * _449;
    float _473 = fma(_299, 3.3333332538604736328125, -1.0);
    float _475 = _469 * _469;
    float _477 = -(*spvDescriptorSet0.fp_c9)._m0[123].z;
    float _479 = _477 + (*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _481 = _473 * _473;
    float _483 = fma(_471, _471, _475);
    float _485 = -(*spvDescriptorSet0.fp_c9)._m0[123].y;
    float _487 = _485 + (*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _489 = sqrt(_483);
    float _491 = precise::max(_489, 0.02999999932944774627685546875);
    float _493 = precise::min(_491, 0.119999997317790985107421875);
    float _495 = fma(_493, -11.11111164093017578125, 1.33333337306976318359375);
    float _497 = fma(_495, _495, _481);
    float _499 = -(*spvDescriptorSet0.fp_c9)._m0[123].x;
    float _501 = _499 + (*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _503 = fma(_497, _501, (*spvDescriptorSet0.fp_c9)._m0[123].x);
    float _505 = fma(_497, _487, (*spvDescriptorSet0.fp_c9)._m0[123].y);
    float _507 = fma(_497, _479, (*spvDescriptorSet0.fp_c9)._m0[123].z);
    float _509 = _487;
    if (!_289)
    {
        out.m_44.x = _503;
        out.m_44.y = _505;
        out.m_44.z = _507;
        out.m_44.w = _249;
        return out;
    }
    float _511 = _505 * 0.715200006961822509765625;
    float _513 = fma(_503, 0.2125999927520751953125, _511);
    float _515 = fma(_507, 0.072200000286102294921875, _513);
    bool _517 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _519 = 1.0 / _515;
    float _521 = 0.0 + _279;
    float _523 = precise::clamp(_521, 0.0, 1.0);
    float _525 = _523;
    if (_517)
    {
        float _527 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _529 = _263 + _527;
        _509 = _529;
    }
    float _531 = _509;
    float _533 = _519 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _535 = precise::clamp(_533, 0.0, 1.0);
    if (_517)
    {
        float _537 = _531 * 8.0;
        float _539 = precise::clamp(_537, 0.0, 1.0);
        _295 = _539;
    }
    float _541 = _295;
    float _543 = fma(_535, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_517)
    {
        float _545 = _523 * _541;
        _525 = _545;
    }
    float _547 = _525;
    float _549 = _503 * _543;
    float _551 = _505 * _543;
    float _553 = _507 * _543;
    float _555 = 0.0 + _547;
    float _557 = precise::clamp(_555, 0.0, 1.0);
    out.m_44.x = _549;
    out.m_44.y = _551;
    out.m_44.z = _553;
    out.m_44.w = _557;
    return out;
}

