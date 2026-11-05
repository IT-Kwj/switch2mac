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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_10Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_46 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_35.w;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = (*spvDescriptorSet0.fp_c9)._m0[191].x * (*spvDescriptorSet0.fp_c15)._m0[630].w;
    float _75 = 1.0 / _53;
    float _77 = _75 * _59;
    float _79 = _75 * _65;
    float _81 = _75 * _71;
    float _83 = 1.0 / _77;
    float _85 = _79 * _83;
    float _87 = _81 * _83;
    float _89 = _85 * _73;
    float _91 = _87 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float2 _610 = float2(_89, _91);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_610, float2(0.0), isnan(_610))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_610, float2(0.0), isnan(_610))).w;
    float2 _621 = float2(_85, _87);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_621, float2(0.0), isnan(_621))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_621, float2(0.0), isnan(_621))).x;
    float _97 = in.m_37.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_35.z;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = -(*spvDescriptorSet0.fp_c9)._m0[115].w;
    float _111 = _109 + (*spvDescriptorSet0.fp_c9)._m0[116].w;
    float _113 = -(*spvDescriptorSet0.fp_c9)._m0[116].w;
    float _115 = _113 + (*spvDescriptorSet0.fp_c9)._m0[117].w;
    float _117 = 1.0 / _111;
    float _119 = 1.0 / _115;
    float _121 = _75 * _101;
    float _123 = -(*spvDescriptorSet0.fp_c9)._m0[115].x;
    float _125 = (*spvDescriptorSet0.fp_c9)._m0[116].x + _123;
    float _127 = -_121;
    float _129 = _127 + 1.0;
    float _131 = precise::clamp(_129, 0.0, 1.0);
    float _133 = _125 * _117;
    bool _137 = _131 >= (*spvDescriptorSet0.fp_c9)._m0[116].w;
    bool _139 = isnan(_131);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.fp_c9)._m0[116].w);
    bool _145 = _141 || _143;
    float _147 = float(_145);
    float _149 = -(*spvDescriptorSet0.fp_c9)._m0[115].w;
    float _151 = _131 + _149;
    bool _153 = _131 >= (*spvDescriptorSet0.fp_c9)._m0[115].w;
    bool _155 = isnan(_131);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.fp_c9)._m0[115].w);
    bool _161 = _157 || _159;
    float _163 = float(_161);
    float _165 = -(*spvDescriptorSet0.fp_c9)._m0[116].x;
    float _167 = _165 + (*spvDescriptorSet0.fp_c9)._m0[117].x;
    bool _169 = _131 >= (*spvDescriptorSet0.fp_c9)._m0[117].w;
    bool _171 = isnan(_131);
    bool _173 = _169 || _171;
    bool _175 = isnan((*spvDescriptorSet0.fp_c9)._m0[117].w);
    bool _177 = _173 || _175;
    float _179 = float(_177);
    float _181 = -_147;
    float _183 = _181 + 1.0;
    float _185 = fma(_133, _151, (*spvDescriptorSet0.fp_c9)._m0[115].x);
    float _187 = _75 * _107;
    float _189 = _167 * _119;
    float _191 = _163 * _183;
    float _193 = -_163;
    float _195 = _193 + 1.0;
    float _197 = _187 * _83;
    float _199 = -_179;
    float _201 = _199 + 1.0;
    float _203 = _185 * _191;
    float _205 = -(*spvDescriptorSet0.fp_c9)._m0[116].w;
    float _207 = _131 + _205;
    float _209 = in.m_39.w;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = _147 * _201;
    float _217 = fma(_189, _207, (*spvDescriptorSet0.fp_c9)._m0[116].x);
    float _219 = fma(_195, (*spvDescriptorSet0.fp_c9)._m0[115].x, _203);
    float _221 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _223 = fma(_197, (*spvDescriptorSet0.fp_c8)._m0[30].w, _221);
    float _225 = in.m_41.x;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = fma(_217, _215, _219);
    float _233 = 1.0 / _223;
    float _235 = fma(_179, (*spvDescriptorSet0.fp_c9)._m0[117].x, _231);
    float _237 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _239 = _233 * _237;
    float _241 = _75 * _229;
    float _243 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _245 = _131 + _243;
    float _247 = _121 * _93;
    float _249 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _251 = fma(_95, (*spvDescriptorSet0.fp_c8)._m0[30].w, _249);
    float _253 = precise::max(_247, 0.5);
    float _255 = 1.0 / _251;
    float _257 = precise::min(_253, 0.60000002384185791015625);
    float _259 = fma(_257, 9.9999980926513671875, -4.99999904632568359375);
    float _261 = _75 * _213;
    float _263 = fma(_259, 0.25, _235);
    float _265 = _261 * _263;
    float _267 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _269 = -_239;
    float _271 = fma(_255, _267, _269);
    float _273 = 0.0 + _265;
    float _275 = precise::clamp(_273, 0.0, 1.0);
    float _277 = abs(_271);
    bool _279 = _277 < (*spvDescriptorSet0.fp_c9)._m0[141].x;
    float _281 = float(_279);
    float _283 = _275 * _281;
    float _285 = _283 * _241;
    bool _287 = _285 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _289 = isnan(_285);
    bool _291 = _287 || _289;
    bool _293 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _295 = _291 || _293;
    float _297 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _299 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _297;
    float _301 = _239;
    if (!_295)
    {
        discard_fragment();
    }
    float _303 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _305 = _303 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _307 = 1.0 / _299;
    float _309 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _311 = _131 + _309;
    float _313 = 1.0 / _305;
    float _315 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _317 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _315;
    float _319 = _311 * _307;
    float _321 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _323 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _321;
    float _325 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _327 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _325;
    float _329 = fma(_317, _319, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _331 = fma(_323, _319, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _333 = fma(_327, _319, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _335 = _245 * _313;
    float _337 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _339 = _337 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _341 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _343 = _341 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    bool _345 = _131 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _347 = isnan(_131);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _359 = _357 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    bool _361 = _131 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _363 = isnan(_131);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = fma(_339, _335, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    bool _375 = _131 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _377 = isnan(_131);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    float _387 = -_355;
    float _389 = _387 + 1.0;
    float _391 = fma(_359, _335, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _393 = fma(_343, _335, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _395 = _371 * _389;
    float _397 = -_371;
    float _399 = _397 + 1.0;
    float _401 = _331 * _395;
    float _403 = _333 * _395;
    float _405 = _329 * _395;
    float _407 = -_385;
    float _409 = _407 + 1.0;
    float _411 = fma(_399, (*spvDescriptorSet0.fp_c9)._m0[107].x, _401);
    float _413 = fma(_399, (*spvDescriptorSet0.fp_c9)._m0[107].y, _403);
    float _415 = fma(_399, (*spvDescriptorSet0.fp_c9)._m0[107].z, _405);
    float _417 = _355 * _409;
    float _419 = fma(_373, _417, _411);
    float _421 = fma(_391, _417, _413);
    float _423 = fma(_393, _417, _415);
    float _425 = in.m_39.x;
    float _427 = gl_FragCoord.w;
    float _429 = _425 * _427;
    float _431 = fma(_385, (*spvDescriptorSet0.fp_c9)._m0[109].x, _419);
    float _433 = fma(_385, (*spvDescriptorSet0.fp_c9)._m0[109].y, _421);
    float _435 = fma(_385, (*spvDescriptorSet0.fp_c9)._m0[109].z, _423);
    float _437 = in.m_39.z;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = in.m_39.y;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = _75 * _429;
    float _451 = _75 * _441;
    float _453 = _75 * _447;
    float _455 = fma(_449, _259, _431);
    float _457 = fma(_453, _259, _433);
    float _459 = fma(_451, _259, _435);
    if (!_295)
    {
        out.m_44.x = _455;
        out.m_44.y = _457;
        out.m_44.z = _459;
        out.m_44.w = _265;
        return out;
    }
    float _461 = _457 * 0.715200006961822509765625;
    float _463 = in.m_46.w;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = in.m_46.x;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = in.m_46.y;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    float _481 = fma(_455, 0.2125999927520751953125, _461);
    float _483 = in.m_46.z;
    float _485 = gl_FragCoord.w;
    float _487 = _483 * _485;
    float _489 = fma(_459, 0.072200000286102294921875, _481);
    bool _491 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _493 = 1.0 / _489;
    float _495 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_491)
    {
        float _497 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _499 = _239 + _497;
        _301 = _499;
    }
    float _501 = _301;
    float _503 = _493 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _505 = precise::clamp(_503, 0.0, 1.0);
    float _507 = fma(_505, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _509 = _75 * _467;
    if (_491)
    {
        float _511 = _501 * 8.0;
        float _513 = precise::clamp(_511, 0.0, 1.0);
        _495 = _513;
    }
    float _515 = _495;
    float _517 = _75 * _479;
    float _519 = _507 * _509;
    float _521 = 0.0 + _285;
    float _523 = precise::clamp(_521, 0.0, 1.0);
    float _525 = _75 * _473;
    float _527 = _75 * _487;
    float _529 = fma(_457, _519, _517);
    float _531 = _523;
    if (_491)
    {
        float _533 = _523 * _515;
        _531 = _533;
    }
    float _535 = _531;
    float _537 = fma(_455, _519, _525);
    float _539 = fma(_459, _519, _527);
    float _541 = 0.0 + _535;
    float _543 = precise::clamp(_541, 0.0, 1.0);
    out.m_44.x = _537;
    out.m_44.y = _529;
    out.m_44.z = _539;
    out.m_44.w = _543;
    return out;
}

