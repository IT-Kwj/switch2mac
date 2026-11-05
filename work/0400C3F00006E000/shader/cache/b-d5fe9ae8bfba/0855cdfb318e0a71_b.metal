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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    texture2d<float> vp_t_tcb_20 [[id(14)]];
    sampler vp_t_tcb_20Smplr [[id(15)]];
    sampler vp_t_tcb_24Smplr_w [[id(16)]];
    sampler vp_t_tcb_32Smplr_w [[id(17)]];
    sampler vp_t_tcb_30Smplr_w [[id(18)]];
    sampler vp_t_tcb_1CSmplr_w [[id(19)]];
    sampler vp_t_tcb_20Smplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_64 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_94 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_90 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_92 [[user(locn9)]];
    float4 m_80 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 m_88 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_78 [[attribute(0)]];
    float4 m_70 [[attribute(1)]];
    float4 m_72 [[attribute(2)]];
    float4 m_68 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
    float4 m_50 [[attribute(6)]];
    float4 m_60 [[attribute(7)]];
    float4 m_62 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2585 = false;
    bool _307 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = in.m_50.w;
    float _112 = trunc(_108);
    int _115 = int(_112);
    float _117 = -_110;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _119;
    bool _123 = _115 >= 1;
    float _125 = 0.0;
    float _127 = as_type<float>(_115);
    float _129 = _119;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _125;
    if (!_123)
    {
        out.m_55.x = 0.0;
    }
    int _133 = 0;
    if (!_123)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2902 = as_type<float>(_137);
        out.gl_Position.z = _2902;
    }
    if (!_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _141 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_110);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = float(_115);
    bool _153 = _119 >= _151;
    bool _155 = !_149;
    bool _157 = _153 || _155;
    if (_157)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _127;
    if (_157)
    {
        out.m_55.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _139 = as_type<int>(_161);
    }
    int _163 = _139;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2957 = as_type<float>(_163);
        out.gl_Position.z = _2957;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = 1.0 / _151;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _119 * _167;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_169;
    float _191 = _171;
    float _209;
    if (!_189)
    {
        float _193 = in.m_60.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        _209 = _171;
    }
    _211 = false;
    float _213 = _209;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _213 + _215;
    bool _219 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _221 = isnan(_213);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    bool _235 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _237 = isnan(_213);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = 1.0 / _233;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _249;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = _217 * _247;
    float _257 = -_229;
    float _259 = _257 + 1.0;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _261;
    float _265 = fma(_251, _255, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _267 = _245 * _259;
    float _269 = fma(_263, _255, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _271 = -_245;
    float _273 = _271 + 1.0;
    float _275 = _265 * _267;
    float _277 = _269 * _267;
    float _279 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].x, _275);
    float _281 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].y, _277);
    float _283 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].x, _279);
    float _285 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].y, _281);
    bool _287 = !_253;
    float _305;
    if (!_287)
    {
        float _289 = in.m_60.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        _305 = _171;
    }
    _307 = false;
    float _309 = _305;
    float _311 = in.m_62.x;
    float _313 = in.m_62.y;
    bool _315 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _317 = isnan(_309);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _331 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _333 = isnan(_309);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _349 = _309 + _347;
    float _351 = 1.0 / _329;
    float _353 = -_325;
    float _355 = _353 + 1.0;
    bool _357 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _359 = _341 * _355;
    float _361 = -_341;
    float _363 = _361 + 1.0;
    float _365 = _345 * _351;
    float _367 = _285 * _313;
    float _369 = _283 * _311;
    float _371 = fma(_365, _349, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _373 = _371 * _359;
    float _375 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[115].x, _373);
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _383 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[116].x, _375);
    float _385 = _377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _387 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = _383 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _385;
    out.m_64.y = _387;
    out.m_64.z = _389;
    out.m_64.w = _391;
    bool _393 = !_357;
    if (!_393)
    {
        float _395 = in.m_60.x;
        float _397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _399 = _395 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _401 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[11].w, _119);
        float _403 = _401 * _397;
        float _405 = floor(_403);
        float _407 = -_405;
        float _409 = _403 + _407;
        _191 = _409;
    }
    float _411 = _191;
    float _413 = in.m_60.z;
    float _415 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _417 = log2(_415);
    float _419 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _421 = in.m_60.x;
    float _423 = in.m_60.y;
    float _425 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _429 = in.m_66.x;
    float _431 = in.m_66.y;
    float _433 = in.m_66.z;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _437 = _435 != 0;
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _441 = _439 != 0;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _445 = _443 != 0;
    float _447 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _449 = !_441;
    int _451 = _449 ? 0 : 1;
    float _453 = _417 * _119;
    bool _455 = !_437;
    int _457 = _455 ? 0 : 1;
    float _459 = exp2(_453);
    bool _461 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _463 = isnan(0.0);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _469 = _465 || _467;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _473 = _413 * 2.0;
    float _475 = _423 * 2.0;
    float _477 = _421 * 2.0;
    float _479 = floor(_473);
    float _481 = _423 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _483 = -_427;
    float _485 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[77].x, _483);
    float _487 = _423 + _421;
    float _489 = fma(_481, -2.0, _471);
    float _491 = -_459;
    float _493 = _491 + 1.0;
    float _495 = floor(_475);
    float _497 = _487 + (-1.0);
    float _499 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _489);
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _503 = _469 ? _493 : 0.0;
    float _505 = floor(_477);
    bool _507 = _479 >= 0.0;
    bool _509 = isnan(_479);
    bool _511 = _507 || _509;
    bool _513 = isnan(0.0);
    bool _515 = _511 || _513;
    float _517 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _519 = int(_517);
    bool _521 = _495 > 0.0;
    bool _523 = _495 >= 0.0;
    bool _525 = isnan(_495);
    bool _527 = _523 || _525;
    bool _529 = isnan(0.0);
    bool _531 = _527 || _529;
    float _533 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _535 = !_445;
    int _537 = _535 ? 0 : 1;
    float _539 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _541 = int(_539);
    bool _543 = _505 > 0.0;
    bool _545 = _505 >= 0.0;
    bool _547 = isnan(_505);
    bool _549 = _545 || _547;
    bool _551 = isnan(0.0);
    bool _553 = _549 || _551;
    int _555 = _515 ? 0 : 1;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _563 = _561 != 0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _567 = _565 != 0;
    int _569 = _553 ? 0 : 1;
    float _571 = float(_519);
    bool _573 = !_559;
    int _575 = _573 ? 0 : 1;
    bool _577 = _479 > 0.0;
    float _579 = 1.0 / _571;
    bool _581 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _583 = isnan(1.0);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _589 = _585 || _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _593 = 1.0 + _591;
    int _595 = abs(_575);
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _599 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[78].z, _501);
    int _601 = ~_555;
    int _603 = _601 + 1;
    int _605 = _603 + 1;
    float _607 = -_119;
    float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[76].x, _485);
    float _611 = 1.0 / _593;
    float _613 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[78].w, _597);
    float _615 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _599);
    int _617 = _605;
    if (!_577)
    {
        int _619 = ~_555;
        int _621 = _619 + 1;
        _617 = _621;
    }
    int _623 = _617;
    float _625 = float(_541);
    float _627 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _613);
    float _629 = float(_595);
    float _631 = _579 * _119;
    float _633 = float(_623);
    float _635 = _625 * _119;
    int _637 = ~_569;
    int _639 = _637 + 1;
    int _641 = _639 + 1;
    int _643 = _641;
    if (!_543)
    {
        int _645 = ~_569;
        int _647 = _645 + 1;
        _643 = _647;
    }
    int _649 = _643;
    float _651 = _629 * _633;
    if (_589)
    {
        float _653 = _503 * _611;
        _129 = _653;
    }
    float _655 = _129;
    bool _657 = !_563;
    int _659 = _657 ? 0 : 1;
    float _661 = _421 + (-0.5);
    float _663 = _651 * (-2.0);
    int _665 = _531 ? 0 : 1;
    int _667 = abs(_659);
    float _669 = fma(_663, _429, _429);
    bool _671 = !_567;
    int _673 = _671 ? 0 : 1;
    float _675 = float(_649);
    float _677 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[196].x, _669);
    float _679 = float(_667);
    float _681 = fma(_533, _663, _533);
    int _683 = ~_665;
    int _685 = _683 + 1;
    int _687 = _685 + 1;
    int _689 = _687;
    if (!_521)
    {
        int _691 = ~_665;
        int _693 = _691 + 1;
        _689 = _693;
    }
    int _695 = _689;
    float _697 = _679 * _675;
    int _699 = abs(_673);
    float _701 = _423 + _413;
    float _703 = fma(_681, _655, _677);
    float _705 = float(_695);
    float _707 = _697 * (-2.0);
    float _709 = float(_699);
    float _711 = _701 + (-1.0);
    float _713 = fma(_707, _431, _431);
    float _715 = _703 * 0.15915493667125701904296875;
    float _717 = _709 * _705;
    float _719 = _423 + (-0.5);
    float _721 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _723 = _413 + _421;
    float _725 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[196].y, _713);
    float _727 = fma(_721, _707, _721);
    float _729 = _723 + (-1.0);
    float _731 = _717 * (-2.0);
    float _733 = _413 + (-0.5);
    float _735 = fma(_727, _655, _725);
    float _737 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _739 = fma(_731, _433, _433);
    float _741 = _715 * 6.283185482025146484375;
    float _743 = sin(_741);
    float _745 = _735 * 0.15915493667125701904296875;
    float _747 = in.m_48.x;
    float _749 = in.m_48.y;
    float _751 = in.m_48.z;
    float _753 = fma(_737, _731, _737);
    float _755 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[196].z, _739);
    bool _757 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _759 = isnan(0.5);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _765 = _761 || _763;
    float _767 = in.m_68.x;
    float _769 = in.m_68.y;
    float _771 = in.m_68.z;
    float _773 = in.m_68.w;
    bool _775 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _777 = isnan(0.5);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _783 = _779 || _781;
    float _785 = fma(_753, _655, _755);
    float _787 = _715 * 6.283185482025146484375;
    float _789 = cos(_787);
    float _791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _793 = _785 * 0.15915493667125701904296875;
    float _795 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _797 = _419 * _791;
    float _799 = _745 * 6.283185482025146484375;
    float _801 = sin(_799);
    float _803 = _425 * _795;
    float _805 = in.m_70.x;
    float _807 = in.m_70.y;
    float _809 = in.m_70.z;
    float _811 = in.m_70.w;
    float _813 = _745 * 6.283185482025146484375;
    float _815 = cos(_813);
    float _817 = _749 * _769;
    float _819 = _793 * 6.283185482025146484375;
    float _821 = cos(_819);
    float _823 = fma(_747, _767, _817);
    float _825 = _743 * _801;
    float _827 = _789 * _801;
    float _829 = fma(_751, _771, _823);
    float _831 = _793 * 6.283185482025146484375;
    float _833 = sin(_831);
    float _835 = _789 * _815;
    float _837 = _743 * _815;
    float _839 = _789 * _821;
    float _841 = _743 * _821;
    float _843 = _815 * _821;
    float _845 = _801 * _821;
    float _847 = _839 * _803;
    float _849 = fma(_833, _835, _825);
    float _851 = -_803;
    float _853 = _833 * _851;
    float _855 = -_837;
    float _857 = fma(_833, _827, _855);
    float _859 = -_827;
    float _861 = fma(_833, _837, _859);
    float _863 = fma(_849, _797, _847);
    float _865 = _841 * _803;
    float _867 = fma(_843, _797, _853);
    float _869 = fma(_833, _825, _835);
    float _871 = fma(_857, _447, _863);
    float _873 = fma(_861, _797, _865);
    float _875 = fma(_845, _447, _867);
    float _877 = _749 * _807;
    float _879 = _871 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _881 = fma(_869, _447, _873);
    float _883 = _871 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _885 = fma(_747, _805, _877);
    float _887 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].x, _879);
    float _889 = _829 + _773;
    float _891 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].x, _883);
    float _893 = fma(_751, _809, _885);
    float _895 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[26].z, _887);
    float _897 = _871 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _899 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[24].z, _891);
    float _901 = _893 + _811;
    float _903 = _895 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _905 = in.m_72.x;
    float _907 = in.m_72.y;
    float _909 = in.m_72.z;
    float _911 = in.m_72.w;
    float _913 = _899 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _915 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].x, _897);
    float _917 = _889 + _903;
    float _919 = _901 + _913;
    float _921 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[25].z, _915);
    float _923 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _925 = _917 + _923;
    float _927 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _929 = _919 + _927;
    float _931 = _921 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _933 = _925 * _925;
    float _935 = fma(_929, _929, _933);
    float _937 = sqrt(_935);
    float _939 = _749 * _907;
    float _941 = fma(_747, _905, _939);
    float _943 = fma(_751, _909, _941);
    bool _945 = _937 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _947 = _943 + _911;
    float _949 = _947 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _951 = _947 + _931;
    float _953 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[11].x, _949);
    float _955 = _747;
    float _957 = _881;
    float _959 = _905;
    float _961 = _875;
    float _963 = _925;
    float _965 = _937;
    float _967 = _951;
    float _969 = _935;
    float _971 = _929;
    float _973 = _863;
    float _975 = _917;
    float _977 = _901;
    if (_945)
    {
        float _979 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _955 = _979;
    }
    float _981 = _955;
    float _983 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[11].z, _953);
    if (!_945)
    {
        _957 = _919;
    }
    float _985 = _957;
    float _987 = _983 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _989 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _991 = _937 + _989;
    float _993 = _987;
    float _995 = _985;
    if (_945)
    {
        float _997 = rsqrt(_935);
        _959 = _997;
    }
    float _999 = _959;
    float _1001 = _981;
    float _1003 = _999;
    if (_945)
    {
        float _1005 = _991 * _981;
        _1001 = _1005;
    }
    float _1007 = _1001;
    float _1009 = _947 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1011 = 1.0 / _987;
    if (_945)
    {
        float _1013 = _1007 * 0.15915493667125701904296875;
        _961 = _1013;
    }
    float _1015 = _961;
    float _1017 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1009);
    float _1019 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1017);
    float _1021 = _1009;
    if (_945)
    {
        float _1023 = _1015 * 6.283185482025146484375;
        float _1025 = sin(_1023);
        _1021 = _1025;
    }
    float _1027 = _1021;
    float _1029 = _1019 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1031 = _1029 + _987;
    float _1033 = _1007;
    if (_945)
    {
        float _1035 = _1015 * 6.283185482025146484375;
        float _1037 = cos(_1035);
        _1033 = _1037;
    }
    float _1039 = _1033;
    if (_945)
    {
        float _1041 = _951 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _993 = _1041;
    }
    float _1043 = _993;
    float _1045 = _1031 * _1011;
    float _1047 = _1045 * 0.5;
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1051 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1049);
    float _1053 = _1027;
    float _1055 = _1043;
    float _1057 = _1047;
    if (_945)
    {
        float _1059 = fma(_1027, _1043, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1053 = _1059;
    }
    float _1061 = _1053;
    float _1063 = _1061;
    if (_945)
    {
        float _1065 = _999 * _1061;
        _1003 = _1065;
    }
    float _1067 = _1003;
    float _1069 = 1.0 / _1051;
    if (!_945)
    {
        _1063 = _917;
    }
    float _1071 = _1063;
    float _1073 = _1071;
    if (_945)
    {
        float _1075 = _1039 + (-1.0);
        _1055 = _1075;
    }
    float _1077 = _1055;
    if (_945)
    {
        float _1079 = fma(_929, _1067, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _995 = _1079;
    }
    float _1081 = _995;
    if (_945)
    {
        float _1083 = fma(_925, _1067, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1073 = _1083;
    }
    float _1085 = _1073;
    if (_783)
    {
        _963 = 1.0;
    }
    float _1087 = _963;
    float _1089 = _1087;
    if (_945)
    {
        float _1091 = _1077 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1057 = _1091;
    }
    float _1093 = _1057;
    if (_765)
    {
        _965 = _1081;
    }
    float _1095 = _965;
    float _1097 = _1095;
    if (_945)
    {
        float _1099 = fma(_951, _1039, _1093);
        _967 = _1099;
    }
    float _1101 = _967;
    float _1103 = _1101;
    if (_765)
    {
        _969 = _1085;
    }
    float _1105 = _969;
    float _1107 = _1105;
    if (!_765)
    {
        float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1111 = _947 + _1109;
        float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1115 = _901 + _1113;
        float _1117 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1119 = -_889;
        float _1121 = _1119 + _1085;
        float _1123 = _1111 * _1111;
        float _1125 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1127 = _889 + _1125;
        float _1129 = fma(_1115, _1115, _1123);
        float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1133 = fma(_1127, _1127, _1129);
        float _1135 = sqrt(_1133);
        float _1137 = _1117 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1139 = precise::min(_1135, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1141 = _1139 * _1131;
        float _1143 = -_947;
        float _1145 = _1143 + _1101;
        float _1147 = _1137 * _1141;
        float _1149 = -_901;
        float _1151 = _1149 + _1081;
        float _1153 = fma(_1145, _1147, _947);
        float _1155 = fma(_1151, _1147, _901);
        float _1157 = fma(_1121, _1147, _889);
        _1103 = _1153;
        _1097 = _1155;
        _1107 = _1157;
        _971 = _1151;
    }
    float _1159 = _1103;
    float _1161 = _1097;
    float _1163 = _1107;
    float _1165 = _971;
    float _1167 = _1165;
    if (_783)
    {
        _973 = 1.0;
    }
    float _1169 = _973;
    float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1173 = _1069 * _1171;
    float _1175 = _1169;
    if (!_783)
    {
        float _1177 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1179 = _1177 * 0.15915493667125701904296875;
        float _1181 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1183 = _1179 * 6.283185482025146484375;
        float _1185 = cos(_1183);
        float _1187 = _1181 * 0.15915493667125701904296875;
        float _1189 = _1179 * 6.283185482025146484375;
        float _1191 = sin(_1189);
        float _1193 = 1.0 / _1185;
        float _1195 = _1187 * 6.283185482025146484375;
        float _1197 = cos(_1195);
        float _1199 = _1191 * _1193;
        float _1201 = _1187 * 6.283185482025146484375;
        float _1203 = sin(_1201);
        float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1207 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1205;
        float _1209 = _1197 * _1199;
        float _1211 = 1.0 / _1207;
        float _1213 = 1.0 / _1209;
        float _1215 = _1203 * _1213;
        float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1219 = fma(_1173, _1215, _1217);
        float _1221 = _1219 * _1211;
        float _1223 = precise::clamp(_1221, 0.0, 1.0);
        _1167 = _1179;
        _1089 = _1223;
    }
    float _1225 = _1167;
    float _1227 = _1089;
    float _1229 = _1225;
    if (!_783)
    {
        float _1231 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1233 = _1231 * 0.15915493667125701904296875;
        float _1235 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1237 = _1233 * 6.283185482025146484375;
        float _1239 = cos(_1237);
        float _1241 = _1235 * 0.15915493667125701904296875;
        float _1243 = _1233 * 6.283185482025146484375;
        float _1245 = sin(_1243);
        float _1247 = 1.0 / _1239;
        float _1249 = _1241 * 6.283185482025146484375;
        float _1251 = cos(_1249);
        float _1253 = _1245 * _1247;
        float _1255 = _1241 * 6.283185482025146484375;
        float _1257 = sin(_1255);
        float _1259 = _1251 * _1253;
        float _1261 = 1.0 / _1259;
        float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1265 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1263;
        float _1267 = 1.0 / _1265;
        float _1269 = _1257 * _1261;
        float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1273 = fma(_1173, _1269, _1271);
        float _1275 = _1273 * _1267;
        float _1277 = precise::clamp(_1275, 0.0, 1.0);
        float _1279 = -_1277;
        float _1281 = _1279 + 1.0;
        _1229 = _1261;
        _1175 = _1281;
    }
    float _1283 = _1229;
    float _1285 = _1175;
    float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1289 = _1159 + _1287;
    float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1293 = _1161 + _1291;
    float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1297 = _1163 + _1295;
    float _1299 = _1289 * _1289;
    float _1301 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1303 = fma(_1085, 6.2500002968590706586837768554688e-05, 0.5);
    float _1305 = fma(_1293, _1293, _1299);
    float _1307 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1301);
    float _1309 = fma(_1297, _1297, _1305);
    float _1311 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1307);
    float _1313 = rsqrt(_1309);
    float _1315 = _1311 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1317 = sqrt(_1309);
    float _1319 = _1313 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1321 = _1293 * _1319;
    float _1323 = _1297 * _1319;
    float _1325 = _1321 * _1321;
    float _1327 = _1323 * _1323;
    float _1329 = _1325 + _1327;
    float _1331 = sqrt(_1329);
    bool _1333 = _1331 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1337 = _1331 + _1335;
    float _1339 = _1283;
    float _1341 = _1337;
    float _1343 = _1323;
    float _1345 = _1321;
    float _1347 = _1325;
    if (_1333)
    {
        float _1349 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1339 = _1349;
    }
    float _1351 = _1339;
    if (_1333)
    {
        float _1353 = _1337 * _1351;
        _1341 = _1353;
    }
    float _1355 = _1341;
    if (_1333)
    {
        float _1357 = _1355 * 0.15915493667125701904296875;
        _975 = _1357;
    }
    float _1359 = _975;
    float _1361 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_1333)
    {
        float _1363 = _1359 * 6.283185482025146484375;
        float _1365 = sin(_1363);
        _1361 = _1365;
    }
    float _1367 = _1361;
    float _1369 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1371 = precise::max(0.0, _1369);
    float _1373 = _1351;
    float _1375 = _1371;
    if (_1333)
    {
        float _1377 = _1359 * 6.283185482025146484375;
        float _1379 = cos(_1377);
        _1373 = _1379;
    }
    float _1381 = _1373;
    float _1383 = -_1319;
    float _1385 = -_1371;
    float _1387 = fma(_1289, _1383, _1385);
    float _1389 = fma(_901, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1333)
    {
        _977 = _1321;
    }
    float _1391 = _977;
    float _1393 = _1369;
    float _1395 = _1391;
    if (_1333)
    {
        float _1397 = rsqrt(_1329);
        _1393 = _1397;
    }
    float _1399 = _1393;
    if (_1333)
    {
        float _1401 = _1387 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1375 = _1401;
    }
    float _1403 = _1375;
    float _1405 = _1403;
    float _1407 = _1367;
    if (_1333)
    {
        float _1409 = fma(_1367, _1403, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1405 = _1409;
    }
    float _1411 = _1405;
    float _1413 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1415 = _1411;
    if (_1333)
    {
        float _1417 = _1381 + (-1.0);
        _1407 = _1417;
    }
    float _1419 = _1407;
    float _1421 = _1419;
    if (_1333)
    {
        float _1423 = _1419 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1421 = _1423;
    }
    float _1425 = _1421;
    float _1427 = _1399;
    if (_1333)
    {
        float _1429 = _1399 * _1411;
        _1415 = _1429;
    }
    float _1431 = _1415;
    if (!_1333)
    {
        _1427 = _1387;
    }
    float _1433 = _1427;
    float _1435 = _1433;
    if (_1333)
    {
        float _1437 = fma(_1387, _1381, _1425);
        _1435 = _1437;
    }
    float _1439 = _1435;
    float _1441 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1333)
    {
        float _1443 = _1321 * _1431;
        _1395 = _1443;
    }
    float _1445 = _1395;
    if (_1333)
    {
        float _1447 = _1323 * _1431;
        _1343 = _1447;
    }
    float _1449 = _1343;
    if (!_1333)
    {
        _1345 = _1327;
    }
    float _1451 = _1345;
    float _1453 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1441);
    float _1455 = _1451;
    if (_1333)
    {
        float _1457 = _1445 * _1445;
        _1347 = _1457;
    }
    float _1459 = _1347;
    if (_1333)
    {
        float _1461 = _1449 * _1449;
        _1455 = _1461;
    }
    float _1463 = _1455;
    float _1465 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1467 = floor(_1389);
    float _1469 = fma(_1439, _1439, _1459);
    float _1471 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1465);
    float _1473 = _1469 + _1463;
    float _1475 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1477 = fma(_1317, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1475);
    float _1479 = precise::clamp(_1477, 0.0, 1.0);
    float _1481 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1453);
    float _1483 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1471);
    float _1485 = rsqrt(_1473);
    float _1487 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1489 = -_1479;
    float _1491 = _1489 + 1.0;
    float _1493 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1495 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1497 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1499 = -_1467;
    float _1501 = _1389 + _1499;
    float _1503 = abs(_1491);
    float _1505 = log2(_1503);
    float _1507 = -_1497;
    float _1509 = fma(_1507, _1413, 1.0);
    float _1511 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1513 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1515 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1511);
    float _1517 = _1485 * _1445;
    float _1519 = _1485 * _1439;
    float _1521 = _1485 * _1449;
    float _1523 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1515);
    float _1525 = _1517 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1527 = floor(_1493);
    float _1529 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1531 = -_1525;
    float _1533 = fma(_1519, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1531);
    float _1535 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1537 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1539 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1513);
    float _1541 = -_1521;
    float _1543 = fma(_1541, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1533);
    float _1545 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1535);
    float _1547 = exp2(_1537);
    float _1549 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1539);
    float _1551 = fma(_1543, -0.5, 0.5);
    float _1553 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1545);
    float _1555 = fma(_1543, 0.5, 0.5);
    float _1557 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1559 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1553);
    float _1561 = log2(_1509);
    float _1563 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1557);
    float _1565 = -_1527;
    float _1567 = _1493 + _1565;
    float _1569 = _1519 + 1.0;
    float _1571 = fma(_1555, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1573 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1563);
    float _1575 = sqrt(_1551);
    float _1577 = -_1519;
    float _1579 = fma(_1547, _1569, _1577);
    float _1581 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1549);
    float _1583 = fma(_1555, _1571, -0.212114393711090087890625);
    float _1585 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1573);
    float _1587 = fma(_1579, 0.5, 0.5);
    float _1589 = fma(_1555, _1583, 1.570728778839111328125);
    float _1591 = 1.0 / _1559;
    float _1593 = _1561 * 0.693147182464599609375;
    float2 _5158 = float2(_1501, _1567);
    float _1595 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5158, float2(0.0), isnan(_5158)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5158, float2(0.0), isnan(_5158)), level(0.0)).x;
    float _1597 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1599 = _1575 * 0.636619746685028076171875;
    float _1601 = -_1589;
    float _1603 = fma(_1599, _1601, 1.0);
    float _1605 = _1581 * _1591;
    float _1607 = _1585 * _1591;
    float _1609 = fma(_1081, 6.2500002968590706586837768554688e-05, 0.5);
    float _1611 = fma(_1605, 0.5, 0.5);
    float _1613 = fma(_1607, -0.5, 0.5);
    float3 _5193 = float3(_1611, _1613, _1597);
    float _1615 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5193, float3(0.0), isnan(_5193)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5193, float3(0.0), isnan(_5193)), level(0.0)).x;
    float3 _5204 = float3(_1611, _1613, _1597);
    float4 _1618 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5204, float3(0.0), isnan(_5204)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5204, float3(0.0), isnan(_5204)), level(0.0)).xyzw;
    float _1620 = _1618.x;
    float _1622 = _1618.y;
    float _1624 = _1618.z;
    float _1626 = _1618.w;
    float2 _5220 = float2(_1603, _1587);
    float3 _1630 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5220, float2(0.0), isnan(_5220)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5220, float2(0.0), isnan(_5220)), level(0.0)).xyz;
    float _1632 = _1630.x;
    float _1634 = _1630.y;
    float _1636 = _1630.z;
    float2 _5234 = float2(_1609, _1303);
    float3 _1638 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5234, float2(0.0), isnan(_5234)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5234, float2(0.0), isnan(_5234)), level(0.0)).xyz;
    float _1640 = _1638.x;
    float _1642 = _1638.y;
    float _1644 = _1638.z;
    float _1646 = float(uint(_541));
    float _1648 = trunc(_631);
    int _1650 = int(_1648);
    float _1652 = _635 * _167;
    int _1654 = ~_541;
    int _1656 = _1654 + 1;
    float _1658 = -_615;
    float _1660 = _1658 + 1.0;
    int _1662 = _541 + (-1);
    float _1664 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1666 = _423 > 0.5;
    float _1668 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1670 = 1.0 / _1646;
    float _1672 = float(uint(_1650));
    float _1674 = trunc(_1652);
    int _1676 = int(_1674);
    float _1678 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1668);
    int _1680 = ~_541;
    int _1682 = _1680 + 1;
    float _1684 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1678);
    int _1686 = as_type<int>(_1670) + (-2);
    float _1688 = exp2(_1664);
    int _1690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1692 = _1690 != 0;
    float _1694 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1684);
    float _1696 = as_type<float>(_1686) * _1672;
    bool _1698 = !_1692;
    float _1700 = _1698 ? 7.345489978790283203125 : 1.0;
    out.gl_Position.x = _1581;
    out.gl_Position.y = _1585;
    out.gl_Position.z = _1694;
    out.gl_Position.w = _1559;
    float _1702 = trunc(_1696);
    float _1704 = precise::max(_1702, 0.0);
    uint _1707 = uint(_1704);
    float _1709 = _1700 * _421;
    float _1711 = float(_1650);
    float _1713 = -_1688;
    float _1715 = _1713 + 1.0;
    bool _1717 = _1711 >= _625;
    bool _1719 = isnan(_1711);
    bool _1721 = _1717 || _1719;
    bool _1723 = isnan(_625);
    bool _1725 = _1721 || _1723;
    float _1727 = float(_1725);
    float _1729 = floor(_1709);
    int _1731 = _1656 * int(_1707);
    int _1733 = _1731 + _1650;
    float _1735 = trunc(_1727);
    int _1737 = int(_1735);
    float _1739 = float(uint(_1733));
    float _1741 = -_1729;
    float _1743 = _1709 + _1741;
    float _1745 = as_type<float>(_1686) * _1739;
    float _1747 = trunc(_1745);
    float _1749 = precise::max(_1747, 0.0);
    uint _1751 = uint(_1749);
    int _1753 = ~_1737;
    int _1755 = _1753 + 1;
    int _1757 = _1755 + 1;
    int _1759 = int(_1707) + int(_1751);
    int _1761 = _1682 * _1759;
    int _1763 = _1761 + _1650;
    bool _1765 = uint(_1763) >= uint(_541);
    bool _1767 = !_1765;
    int _1769 = _1767 ? 0 : (-1);
    bool _1771 = _541 == 0;
    int _1773 = ~_1759;
    int _1775 = _1773 + _1769;
    int _1777 = _1775 + 1;
    float _1779 = _1743 * _625;
    int _1781 = _541 * _1777;
    int _1783 = _1781 + _1650;
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1787 = _1785 != 0;
    float _1789 = trunc(_1779);
    int _1791 = int(_1789);
    int _1793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1795 = _1793 != 0;
    bool _1797 = !_1771;
    int _1799 = _1797 ? _1783 : (-1);
    bool _1801 = !_1787;
    int _1803 = _1801 ? 0 : 1;
    int _1805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1807 = _1805 != 0;
    int _1809 = _1799 * _1757;
    int _1811 = abs(_451);
    int _1813 = abs(_1803);
    int _1815 = _1737 * _1662;
    int _1817 = _1815 + _1809;
    int _1819 = abs(_457);
    int _1821 = _1791 * _1813;
    int _1823 = _1821 + _1650;
    int _1825 = abs(_537);
    int _1827 = _1817 * _1811;
    bool _1829 = !_1807;
    int _1831 = _1829 ? 0 : 1;
    int _1833 = _1676 * _1819;
    int _1835 = _1833 + _1827;
    int _1837 = abs(_1831);
    int _1839 = _1823 * _1825;
    int _1841 = _1839 + _1835;
    int _1843 = ~_541;
    int _1845 = _1843 + 1;
    int _1847 = _1791 * _1837;
    int _1849 = _1847 + _1841;
    float _1851 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1853 = _1851 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1855 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1857 = _1855 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1859 = float(uint(_1849));
    float _1861 = 1.0 / _1853;
    bool _1863 = _421 > 0.5;
    float _1865 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1867 = _411 + _1865;
    float _1869 = as_type<float>(_1686) * _1859;
    int _1871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1873 = _1871 != 0;
    float _1875 = trunc(_1869);
    float _1877 = precise::max(_1875, 0.0);
    uint _1879 = uint(_1877);
    float _1881 = 1.0 / _1857;
    float _1883 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1885 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1883;
    int _1887 = _1845 * int(_1879);
    int _1889 = _1887 + _1849;
    float _1891 = float(uint(_1889));
    bool _1893 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1895 = isnan(_411);
    bool _1897 = _1893 || _1895;
    bool _1899 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1901 = _1897 || _1899;
    float _1903 = float(_1901);
    float _1905 = _1885 * _1881;
    bool _1907 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1909 = isnan(_411);
    bool _1911 = _1907 || _1909;
    bool _1913 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1915 = _1911 || _1913;
    float _1917 = float(_1915);
    float _1919 = as_type<float>(_1686) * _1891;
    float _1921 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1923 = _1921 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1925 = fma(_1905, _1867, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1927 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1929 = isnan(_411);
    bool _1931 = _1927 || _1929;
    bool _1933 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1935 = _1931 || _1933;
    float _1937 = float(_1935);
    float _1939 = trunc(_1919);
    float _1941 = precise::max(_1939, 0.0);
    uint _1943 = uint(_1941);
    float _1945 = _1923 * _1861;
    float _1947 = float(uint(_1823));
    float _1949 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1951 = _411 + _1949;
    float _1953 = -_1903;
    float _1955 = _1953 + 1.0;
    float _1957 = -_1917;
    float _1959 = _1957 + 1.0;
    float _1961 = as_type<float>(_1686) * _1947;
    float _1963 = fma(_1945, _1951, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1965 = _1937 * _1955;
    float _1967 = _1903 * _1959;
    float _1969 = trunc(_1961);
    float _1971 = precise::max(_1969, 0.0);
    uint _1973 = uint(_1971);
    float _1975 = -_1937;
    float _1977 = _1975 + 1.0;
    float _1979 = _1925 * _1965;
    int _1981 = ~_541;
    int _1983 = _1981 + 1;
    int _1985 = int(_1879) + int(_1943);
    float _1987 = fma(_1977, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1979);
    float _1989 = -_183;
    int _1991 = _1863 ? as_type<int>(_1989) : as_type<int>(_183);
    int _1993 = ~_541;
    int _1995 = _1993 + 1;
    int _1997 = _1983 * _1985;
    int _1999 = _1997 + _1849;
    float _2001 = -_187;
    int _2003 = _1666 ? as_type<int>(_2001) : as_type<int>(_187);
    float _2005 = fma(_1963, _1967, _1987);
    bool _2007 = !_1795;
    float _2009 = _2007 ? _183 : as_type<float>(_1991);
    bool _2011 = !_1873;
    float _2013 = _2011 ? _187 : as_type<float>(_2003);
    int _2015 = _1995 * int(_1973);
    int _2017 = _2015 + _1823;
    bool _2019 = uint(_1999) >= uint(_541);
    float _2021 = _2009 + 0.5;
    float _2023 = _2013 + (-0.5);
    float _2025 = float(uint(_2017));
    float _2027 = fma(_2021, (*spvDescriptorSet0.vp_c9)._m0[80].x, _609);
    bool _2029 = !_2019;
    int _2031 = _2029 ? 0 : (-1);
    float _2033 = -_2023;
    float _2035 = -_499;
    float _2037 = fma(_2033, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2035);
    float _2039 = fma(_1917, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2005);
    float _2041 = as_type<float>(_1686) * _2025;
    int _2043 = ~_1985;
    int _2045 = _2043 + _2031;
    int _2047 = _2045 + 1;
    float _2049 = -_1660;
    float _2051 = fma(_2009, _2049, _2027);
    float _2053 = -_627;
    float _2055 = _2053 + 1.0;
    float _2057 = trunc(_2041);
    float _2059 = precise::max(_2057, 0.0);
    uint _2061 = uint(_2059);
    int _2063 = _541 * _2047;
    int _2065 = _2063 + _1849;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2069 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2071 = fma(_2013, _2055, _2037);
    float _2073 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2075 = !_1771;
    int _2077 = _2075 ? _2065 : (-1);
    float _2079 = abs(_1173);
    float _2081 = log2(_2079);
    int _2083 = ~_541;
    int _2085 = _2083 + 1;
    float _2087 = _2073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2089 = _2039 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2091 = _2077 >> 31;
    out.m_74.x = _2051;
    out.m_74.y = _2071;
    float _2093 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2095 = _2069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2097 = _2091 & 3;
    float _2099 = _839 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2101 = int(_1973) + int(_2061);
    float _2103 = _839 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2105 = _2077 + _2097;
    out.m_76.x = _2093;
    out.m_76.y = _2095;
    out.m_76.z = _2087;
    out.m_76.w = _2089;
    int _2107 = _2077 & 3;
    bool _2109 = _2107 != 0;
    int _2111 = _2085 * _2101;
    int _2113 = _2111 + _1823;
    float _2115 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2117 = _2105 >> 2;
    float _2119 = _839 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2123 = _2121 != 0;
    float _2125 = exp2(_2115);
    int _2127 = _2117 << 4;
    int _2129 = _2127 + 368;
    bool _2131 = uint(_2113) >= uint(_541);
    uint _2133 = uint(int(uint(_2129) >> uint(2)));
    uint _2135 = uint(int(uint(int(_2133)) >> uint(2)));
    int _2137 = int(_2133) & 3;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[int(_2135)][_2137];
    int _2141 = int(_2133) + 1;
    uint _2143 = uint(int(uint(_2141) >> uint(2)));
    int _2145 = _2141 & 3;
    float _2147 = (*spvDescriptorSet0.vp_c9)._m0[int(_2143)][_2145];
    bool _2149 = _1173 <= 8000.0;
    bool _2151 = isnan(_1173);
    bool _2153 = _2149 || _2151;
    bool _2155 = isnan(8000.0);
    bool _2157 = _2153 || _2155;
    float _2159 = float(_2157);
    float _2161 = -_833;
    float _2163 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2099);
    float _2165 = -_833;
    float _2167 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2103);
    float _2169 = _849 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2171 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2163);
    int _2173 = _2077 & 3;
    bool _2175 = _2173 != 0;
    float _2177 = -_833;
    float _2179 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2119);
    float _2181 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2169);
    float _2183 = _857 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2185 = fma(_2125, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2187 = precise::clamp(_2185, 0.0, 1.0);
    float _2189 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2191 = _849 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2193 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2183);
    bool _2195 = uint(_2173) > 1u;
    int _2197 = _2129 + 8;
    uint _2199 = uint(int(uint(_2197) >> uint(2)));
    uint _2201 = uint(int(uint(int(_2199)) >> uint(2)));
    int _2203 = int(_2199) & 3;
    float _2205 = (*spvDescriptorSet0.vp_c9)._m0[int(_2201)][_2203];
    int _2207 = int(_2199) + 1;
    uint _2209 = uint(int(uint(_2207) >> uint(2)));
    int _2211 = _2207 & 3;
    float _2213 = (*spvDescriptorSet0.vp_c9)._m0[int(_2209)][_2211];
    float _2215 = _849 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2217 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2191);
    float _2219 = _857 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2221 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2179);
    float _2223 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2215);
    float _2225 = _857 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2227 = _2109 ? 0 : 1;
    float _2229 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2219);
    bool _2231 = uint(_2173) >= 2u;
    float _2233 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2225);
    float _2235 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2181);
    int _2237 = ~_2227;
    int _2239 = _2237 + 1;
    int _2241 = _2239 + 1;
    float _2243 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2217);
    int _2245 = _2241;
    if (!_2195)
    {
        int _2247 = ~_2227;
        int _2249 = _2247 + 1;
        _2245 = _2249;
    }
    int _2251 = _2245;
    float _2253 = fma(_2187, -2.0, 3.0);
    bool _2255 = _2173 != 3;
    float _2257 = _2187 * _2187;
    float _2259 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2223);
    float _2261 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2193);
    int _2263 = abs(_2251);
    float _2265 = _2257 * _2253;
    int _2267 = _2231 ? 0 : 1;
    float _2269 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2233);
    bool _2271 = !_2131;
    int _2273 = _2271 ? 0 : (-1);
    float _2275 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2167);
    bool _2277 = !_2175;
    int _2279 = _2277 ? 0 : 1;
    float _2281 = _2189 * _2171;
    int _2283 = ~_2267;
    int _2285 = _2283 + 1;
    int _2287 = _2285 + 1;
    float _2289 = _2189 * _2275;
    bool _2291 = _2173 != 3;
    float _2293 = _2189 * _2221;
    int _2295 = _2287;
    if (_2255)
    {
        int _2297 = ~_2267;
        int _2299 = _2297 + 1;
        _2295 = _2299;
    }
    int _2301 = _2295;
    float _2303 = -_1595;
    float _2305 = _2303 + 1.0;
    int _2307 = ~_2263;
    int _2309 = _2307 + 1;
    int _2311 = _2309 + 1;
    float _2313 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2229);
    int _2315 = ~_2101;
    int _2317 = _2315 + _2273;
    int _2319 = _2317 + 1;
    int _2321 = abs(_2279);
    int _2323 = _2311 * as_type<int>(_2147);
    bool _2325 = !_2291;
    int _2327 = _2325 ? 0 : (-1);
    int _2329 = _541 * _2319;
    int _2331 = _2329 + _1823;
    int _2333 = abs(_2301);
    float _2335 = in.m_78.x;
    bool _2337 = !_2123;
    int _2339 = _2337 ? 0 : 1;
    int _2341 = ~_2321;
    int _2343 = _2341 + 1;
    int _2345 = _2343 + 1;
    int _2347 = abs(_2327);
    float _2349 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2351 = _2345 * as_type<int>(_2139);
    int _2353 = _2351 + _2323;
    int _2355 = abs(_2339);
    float _2357 = fma(_2349, _2235, _2289);
    float _2359 = fma(_2349, _2243, _2281);
    int _2361 = ~_2333;
    int _2363 = _2361 + 1;
    int _2365 = _2363 + 1;
    float _2367 = fma(_2349, _2259, _2293);
    int _2369 = ~_2347;
    int _2371 = _2369 + 1;
    int _2373 = _2371 + 1;
    float _2375 = _2261 + _2357;
    int _2377 = _2365 * as_type<int>(_2205);
    int _2379 = _2377 + _2353;
    bool _2381 = !_1771;
    int _2383 = _2381 ? _2331 : (-1);
    float _2385 = _2269 + _2359;
    int _2387 = ~_2355;
    int _2389 = _2387 + 1;
    int _2391 = _2389 + 1;
    int _2393 = _2373 * as_type<int>(_2213);
    int _2395 = _2393 + _2379;
    float _2397 = -_2265;
    float _2399 = _2397 + 1.0;
    float _2401 = _2313 + _2367;
    int _2403 = _2395 * _2391;
    float _2405 = fma(_2399, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2265);
    float _2407 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _1640;
    out.m_80.y = _1642;
    out.m_80.z = _1644;
    int _2409 = _2383 * _2355;
    int _2411 = _2409 + _2403;
    float _2413 = _2159 * _2405;
    float _2415 = _1559 * 0.5;
    float _2417 = _2407 * _1615;
    out.m_82.x = _2375;
    out.m_82.y = _2385;
    out.m_82.z = _2401;
    float _2419 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2421 = float(_2411);
    float _2423 = fma(_1585, -0.5, _2415);
    float _2425 = _1636 * _2417;
    float _2427 = _2305 * _2419;
    float _2429 = precise::clamp(_2427, 0.0, 1.0);
    float _2431 = -_2407;
    float _2433 = _2431 + 1.0;
    out.m_84.x = _2421;
    float _2435 = fma(_1626, _2425, _1624);
    float _2437 = -_2429;
    float _2439 = fma(_2437, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2441 = _1626 * _2433;
    bool _2443 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2445 = isnan(_1317);
    bool _2447 = _2443 || _2445;
    bool _2449 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2451 = _2447 || _2449;
    float _2453 = _1694 + _1559;
    float _2455 = _2439 * _2335;
    float _2457 = _1581 + _1559;
    float _2459 = _1626 * _2417;
    float _2461 = _2455 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2463 = _2453 * 0.5;
    float _2465 = fma(_1632, _2459, _1620);
    float _2467 = fma(_1634, _2459, _1622);
    float _2469 = _2457 * 0.5;
    out.m_86.x = _2461;
    float _2471 = _1227 * _1285;
    float _2473 = _2407;
    float _2475 = _2433;
    float _2477 = _2471;
    float _2479 = _2463;
    float _2481 = _2423;
    float _2483 = _2469;
    if (!_2451)
    {
        _2473 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2485 = _2473;
    out.m_88.x = _2465;
    out.m_88.y = _2467;
    out.m_88.z = _2435;
    out.m_88.w = _2441;
    float _2487 = _2471 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2489 = _2485;
    float _2491 = _2485;
    if (!_2451)
    {
        _2475 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2493 = _2475;
    out.m_90.x = _2469;
    out.m_90.y = _2423;
    out.m_90.z = _2463;
    out.m_90.w = _1559;
    float _2495 = _2493;
    float _2497 = _2493;
    if (!_2451)
    {
        _2477 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2499 = _2477;
    float _2501 = _2499;
    float _2503 = _2499;
    if (!_2451)
    {
        _2479 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2505 = _2479;
    float _2507 = _2505;
    float _2509 = _2505;
    if (!_2451)
    {
        _2481 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2511 = _2481;
    float _2513 = _2511;
    float _2515 = _2511;
    if (!_2451)
    {
        _2483 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2517 = _2483;
    bool _2519 = !_2451;
    float _2521 = _2517;
    float _2523 = _2517;
    if (!_2519)
    {
        bool _2525 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2527 = isnan(_1317);
        bool _2529 = _2525 || _2527;
        bool _2531 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2533 = _2529 || _2531;
        if (!_2533)
        {
            float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2537 = _1317 + _2535;
            float _2539 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2541 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2539;
            float _2543 = 1.0 / _2541;
            float _2545 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2547 = _2545 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2551 = _2549 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2553 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2555 = _2553 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2565 = _2537 * _2543;
            float _2567 = precise::clamp(_2565, 0.0, 1.0);
            float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2571 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2573 = fma(_2567, _2547, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2575 = fma(_2567, _2571, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2577 = fma(_2567, _2551, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2579 = fma(_2567, _2555, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2581 = fma(_2567, _2559, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2583 = fma(_2567, _2563, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2515 = _2575;
            _2497 = _2581;
            _2509 = _2573;
            _2491 = _2579;
            _2523 = _2577;
            _2503 = _2583;
            _2585 = true;
        }
        else
        {
            bool _2587 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2589 = isnan(_1317);
            bool _2591 = _2587 || _2589;
            bool _2593 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2595 = _2591 || _2593;
            if (!_2595)
            {
                _2507 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2597 = _2507;
            _2509 = _2597;
            if (!_2595)
            {
                _2513 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2599 = _2513;
            _2515 = _2599;
            if (!_2595)
            {
                _2521 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2601 = _2521;
            _2523 = _2601;
            if (!_2595)
            {
                _2489 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2603 = _2489;
            _2491 = _2603;
            if (!_2595)
            {
                _2495 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2605 = _2495;
            _2497 = _2605;
            if (!_2595)
            {
                _2501 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2607 = _2501;
            bool _2609 = !_2595;
            _2503 = _2607;
            if (!_2609)
            {
                bool _2611 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2613 = isnan(_1317);
                bool _2615 = _2611 || _2613;
                bool _2617 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2619 = _2615 || _2617;
                if (!_2619)
                {
                    float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2623 = _1317 + _2621;
                    float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2627 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2625;
                    float _2629 = 1.0 / _2627;
                    float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2641 = _2639 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2647 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2649 = _2647 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2651 = _2623 * _2629;
                    float _2653 = precise::clamp(_2651, 0.0, 1.0);
                    float _2655 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2659 = fma(_2653, _2633, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2661 = fma(_2653, _2657, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2663 = fma(_2653, _2637, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2665 = fma(_2653, _2641, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2667 = fma(_2653, _2645, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2669 = fma(_2653, _2649, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2515 = _2661;
                    _2497 = _2667;
                    _2509 = _2659;
                    _2491 = _2665;
                    _2523 = _2663;
                    _2503 = _2669;
                    _2585 = true;
                }
                else
                {
                    _2515 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2497 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2509 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2491 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2523 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2503 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2585 = false;
    float _2671 = _2515;
    float _2673 = _2497;
    float _2675 = _2509;
    float _2677 = _2491;
    float _2679 = _2523;
    float _2681 = _2503;
    float _2683 = _2487 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2685 = fma(_2385, -0.5, 0.5);
    float _2687 = precise::clamp(_2685, 0.0, 1.0);
    float _2689 = -_2671;
    float _2691 = _2689 + _2673;
    float _2693 = -_2675;
    float _2695 = _2693 + _2677;
    out.m_55.x = _2683;
    float _2697 = -_2679;
    float _2699 = _2697 + _2681;
    float _2701 = fma(_2687, _2691, _2671);
    float _2703 = fma(_2687, _2695, _2675);
    bool _2705 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2707 = _2701 * 0.586610972881317138671875;
    float _2709 = fma(_2687, _2699, _2679);
    out.m_92.x = 0.0;
    bool _2711 = _1227 > 0.0;
    bool _2713 = isnan(_1227);
    bool _2715 = _2711 || _2713;
    bool _2717 = isnan(0.0);
    bool _2719 = _2715 || _2717;
    float _2721 = fma(_2703, 0.298911988735198974609375, _2707);
    bool _2723 = _1285 <= 0.0;
    bool _2725 = !_2719;
    bool _2727 = _2723 || _2725;
    float _2729 = fma(_2709, 0.114477999508380889892578125, _2721);
    float _2731 = -_2729;
    float _2733 = _2703 + _2731;
    float _2735 = -_2729;
    float _2737 = _2701 + _2735;
    float _2739 = -_2729;
    float _2741 = _2709 + _2739;
    float _2743 = fma(_2733, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2729);
    float _2745 = fma(_2737, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2729);
    float _2747 = fma(_2741, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2729);
    bool _2749 = !_2705;
    if (!_2749)
    {
        float _2751 = -_1159;
        float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2755 = -_1161;
        float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2759 = -_1163;
        float _2761 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2763 = _2753 * _2753;
        float _2765 = fma(_2757, _2757, _2763);
        float _2767 = fma(_2761, _2761, _2765);
        float _2769 = sqrt(_2767);
        float _2771 = rsqrt(_2767);
        float _2773 = -_2769;
        float _2775 = _2773 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2777 = _2775 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2779 = precise::clamp(_2777, 0.0, 1.0);
        float _2781 = _2757 * _2771;
        float _2783 = _2753 * _2771;
        float _2785 = abs(_2779);
        float _2787 = log2(_2785);
        float _2789 = _2761 * _2771;
        float _2791 = _2781 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2793 = _2385 * _2783;
        float _2795 = -_2783;
        float _2797 = -_2791;
        float _2799 = fma(_2795, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2797);
        float _2801 = fma(_2375, _2781, _2793);
        float _2803 = -_2789;
        float _2805 = fma(_2803, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2799);
        float _2807 = fma(_2401, _2789, _2801);
        float _2809 = precise::clamp(_2807, 0.0, 1.0);
        float _2811 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2813 = _2805 + _2811;
        float _2815 = _2787 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2817 = _2813 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2819 = precise::clamp(_2817, 0.0, 1.0);
        float _2821 = exp2(_2815);
        float _2823 = _2821 * _2819;
        float _2825 = _2809 * _2823;
        float _2827 = _2825 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2829 = _2825 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2831 = _2825 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2827;
        out.m_92.y = _2829;
        out.m_92.z = _2831;
    }
    out.m_94.x = _2743;
    out.m_94.y = _2745;
    out.m_94.z = _2747;
    if (!_2727)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _2833 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2833;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2585 = false;
    bool _307 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = in.m_50.w;
    float _112 = trunc(_108);
    int _115 = int(_112);
    float _117 = -_110;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _119;
    bool _123 = _115 >= 1;
    float _125 = 0.0;
    float _127 = as_type<float>(_115);
    float _129 = _119;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _125;
    if (!_123)
    {
        out.m_55.x = 0.0;
    }
    int _133 = 0;
    if (!_123)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2902 = as_type<float>(_137);
        out.gl_Position.z = _2902;
    }
    if (!_123)
    {
        return out;
    }
    bool _141 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_110);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = float(_115);
    bool _153 = _119 >= _151;
    bool _155 = !_149;
    bool _157 = _153 || _155;
    if (_157)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _127;
    if (_157)
    {
        out.m_55.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _139 = as_type<int>(_161);
    }
    int _163 = _139;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2957 = as_type<float>(_163);
        out.gl_Position.z = _2957;
    }
    if (_157)
    {
        return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = 1.0 / _151;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _119 * _167;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_169;
    float _191 = _171;
    float _209;
    if (!_189)
    {
        float _193 = in.m_60.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        _209 = _171;
    }
    _211 = false;
    float _213 = _209;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _213 + _215;
    bool _219 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _221 = isnan(_213);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    bool _235 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _237 = isnan(_213);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = 1.0 / _233;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _249;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = _217 * _247;
    float _257 = -_229;
    float _259 = _257 + 1.0;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _261;
    float _265 = fma(_251, _255, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _267 = _245 * _259;
    float _269 = fma(_263, _255, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _271 = -_245;
    float _273 = _271 + 1.0;
    float _275 = _265 * _267;
    float _277 = _269 * _267;
    float _279 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].x, _275);
    float _281 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].y, _277);
    float _283 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].x, _279);
    float _285 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].y, _281);
    bool _287 = !_253;
    float _305;
    if (!_287)
    {
        float _289 = in.m_60.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        _305 = _171;
    }
    _307 = false;
    float _309 = _305;
    float _311 = in.m_62.x;
    float _313 = in.m_62.y;
    bool _315 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _317 = isnan(_309);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _331 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _333 = isnan(_309);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _349 = _309 + _347;
    float _351 = 1.0 / _329;
    float _353 = -_325;
    float _355 = _353 + 1.0;
    bool _357 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _359 = _341 * _355;
    float _361 = -_341;
    float _363 = _361 + 1.0;
    float _365 = _345 * _351;
    float _367 = _285 * _313;
    float _369 = _283 * _311;
    float _371 = fma(_365, _349, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _373 = _371 * _359;
    float _375 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[115].x, _373);
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _383 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[116].x, _375);
    float _385 = _377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _387 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = _383 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _385;
    out.m_64.y = _387;
    out.m_64.z = _389;
    out.m_64.w = _391;
    bool _393 = !_357;
    if (!_393)
    {
        float _395 = in.m_60.x;
        float _397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _399 = _395 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _401 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[11].w, _119);
        float _403 = _401 * _397;
        float _405 = floor(_403);
        float _407 = -_405;
        float _409 = _403 + _407;
        _191 = _409;
    }
    float _411 = _191;
    float _413 = in.m_60.z;
    float _415 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _417 = log2(_415);
    float _419 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _421 = in.m_60.x;
    float _423 = in.m_60.y;
    float _425 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _429 = in.m_66.x;
    float _431 = in.m_66.y;
    float _433 = in.m_66.z;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _437 = _435 != 0;
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _441 = _439 != 0;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _445 = _443 != 0;
    float _447 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _449 = !_441;
    int _451 = _449 ? 0 : 1;
    float _453 = _417 * _119;
    bool _455 = !_437;
    int _457 = _455 ? 0 : 1;
    float _459 = exp2(_453);
    bool _461 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _463 = isnan(0.0);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _469 = _465 || _467;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _473 = _413 * 2.0;
    float _475 = _423 * 2.0;
    float _477 = _421 * 2.0;
    float _479 = floor(_473);
    float _481 = _423 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _483 = -_427;
    float _485 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[77].x, _483);
    float _487 = _423 + _421;
    float _489 = fma(_481, -2.0, _471);
    float _491 = -_459;
    float _493 = _491 + 1.0;
    float _495 = floor(_475);
    float _497 = _487 + (-1.0);
    float _499 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _489);
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _503 = _469 ? _493 : 0.0;
    float _505 = floor(_477);
    bool _507 = _479 >= 0.0;
    bool _509 = isnan(_479);
    bool _511 = _507 || _509;
    bool _513 = isnan(0.0);
    bool _515 = _511 || _513;
    float _517 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _519 = int(_517);
    bool _521 = _495 > 0.0;
    bool _523 = _495 >= 0.0;
    bool _525 = isnan(_495);
    bool _527 = _523 || _525;
    bool _529 = isnan(0.0);
    bool _531 = _527 || _529;
    float _533 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _535 = !_445;
    int _537 = _535 ? 0 : 1;
    float _539 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _541 = int(_539);
    bool _543 = _505 > 0.0;
    bool _545 = _505 >= 0.0;
    bool _547 = isnan(_505);
    bool _549 = _545 || _547;
    bool _551 = isnan(0.0);
    bool _553 = _549 || _551;
    int _555 = _515 ? 0 : 1;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _563 = _561 != 0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _567 = _565 != 0;
    int _569 = _553 ? 0 : 1;
    float _571 = float(_519);
    bool _573 = !_559;
    int _575 = _573 ? 0 : 1;
    bool _577 = _479 > 0.0;
    float _579 = 1.0 / _571;
    bool _581 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _583 = isnan(1.0);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _589 = _585 || _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _593 = 1.0 + _591;
    int _595 = abs(_575);
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _599 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[78].z, _501);
    int _601 = ~_555;
    int _603 = _601 + 1;
    int _605 = _603 + 1;
    float _607 = -_119;
    float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[76].x, _485);
    float _611 = 1.0 / _593;
    float _613 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[78].w, _597);
    float _615 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _599);
    int _617 = _605;
    if (!_577)
    {
        int _619 = ~_555;
        int _621 = _619 + 1;
        _617 = _621;
    }
    int _623 = _617;
    float _625 = float(_541);
    float _627 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _613);
    float _629 = float(_595);
    float _631 = _579 * _119;
    float _633 = float(_623);
    float _635 = _625 * _119;
    int _637 = ~_569;
    int _639 = _637 + 1;
    int _641 = _639 + 1;
    int _643 = _641;
    if (!_543)
    {
        int _645 = ~_569;
        int _647 = _645 + 1;
        _643 = _647;
    }
    int _649 = _643;
    float _651 = _629 * _633;
    if (_589)
    {
        float _653 = _503 * _611;
        _129 = _653;
    }
    float _655 = _129;
    bool _657 = !_563;
    int _659 = _657 ? 0 : 1;
    float _661 = _421 + (-0.5);
    float _663 = _651 * (-2.0);
    int _665 = _531 ? 0 : 1;
    int _667 = abs(_659);
    float _669 = fma(_663, _429, _429);
    bool _671 = !_567;
    int _673 = _671 ? 0 : 1;
    float _675 = float(_649);
    float _677 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[196].x, _669);
    float _679 = float(_667);
    float _681 = fma(_533, _663, _533);
    int _683 = ~_665;
    int _685 = _683 + 1;
    int _687 = _685 + 1;
    int _689 = _687;
    if (!_521)
    {
        int _691 = ~_665;
        int _693 = _691 + 1;
        _689 = _693;
    }
    int _695 = _689;
    float _697 = _679 * _675;
    int _699 = abs(_673);
    float _701 = _423 + _413;
    float _703 = fma(_681, _655, _677);
    float _705 = float(_695);
    float _707 = _697 * (-2.0);
    float _709 = float(_699);
    float _711 = _701 + (-1.0);
    float _713 = fma(_707, _431, _431);
    float _715 = _703 * 0.15915493667125701904296875;
    float _717 = _709 * _705;
    float _719 = _423 + (-0.5);
    float _721 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _723 = _413 + _421;
    float _725 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[196].y, _713);
    float _727 = fma(_721, _707, _721);
    float _729 = _723 + (-1.0);
    float _731 = _717 * (-2.0);
    float _733 = _413 + (-0.5);
    float _735 = fma(_727, _655, _725);
    float _737 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _739 = fma(_731, _433, _433);
    float _741 = _715 * 6.283185482025146484375;
    float _743 = sin(_741);
    float _745 = _735 * 0.15915493667125701904296875;
    float _747 = in.m_48.x;
    float _749 = in.m_48.y;
    float _751 = in.m_48.z;
    float _753 = fma(_737, _731, _737);
    float _755 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[196].z, _739);
    bool _757 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _759 = isnan(0.5);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _765 = _761 || _763;
    float _767 = in.m_68.x;
    float _769 = in.m_68.y;
    float _771 = in.m_68.z;
    float _773 = in.m_68.w;
    bool _775 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _777 = isnan(0.5);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _783 = _779 || _781;
    float _785 = fma(_753, _655, _755);
    float _787 = _715 * 6.283185482025146484375;
    float _789 = cos(_787);
    float _791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _793 = _785 * 0.15915493667125701904296875;
    float _795 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _797 = _419 * _791;
    float _799 = _745 * 6.283185482025146484375;
    float _801 = sin(_799);
    float _803 = _425 * _795;
    float _805 = in.m_70.x;
    float _807 = in.m_70.y;
    float _809 = in.m_70.z;
    float _811 = in.m_70.w;
    float _813 = _745 * 6.283185482025146484375;
    float _815 = cos(_813);
    float _817 = _749 * _769;
    float _819 = _793 * 6.283185482025146484375;
    float _821 = cos(_819);
    float _823 = fma(_747, _767, _817);
    float _825 = _743 * _801;
    float _827 = _789 * _801;
    float _829 = fma(_751, _771, _823);
    float _831 = _793 * 6.283185482025146484375;
    float _833 = sin(_831);
    float _835 = _789 * _815;
    float _837 = _743 * _815;
    float _839 = _789 * _821;
    float _841 = _743 * _821;
    float _843 = _815 * _821;
    float _845 = _801 * _821;
    float _847 = _839 * _803;
    float _849 = fma(_833, _835, _825);
    float _851 = -_803;
    float _853 = _833 * _851;
    float _855 = -_837;
    float _857 = fma(_833, _827, _855);
    float _859 = -_827;
    float _861 = fma(_833, _837, _859);
    float _863 = fma(_849, _797, _847);
    float _865 = _841 * _803;
    float _867 = fma(_843, _797, _853);
    float _869 = fma(_833, _825, _835);
    float _871 = fma(_857, _447, _863);
    float _873 = fma(_861, _797, _865);
    float _875 = fma(_845, _447, _867);
    float _877 = _749 * _807;
    float _879 = _871 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _881 = fma(_869, _447, _873);
    float _883 = _871 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _885 = fma(_747, _805, _877);
    float _887 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].x, _879);
    float _889 = _829 + _773;
    float _891 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].x, _883);
    float _893 = fma(_751, _809, _885);
    float _895 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[26].z, _887);
    float _897 = _871 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _899 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[24].z, _891);
    float _901 = _893 + _811;
    float _903 = _895 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _905 = in.m_72.x;
    float _907 = in.m_72.y;
    float _909 = in.m_72.z;
    float _911 = in.m_72.w;
    float _913 = _899 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _915 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].x, _897);
    float _917 = _889 + _903;
    float _919 = _901 + _913;
    float _921 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[25].z, _915);
    float _923 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _925 = _917 + _923;
    float _927 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _929 = _919 + _927;
    float _931 = _921 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _933 = _925 * _925;
    float _935 = fma(_929, _929, _933);
    float _937 = sqrt(_935);
    float _939 = _749 * _907;
    float _941 = fma(_747, _905, _939);
    float _943 = fma(_751, _909, _941);
    bool _945 = _937 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _947 = _943 + _911;
    float _949 = _947 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _951 = _947 + _931;
    float _953 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[11].x, _949);
    float _955 = _747;
    float _957 = _881;
    float _959 = _905;
    float _961 = _875;
    float _963 = _925;
    float _965 = _937;
    float _967 = _951;
    float _969 = _935;
    float _971 = _929;
    float _973 = _863;
    float _975 = _917;
    float _977 = _901;
    if (_945)
    {
        float _979 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _955 = _979;
    }
    float _981 = _955;
    float _983 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[11].z, _953);
    if (!_945)
    {
        _957 = _919;
    }
    float _985 = _957;
    float _987 = _983 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _989 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _991 = _937 + _989;
    float _993 = _987;
    float _995 = _985;
    if (_945)
    {
        float _997 = rsqrt(_935);
        _959 = _997;
    }
    float _999 = _959;
    float _1001 = _981;
    float _1003 = _999;
    if (_945)
    {
        float _1005 = _991 * _981;
        _1001 = _1005;
    }
    float _1007 = _1001;
    float _1009 = _947 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1011 = 1.0 / _987;
    if (_945)
    {
        float _1013 = _1007 * 0.15915493667125701904296875;
        _961 = _1013;
    }
    float _1015 = _961;
    float _1017 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1009);
    float _1019 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1017);
    float _1021 = _1009;
    if (_945)
    {
        float _1023 = _1015 * 6.283185482025146484375;
        float _1025 = sin(_1023);
        _1021 = _1025;
    }
    float _1027 = _1021;
    float _1029 = _1019 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1031 = _1029 + _987;
    float _1033 = _1007;
    if (_945)
    {
        float _1035 = _1015 * 6.283185482025146484375;
        float _1037 = cos(_1035);
        _1033 = _1037;
    }
    float _1039 = _1033;
    if (_945)
    {
        float _1041 = _951 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _993 = _1041;
    }
    float _1043 = _993;
    float _1045 = _1031 * _1011;
    float _1047 = _1045 * 0.5;
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1051 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1049);
    float _1053 = _1027;
    float _1055 = _1043;
    float _1057 = _1047;
    if (_945)
    {
        float _1059 = fma(_1027, _1043, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1053 = _1059;
    }
    float _1061 = _1053;
    float _1063 = _1061;
    if (_945)
    {
        float _1065 = _999 * _1061;
        _1003 = _1065;
    }
    float _1067 = _1003;
    float _1069 = 1.0 / _1051;
    if (!_945)
    {
        _1063 = _917;
    }
    float _1071 = _1063;
    float _1073 = _1071;
    if (_945)
    {
        float _1075 = _1039 + (-1.0);
        _1055 = _1075;
    }
    float _1077 = _1055;
    if (_945)
    {
        float _1079 = fma(_929, _1067, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _995 = _1079;
    }
    float _1081 = _995;
    if (_945)
    {
        float _1083 = fma(_925, _1067, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1073 = _1083;
    }
    float _1085 = _1073;
    if (_783)
    {
        _963 = 1.0;
    }
    float _1087 = _963;
    float _1089 = _1087;
    if (_945)
    {
        float _1091 = _1077 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1057 = _1091;
    }
    float _1093 = _1057;
    if (_765)
    {
        _965 = _1081;
    }
    float _1095 = _965;
    float _1097 = _1095;
    if (_945)
    {
        float _1099 = fma(_951, _1039, _1093);
        _967 = _1099;
    }
    float _1101 = _967;
    float _1103 = _1101;
    if (_765)
    {
        _969 = _1085;
    }
    float _1105 = _969;
    float _1107 = _1105;
    if (!_765)
    {
        float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1111 = _947 + _1109;
        float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1115 = _901 + _1113;
        float _1117 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1119 = -_889;
        float _1121 = _1119 + _1085;
        float _1123 = _1111 * _1111;
        float _1125 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1127 = _889 + _1125;
        float _1129 = fma(_1115, _1115, _1123);
        float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1133 = fma(_1127, _1127, _1129);
        float _1135 = sqrt(_1133);
        float _1137 = _1117 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1139 = precise::min(_1135, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1141 = _1139 * _1131;
        float _1143 = -_947;
        float _1145 = _1143 + _1101;
        float _1147 = _1137 * _1141;
        float _1149 = -_901;
        float _1151 = _1149 + _1081;
        float _1153 = fma(_1145, _1147, _947);
        float _1155 = fma(_1151, _1147, _901);
        float _1157 = fma(_1121, _1147, _889);
        _1103 = _1153;
        _1097 = _1155;
        _1107 = _1157;
        _971 = _1151;
    }
    float _1159 = _1103;
    float _1161 = _1097;
    float _1163 = _1107;
    float _1165 = _971;
    float _1167 = _1165;
    if (_783)
    {
        _973 = 1.0;
    }
    float _1169 = _973;
    float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1173 = _1069 * _1171;
    float _1175 = _1169;
    if (!_783)
    {
        float _1177 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1179 = _1177 * 0.15915493667125701904296875;
        float _1181 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1183 = _1179 * 6.283185482025146484375;
        float _1185 = cos(_1183);
        float _1187 = _1181 * 0.15915493667125701904296875;
        float _1189 = _1179 * 6.283185482025146484375;
        float _1191 = sin(_1189);
        float _1193 = 1.0 / _1185;
        float _1195 = _1187 * 6.283185482025146484375;
        float _1197 = cos(_1195);
        float _1199 = _1191 * _1193;
        float _1201 = _1187 * 6.283185482025146484375;
        float _1203 = sin(_1201);
        float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1207 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1205;
        float _1209 = _1197 * _1199;
        float _1211 = 1.0 / _1207;
        float _1213 = 1.0 / _1209;
        float _1215 = _1203 * _1213;
        float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1219 = fma(_1173, _1215, _1217);
        float _1221 = _1219 * _1211;
        float _1223 = precise::clamp(_1221, 0.0, 1.0);
        _1167 = _1179;
        _1089 = _1223;
    }
    float _1225 = _1167;
    float _1227 = _1089;
    float _1229 = _1225;
    if (!_783)
    {
        float _1231 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1233 = _1231 * 0.15915493667125701904296875;
        float _1235 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1237 = _1233 * 6.283185482025146484375;
        float _1239 = cos(_1237);
        float _1241 = _1235 * 0.15915493667125701904296875;
        float _1243 = _1233 * 6.283185482025146484375;
        float _1245 = sin(_1243);
        float _1247 = 1.0 / _1239;
        float _1249 = _1241 * 6.283185482025146484375;
        float _1251 = cos(_1249);
        float _1253 = _1245 * _1247;
        float _1255 = _1241 * 6.283185482025146484375;
        float _1257 = sin(_1255);
        float _1259 = _1251 * _1253;
        float _1261 = 1.0 / _1259;
        float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1265 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1263;
        float _1267 = 1.0 / _1265;
        float _1269 = _1257 * _1261;
        float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1273 = fma(_1173, _1269, _1271);
        float _1275 = _1273 * _1267;
        float _1277 = precise::clamp(_1275, 0.0, 1.0);
        float _1279 = -_1277;
        float _1281 = _1279 + 1.0;
        _1229 = _1261;
        _1175 = _1281;
    }
    float _1283 = _1229;
    float _1285 = _1175;
    float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1289 = _1159 + _1287;
    float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1293 = _1161 + _1291;
    float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1297 = _1163 + _1295;
    float _1299 = _1289 * _1289;
    float _1301 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1303 = fma(_1085, 6.2500002968590706586837768554688e-05, 0.5);
    float _1305 = fma(_1293, _1293, _1299);
    float _1307 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1301);
    float _1309 = fma(_1297, _1297, _1305);
    float _1311 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1307);
    float _1313 = rsqrt(_1309);
    float _1315 = _1311 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1317 = sqrt(_1309);
    float _1319 = _1313 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1321 = _1293 * _1319;
    float _1323 = _1297 * _1319;
    float _1325 = _1321 * _1321;
    float _1327 = _1323 * _1323;
    float _1329 = _1325 + _1327;
    float _1331 = sqrt(_1329);
    bool _1333 = _1331 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1337 = _1331 + _1335;
    float _1339 = _1283;
    float _1341 = _1337;
    float _1343 = _1323;
    float _1345 = _1321;
    float _1347 = _1325;
    if (_1333)
    {
        float _1349 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1339 = _1349;
    }
    float _1351 = _1339;
    if (_1333)
    {
        float _1353 = _1337 * _1351;
        _1341 = _1353;
    }
    float _1355 = _1341;
    if (_1333)
    {
        float _1357 = _1355 * 0.15915493667125701904296875;
        _975 = _1357;
    }
    float _1359 = _975;
    float _1361 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_1333)
    {
        float _1363 = _1359 * 6.283185482025146484375;
        float _1365 = sin(_1363);
        _1361 = _1365;
    }
    float _1367 = _1361;
    float _1369 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1371 = precise::max(0.0, _1369);
    float _1373 = _1351;
    float _1375 = _1371;
    if (_1333)
    {
        float _1377 = _1359 * 6.283185482025146484375;
        float _1379 = cos(_1377);
        _1373 = _1379;
    }
    float _1381 = _1373;
    float _1383 = -_1319;
    float _1385 = -_1371;
    float _1387 = fma(_1289, _1383, _1385);
    float _1389 = fma(_901, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1333)
    {
        _977 = _1321;
    }
    float _1391 = _977;
    float _1393 = _1369;
    float _1395 = _1391;
    if (_1333)
    {
        float _1397 = rsqrt(_1329);
        _1393 = _1397;
    }
    float _1399 = _1393;
    if (_1333)
    {
        float _1401 = _1387 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1375 = _1401;
    }
    float _1403 = _1375;
    float _1405 = _1403;
    float _1407 = _1367;
    if (_1333)
    {
        float _1409 = fma(_1367, _1403, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1405 = _1409;
    }
    float _1411 = _1405;
    float _1413 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1415 = _1411;
    if (_1333)
    {
        float _1417 = _1381 + (-1.0);
        _1407 = _1417;
    }
    float _1419 = _1407;
    float _1421 = _1419;
    if (_1333)
    {
        float _1423 = _1419 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1421 = _1423;
    }
    float _1425 = _1421;
    float _1427 = _1399;
    if (_1333)
    {
        float _1429 = _1399 * _1411;
        _1415 = _1429;
    }
    float _1431 = _1415;
    if (!_1333)
    {
        _1427 = _1387;
    }
    float _1433 = _1427;
    float _1435 = _1433;
    if (_1333)
    {
        float _1437 = fma(_1387, _1381, _1425);
        _1435 = _1437;
    }
    float _1439 = _1435;
    float _1441 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1333)
    {
        float _1443 = _1321 * _1431;
        _1395 = _1443;
    }
    float _1445 = _1395;
    if (_1333)
    {
        float _1447 = _1323 * _1431;
        _1343 = _1447;
    }
    float _1449 = _1343;
    if (!_1333)
    {
        _1345 = _1327;
    }
    float _1451 = _1345;
    float _1453 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1441);
    float _1455 = _1451;
    if (_1333)
    {
        float _1457 = _1445 * _1445;
        _1347 = _1457;
    }
    float _1459 = _1347;
    if (_1333)
    {
        float _1461 = _1449 * _1449;
        _1455 = _1461;
    }
    float _1463 = _1455;
    float _1465 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1467 = floor(_1389);
    float _1469 = fma(_1439, _1439, _1459);
    float _1471 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1465);
    float _1473 = _1469 + _1463;
    float _1475 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1477 = fma(_1317, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1475);
    float _1479 = precise::clamp(_1477, 0.0, 1.0);
    float _1481 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1453);
    float _1483 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1471);
    float _1485 = rsqrt(_1473);
    float _1487 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1489 = -_1479;
    float _1491 = _1489 + 1.0;
    float _1493 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1495 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1497 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1499 = -_1467;
    float _1501 = _1389 + _1499;
    float _1503 = abs(_1491);
    float _1505 = log2(_1503);
    float _1507 = -_1497;
    float _1509 = fma(_1507, _1413, 1.0);
    float _1511 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1513 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1515 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1511);
    float _1517 = _1485 * _1445;
    float _1519 = _1485 * _1439;
    float _1521 = _1485 * _1449;
    float _1523 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1515);
    float _1525 = _1517 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1527 = floor(_1493);
    float _1529 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1531 = -_1525;
    float _1533 = fma(_1519, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1531);
    float _1535 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1537 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1539 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1513);
    float _1541 = -_1521;
    float _1543 = fma(_1541, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1533);
    float _1545 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1535);
    float _1547 = exp2(_1537);
    float _1549 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1539);
    float _1551 = fma(_1543, -0.5, 0.5);
    float _1553 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1545);
    float _1555 = fma(_1543, 0.5, 0.5);
    float _1557 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1559 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1553);
    float _1561 = log2(_1509);
    float _1563 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1557);
    float _1565 = -_1527;
    float _1567 = _1493 + _1565;
    float _1569 = _1519 + 1.0;
    float _1571 = fma(_1555, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1573 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1563);
    float _1575 = sqrt(_1551);
    float _1577 = -_1519;
    float _1579 = fma(_1547, _1569, _1577);
    float _1581 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1549);
    float _1583 = fma(_1555, _1571, -0.212114393711090087890625);
    float _1585 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1573);
    float _1587 = fma(_1579, 0.5, 0.5);
    float _1589 = fma(_1555, _1583, 1.570728778839111328125);
    float _1591 = 1.0 / _1559;
    float _1593 = _1561 * 0.693147182464599609375;
    float2 _5158 = float2(_1501, _1567);
    float _1595 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5158, float2(0.0), isnan(_5158)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5158, float2(0.0), isnan(_5158)), level(0.0)).x;
    float _1597 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1599 = _1575 * 0.636619746685028076171875;
    float _1601 = -_1589;
    float _1603 = fma(_1599, _1601, 1.0);
    float _1605 = _1581 * _1591;
    float _1607 = _1585 * _1591;
    float _1609 = fma(_1081, 6.2500002968590706586837768554688e-05, 0.5);
    float _1611 = fma(_1605, 0.5, 0.5);
    float _1613 = fma(_1607, -0.5, 0.5);
    float3 _5193 = float3(_1611, _1613, _1597);
    float _1615 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5193, float3(0.0), isnan(_5193)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5193, float3(0.0), isnan(_5193)), level(0.0)).x;
    float3 _5204 = float3(_1611, _1613, _1597);
    float4 _1618 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5204, float3(0.0), isnan(_5204)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5204, float3(0.0), isnan(_5204)), level(0.0)).xyzw;
    float _1620 = _1618.x;
    float _1622 = _1618.y;
    float _1624 = _1618.z;
    float _1626 = _1618.w;
    float2 _5220 = float2(_1603, _1587);
    float3 _1630 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5220, float2(0.0), isnan(_5220)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5220, float2(0.0), isnan(_5220)), level(0.0)).xyz;
    float _1632 = _1630.x;
    float _1634 = _1630.y;
    float _1636 = _1630.z;
    float2 _5234 = float2(_1609, _1303);
    float3 _1638 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5234, float2(0.0), isnan(_5234)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5234, float2(0.0), isnan(_5234)), level(0.0)).xyz;
    float _1640 = _1638.x;
    float _1642 = _1638.y;
    float _1644 = _1638.z;
    float _1646 = float(uint(_541));
    float _1648 = trunc(_631);
    int _1650 = int(_1648);
    float _1652 = _635 * _167;
    int _1654 = ~_541;
    int _1656 = _1654 + 1;
    float _1658 = -_615;
    float _1660 = _1658 + 1.0;
    int _1662 = _541 + (-1);
    float _1664 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1666 = _423 > 0.5;
    float _1668 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1670 = 1.0 / _1646;
    float _1672 = float(uint(_1650));
    float _1674 = trunc(_1652);
    int _1676 = int(_1674);
    float _1678 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1668);
    int _1680 = ~_541;
    int _1682 = _1680 + 1;
    float _1684 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1678);
    int _1686 = as_type<int>(_1670) + (-2);
    float _1688 = exp2(_1664);
    int _1690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1692 = _1690 != 0;
    float _1694 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1684);
    float _1696 = as_type<float>(_1686) * _1672;
    bool _1698 = !_1692;
    float _1700 = _1698 ? 7.345489978790283203125 : 1.0;
    out.gl_Position.x = _1581;
    out.gl_Position.y = _1585;
    out.gl_Position.z = _1694;
    out.gl_Position.w = _1559;
    float _1702 = trunc(_1696);
    float _1704 = precise::max(_1702, 0.0);
    uint _1707 = uint(_1704);
    float _1709 = _1700 * _421;
    float _1711 = float(_1650);
    float _1713 = -_1688;
    float _1715 = _1713 + 1.0;
    bool _1717 = _1711 >= _625;
    bool _1719 = isnan(_1711);
    bool _1721 = _1717 || _1719;
    bool _1723 = isnan(_625);
    bool _1725 = _1721 || _1723;
    float _1727 = float(_1725);
    float _1729 = floor(_1709);
    int _1731 = _1656 * int(_1707);
    int _1733 = _1731 + _1650;
    float _1735 = trunc(_1727);
    int _1737 = int(_1735);
    float _1739 = float(uint(_1733));
    float _1741 = -_1729;
    float _1743 = _1709 + _1741;
    float _1745 = as_type<float>(_1686) * _1739;
    float _1747 = trunc(_1745);
    float _1749 = precise::max(_1747, 0.0);
    uint _1751 = uint(_1749);
    int _1753 = ~_1737;
    int _1755 = _1753 + 1;
    int _1757 = _1755 + 1;
    int _1759 = int(_1707) + int(_1751);
    int _1761 = _1682 * _1759;
    int _1763 = _1761 + _1650;
    bool _1765 = uint(_1763) >= uint(_541);
    bool _1767 = !_1765;
    int _1769 = _1767 ? 0 : (-1);
    bool _1771 = _541 == 0;
    int _1773 = ~_1759;
    int _1775 = _1773 + _1769;
    int _1777 = _1775 + 1;
    float _1779 = _1743 * _625;
    int _1781 = _541 * _1777;
    int _1783 = _1781 + _1650;
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1787 = _1785 != 0;
    float _1789 = trunc(_1779);
    int _1791 = int(_1789);
    int _1793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1795 = _1793 != 0;
    bool _1797 = !_1771;
    int _1799 = _1797 ? _1783 : (-1);
    bool _1801 = !_1787;
    int _1803 = _1801 ? 0 : 1;
    int _1805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1807 = _1805 != 0;
    int _1809 = _1799 * _1757;
    int _1811 = abs(_451);
    int _1813 = abs(_1803);
    int _1815 = _1737 * _1662;
    int _1817 = _1815 + _1809;
    int _1819 = abs(_457);
    int _1821 = _1791 * _1813;
    int _1823 = _1821 + _1650;
    int _1825 = abs(_537);
    int _1827 = _1817 * _1811;
    bool _1829 = !_1807;
    int _1831 = _1829 ? 0 : 1;
    int _1833 = _1676 * _1819;
    int _1835 = _1833 + _1827;
    int _1837 = abs(_1831);
    int _1839 = _1823 * _1825;
    int _1841 = _1839 + _1835;
    int _1843 = ~_541;
    int _1845 = _1843 + 1;
    int _1847 = _1791 * _1837;
    int _1849 = _1847 + _1841;
    float _1851 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1853 = _1851 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1855 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1857 = _1855 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1859 = float(uint(_1849));
    float _1861 = 1.0 / _1853;
    bool _1863 = _421 > 0.5;
    float _1865 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1867 = _411 + _1865;
    float _1869 = as_type<float>(_1686) * _1859;
    int _1871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1873 = _1871 != 0;
    float _1875 = trunc(_1869);
    float _1877 = precise::max(_1875, 0.0);
    uint _1879 = uint(_1877);
    float _1881 = 1.0 / _1857;
    float _1883 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1885 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1883;
    int _1887 = _1845 * int(_1879);
    int _1889 = _1887 + _1849;
    float _1891 = float(uint(_1889));
    bool _1893 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1895 = isnan(_411);
    bool _1897 = _1893 || _1895;
    bool _1899 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1901 = _1897 || _1899;
    float _1903 = float(_1901);
    float _1905 = _1885 * _1881;
    bool _1907 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1909 = isnan(_411);
    bool _1911 = _1907 || _1909;
    bool _1913 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1915 = _1911 || _1913;
    float _1917 = float(_1915);
    float _1919 = as_type<float>(_1686) * _1891;
    float _1921 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1923 = _1921 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1925 = fma(_1905, _1867, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1927 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1929 = isnan(_411);
    bool _1931 = _1927 || _1929;
    bool _1933 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1935 = _1931 || _1933;
    float _1937 = float(_1935);
    float _1939 = trunc(_1919);
    float _1941 = precise::max(_1939, 0.0);
    uint _1943 = uint(_1941);
    float _1945 = _1923 * _1861;
    float _1947 = float(uint(_1823));
    float _1949 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1951 = _411 + _1949;
    float _1953 = -_1903;
    float _1955 = _1953 + 1.0;
    float _1957 = -_1917;
    float _1959 = _1957 + 1.0;
    float _1961 = as_type<float>(_1686) * _1947;
    float _1963 = fma(_1945, _1951, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1965 = _1937 * _1955;
    float _1967 = _1903 * _1959;
    float _1969 = trunc(_1961);
    float _1971 = precise::max(_1969, 0.0);
    uint _1973 = uint(_1971);
    float _1975 = -_1937;
    float _1977 = _1975 + 1.0;
    float _1979 = _1925 * _1965;
    int _1981 = ~_541;
    int _1983 = _1981 + 1;
    int _1985 = int(_1879) + int(_1943);
    float _1987 = fma(_1977, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1979);
    float _1989 = -_183;
    int _1991 = _1863 ? as_type<int>(_1989) : as_type<int>(_183);
    int _1993 = ~_541;
    int _1995 = _1993 + 1;
    int _1997 = _1983 * _1985;
    int _1999 = _1997 + _1849;
    float _2001 = -_187;
    int _2003 = _1666 ? as_type<int>(_2001) : as_type<int>(_187);
    float _2005 = fma(_1963, _1967, _1987);
    bool _2007 = !_1795;
    float _2009 = _2007 ? _183 : as_type<float>(_1991);
    bool _2011 = !_1873;
    float _2013 = _2011 ? _187 : as_type<float>(_2003);
    int _2015 = _1995 * int(_1973);
    int _2017 = _2015 + _1823;
    bool _2019 = uint(_1999) >= uint(_541);
    float _2021 = _2009 + 0.5;
    float _2023 = _2013 + (-0.5);
    float _2025 = float(uint(_2017));
    float _2027 = fma(_2021, (*spvDescriptorSet0.vp_c9)._m0[80].x, _609);
    bool _2029 = !_2019;
    int _2031 = _2029 ? 0 : (-1);
    float _2033 = -_2023;
    float _2035 = -_499;
    float _2037 = fma(_2033, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2035);
    float _2039 = fma(_1917, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2005);
    float _2041 = as_type<float>(_1686) * _2025;
    int _2043 = ~_1985;
    int _2045 = _2043 + _2031;
    int _2047 = _2045 + 1;
    float _2049 = -_1660;
    float _2051 = fma(_2009, _2049, _2027);
    float _2053 = -_627;
    float _2055 = _2053 + 1.0;
    float _2057 = trunc(_2041);
    float _2059 = precise::max(_2057, 0.0);
    uint _2061 = uint(_2059);
    int _2063 = _541 * _2047;
    int _2065 = _2063 + _1849;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2069 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2071 = fma(_2013, _2055, _2037);
    float _2073 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2075 = !_1771;
    int _2077 = _2075 ? _2065 : (-1);
    float _2079 = abs(_1173);
    float _2081 = log2(_2079);
    int _2083 = ~_541;
    int _2085 = _2083 + 1;
    float _2087 = _2073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2089 = _2039 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2091 = _2077 >> 31;
    out.m_74.x = _2051;
    out.m_74.y = _2071;
    float _2093 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2095 = _2069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2097 = _2091 & 3;
    float _2099 = _839 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2101 = int(_1973) + int(_2061);
    float _2103 = _839 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2105 = _2077 + _2097;
    out.m_76.x = _2093;
    out.m_76.y = _2095;
    out.m_76.z = _2087;
    out.m_76.w = _2089;
    int _2107 = _2077 & 3;
    bool _2109 = _2107 != 0;
    int _2111 = _2085 * _2101;
    int _2113 = _2111 + _1823;
    float _2115 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2117 = _2105 >> 2;
    float _2119 = _839 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2123 = _2121 != 0;
    float _2125 = exp2(_2115);
    int _2127 = _2117 << 4;
    int _2129 = _2127 + 368;
    bool _2131 = uint(_2113) >= uint(_541);
    uint _2133 = uint(int(uint(_2129) >> uint(2)));
    uint _2135 = uint(int(uint(int(_2133)) >> uint(2)));
    int _2137 = int(_2133) & 3;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[int(_2135)][_2137];
    int _2141 = int(_2133) + 1;
    uint _2143 = uint(int(uint(_2141) >> uint(2)));
    int _2145 = _2141 & 3;
    float _2147 = (*spvDescriptorSet0.vp_c9)._m0[int(_2143)][_2145];
    bool _2149 = _1173 <= 8000.0;
    bool _2151 = isnan(_1173);
    bool _2153 = _2149 || _2151;
    bool _2155 = isnan(8000.0);
    bool _2157 = _2153 || _2155;
    float _2159 = float(_2157);
    float _2161 = -_833;
    float _2163 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2099);
    float _2165 = -_833;
    float _2167 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2103);
    float _2169 = _849 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2171 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2163);
    int _2173 = _2077 & 3;
    bool _2175 = _2173 != 0;
    float _2177 = -_833;
    float _2179 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2119);
    float _2181 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2169);
    float _2183 = _857 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2185 = fma(_2125, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2187 = precise::clamp(_2185, 0.0, 1.0);
    float _2189 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2191 = _849 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2193 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2183);
    bool _2195 = uint(_2173) > 1u;
    int _2197 = _2129 + 8;
    uint _2199 = uint(int(uint(_2197) >> uint(2)));
    uint _2201 = uint(int(uint(int(_2199)) >> uint(2)));
    int _2203 = int(_2199) & 3;
    float _2205 = (*spvDescriptorSet0.vp_c9)._m0[int(_2201)][_2203];
    int _2207 = int(_2199) + 1;
    uint _2209 = uint(int(uint(_2207) >> uint(2)));
    int _2211 = _2207 & 3;
    float _2213 = (*spvDescriptorSet0.vp_c9)._m0[int(_2209)][_2211];
    float _2215 = _849 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2217 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2191);
    float _2219 = _857 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2221 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2179);
    float _2223 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2215);
    float _2225 = _857 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2227 = _2109 ? 0 : 1;
    float _2229 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2219);
    bool _2231 = uint(_2173) >= 2u;
    float _2233 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2225);
    float _2235 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2181);
    int _2237 = ~_2227;
    int _2239 = _2237 + 1;
    int _2241 = _2239 + 1;
    float _2243 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2217);
    int _2245 = _2241;
    if (!_2195)
    {
        int _2247 = ~_2227;
        int _2249 = _2247 + 1;
        _2245 = _2249;
    }
    int _2251 = _2245;
    float _2253 = fma(_2187, -2.0, 3.0);
    bool _2255 = _2173 != 3;
    float _2257 = _2187 * _2187;
    float _2259 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2223);
    float _2261 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2193);
    int _2263 = abs(_2251);
    float _2265 = _2257 * _2253;
    int _2267 = _2231 ? 0 : 1;
    float _2269 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2233);
    bool _2271 = !_2131;
    int _2273 = _2271 ? 0 : (-1);
    float _2275 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2167);
    bool _2277 = !_2175;
    int _2279 = _2277 ? 0 : 1;
    float _2281 = _2189 * _2171;
    int _2283 = ~_2267;
    int _2285 = _2283 + 1;
    int _2287 = _2285 + 1;
    float _2289 = _2189 * _2275;
    bool _2291 = _2173 != 3;
    float _2293 = _2189 * _2221;
    int _2295 = _2287;
    if (_2255)
    {
        int _2297 = ~_2267;
        int _2299 = _2297 + 1;
        _2295 = _2299;
    }
    int _2301 = _2295;
    float _2303 = -_1595;
    float _2305 = _2303 + 1.0;
    int _2307 = ~_2263;
    int _2309 = _2307 + 1;
    int _2311 = _2309 + 1;
    float _2313 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2229);
    int _2315 = ~_2101;
    int _2317 = _2315 + _2273;
    int _2319 = _2317 + 1;
    int _2321 = abs(_2279);
    int _2323 = _2311 * as_type<int>(_2147);
    bool _2325 = !_2291;
    int _2327 = _2325 ? 0 : (-1);
    int _2329 = _541 * _2319;
    int _2331 = _2329 + _1823;
    int _2333 = abs(_2301);
    float _2335 = in.m_78.x;
    bool _2337 = !_2123;
    int _2339 = _2337 ? 0 : 1;
    int _2341 = ~_2321;
    int _2343 = _2341 + 1;
    int _2345 = _2343 + 1;
    int _2347 = abs(_2327);
    float _2349 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2351 = _2345 * as_type<int>(_2139);
    int _2353 = _2351 + _2323;
    int _2355 = abs(_2339);
    float _2357 = fma(_2349, _2235, _2289);
    float _2359 = fma(_2349, _2243, _2281);
    int _2361 = ~_2333;
    int _2363 = _2361 + 1;
    int _2365 = _2363 + 1;
    float _2367 = fma(_2349, _2259, _2293);
    int _2369 = ~_2347;
    int _2371 = _2369 + 1;
    int _2373 = _2371 + 1;
    float _2375 = _2261 + _2357;
    int _2377 = _2365 * as_type<int>(_2205);
    int _2379 = _2377 + _2353;
    bool _2381 = !_1771;
    int _2383 = _2381 ? _2331 : (-1);
    float _2385 = _2269 + _2359;
    int _2387 = ~_2355;
    int _2389 = _2387 + 1;
    int _2391 = _2389 + 1;
    int _2393 = _2373 * as_type<int>(_2213);
    int _2395 = _2393 + _2379;
    float _2397 = -_2265;
    float _2399 = _2397 + 1.0;
    float _2401 = _2313 + _2367;
    int _2403 = _2395 * _2391;
    float _2405 = fma(_2399, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2265);
    float _2407 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _1640;
    out.m_80.y = _1642;
    out.m_80.z = _1644;
    int _2409 = _2383 * _2355;
    int _2411 = _2409 + _2403;
    float _2413 = _2159 * _2405;
    float _2415 = _1559 * 0.5;
    float _2417 = _2407 * _1615;
    out.m_82.x = _2375;
    out.m_82.y = _2385;
    out.m_82.z = _2401;
    float _2419 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2421 = float(_2411);
    float _2423 = fma(_1585, -0.5, _2415);
    float _2425 = _1636 * _2417;
    float _2427 = _2305 * _2419;
    float _2429 = precise::clamp(_2427, 0.0, 1.0);
    float _2431 = -_2407;
    float _2433 = _2431 + 1.0;
    out.m_84.x = _2421;
    float _2435 = fma(_1626, _2425, _1624);
    float _2437 = -_2429;
    float _2439 = fma(_2437, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2441 = _1626 * _2433;
    bool _2443 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2445 = isnan(_1317);
    bool _2447 = _2443 || _2445;
    bool _2449 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2451 = _2447 || _2449;
    float _2453 = _1694 + _1559;
    float _2455 = _2439 * _2335;
    float _2457 = _1581 + _1559;
    float _2459 = _1626 * _2417;
    float _2461 = _2455 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2463 = _2453 * 0.5;
    float _2465 = fma(_1632, _2459, _1620);
    float _2467 = fma(_1634, _2459, _1622);
    float _2469 = _2457 * 0.5;
    out.m_86.x = _2461;
    float _2471 = _1227 * _1285;
    float _2473 = _2407;
    float _2475 = _2433;
    float _2477 = _2471;
    float _2479 = _2463;
    float _2481 = _2423;
    float _2483 = _2469;
    if (!_2451)
    {
        _2473 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2485 = _2473;
    out.m_88.x = _2465;
    out.m_88.y = _2467;
    out.m_88.z = _2435;
    out.m_88.w = _2441;
    float _2487 = _2471 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2489 = _2485;
    float _2491 = _2485;
    if (!_2451)
    {
        _2475 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2493 = _2475;
    out.m_90.x = _2469;
    out.m_90.y = _2423;
    out.m_90.z = _2463;
    out.m_90.w = _1559;
    float _2495 = _2493;
    float _2497 = _2493;
    if (!_2451)
    {
        _2477 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2499 = _2477;
    float _2501 = _2499;
    float _2503 = _2499;
    if (!_2451)
    {
        _2479 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2505 = _2479;
    float _2507 = _2505;
    float _2509 = _2505;
    if (!_2451)
    {
        _2481 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2511 = _2481;
    float _2513 = _2511;
    float _2515 = _2511;
    if (!_2451)
    {
        _2483 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2517 = _2483;
    bool _2519 = !_2451;
    float _2521 = _2517;
    float _2523 = _2517;
    if (!_2519)
    {
        bool _2525 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2527 = isnan(_1317);
        bool _2529 = _2525 || _2527;
        bool _2531 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2533 = _2529 || _2531;
        if (!_2533)
        {
            float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2537 = _1317 + _2535;
            float _2539 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2541 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2539;
            float _2543 = 1.0 / _2541;
            float _2545 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2547 = _2545 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2551 = _2549 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2553 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2555 = _2553 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2565 = _2537 * _2543;
            float _2567 = precise::clamp(_2565, 0.0, 1.0);
            float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2571 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2573 = fma(_2567, _2547, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2575 = fma(_2567, _2571, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2577 = fma(_2567, _2551, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2579 = fma(_2567, _2555, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2581 = fma(_2567, _2559, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2583 = fma(_2567, _2563, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2515 = _2575;
            _2497 = _2581;
            _2509 = _2573;
            _2491 = _2579;
            _2523 = _2577;
            _2503 = _2583;
            _2585 = true;
        }
        else
        {
            bool _2587 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2589 = isnan(_1317);
            bool _2591 = _2587 || _2589;
            bool _2593 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2595 = _2591 || _2593;
            if (!_2595)
            {
                _2507 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2597 = _2507;
            _2509 = _2597;
            if (!_2595)
            {
                _2513 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2599 = _2513;
            _2515 = _2599;
            if (!_2595)
            {
                _2521 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2601 = _2521;
            _2523 = _2601;
            if (!_2595)
            {
                _2489 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2603 = _2489;
            _2491 = _2603;
            if (!_2595)
            {
                _2495 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2605 = _2495;
            _2497 = _2605;
            if (!_2595)
            {
                _2501 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2607 = _2501;
            bool _2609 = !_2595;
            _2503 = _2607;
            if (!_2609)
            {
                bool _2611 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2613 = isnan(_1317);
                bool _2615 = _2611 || _2613;
                bool _2617 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2619 = _2615 || _2617;
                if (!_2619)
                {
                    float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2623 = _1317 + _2621;
                    float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2627 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2625;
                    float _2629 = 1.0 / _2627;
                    float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2641 = _2639 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2647 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2649 = _2647 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2651 = _2623 * _2629;
                    float _2653 = precise::clamp(_2651, 0.0, 1.0);
                    float _2655 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2659 = fma(_2653, _2633, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2661 = fma(_2653, _2657, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2663 = fma(_2653, _2637, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2665 = fma(_2653, _2641, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2667 = fma(_2653, _2645, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2669 = fma(_2653, _2649, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2515 = _2661;
                    _2497 = _2667;
                    _2509 = _2659;
                    _2491 = _2665;
                    _2523 = _2663;
                    _2503 = _2669;
                    _2585 = true;
                }
                else
                {
                    _2515 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2497 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2509 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2491 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2523 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2503 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2585 = false;
    float _2671 = _2515;
    float _2673 = _2497;
    float _2675 = _2509;
    float _2677 = _2491;
    float _2679 = _2523;
    float _2681 = _2503;
    float _2683 = _2487 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2685 = fma(_2385, -0.5, 0.5);
    float _2687 = precise::clamp(_2685, 0.0, 1.0);
    float _2689 = -_2671;
    float _2691 = _2689 + _2673;
    float _2693 = -_2675;
    float _2695 = _2693 + _2677;
    out.m_55.x = _2683;
    float _2697 = -_2679;
    float _2699 = _2697 + _2681;
    float _2701 = fma(_2687, _2691, _2671);
    float _2703 = fma(_2687, _2695, _2675);
    bool _2705 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2707 = _2701 * 0.586610972881317138671875;
    float _2709 = fma(_2687, _2699, _2679);
    out.m_92.x = 0.0;
    bool _2711 = _1227 > 0.0;
    bool _2713 = isnan(_1227);
    bool _2715 = _2711 || _2713;
    bool _2717 = isnan(0.0);
    bool _2719 = _2715 || _2717;
    float _2721 = fma(_2703, 0.298911988735198974609375, _2707);
    bool _2723 = _1285 <= 0.0;
    bool _2725 = !_2719;
    bool _2727 = _2723 || _2725;
    float _2729 = fma(_2709, 0.114477999508380889892578125, _2721);
    float _2731 = -_2729;
    float _2733 = _2703 + _2731;
    float _2735 = -_2729;
    float _2737 = _2701 + _2735;
    float _2739 = -_2729;
    float _2741 = _2709 + _2739;
    float _2743 = fma(_2733, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2729);
    float _2745 = fma(_2737, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2729);
    float _2747 = fma(_2741, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2729);
    bool _2749 = !_2705;
    if (!_2749)
    {
        float _2751 = -_1159;
        float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2755 = -_1161;
        float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2759 = -_1163;
        float _2761 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2763 = _2753 * _2753;
        float _2765 = fma(_2757, _2757, _2763);
        float _2767 = fma(_2761, _2761, _2765);
        float _2769 = sqrt(_2767);
        float _2771 = rsqrt(_2767);
        float _2773 = -_2769;
        float _2775 = _2773 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2777 = _2775 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2779 = precise::clamp(_2777, 0.0, 1.0);
        float _2781 = _2757 * _2771;
        float _2783 = _2753 * _2771;
        float _2785 = abs(_2779);
        float _2787 = log2(_2785);
        float _2789 = _2761 * _2771;
        float _2791 = _2781 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2793 = _2385 * _2783;
        float _2795 = -_2783;
        float _2797 = -_2791;
        float _2799 = fma(_2795, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2797);
        float _2801 = fma(_2375, _2781, _2793);
        float _2803 = -_2789;
        float _2805 = fma(_2803, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2799);
        float _2807 = fma(_2401, _2789, _2801);
        float _2809 = precise::clamp(_2807, 0.0, 1.0);
        float _2811 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2813 = _2805 + _2811;
        float _2815 = _2787 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2817 = _2813 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2819 = precise::clamp(_2817, 0.0, 1.0);
        float _2821 = exp2(_2815);
        float _2823 = _2821 * _2819;
        float _2825 = _2809 * _2823;
        float _2827 = _2825 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2829 = _2825 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2831 = _2825 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2827;
        out.m_92.y = _2829;
        out.m_92.z = _2831;
    }
    out.m_94.x = _2743;
    out.m_94.y = _2745;
    out.m_94.z = _2747;
    if (!_2727)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _2833 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2833;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2585 = false;
    bool _307 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = in.m_50.w;
    float _112 = trunc(_108);
    int _115 = int(_112);
    float _117 = -_110;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _119;
    bool _123 = _115 >= 1;
    float _125 = 0.0;
    float _127 = as_type<float>(_115);
    float _129 = _119;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _125;
    if (!_123)
    {
        out.m_55.x = 0.0;
    }
    int _133 = 0;
    if (!_123)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2902 = as_type<float>(_137);
        out.gl_Position.z = _2902;
    }
    if (!_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _141 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_110);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = float(_115);
    bool _153 = _119 >= _151;
    bool _155 = !_149;
    bool _157 = _153 || _155;
    if (_157)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _127;
    if (_157)
    {
        out.m_55.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _139 = as_type<int>(_161);
    }
    int _163 = _139;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2957 = as_type<float>(_163);
        out.gl_Position.z = _2957;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = 1.0 / _151;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _119 * _167;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_169;
    float _191 = _171;
    float _209;
    if (!_189)
    {
        float _193 = in.m_60.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        _209 = _171;
    }
    _211 = false;
    float _213 = _209;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _213 + _215;
    bool _219 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _221 = isnan(_213);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    bool _235 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _237 = isnan(_213);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = 1.0 / _233;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _249;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = _217 * _247;
    float _257 = -_229;
    float _259 = _257 + 1.0;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _261;
    float _265 = fma(_251, _255, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _267 = _245 * _259;
    float _269 = fma(_263, _255, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _271 = -_245;
    float _273 = _271 + 1.0;
    float _275 = _265 * _267;
    float _277 = _269 * _267;
    float _279 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].x, _275);
    float _281 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].y, _277);
    float _283 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].x, _279);
    float _285 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].y, _281);
    bool _287 = !_253;
    float _305;
    if (!_287)
    {
        float _289 = in.m_60.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        _305 = _171;
    }
    _307 = false;
    float _309 = _305;
    float _311 = in.m_62.x;
    float _313 = in.m_62.y;
    bool _315 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _317 = isnan(_309);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _331 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _333 = isnan(_309);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _349 = _309 + _347;
    float _351 = 1.0 / _329;
    float _353 = -_325;
    float _355 = _353 + 1.0;
    bool _357 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _359 = _341 * _355;
    float _361 = -_341;
    float _363 = _361 + 1.0;
    float _365 = _345 * _351;
    float _367 = _285 * _313;
    float _369 = _283 * _311;
    float _371 = fma(_365, _349, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _373 = _371 * _359;
    float _375 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[115].x, _373);
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _383 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[116].x, _375);
    float _385 = _377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _387 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = _383 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _385;
    out.m_64.y = _387;
    out.m_64.z = _389;
    out.m_64.w = _391;
    bool _393 = !_357;
    if (!_393)
    {
        float _395 = in.m_60.x;
        float _397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _399 = _395 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _401 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[11].w, _119);
        float _403 = _401 * _397;
        float _405 = floor(_403);
        float _407 = -_405;
        float _409 = _403 + _407;
        _191 = _409;
    }
    float _411 = _191;
    float _413 = in.m_60.z;
    float _415 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _417 = log2(_415);
    float _419 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _421 = in.m_60.x;
    float _423 = in.m_60.y;
    float _425 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _429 = in.m_66.x;
    float _431 = in.m_66.y;
    float _433 = in.m_66.z;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _437 = _435 != 0;
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _441 = _439 != 0;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _445 = _443 != 0;
    float _447 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _449 = !_441;
    int _451 = _449 ? 0 : 1;
    float _453 = _417 * _119;
    bool _455 = !_437;
    int _457 = _455 ? 0 : 1;
    float _459 = exp2(_453);
    bool _461 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _463 = isnan(0.0);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _469 = _465 || _467;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _473 = _413 * 2.0;
    float _475 = _423 * 2.0;
    float _477 = _421 * 2.0;
    float _479 = floor(_473);
    float _481 = _423 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _483 = -_427;
    float _485 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[77].x, _483);
    float _487 = _423 + _421;
    float _489 = fma(_481, -2.0, _471);
    float _491 = -_459;
    float _493 = _491 + 1.0;
    float _495 = floor(_475);
    float _497 = _487 + (-1.0);
    float _499 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _489);
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _503 = _469 ? _493 : 0.0;
    float _505 = floor(_477);
    bool _507 = _479 >= 0.0;
    bool _509 = isnan(_479);
    bool _511 = _507 || _509;
    bool _513 = isnan(0.0);
    bool _515 = _511 || _513;
    float _517 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _519 = int(_517);
    bool _521 = _495 > 0.0;
    bool _523 = _495 >= 0.0;
    bool _525 = isnan(_495);
    bool _527 = _523 || _525;
    bool _529 = isnan(0.0);
    bool _531 = _527 || _529;
    float _533 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _535 = !_445;
    int _537 = _535 ? 0 : 1;
    float _539 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _541 = int(_539);
    bool _543 = _505 > 0.0;
    bool _545 = _505 >= 0.0;
    bool _547 = isnan(_505);
    bool _549 = _545 || _547;
    bool _551 = isnan(0.0);
    bool _553 = _549 || _551;
    int _555 = _515 ? 0 : 1;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _563 = _561 != 0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _567 = _565 != 0;
    int _569 = _553 ? 0 : 1;
    float _571 = float(_519);
    bool _573 = !_559;
    int _575 = _573 ? 0 : 1;
    bool _577 = _479 > 0.0;
    float _579 = 1.0 / _571;
    bool _581 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _583 = isnan(1.0);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _589 = _585 || _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _593 = 1.0 + _591;
    int _595 = abs(_575);
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _599 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[78].z, _501);
    int _601 = ~_555;
    int _603 = _601 + 1;
    int _605 = _603 + 1;
    float _607 = -_119;
    float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[76].x, _485);
    float _611 = 1.0 / _593;
    float _613 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[78].w, _597);
    float _615 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _599);
    int _617 = _605;
    if (!_577)
    {
        int _619 = ~_555;
        int _621 = _619 + 1;
        _617 = _621;
    }
    int _623 = _617;
    float _625 = float(_541);
    float _627 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _613);
    float _629 = float(_595);
    float _631 = _579 * _119;
    float _633 = float(_623);
    float _635 = _625 * _119;
    int _637 = ~_569;
    int _639 = _637 + 1;
    int _641 = _639 + 1;
    int _643 = _641;
    if (!_543)
    {
        int _645 = ~_569;
        int _647 = _645 + 1;
        _643 = _647;
    }
    int _649 = _643;
    float _651 = _629 * _633;
    if (_589)
    {
        float _653 = _503 * _611;
        _129 = _653;
    }
    float _655 = _129;
    bool _657 = !_563;
    int _659 = _657 ? 0 : 1;
    float _661 = _421 + (-0.5);
    float _663 = _651 * (-2.0);
    int _665 = _531 ? 0 : 1;
    int _667 = abs(_659);
    float _669 = fma(_663, _429, _429);
    bool _671 = !_567;
    int _673 = _671 ? 0 : 1;
    float _675 = float(_649);
    float _677 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[196].x, _669);
    float _679 = float(_667);
    float _681 = fma(_533, _663, _533);
    int _683 = ~_665;
    int _685 = _683 + 1;
    int _687 = _685 + 1;
    int _689 = _687;
    if (!_521)
    {
        int _691 = ~_665;
        int _693 = _691 + 1;
        _689 = _693;
    }
    int _695 = _689;
    float _697 = _679 * _675;
    int _699 = abs(_673);
    float _701 = _423 + _413;
    float _703 = fma(_681, _655, _677);
    float _705 = float(_695);
    float _707 = _697 * (-2.0);
    float _709 = float(_699);
    float _711 = _701 + (-1.0);
    float _713 = fma(_707, _431, _431);
    float _715 = _703 * 0.15915493667125701904296875;
    float _717 = _709 * _705;
    float _719 = _423 + (-0.5);
    float _721 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _723 = _413 + _421;
    float _725 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[196].y, _713);
    float _727 = fma(_721, _707, _721);
    float _729 = _723 + (-1.0);
    float _731 = _717 * (-2.0);
    float _733 = _413 + (-0.5);
    float _735 = fma(_727, _655, _725);
    float _737 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _739 = fma(_731, _433, _433);
    float _741 = _715 * 6.283185482025146484375;
    float _743 = sin(_741);
    float _745 = _735 * 0.15915493667125701904296875;
    float _747 = in.m_48.x;
    float _749 = in.m_48.y;
    float _751 = in.m_48.z;
    float _753 = fma(_737, _731, _737);
    float _755 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[196].z, _739);
    bool _757 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _759 = isnan(0.5);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _765 = _761 || _763;
    float _767 = in.m_68.x;
    float _769 = in.m_68.y;
    float _771 = in.m_68.z;
    float _773 = in.m_68.w;
    bool _775 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _777 = isnan(0.5);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _783 = _779 || _781;
    float _785 = fma(_753, _655, _755);
    float _787 = _715 * 6.283185482025146484375;
    float _789 = cos(_787);
    float _791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _793 = _785 * 0.15915493667125701904296875;
    float _795 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _797 = _419 * _791;
    float _799 = _745 * 6.283185482025146484375;
    float _801 = sin(_799);
    float _803 = _425 * _795;
    float _805 = in.m_70.x;
    float _807 = in.m_70.y;
    float _809 = in.m_70.z;
    float _811 = in.m_70.w;
    float _813 = _745 * 6.283185482025146484375;
    float _815 = cos(_813);
    float _817 = _749 * _769;
    float _819 = _793 * 6.283185482025146484375;
    float _821 = cos(_819);
    float _823 = fma(_747, _767, _817);
    float _825 = _743 * _801;
    float _827 = _789 * _801;
    float _829 = fma(_751, _771, _823);
    float _831 = _793 * 6.283185482025146484375;
    float _833 = sin(_831);
    float _835 = _789 * _815;
    float _837 = _743 * _815;
    float _839 = _789 * _821;
    float _841 = _743 * _821;
    float _843 = _815 * _821;
    float _845 = _801 * _821;
    float _847 = _839 * _803;
    float _849 = fma(_833, _835, _825);
    float _851 = -_803;
    float _853 = _833 * _851;
    float _855 = -_837;
    float _857 = fma(_833, _827, _855);
    float _859 = -_827;
    float _861 = fma(_833, _837, _859);
    float _863 = fma(_849, _797, _847);
    float _865 = _841 * _803;
    float _867 = fma(_843, _797, _853);
    float _869 = fma(_833, _825, _835);
    float _871 = fma(_857, _447, _863);
    float _873 = fma(_861, _797, _865);
    float _875 = fma(_845, _447, _867);
    float _877 = _749 * _807;
    float _879 = _871 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _881 = fma(_869, _447, _873);
    float _883 = _871 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _885 = fma(_747, _805, _877);
    float _887 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].x, _879);
    float _889 = _829 + _773;
    float _891 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].x, _883);
    float _893 = fma(_751, _809, _885);
    float _895 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[26].z, _887);
    float _897 = _871 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _899 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[24].z, _891);
    float _901 = _893 + _811;
    float _903 = _895 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _905 = in.m_72.x;
    float _907 = in.m_72.y;
    float _909 = in.m_72.z;
    float _911 = in.m_72.w;
    float _913 = _899 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _915 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].x, _897);
    float _917 = _889 + _903;
    float _919 = _901 + _913;
    float _921 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[25].z, _915);
    float _923 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _925 = _917 + _923;
    float _927 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _929 = _919 + _927;
    float _931 = _921 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _933 = _925 * _925;
    float _935 = fma(_929, _929, _933);
    float _937 = sqrt(_935);
    float _939 = _749 * _907;
    float _941 = fma(_747, _905, _939);
    float _943 = fma(_751, _909, _941);
    bool _945 = _937 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _947 = _943 + _911;
    float _949 = _947 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _951 = _947 + _931;
    float _953 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[11].x, _949);
    float _955 = _747;
    float _957 = _881;
    float _959 = _905;
    float _961 = _875;
    float _963 = _925;
    float _965 = _937;
    float _967 = _951;
    float _969 = _935;
    float _971 = _929;
    float _973 = _863;
    float _975 = _917;
    float _977 = _901;
    if (_945)
    {
        float _979 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _955 = _979;
    }
    float _981 = _955;
    float _983 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[11].z, _953);
    if (!_945)
    {
        _957 = _919;
    }
    float _985 = _957;
    float _987 = _983 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _989 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _991 = _937 + _989;
    float _993 = _987;
    float _995 = _985;
    if (_945)
    {
        float _997 = rsqrt(_935);
        _959 = _997;
    }
    float _999 = _959;
    float _1001 = _981;
    float _1003 = _999;
    if (_945)
    {
        float _1005 = _991 * _981;
        _1001 = _1005;
    }
    float _1007 = _1001;
    float _1009 = _947 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1011 = 1.0 / _987;
    if (_945)
    {
        float _1013 = _1007 * 0.15915493667125701904296875;
        _961 = _1013;
    }
    float _1015 = _961;
    float _1017 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1009);
    float _1019 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1017);
    float _1021 = _1009;
    if (_945)
    {
        float _1023 = _1015 * 6.283185482025146484375;
        float _1025 = sin(_1023);
        _1021 = _1025;
    }
    float _1027 = _1021;
    float _1029 = _1019 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1031 = _1029 + _987;
    float _1033 = _1007;
    if (_945)
    {
        float _1035 = _1015 * 6.283185482025146484375;
        float _1037 = cos(_1035);
        _1033 = _1037;
    }
    float _1039 = _1033;
    if (_945)
    {
        float _1041 = _951 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _993 = _1041;
    }
    float _1043 = _993;
    float _1045 = _1031 * _1011;
    float _1047 = _1045 * 0.5;
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1051 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1049);
    float _1053 = _1027;
    float _1055 = _1043;
    float _1057 = _1047;
    if (_945)
    {
        float _1059 = fma(_1027, _1043, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1053 = _1059;
    }
    float _1061 = _1053;
    float _1063 = _1061;
    if (_945)
    {
        float _1065 = _999 * _1061;
        _1003 = _1065;
    }
    float _1067 = _1003;
    float _1069 = 1.0 / _1051;
    if (!_945)
    {
        _1063 = _917;
    }
    float _1071 = _1063;
    float _1073 = _1071;
    if (_945)
    {
        float _1075 = _1039 + (-1.0);
        _1055 = _1075;
    }
    float _1077 = _1055;
    if (_945)
    {
        float _1079 = fma(_929, _1067, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _995 = _1079;
    }
    float _1081 = _995;
    if (_945)
    {
        float _1083 = fma(_925, _1067, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1073 = _1083;
    }
    float _1085 = _1073;
    if (_783)
    {
        _963 = 1.0;
    }
    float _1087 = _963;
    float _1089 = _1087;
    if (_945)
    {
        float _1091 = _1077 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1057 = _1091;
    }
    float _1093 = _1057;
    if (_765)
    {
        _965 = _1081;
    }
    float _1095 = _965;
    float _1097 = _1095;
    if (_945)
    {
        float _1099 = fma(_951, _1039, _1093);
        _967 = _1099;
    }
    float _1101 = _967;
    float _1103 = _1101;
    if (_765)
    {
        _969 = _1085;
    }
    float _1105 = _969;
    float _1107 = _1105;
    if (!_765)
    {
        float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1111 = _947 + _1109;
        float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1115 = _901 + _1113;
        float _1117 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1119 = -_889;
        float _1121 = _1119 + _1085;
        float _1123 = _1111 * _1111;
        float _1125 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1127 = _889 + _1125;
        float _1129 = fma(_1115, _1115, _1123);
        float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1133 = fma(_1127, _1127, _1129);
        float _1135 = sqrt(_1133);
        float _1137 = _1117 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1139 = precise::min(_1135, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1141 = _1139 * _1131;
        float _1143 = -_947;
        float _1145 = _1143 + _1101;
        float _1147 = _1137 * _1141;
        float _1149 = -_901;
        float _1151 = _1149 + _1081;
        float _1153 = fma(_1145, _1147, _947);
        float _1155 = fma(_1151, _1147, _901);
        float _1157 = fma(_1121, _1147, _889);
        _1103 = _1153;
        _1097 = _1155;
        _1107 = _1157;
        _971 = _1151;
    }
    float _1159 = _1103;
    float _1161 = _1097;
    float _1163 = _1107;
    float _1165 = _971;
    float _1167 = _1165;
    if (_783)
    {
        _973 = 1.0;
    }
    float _1169 = _973;
    float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1173 = _1069 * _1171;
    float _1175 = _1169;
    if (!_783)
    {
        float _1177 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1179 = _1177 * 0.15915493667125701904296875;
        float _1181 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1183 = _1179 * 6.283185482025146484375;
        float _1185 = cos(_1183);
        float _1187 = _1181 * 0.15915493667125701904296875;
        float _1189 = _1179 * 6.283185482025146484375;
        float _1191 = sin(_1189);
        float _1193 = 1.0 / _1185;
        float _1195 = _1187 * 6.283185482025146484375;
        float _1197 = cos(_1195);
        float _1199 = _1191 * _1193;
        float _1201 = _1187 * 6.283185482025146484375;
        float _1203 = sin(_1201);
        float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1207 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1205;
        float _1209 = _1197 * _1199;
        float _1211 = 1.0 / _1207;
        float _1213 = 1.0 / _1209;
        float _1215 = _1203 * _1213;
        float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1219 = fma(_1173, _1215, _1217);
        float _1221 = _1219 * _1211;
        float _1223 = precise::clamp(_1221, 0.0, 1.0);
        _1167 = _1179;
        _1089 = _1223;
    }
    float _1225 = _1167;
    float _1227 = _1089;
    float _1229 = _1225;
    if (!_783)
    {
        float _1231 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1233 = _1231 * 0.15915493667125701904296875;
        float _1235 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1237 = _1233 * 6.283185482025146484375;
        float _1239 = cos(_1237);
        float _1241 = _1235 * 0.15915493667125701904296875;
        float _1243 = _1233 * 6.283185482025146484375;
        float _1245 = sin(_1243);
        float _1247 = 1.0 / _1239;
        float _1249 = _1241 * 6.283185482025146484375;
        float _1251 = cos(_1249);
        float _1253 = _1245 * _1247;
        float _1255 = _1241 * 6.283185482025146484375;
        float _1257 = sin(_1255);
        float _1259 = _1251 * _1253;
        float _1261 = 1.0 / _1259;
        float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1265 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1263;
        float _1267 = 1.0 / _1265;
        float _1269 = _1257 * _1261;
        float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1273 = fma(_1173, _1269, _1271);
        float _1275 = _1273 * _1267;
        float _1277 = precise::clamp(_1275, 0.0, 1.0);
        float _1279 = -_1277;
        float _1281 = _1279 + 1.0;
        _1229 = _1261;
        _1175 = _1281;
    }
    float _1283 = _1229;
    float _1285 = _1175;
    float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1289 = _1159 + _1287;
    float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1293 = _1161 + _1291;
    float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1297 = _1163 + _1295;
    float _1299 = _1289 * _1289;
    float _1301 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1303 = fma(_1085, 6.2500002968590706586837768554688e-05, 0.5);
    float _1305 = fma(_1293, _1293, _1299);
    float _1307 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1301);
    float _1309 = fma(_1297, _1297, _1305);
    float _1311 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1307);
    float _1313 = rsqrt(_1309);
    float _1315 = _1311 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1317 = sqrt(_1309);
    float _1319 = _1313 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1321 = _1293 * _1319;
    float _1323 = _1297 * _1319;
    float _1325 = _1321 * _1321;
    float _1327 = _1323 * _1323;
    float _1329 = _1325 + _1327;
    float _1331 = sqrt(_1329);
    bool _1333 = _1331 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1337 = _1331 + _1335;
    float _1339 = _1283;
    float _1341 = _1337;
    float _1343 = _1323;
    float _1345 = _1321;
    float _1347 = _1325;
    if (_1333)
    {
        float _1349 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1339 = _1349;
    }
    float _1351 = _1339;
    if (_1333)
    {
        float _1353 = _1337 * _1351;
        _1341 = _1353;
    }
    float _1355 = _1341;
    if (_1333)
    {
        float _1357 = _1355 * 0.15915493667125701904296875;
        _975 = _1357;
    }
    float _1359 = _975;
    float _1361 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_1333)
    {
        float _1363 = _1359 * 6.283185482025146484375;
        float _1365 = sin(_1363);
        _1361 = _1365;
    }
    float _1367 = _1361;
    float _1369 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1371 = precise::max(0.0, _1369);
    float _1373 = _1351;
    float _1375 = _1371;
    if (_1333)
    {
        float _1377 = _1359 * 6.283185482025146484375;
        float _1379 = cos(_1377);
        _1373 = _1379;
    }
    float _1381 = _1373;
    float _1383 = -_1319;
    float _1385 = -_1371;
    float _1387 = fma(_1289, _1383, _1385);
    float _1389 = fma(_901, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1333)
    {
        _977 = _1321;
    }
    float _1391 = _977;
    float _1393 = _1369;
    float _1395 = _1391;
    if (_1333)
    {
        float _1397 = rsqrt(_1329);
        _1393 = _1397;
    }
    float _1399 = _1393;
    if (_1333)
    {
        float _1401 = _1387 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1375 = _1401;
    }
    float _1403 = _1375;
    float _1405 = _1403;
    float _1407 = _1367;
    if (_1333)
    {
        float _1409 = fma(_1367, _1403, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1405 = _1409;
    }
    float _1411 = _1405;
    float _1413 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1415 = _1411;
    if (_1333)
    {
        float _1417 = _1381 + (-1.0);
        _1407 = _1417;
    }
    float _1419 = _1407;
    float _1421 = _1419;
    if (_1333)
    {
        float _1423 = _1419 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1421 = _1423;
    }
    float _1425 = _1421;
    float _1427 = _1399;
    if (_1333)
    {
        float _1429 = _1399 * _1411;
        _1415 = _1429;
    }
    float _1431 = _1415;
    if (!_1333)
    {
        _1427 = _1387;
    }
    float _1433 = _1427;
    float _1435 = _1433;
    if (_1333)
    {
        float _1437 = fma(_1387, _1381, _1425);
        _1435 = _1437;
    }
    float _1439 = _1435;
    float _1441 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1333)
    {
        float _1443 = _1321 * _1431;
        _1395 = _1443;
    }
    float _1445 = _1395;
    if (_1333)
    {
        float _1447 = _1323 * _1431;
        _1343 = _1447;
    }
    float _1449 = _1343;
    if (!_1333)
    {
        _1345 = _1327;
    }
    float _1451 = _1345;
    float _1453 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1441);
    float _1455 = _1451;
    if (_1333)
    {
        float _1457 = _1445 * _1445;
        _1347 = _1457;
    }
    float _1459 = _1347;
    if (_1333)
    {
        float _1461 = _1449 * _1449;
        _1455 = _1461;
    }
    float _1463 = _1455;
    float _1465 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1467 = floor(_1389);
    float _1469 = fma(_1439, _1439, _1459);
    float _1471 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1465);
    float _1473 = _1469 + _1463;
    float _1475 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1477 = fma(_1317, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1475);
    float _1479 = precise::clamp(_1477, 0.0, 1.0);
    float _1481 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1453);
    float _1483 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1471);
    float _1485 = rsqrt(_1473);
    float _1487 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1489 = -_1479;
    float _1491 = _1489 + 1.0;
    float _1493 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1495 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1497 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1499 = -_1467;
    float _1501 = _1389 + _1499;
    float _1503 = abs(_1491);
    float _1505 = log2(_1503);
    float _1507 = -_1497;
    float _1509 = fma(_1507, _1413, 1.0);
    float _1511 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1513 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1515 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1511);
    float _1517 = _1485 * _1445;
    float _1519 = _1485 * _1439;
    float _1521 = _1485 * _1449;
    float _1523 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1515);
    float _1525 = _1517 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1527 = floor(_1493);
    float _1529 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1531 = -_1525;
    float _1533 = fma(_1519, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1531);
    float _1535 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1537 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1539 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1513);
    float _1541 = -_1521;
    float _1543 = fma(_1541, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1533);
    float _1545 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1535);
    float _1547 = exp2(_1537);
    float _1549 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1539);
    float _1551 = fma(_1543, -0.5, 0.5);
    float _1553 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1545);
    float _1555 = fma(_1543, 0.5, 0.5);
    float _1557 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1559 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1553);
    float _1561 = log2(_1509);
    float _1563 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1557);
    float _1565 = -_1527;
    float _1567 = _1493 + _1565;
    float _1569 = _1519 + 1.0;
    float _1571 = fma(_1555, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1573 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1563);
    float _1575 = sqrt(_1551);
    float _1577 = -_1519;
    float _1579 = fma(_1547, _1569, _1577);
    float _1581 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1549);
    float _1583 = fma(_1555, _1571, -0.212114393711090087890625);
    float _1585 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1573);
    float _1587 = fma(_1579, 0.5, 0.5);
    float _1589 = fma(_1555, _1583, 1.570728778839111328125);
    float _1591 = 1.0 / _1559;
    float _1593 = _1561 * 0.693147182464599609375;
    float2 _5158 = float2(_1501, _1567);
    float _1595 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5158, float2(0.0), isnan(_5158)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5158, float2(0.0), isnan(_5158)), level(0.0)).x;
    float _1597 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1599 = _1575 * 0.636619746685028076171875;
    float _1601 = -_1589;
    float _1603 = fma(_1599, _1601, 1.0);
    float _1605 = _1581 * _1591;
    float _1607 = _1585 * _1591;
    float _1609 = fma(_1081, 6.2500002968590706586837768554688e-05, 0.5);
    float _1611 = fma(_1605, 0.5, 0.5);
    float _1613 = fma(_1607, -0.5, 0.5);
    float3 _5193 = float3(_1611, _1613, _1597);
    float _1615 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5193, float3(0.0), isnan(_5193)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5193, float3(0.0), isnan(_5193)), level(0.0)).x;
    float3 _5204 = float3(_1611, _1613, _1597);
    float4 _1618 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5204, float3(0.0), isnan(_5204)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5204, float3(0.0), isnan(_5204)), level(0.0)).xyzw;
    float _1620 = _1618.x;
    float _1622 = _1618.y;
    float _1624 = _1618.z;
    float _1626 = _1618.w;
    float2 _5220 = float2(_1603, _1587);
    float3 _1630 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5220, float2(0.0), isnan(_5220)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5220, float2(0.0), isnan(_5220)), level(0.0)).xyz;
    float _1632 = _1630.x;
    float _1634 = _1630.y;
    float _1636 = _1630.z;
    float2 _5234 = float2(_1609, _1303);
    float3 _1638 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5234, float2(0.0), isnan(_5234)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5234, float2(0.0), isnan(_5234)), level(0.0)).xyz;
    float _1640 = _1638.x;
    float _1642 = _1638.y;
    float _1644 = _1638.z;
    float _1646 = float(uint(_541));
    float _1648 = trunc(_631);
    int _1650 = int(_1648);
    float _1652 = _635 * _167;
    int _1654 = ~_541;
    int _1656 = _1654 + 1;
    float _1658 = -_615;
    float _1660 = _1658 + 1.0;
    int _1662 = _541 + (-1);
    float _1664 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1666 = _423 > 0.5;
    float _1668 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1670 = 1.0 / _1646;
    float _1672 = float(uint(_1650));
    float _1674 = trunc(_1652);
    int _1676 = int(_1674);
    float _1678 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1668);
    int _1680 = ~_541;
    int _1682 = _1680 + 1;
    float _1684 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1678);
    int _1686 = as_type<int>(_1670) + (-2);
    float _1688 = exp2(_1664);
    int _1690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1692 = _1690 != 0;
    float _1694 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1684);
    float _1696 = as_type<float>(_1686) * _1672;
    bool _1698 = !_1692;
    float _1700 = _1698 ? 7.345489978790283203125 : 1.0;
    out.gl_Position.x = _1581;
    out.gl_Position.y = _1585;
    out.gl_Position.z = _1694;
    out.gl_Position.w = _1559;
    float _1702 = trunc(_1696);
    float _1704 = precise::max(_1702, 0.0);
    uint _1707 = uint(_1704);
    float _1709 = _1700 * _421;
    float _1711 = float(_1650);
    float _1713 = -_1688;
    float _1715 = _1713 + 1.0;
    bool _1717 = _1711 >= _625;
    bool _1719 = isnan(_1711);
    bool _1721 = _1717 || _1719;
    bool _1723 = isnan(_625);
    bool _1725 = _1721 || _1723;
    float _1727 = float(_1725);
    float _1729 = floor(_1709);
    int _1731 = _1656 * int(_1707);
    int _1733 = _1731 + _1650;
    float _1735 = trunc(_1727);
    int _1737 = int(_1735);
    float _1739 = float(uint(_1733));
    float _1741 = -_1729;
    float _1743 = _1709 + _1741;
    float _1745 = as_type<float>(_1686) * _1739;
    float _1747 = trunc(_1745);
    float _1749 = precise::max(_1747, 0.0);
    uint _1751 = uint(_1749);
    int _1753 = ~_1737;
    int _1755 = _1753 + 1;
    int _1757 = _1755 + 1;
    int _1759 = int(_1707) + int(_1751);
    int _1761 = _1682 * _1759;
    int _1763 = _1761 + _1650;
    bool _1765 = uint(_1763) >= uint(_541);
    bool _1767 = !_1765;
    int _1769 = _1767 ? 0 : (-1);
    bool _1771 = _541 == 0;
    int _1773 = ~_1759;
    int _1775 = _1773 + _1769;
    int _1777 = _1775 + 1;
    float _1779 = _1743 * _625;
    int _1781 = _541 * _1777;
    int _1783 = _1781 + _1650;
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1787 = _1785 != 0;
    float _1789 = trunc(_1779);
    int _1791 = int(_1789);
    int _1793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1795 = _1793 != 0;
    bool _1797 = !_1771;
    int _1799 = _1797 ? _1783 : (-1);
    bool _1801 = !_1787;
    int _1803 = _1801 ? 0 : 1;
    int _1805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1807 = _1805 != 0;
    int _1809 = _1799 * _1757;
    int _1811 = abs(_451);
    int _1813 = abs(_1803);
    int _1815 = _1737 * _1662;
    int _1817 = _1815 + _1809;
    int _1819 = abs(_457);
    int _1821 = _1791 * _1813;
    int _1823 = _1821 + _1650;
    int _1825 = abs(_537);
    int _1827 = _1817 * _1811;
    bool _1829 = !_1807;
    int _1831 = _1829 ? 0 : 1;
    int _1833 = _1676 * _1819;
    int _1835 = _1833 + _1827;
    int _1837 = abs(_1831);
    int _1839 = _1823 * _1825;
    int _1841 = _1839 + _1835;
    int _1843 = ~_541;
    int _1845 = _1843 + 1;
    int _1847 = _1791 * _1837;
    int _1849 = _1847 + _1841;
    float _1851 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1853 = _1851 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1855 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1857 = _1855 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1859 = float(uint(_1849));
    float _1861 = 1.0 / _1853;
    bool _1863 = _421 > 0.5;
    float _1865 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1867 = _411 + _1865;
    float _1869 = as_type<float>(_1686) * _1859;
    int _1871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1873 = _1871 != 0;
    float _1875 = trunc(_1869);
    float _1877 = precise::max(_1875, 0.0);
    uint _1879 = uint(_1877);
    float _1881 = 1.0 / _1857;
    float _1883 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1885 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1883;
    int _1887 = _1845 * int(_1879);
    int _1889 = _1887 + _1849;
    float _1891 = float(uint(_1889));
    bool _1893 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1895 = isnan(_411);
    bool _1897 = _1893 || _1895;
    bool _1899 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1901 = _1897 || _1899;
    float _1903 = float(_1901);
    float _1905 = _1885 * _1881;
    bool _1907 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1909 = isnan(_411);
    bool _1911 = _1907 || _1909;
    bool _1913 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1915 = _1911 || _1913;
    float _1917 = float(_1915);
    float _1919 = as_type<float>(_1686) * _1891;
    float _1921 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1923 = _1921 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1925 = fma(_1905, _1867, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1927 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1929 = isnan(_411);
    bool _1931 = _1927 || _1929;
    bool _1933 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1935 = _1931 || _1933;
    float _1937 = float(_1935);
    float _1939 = trunc(_1919);
    float _1941 = precise::max(_1939, 0.0);
    uint _1943 = uint(_1941);
    float _1945 = _1923 * _1861;
    float _1947 = float(uint(_1823));
    float _1949 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1951 = _411 + _1949;
    float _1953 = -_1903;
    float _1955 = _1953 + 1.0;
    float _1957 = -_1917;
    float _1959 = _1957 + 1.0;
    float _1961 = as_type<float>(_1686) * _1947;
    float _1963 = fma(_1945, _1951, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1965 = _1937 * _1955;
    float _1967 = _1903 * _1959;
    float _1969 = trunc(_1961);
    float _1971 = precise::max(_1969, 0.0);
    uint _1973 = uint(_1971);
    float _1975 = -_1937;
    float _1977 = _1975 + 1.0;
    float _1979 = _1925 * _1965;
    int _1981 = ~_541;
    int _1983 = _1981 + 1;
    int _1985 = int(_1879) + int(_1943);
    float _1987 = fma(_1977, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1979);
    float _1989 = -_183;
    int _1991 = _1863 ? as_type<int>(_1989) : as_type<int>(_183);
    int _1993 = ~_541;
    int _1995 = _1993 + 1;
    int _1997 = _1983 * _1985;
    int _1999 = _1997 + _1849;
    float _2001 = -_187;
    int _2003 = _1666 ? as_type<int>(_2001) : as_type<int>(_187);
    float _2005 = fma(_1963, _1967, _1987);
    bool _2007 = !_1795;
    float _2009 = _2007 ? _183 : as_type<float>(_1991);
    bool _2011 = !_1873;
    float _2013 = _2011 ? _187 : as_type<float>(_2003);
    int _2015 = _1995 * int(_1973);
    int _2017 = _2015 + _1823;
    bool _2019 = uint(_1999) >= uint(_541);
    float _2021 = _2009 + 0.5;
    float _2023 = _2013 + (-0.5);
    float _2025 = float(uint(_2017));
    float _2027 = fma(_2021, (*spvDescriptorSet0.vp_c9)._m0[80].x, _609);
    bool _2029 = !_2019;
    int _2031 = _2029 ? 0 : (-1);
    float _2033 = -_2023;
    float _2035 = -_499;
    float _2037 = fma(_2033, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2035);
    float _2039 = fma(_1917, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2005);
    float _2041 = as_type<float>(_1686) * _2025;
    int _2043 = ~_1985;
    int _2045 = _2043 + _2031;
    int _2047 = _2045 + 1;
    float _2049 = -_1660;
    float _2051 = fma(_2009, _2049, _2027);
    float _2053 = -_627;
    float _2055 = _2053 + 1.0;
    float _2057 = trunc(_2041);
    float _2059 = precise::max(_2057, 0.0);
    uint _2061 = uint(_2059);
    int _2063 = _541 * _2047;
    int _2065 = _2063 + _1849;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2069 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2071 = fma(_2013, _2055, _2037);
    float _2073 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2075 = !_1771;
    int _2077 = _2075 ? _2065 : (-1);
    float _2079 = abs(_1173);
    float _2081 = log2(_2079);
    int _2083 = ~_541;
    int _2085 = _2083 + 1;
    float _2087 = _2073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2089 = _2039 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2091 = _2077 >> 31;
    out.m_74.x = _2051;
    out.m_74.y = _2071;
    float _2093 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2095 = _2069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2097 = _2091 & 3;
    float _2099 = _839 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2101 = int(_1973) + int(_2061);
    float _2103 = _839 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2105 = _2077 + _2097;
    out.m_76.x = _2093;
    out.m_76.y = _2095;
    out.m_76.z = _2087;
    out.m_76.w = _2089;
    int _2107 = _2077 & 3;
    bool _2109 = _2107 != 0;
    int _2111 = _2085 * _2101;
    int _2113 = _2111 + _1823;
    float _2115 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2117 = _2105 >> 2;
    float _2119 = _839 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2123 = _2121 != 0;
    float _2125 = exp2(_2115);
    int _2127 = _2117 << 4;
    int _2129 = _2127 + 368;
    bool _2131 = uint(_2113) >= uint(_541);
    uint _2133 = uint(int(uint(_2129) >> uint(2)));
    uint _2135 = uint(int(uint(int(_2133)) >> uint(2)));
    int _2137 = int(_2133) & 3;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[int(_2135)][_2137];
    int _2141 = int(_2133) + 1;
    uint _2143 = uint(int(uint(_2141) >> uint(2)));
    int _2145 = _2141 & 3;
    float _2147 = (*spvDescriptorSet0.vp_c9)._m0[int(_2143)][_2145];
    bool _2149 = _1173 <= 8000.0;
    bool _2151 = isnan(_1173);
    bool _2153 = _2149 || _2151;
    bool _2155 = isnan(8000.0);
    bool _2157 = _2153 || _2155;
    float _2159 = float(_2157);
    float _2161 = -_833;
    float _2163 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2099);
    float _2165 = -_833;
    float _2167 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2103);
    float _2169 = _849 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2171 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2163);
    int _2173 = _2077 & 3;
    bool _2175 = _2173 != 0;
    float _2177 = -_833;
    float _2179 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2119);
    float _2181 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2169);
    float _2183 = _857 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2185 = fma(_2125, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2187 = precise::clamp(_2185, 0.0, 1.0);
    float _2189 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2191 = _849 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2193 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2183);
    bool _2195 = uint(_2173) > 1u;
    int _2197 = _2129 + 8;
    uint _2199 = uint(int(uint(_2197) >> uint(2)));
    uint _2201 = uint(int(uint(int(_2199)) >> uint(2)));
    int _2203 = int(_2199) & 3;
    float _2205 = (*spvDescriptorSet0.vp_c9)._m0[int(_2201)][_2203];
    int _2207 = int(_2199) + 1;
    uint _2209 = uint(int(uint(_2207) >> uint(2)));
    int _2211 = _2207 & 3;
    float _2213 = (*spvDescriptorSet0.vp_c9)._m0[int(_2209)][_2211];
    float _2215 = _849 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2217 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2191);
    float _2219 = _857 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2221 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2179);
    float _2223 = fma(_843, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2215);
    float _2225 = _857 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2227 = _2109 ? 0 : 1;
    float _2229 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2219);
    bool _2231 = uint(_2173) >= 2u;
    float _2233 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2225);
    float _2235 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2181);
    int _2237 = ~_2227;
    int _2239 = _2237 + 1;
    int _2241 = _2239 + 1;
    float _2243 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2217);
    int _2245 = _2241;
    if (!_2195)
    {
        int _2247 = ~_2227;
        int _2249 = _2247 + 1;
        _2245 = _2249;
    }
    int _2251 = _2245;
    float _2253 = fma(_2187, -2.0, 3.0);
    bool _2255 = _2173 != 3;
    float _2257 = _2187 * _2187;
    float _2259 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2223);
    float _2261 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2193);
    int _2263 = abs(_2251);
    float _2265 = _2257 * _2253;
    int _2267 = _2231 ? 0 : 1;
    float _2269 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2233);
    bool _2271 = !_2131;
    int _2273 = _2271 ? 0 : (-1);
    float _2275 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2167);
    bool _2277 = !_2175;
    int _2279 = _2277 ? 0 : 1;
    float _2281 = _2189 * _2171;
    int _2283 = ~_2267;
    int _2285 = _2283 + 1;
    int _2287 = _2285 + 1;
    float _2289 = _2189 * _2275;
    bool _2291 = _2173 != 3;
    float _2293 = _2189 * _2221;
    int _2295 = _2287;
    if (_2255)
    {
        int _2297 = ~_2267;
        int _2299 = _2297 + 1;
        _2295 = _2299;
    }
    int _2301 = _2295;
    float _2303 = -_1595;
    float _2305 = _2303 + 1.0;
    int _2307 = ~_2263;
    int _2309 = _2307 + 1;
    int _2311 = _2309 + 1;
    float _2313 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2229);
    int _2315 = ~_2101;
    int _2317 = _2315 + _2273;
    int _2319 = _2317 + 1;
    int _2321 = abs(_2279);
    int _2323 = _2311 * as_type<int>(_2147);
    bool _2325 = !_2291;
    int _2327 = _2325 ? 0 : (-1);
    int _2329 = _541 * _2319;
    int _2331 = _2329 + _1823;
    int _2333 = abs(_2301);
    float _2335 = in.m_78.x;
    bool _2337 = !_2123;
    int _2339 = _2337 ? 0 : 1;
    int _2341 = ~_2321;
    int _2343 = _2341 + 1;
    int _2345 = _2343 + 1;
    int _2347 = abs(_2327);
    float _2349 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2351 = _2345 * as_type<int>(_2139);
    int _2353 = _2351 + _2323;
    int _2355 = abs(_2339);
    float _2357 = fma(_2349, _2235, _2289);
    float _2359 = fma(_2349, _2243, _2281);
    int _2361 = ~_2333;
    int _2363 = _2361 + 1;
    int _2365 = _2363 + 1;
    float _2367 = fma(_2349, _2259, _2293);
    int _2369 = ~_2347;
    int _2371 = _2369 + 1;
    int _2373 = _2371 + 1;
    float _2375 = _2261 + _2357;
    int _2377 = _2365 * as_type<int>(_2205);
    int _2379 = _2377 + _2353;
    bool _2381 = !_1771;
    int _2383 = _2381 ? _2331 : (-1);
    float _2385 = _2269 + _2359;
    int _2387 = ~_2355;
    int _2389 = _2387 + 1;
    int _2391 = _2389 + 1;
    int _2393 = _2373 * as_type<int>(_2213);
    int _2395 = _2393 + _2379;
    float _2397 = -_2265;
    float _2399 = _2397 + 1.0;
    float _2401 = _2313 + _2367;
    int _2403 = _2395 * _2391;
    float _2405 = fma(_2399, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2265);
    float _2407 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _1640;
    out.m_80.y = _1642;
    out.m_80.z = _1644;
    int _2409 = _2383 * _2355;
    int _2411 = _2409 + _2403;
    float _2413 = _2159 * _2405;
    float _2415 = _1559 * 0.5;
    float _2417 = _2407 * _1615;
    out.m_82.x = _2375;
    out.m_82.y = _2385;
    out.m_82.z = _2401;
    float _2419 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2421 = float(_2411);
    float _2423 = fma(_1585, -0.5, _2415);
    float _2425 = _1636 * _2417;
    float _2427 = _2305 * _2419;
    float _2429 = precise::clamp(_2427, 0.0, 1.0);
    float _2431 = -_2407;
    float _2433 = _2431 + 1.0;
    out.m_84.x = _2421;
    float _2435 = fma(_1626, _2425, _1624);
    float _2437 = -_2429;
    float _2439 = fma(_2437, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2441 = _1626 * _2433;
    bool _2443 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2445 = isnan(_1317);
    bool _2447 = _2443 || _2445;
    bool _2449 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2451 = _2447 || _2449;
    float _2453 = _1694 + _1559;
    float _2455 = _2439 * _2335;
    float _2457 = _1581 + _1559;
    float _2459 = _1626 * _2417;
    float _2461 = _2455 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2463 = _2453 * 0.5;
    float _2465 = fma(_1632, _2459, _1620);
    float _2467 = fma(_1634, _2459, _1622);
    float _2469 = _2457 * 0.5;
    out.m_86.x = _2461;
    float _2471 = _1227 * _1285;
    float _2473 = _2407;
    float _2475 = _2433;
    float _2477 = _2471;
    float _2479 = _2463;
    float _2481 = _2423;
    float _2483 = _2469;
    if (!_2451)
    {
        _2473 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2485 = _2473;
    out.m_88.x = _2465;
    out.m_88.y = _2467;
    out.m_88.z = _2435;
    out.m_88.w = _2441;
    float _2487 = _2471 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2489 = _2485;
    float _2491 = _2485;
    if (!_2451)
    {
        _2475 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2493 = _2475;
    out.m_90.x = _2469;
    out.m_90.y = _2423;
    out.m_90.z = _2463;
    out.m_90.w = _1559;
    float _2495 = _2493;
    float _2497 = _2493;
    if (!_2451)
    {
        _2477 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2499 = _2477;
    float _2501 = _2499;
    float _2503 = _2499;
    if (!_2451)
    {
        _2479 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2505 = _2479;
    float _2507 = _2505;
    float _2509 = _2505;
    if (!_2451)
    {
        _2481 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2511 = _2481;
    float _2513 = _2511;
    float _2515 = _2511;
    if (!_2451)
    {
        _2483 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2517 = _2483;
    bool _2519 = !_2451;
    float _2521 = _2517;
    float _2523 = _2517;
    if (!_2519)
    {
        bool _2525 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2527 = isnan(_1317);
        bool _2529 = _2525 || _2527;
        bool _2531 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2533 = _2529 || _2531;
        if (!_2533)
        {
            float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2537 = _1317 + _2535;
            float _2539 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2541 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2539;
            float _2543 = 1.0 / _2541;
            float _2545 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2547 = _2545 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2551 = _2549 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2553 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2555 = _2553 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2565 = _2537 * _2543;
            float _2567 = precise::clamp(_2565, 0.0, 1.0);
            float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2571 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2573 = fma(_2567, _2547, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2575 = fma(_2567, _2571, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2577 = fma(_2567, _2551, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2579 = fma(_2567, _2555, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2581 = fma(_2567, _2559, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2583 = fma(_2567, _2563, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2515 = _2575;
            _2497 = _2581;
            _2509 = _2573;
            _2491 = _2579;
            _2523 = _2577;
            _2503 = _2583;
            _2585 = true;
        }
        else
        {
            bool _2587 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2589 = isnan(_1317);
            bool _2591 = _2587 || _2589;
            bool _2593 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2595 = _2591 || _2593;
            if (!_2595)
            {
                _2507 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2597 = _2507;
            _2509 = _2597;
            if (!_2595)
            {
                _2513 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2599 = _2513;
            _2515 = _2599;
            if (!_2595)
            {
                _2521 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2601 = _2521;
            _2523 = _2601;
            if (!_2595)
            {
                _2489 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2603 = _2489;
            _2491 = _2603;
            if (!_2595)
            {
                _2495 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2605 = _2495;
            _2497 = _2605;
            if (!_2595)
            {
                _2501 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2607 = _2501;
            bool _2609 = !_2595;
            _2503 = _2607;
            if (!_2609)
            {
                bool _2611 = _1317 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2613 = isnan(_1317);
                bool _2615 = _2611 || _2613;
                bool _2617 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2619 = _2615 || _2617;
                if (!_2619)
                {
                    float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2623 = _1317 + _2621;
                    float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2627 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2625;
                    float _2629 = 1.0 / _2627;
                    float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2641 = _2639 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2647 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2649 = _2647 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2651 = _2623 * _2629;
                    float _2653 = precise::clamp(_2651, 0.0, 1.0);
                    float _2655 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2659 = fma(_2653, _2633, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2661 = fma(_2653, _2657, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2663 = fma(_2653, _2637, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2665 = fma(_2653, _2641, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2667 = fma(_2653, _2645, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2669 = fma(_2653, _2649, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2515 = _2661;
                    _2497 = _2667;
                    _2509 = _2659;
                    _2491 = _2665;
                    _2523 = _2663;
                    _2503 = _2669;
                    _2585 = true;
                }
                else
                {
                    _2515 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2497 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2509 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2491 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2523 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2503 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2585 = false;
    float _2671 = _2515;
    float _2673 = _2497;
    float _2675 = _2509;
    float _2677 = _2491;
    float _2679 = _2523;
    float _2681 = _2503;
    float _2683 = _2487 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2685 = fma(_2385, -0.5, 0.5);
    float _2687 = precise::clamp(_2685, 0.0, 1.0);
    float _2689 = -_2671;
    float _2691 = _2689 + _2673;
    float _2693 = -_2675;
    float _2695 = _2693 + _2677;
    out.m_55.x = _2683;
    float _2697 = -_2679;
    float _2699 = _2697 + _2681;
    float _2701 = fma(_2687, _2691, _2671);
    float _2703 = fma(_2687, _2695, _2675);
    bool _2705 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2707 = _2701 * 0.586610972881317138671875;
    float _2709 = fma(_2687, _2699, _2679);
    out.m_92.x = 0.0;
    bool _2711 = _1227 > 0.0;
    bool _2713 = isnan(_1227);
    bool _2715 = _2711 || _2713;
    bool _2717 = isnan(0.0);
    bool _2719 = _2715 || _2717;
    float _2721 = fma(_2703, 0.298911988735198974609375, _2707);
    bool _2723 = _1285 <= 0.0;
    bool _2725 = !_2719;
    bool _2727 = _2723 || _2725;
    float _2729 = fma(_2709, 0.114477999508380889892578125, _2721);
    float _2731 = -_2729;
    float _2733 = _2703 + _2731;
    float _2735 = -_2729;
    float _2737 = _2701 + _2735;
    float _2739 = -_2729;
    float _2741 = _2709 + _2739;
    float _2743 = fma(_2733, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2729);
    float _2745 = fma(_2737, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2729);
    float _2747 = fma(_2741, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2729);
    bool _2749 = !_2705;
    if (!_2749)
    {
        float _2751 = -_1159;
        float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2755 = -_1161;
        float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2759 = -_1163;
        float _2761 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2763 = _2753 * _2753;
        float _2765 = fma(_2757, _2757, _2763);
        float _2767 = fma(_2761, _2761, _2765);
        float _2769 = sqrt(_2767);
        float _2771 = rsqrt(_2767);
        float _2773 = -_2769;
        float _2775 = _2773 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2777 = _2775 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2779 = precise::clamp(_2777, 0.0, 1.0);
        float _2781 = _2757 * _2771;
        float _2783 = _2753 * _2771;
        float _2785 = abs(_2779);
        float _2787 = log2(_2785);
        float _2789 = _2761 * _2771;
        float _2791 = _2781 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2793 = _2385 * _2783;
        float _2795 = -_2783;
        float _2797 = -_2791;
        float _2799 = fma(_2795, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2797);
        float _2801 = fma(_2375, _2781, _2793);
        float _2803 = -_2789;
        float _2805 = fma(_2803, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2799);
        float _2807 = fma(_2401, _2789, _2801);
        float _2809 = precise::clamp(_2807, 0.0, 1.0);
        float _2811 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2813 = _2805 + _2811;
        float _2815 = _2787 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2817 = _2813 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2819 = precise::clamp(_2817, 0.0, 1.0);
        float _2821 = exp2(_2815);
        float _2823 = _2821 * _2819;
        float _2825 = _2809 * _2823;
        float _2827 = _2825 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2829 = _2825 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2831 = _2825 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2827;
        out.m_92.y = _2829;
        out.m_92.z = _2831;
    }
    out.m_94.x = _2743;
    out.m_94.y = _2745;
    out.m_94.z = _2747;
    if (!_2727)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _2833 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2833;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

