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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_78 [[user(locn0)]];
    float4 m_82 [[user(locn1)]];
    float4 m_92 [[user(locn2)]];
    float4 m_76 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_70 [[user(locn5)]];
    float4 m_90 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_74 [[user(locn9)]];
    float4 m_49 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_72 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(0)]];
    float4 m_53 [[attribute(1)]];
    float4 m_59 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2519 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = in.m_46.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = _108;
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _131 = 0;
    if (!_121)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2835 = as_type<float>(_135);
        out.gl_Position.z = _2835;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _139 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_108);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = float(_113);
    bool _151 = _117 >= _149;
    bool _153 = !_147;
    bool _155 = _151 || _153;
    if (_155)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _125;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _137 = as_type<int>(_159);
    }
    int _161 = _137;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2890 = as_type<float>(_161);
        out.gl_Position.z = _2890;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = in.m_44.x;
    float _165 = in.m_44.y;
    float _167 = in.m_44.z;
    float _169 = in.m_53.x;
    float _171 = in.m_53.y;
    float _173 = in.m_53.z;
    float _175 = in.m_53.w;
    float _177 = in.m_55.x;
    float _179 = in.m_55.y;
    float _181 = in.m_55.z;
    float _183 = in.m_55.w;
    float _185 = in.m_57.y;
    float _187 = in.m_59.x;
    float _189 = in.m_59.y;
    float _191 = in.m_59.z;
    float _193 = in.m_59.w;
    float _195 = in.m_61.x;
    float _197 = in.m_61.y;
    float _199 = _165 * _171;
    float _201 = _165 * _179;
    float _203 = fma(_163, _169, _199);
    float _205 = fma(_163, _177, _201);
    float _207 = fma(_167, _173, _203);
    float _209 = _165 + _185;
    float _211 = fma(_167, _181, _205);
    float _213 = _207 + _175;
    float _215 = -_209;
    float _217 = _215 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _219 = _165 * _189;
    float _221 = _211 + _183;
    float _223 = -_213;
    float _225 = _223 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _227 = _217 * _217;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _231 = -_221;
    float _233 = _231 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _235 = _197 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _237 = fma(_225, _225, _227);
    float _239 = fma(_163, _187, _219);
    float _241 = fma(_233, _233, _237);
    float _243 = fma(_235, -2.0, _229);
    float _245 = in.m_61.z;
    float _247 = rsqrt(_241);
    float _249 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _251 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _253 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _255 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _257 = -_249;
    float _259 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _257);
    float _261 = -_251;
    float _263 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _261);
    float _265 = -_253;
    float _267 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _265);
    float _269 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _271 = -_255;
    float _273 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _271);
    float _275 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _277 = _195 * 2.0;
    float _279 = _197 * 2.0;
    float _281 = fma(_167, _191, _239);
    float _283 = _195 + _197;
    float _285 = floor(_277);
    float _287 = _225 * _247;
    float _289 = _233 * _247;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _293 = _287 * _287;
    float _295 = _283 + (-1.0);
    float _297 = -_291;
    float _299 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[77].x, _297);
    float _301 = floor(_279);
    float _303 = fma(_289, _289, _293);
    float _305 = _245 * 2.0;
    float _307 = _267 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _309 = -_269;
    float _311 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _309);
    float _313 = -_275;
    float _315 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _313);
    float _317 = _281 + _193;
    float _319 = _263 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _321 = rsqrt(_303);
    float _323 = _197 + _245;
    bool _325 = _285 > 0.0;
    float _327 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _329 = _317 + _327;
    bool _331 = _285 >= 0.0;
    bool _333 = isnan(_285);
    bool _335 = _331 || _333;
    bool _337 = isnan(0.0);
    bool _339 = _335 || _337;
    float _341 = _323 + (-1.0);
    float _343 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _345 = _329 * _329;
    float _347 = floor(_305);
    float _349 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _351 = _217 * _247;
    float _353 = _263 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _355 = -_307;
    float _357 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[1].x, _355);
    float _359 = _267 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _363 = _361 != 0;
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _367 = _365 != 0;
    int _369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _371 = _369 != 0;
    float _373 = -_353;
    float _375 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[1].y, _373);
    float _377 = _289 * _321;
    float _379 = _287 * _321;
    float _381 = fma(_311, (*spvDescriptorSet0.vp_c8)._m0[1].w, _357);
    float _383 = -_359;
    float _385 = fma(_263, (*spvDescriptorSet0.vp_c8)._m0[1].x, _383);
    float _387 = -_377;
    float _389 = _289 * _387;
    float _391 = fma(_273, (*spvDescriptorSet0.vp_c8)._m0[1].w, _375);
    float _393 = _381 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _395 = _311 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _397 = -_389;
    float _399 = fma(_287, _379, _397);
    float _401 = fma(_315, (*spvDescriptorSet0.vp_c8)._m0[1].w, _385);
    float _403 = _351 * _379;
    float _405 = -_393;
    float _407 = fma(_391, (*spvDescriptorSet0.vp_c8)._m0[0].x, _405);
    float _409 = _399 * _399;
    float _411 = -_395;
    float _413 = fma(_273, (*spvDescriptorSet0.vp_c8)._m0[1].x, _411);
    int _415 = _339 ? 0 : 1;
    float _417 = -_377;
    float _419 = _351 * _417;
    float _421 = fma(_403, _403, _409);
    float _423 = fma(_401, (*spvDescriptorSet0.vp_c8)._m0[0].z, _407);
    float _425 = fma(_315, (*spvDescriptorSet0.vp_c8)._m0[1].z, _413);
    bool _427 = _301 > 0.0;
    float _429 = fma(_419, _419, _421);
    bool _431 = _301 >= 0.0;
    bool _433 = isnan(_301);
    bool _435 = _431 || _433;
    bool _437 = isnan(0.0);
    bool _439 = _435 || _437;
    float _441 = -_425;
    float _443 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[0].w, _423);
    bool _445 = _347 >= 0.0;
    bool _447 = isnan(_347);
    bool _449 = _445 || _447;
    bool _451 = isnan(0.0);
    bool _453 = _449 || _451;
    float _455 = _267 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    bool _457 = !_367;
    int _459 = _457 ? 0 : 1;
    float _461 = _267 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _463 = !_363;
    int _465 = _463 ? 0 : 1;
    float _467 = -_319;
    float _469 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[0].y, _467);
    bool _471 = !_371;
    int _473 = _471 ? 0 : 1;
    float _475 = -_455;
    float _477 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[0].x, _475);
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _481 = _479 != 0;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _489 = _487 != 0;
    float _491 = -_461;
    float _493 = fma(_263, (*spvDescriptorSet0.vp_c8)._m0[0].x, _491);
    float _495 = rsqrt(_429);
    int _497 = ~_415;
    int _499 = _497 + 1;
    int _501 = _499 + 1;
    float _503 = fma(_273, (*spvDescriptorSet0.vp_c8)._m0[0].w, _469);
    bool _505 = !_485;
    int _507 = _505 ? 0 : 1;
    float _509 = fma(_311, (*spvDescriptorSet0.vp_c8)._m0[0].w, _477);
    int _511 = _501;
    if (!_325)
    {
        int _513 = ~_415;
        int _515 = _513 + 1;
        _511 = _515;
    }
    int _517 = _511;
    float _519 = fma(_315, (*spvDescriptorSet0.vp_c8)._m0[0].w, _493);
    int _521 = abs(_507);
    float _523 = 1.0 / _443;
    bool _525 = _347 > 0.0;
    float _527 = in.m_63.x;
    float _529 = in.m_63.y;
    float _531 = float(_517);
    float _533 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _243);
    float _535 = float(_521);
    int _537 = _453 ? 0 : 1;
    float _539 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _541 = log2(_539);
    float _543 = _399 * _495;
    float _545 = precise::clamp(_543, 0.0, 1.0);
    float _547 = _535 * _531;
    int _549 = ~_537;
    int _551 = _549 + 1;
    int _553 = _551 + 1;
    float _555 = -_545;
    float _557 = _555 + 1.0;
    int _559 = _553;
    if (!_525)
    {
        int _561 = ~_537;
        int _563 = _561 + 1;
        _559 = _563;
    }
    int _565 = _559;
    float _567 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _569 = int(_567);
    float _571 = fma(_509, _523, -1.0);
    float _573 = _557 * _523;
    float _575 = fma(_557, _571, 1.0);
    float _577 = _503 * _573;
    bool _579 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _581 = isnan(1.0);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _587 = _583 || _585;
    float _589 = _541 * _117;
    float _591 = _575 * _575;
    float _593 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _595 = int(_593);
    float _597 = _519 * _573;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _601 = 1.0 + _599;
    float _603 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _605 = _213 + _603;
    float _607 = fma(_577, _577, _591);
    float _609 = _527 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _611 = float(_569);
    float _613 = exp2(_589);
    float _615 = in.m_65.x;
    float _617 = in.m_65.y;
    float _619 = in.m_65.z;
    float _621 = fma(_605, _605, _345);
    float _623 = fma(_597, _597, _607);
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _627 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _629 = isnan(0.0);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _635 = _631 || _633;
    float _637 = _609 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _639 = 1.0 / _611;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _643 = float(_595);
    float _645 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[78].z, _625);
    float _647 = float(_565);
    float _649 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[78].w, _641);
    float _651 = -_117;
    float _653 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[76].x, _299);
    float _655 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _645);
    float _657 = 1.0 / _601;
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _661 = _221 + _659;
    float _663 = -_613;
    float _665 = _663 + 1.0;
    float _667 = _643 * _117;
    float _669 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _649);
    float _671 = fma(_661, _661, _621);
    bool _673 = !_481;
    int _675 = _673 ? 0 : 1;
    float _677 = _529 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _679 = rsqrt(_623);
    float _681 = _639 * _117;
    float _683 = _635 ? _665 : 0.0;
    float _685 = _677 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _687 = _439 ? 0 : 1;
    int _689 = abs(_675);
    float _691 = sqrt(_671);
    if (_587)
    {
        float _693 = _683 * _657;
        _127 = _693;
    }
    float _695 = _127;
    float _697 = _547 * (-2.0);
    int _699 = ~_687;
    int _701 = _699 + 1;
    int _703 = _701 + 1;
    int _705 = _703;
    if (!_427)
    {
        int _707 = ~_687;
        int _709 = _707 + 1;
        _705 = _709;
    }
    int _711 = _705;
    float _713 = fma(_349, _697, _349);
    float _715 = fma(_697, _617, _617);
    float _717 = _597 * _679;
    float _719 = _637 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _721 = _575 * _679;
    float _723 = _577 * _679;
    float _725 = -_717;
    float _727 = _287 * _725;
    float _729 = float(_689);
    float _731 = float(_711);
    float _733 = _691 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _735 = _289 * _721;
    float _737 = _729 * _647;
    float _739 = rsqrt(_671);
    float _741 = precise::min(_719, _733);
    float _743 = -_723;
    float _745 = -_727;
    float _747 = fma(_289, _743, _745);
    float _749 = -_723;
    float _751 = _351 * _749;
    float _753 = -_717;
    float _755 = -_735;
    float _757 = fma(_351, _753, _755);
    float _759 = _737 * (-2.0);
    float _761 = _747 * _747;
    float _763 = -_751;
    float _765 = fma(_287, _721, _763);
    float _767 = _195 + (-0.5);
    float _769 = fma(_759, _615, _615);
    float _771 = fma(_757, _757, _761);
    float _773 = _197 + (-0.5);
    float _775 = fma(_343, _759, _343);
    float _777 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[196].x, _769);
    float _779 = fma(_765, _765, _771);
    float _781 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[196].y, _715);
    bool _783 = !_489;
    int _785 = _783 ? 0 : 1;
    float _787 = _739 * _741;
    float _789 = rsqrt(_779);
    float _791 = fma(_775, _695, _777);
    int _793 = abs(_785);
    float _795 = _329 * _787;
    float _797 = _605 * _787;
    float _799 = _661 * _787;
    float _801 = float(_793);
    float _803 = -_795;
    float _805 = _329 + _803;
    float _807 = -_797;
    float _809 = _605 + _807;
    float _811 = -_799;
    float _813 = _661 + _811;
    float _815 = _791 * 0.15915493667125701904296875;
    float _817 = _801 * _731;
    float _819 = _805 * _805;
    float _821 = fma(_713, _695, _781);
    float _823 = _815 * 6.283185482025146484375;
    float _825 = sin(_823);
    float _827 = _817 * (-2.0);
    float _829 = _757 * _789;
    float _831 = _765 * _789;
    float _833 = _747 * _789;
    float _835 = fma(_809, _809, _819);
    float _837 = _289 * _829;
    float _839 = _351 * _831;
    float _841 = _287 * _833;
    float _843 = fma(_813, _813, _835);
    float _845 = -_837;
    float _847 = fma(_287, _831, _845);
    float _849 = -_839;
    float _851 = fma(_289, _833, _849);
    float _853 = -_841;
    float _855 = fma(_351, _829, _853);
    float _857 = _195 + _245;
    float _859 = _847 * _847;
    float _861 = _815 * 6.283185482025146484375;
    float _863 = cos(_861);
    float _865 = _821 * 0.15915493667125701904296875;
    float _867 = _857 + (-1.0);
    float _869 = fma(_851, _851, _859);
    float _871 = as_type<float>(int(gl_VertexIndex));
    float _873 = _245 + (-0.5);
    float _875 = fma(_855, _855, _869);
    float _877 = sqrt(_843);
    float _879 = fma(_827, _619, _619);
    float _881 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _883 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[196].z, _879);
    float _885 = rsqrt(_875);
    float _887 = fma(_881, _827, _881);
    float _889 = fma(_887, _695, _883);
    float _891 = _739 * _877;
    float _893 = _865 * 6.283185482025146484375;
    float _895 = sin(_893);
    float _897 = _889 * 0.15915493667125701904296875;
    int _899 = as_type<int>(_871) & 1;
    bool _901 = _899 != 0;
    int _903 = as_type<int>(_871) & 2;
    bool _905 = _903 != 0;
    float _907 = _685 * _891;
    float _909 = _637 * _891;
    float _911 = _855 * _885;
    float _913 = _851 * _885;
    float _915 = _847 * _885;
    float _917 = _897 * 6.283185482025146484375;
    float _919 = sin(_917);
    float _921 = _287 * _911;
    bool _923 = !_905;
    float _925 = _923 ? (-0.5) : 0.5;
    float _927 = _289 * _915;
    bool _929 = !_901;
    float _931 = _929 ? (-0.5) : 0.5;
    float _933 = -_921;
    float _935 = fma(_289, _913, _933);
    float _937 = _351 * _913;
    float _939 = -_927;
    float _941 = fma(_351, _911, _939);
    float _943 = _897 * 6.283185482025146484375;
    float _945 = cos(_943);
    float _947 = _935 * _935;
    float _949 = -_937;
    float _951 = fma(_287, _915, _949);
    float _953 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _925);
    float _955 = -_799;
    float _957 = _221 + _955;
    float _959 = fma(_941, _941, _947);
    float _961 = _907 * _953;
    float _963 = _865 * 6.283185482025146484375;
    float _965 = cos(_963);
    float _967 = fma(_951, _951, _959);
    float _969 = _825 * _919;
    float _971 = _863 * _919;
    float _973 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _931);
    float _975 = _863 * _945;
    float _977 = rsqrt(_967);
    float _979 = _825 * _945;
    float _981 = fma(_895, _969, _975);
    float _983 = -_971;
    float _985 = fma(_895, _979, _983);
    float _987 = _965 * _945;
    float _989 = _825 * _965;
    float _991 = _909 * _973;
    float _993 = _965 * _919;
    float _995 = _981 * _961;
    float _997 = _985 * _961;
    float _999 = _989 * _961;
    float _1001 = fma(_993, _991, _995);
    float _1003 = fma(_987, _991, _997);
    float _1005 = -_895;
    float _1007 = fma(_1005, _991, _999);
    float _1009 = _951 * _977;
    float _1011 = _1001 * _911;
    float _1013 = -_795;
    float _1015 = _1013 + _209;
    float _1017 = _1001 * _913;
    float _1019 = _941 * _977;
    float _1021 = fma(_1003, _1009, _1011);
    float _1023 = -_797;
    float _1025 = _213 + _1023;
    float _1027 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1029 = fma(_1003, _1019, _1017);
    float _1031 = fma(_289, _1007, _1021);
    float _1033 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1035 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1027);
    float _1037 = fma(_287, _1007, _1029);
    float _1039 = _221 + _1031;
    float _1041 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1033);
    float _1043 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1035);
    float _1045 = _213 + _1037;
    float _1047 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1049 = _1039 + _1047;
    float _1051 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1041);
    float _1053 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1055 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1057 = _1045 + _1055;
    float _1059 = _1049 * _1049;
    float _1061 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1063 = 1.0 / _1053;
    float _1065 = _935 * _977;
    float _1067 = fma(_1057, _1057, _1059);
    float _1069 = _1061 + _1053;
    float _1071 = _1001 * _915;
    float _1073 = sqrt(_1067);
    float _1075 = fma(_1003, _1065, _1071);
    bool _1077 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan(0.5);
    bool _1085 = _1081 || _1083;
    float _1087 = fma(_351, _1007, _1075);
    bool _1089 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1093 = _1089 || _1091;
    bool _1095 = isnan(0.5);
    bool _1097 = _1093 || _1095;
    float _1099 = _1069 * _1063;
    float _1101 = _1099 * 0.5;
    float _1103 = _209 + _1087;
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1107 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1105);
    bool _1109 = _1073 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1111 = 1.0 / _1107;
    float _1113 = _1007;
    float _1115 = _1087;
    float _1117 = _1039;
    float _1119 = _1073;
    float _1121 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1123 = _1063;
    float _1125 = _957;
    float _1127 = _1015;
    if (!_1109)
    {
        _1113 = _1045;
    }
    float _1129 = _1113;
    float _1131 = _1129;
    if (!_1109)
    {
        _1115 = _1103;
    }
    float _1133 = _1115;
    bool _1135 = !_1109;
    float _1137 = _1133;
    if (!_1135)
    {
        float _1139 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1141 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1143 = _1073 + _1141;
        float _1145 = _1103 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1147 = rsqrt(_1067);
        float _1149 = _1143 * _1139;
        float _1151 = _1149 * 0.15915493667125701904296875;
        float _1153 = _1151 * 6.283185482025146484375;
        float _1155 = cos(_1153);
        float _1157 = _1151 * 6.283185482025146484375;
        float _1159 = sin(_1157);
        float _1161 = _1155 + (-1.0);
        float _1163 = _1161 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1165 = fma(_1159, _1145, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1167 = fma(_1103, _1155, _1163);
        float _1169 = _1147 * _1165;
        float _1171 = fma(_1057, _1169, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1173 = fma(_1049, _1169, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1131 = _1171;
        _1137 = _1167;
        _1117 = _1173;
        _1119 = _1151;
    }
    float _1175 = _1131;
    float _1177 = _1137;
    float _1179 = _1117;
    float _1181 = _1119;
    float _1183 = -_797;
    float _1185 = _1183 + _1175;
    float _1187 = -_795;
    float _1189 = _1187 + _1177;
    float _1191 = -_799;
    float _1193 = _1191 + _1179;
    float _1195 = _1181;
    float _1197 = _1189;
    float _1199 = _1185;
    float _1201 = _1193;
    if (_1097)
    {
        _1195 = 1.0;
    }
    float _1203 = _1195;
    float _1205 = _1203;
    if (!_1085)
    {
        float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1209 = _1015 + _1207;
        float _1211 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1213 = _1025 + _1211;
        float _1215 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1217 = -_213;
        float _1219 = _1217 + _1175;
        float _1221 = _1209 * _1209;
        float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1225 = _957 + _1223;
        float _1227 = -_209;
        float _1229 = _1227 + _1177;
        float _1231 = -_221;
        float _1233 = _1231 + _1179;
        float _1235 = fma(_1213, _1213, _1221);
        float _1237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1239 = fma(_1225, _1225, _1235);
        float _1241 = sqrt(_1239);
        float _1243 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1245 = precise::min(_1241, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1247 = _1245 * _1237;
        float _1249 = _1243 * _1247;
        float _1251 = fma(_1219, _1249, _1025);
        float _1253 = fma(_1229, _1249, _1015);
        float _1255 = fma(_1233, _1249, _957);
        _1197 = _1253;
        _1199 = _1251;
        _1201 = _1255;
    }
    float _1257 = _1197;
    float _1259 = _1199;
    float _1261 = _1201;
    if (_1097)
    {
        _1121 = 1.0;
    }
    float _1263 = _1121;
    float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1267 = _1111 * _1265;
    float _1269 = _1267;
    float _1271 = _1263;
    if (!_1097)
    {
        float _1273 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1277 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1275;
        float _1279 = _1273 * 0.15915493667125701904296875;
        float _1281 = _1279 * 6.283185482025146484375;
        float _1283 = cos(_1281);
        float _1285 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1287 = _1285 * 0.15915493667125701904296875;
        float _1289 = _1279 * 6.283185482025146484375;
        float _1291 = sin(_1289);
        float _1293 = 1.0 / _1283;
        float _1295 = _1287 * 6.283185482025146484375;
        float _1297 = cos(_1295);
        float _1299 = _1291 * _1293;
        float _1301 = _1287 * 6.283185482025146484375;
        float _1303 = sin(_1301);
        float _1305 = _1297 * _1299;
        float _1307 = 1.0 / _1277;
        float _1309 = 1.0 / _1305;
        float _1311 = _1303 * _1309;
        float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1315 = fma(_1267, _1311, _1313);
        float _1317 = _1315 * _1307;
        float _1319 = precise::clamp(_1317, 0.0, 1.0);
        _1205 = _1319;
    }
    float _1321 = _1205;
    if (!_1097)
    {
        float _1323 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1325 = _1323 * 0.15915493667125701904296875;
        float _1327 = _1325 * 6.283185482025146484375;
        float _1329 = cos(_1327);
        float _1331 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1333 = _1331 * 0.15915493667125701904296875;
        float _1335 = _1325 * 6.283185482025146484375;
        float _1337 = sin(_1335);
        float _1339 = 1.0 / _1329;
        float _1341 = _1333 * 6.283185482025146484375;
        float _1343 = cos(_1341);
        float _1345 = _1337 * _1339;
        float _1347 = _1333 * 6.283185482025146484375;
        float _1349 = sin(_1347);
        float _1351 = _1343 * _1345;
        float _1353 = 1.0 / _1351;
        float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1357 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1355;
        float _1359 = 1.0 / _1357;
        float _1361 = _1349 * _1353;
        float _1363 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1365 = fma(_1267, _1361, _1363);
        float _1367 = _1365 * _1359;
        float _1369 = precise::clamp(_1367, 0.0, 1.0);
        float _1371 = -_1369;
        float _1373 = _1371 + 1.0;
        _1269 = _1369;
        _1271 = _1373;
    }
    float _1375 = _1269;
    float _1377 = _1271;
    float _1379 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1381 = _1257 + _1379;
    float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1385 = _1259 + _1383;
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1389 = _1261 + _1387;
    float _1391 = _1381 * _1381;
    float _1393 = fma(_1385, _1385, _1391);
    float _1395 = fma(_1389, _1389, _1393);
    float _1397 = rsqrt(_1395);
    float _1399 = sqrt(_1395);
    float _1401 = _1397 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1403 = _1385 * _1401;
    float _1405 = _1389 * _1401;
    float _1407 = _1403 * _1403;
    float _1409 = _1405 * _1405;
    float _1411 = _1407 + _1409;
    float _1413 = sqrt(_1411);
    bool _1415 = _1413 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1417 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1419 = _1413 + _1417;
    float _1421 = _1389;
    float _1423 = _1397;
    float _1425 = _1419;
    float _1427 = _1375;
    float _1429 = _1381;
    if (_1415)
    {
        float _1431 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1421 = _1431;
    }
    float _1433 = _1421;
    if (_1415)
    {
        float _1435 = rsqrt(_1411);
        _1423 = _1435;
    }
    float _1437 = _1423;
    float _1439 = _1437;
    if (_1415)
    {
        float _1441 = _1419 * _1433;
        _1425 = _1441;
    }
    float _1443 = _1425;
    if (_1415)
    {
        float _1445 = _1443 * 0.15915493667125701904296875;
        _1427 = _1445;
    }
    float _1447 = _1427;
    float _1449 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1451 = _1433;
    float _1453 = _1447;
    if (_1415)
    {
        float _1455 = _1447 * 6.283185482025146484375;
        float _1457 = sin(_1455);
        _1451 = _1457;
    }
    float _1459 = _1451;
    float _1461 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1463 = precise::max(0.0, _1461);
    float _1465 = _1391;
    float _1467 = _1463;
    if (_1415)
    {
        float _1469 = _1447 * 6.283185482025146484375;
        float _1471 = cos(_1469);
        _1465 = _1471;
    }
    float _1473 = _1465;
    float _1475 = -_1401;
    float _1477 = -_1463;
    float _1479 = fma(_1381, _1475, _1477);
    if (_1415)
    {
        float _1481 = _1479 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1467 = _1481;
    }
    float _1483 = _1467;
    float _1485 = _1459;
    float _1487 = _1483;
    if (_1415)
    {
        float _1489 = fma(_1459, _1483, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1429 = _1489;
    }
    float _1491 = _1429;
    float _1493 = _1491;
    if (!_1415)
    {
        _1485 = _1403;
    }
    float _1495 = _1485;
    float _1497 = _1495;
    float _1499 = _1473;
    if (_1415)
    {
        float _1501 = _1473 + (-1.0);
        _1487 = _1501;
    }
    float _1503 = _1487;
    float _1505 = _1503;
    if (_1415)
    {
        float _1507 = _1437 * _1491;
        _1123 = _1507;
    }
    float _1509 = _1123;
    if (!_1415)
    {
        _1493 = _1479;
    }
    float _1511 = _1493;
    float _1513 = _1511;
    if (_1415)
    {
        float _1515 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1453 = _1515;
    }
    float _1517 = _1453;
    if (_1415)
    {
        float _1519 = _1403 * _1509;
        _1497 = _1519;
    }
    float _1521 = _1497;
    if (!_1415)
    {
        _1505 = _1405;
    }
    float _1523 = _1505;
    float _1525 = _1523;
    if (_1415)
    {
        float _1527 = _1405 * _1509;
        _1525 = _1527;
    }
    float _1529 = _1525;
    if (!_1415)
    {
        _1439 = _1407;
    }
    float _1531 = _1439;
    float _1533 = _1531;
    if (_1415)
    {
        float _1535 = fma(_1479, _1473, _1517);
        _1513 = _1535;
    }
    float _1537 = _1513;
    if (_1415)
    {
        float _1539 = _1521 * _1521;
        _1533 = _1539;
    }
    float _1541 = _1533;
    if (!_1415)
    {
        _1499 = _1409;
    }
    float _1543 = _1499;
    float _1545 = _1543;
    if (_1415)
    {
        float _1547 = _1529 * _1529;
        _1545 = _1547;
    }
    float _1549 = _1545;
    float _1551 = fma(_1537, _1537, _1541);
    float _1553 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1555 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1557 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1559 = _1551 + _1549;
    float _1561 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1563 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1553);
    float _1565 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1555);
    float _1567 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1569 = fma(_1399, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1567);
    float _1571 = precise::clamp(_1569, 0.0, 1.0);
    float _1573 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1561);
    float _1575 = rsqrt(_1559);
    float _1577 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1563);
    float _1579 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1565);
    float _1581 = -_1571;
    float _1583 = _1581 + 1.0;
    float _1585 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1573);
    float _1587 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1589 = _1579 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1591 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1557);
    float _1593 = _1585 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1595 = abs(_1583);
    float _1597 = log2(_1595);
    float _1599 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1601 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1603 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1591);
    float _1605 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1607 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1599);
    float _1609 = -_1601;
    float _1611 = fma(_1609, _1449, 1.0);
    float _1613 = _1575 * _1521;
    float _1615 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1617 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1607);
    float _1619 = _1575 * _1537;
    float _1621 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1623 = _1575 * _1529;
    float _1625 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1617);
    float _1627 = log2(_1611);
    float _1629 = -_1621;
    float _1631 = fma(_1619, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1629);
    float _1633 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1635 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1605);
    float _1637 = -_1623;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1631);
    float _1641 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1643 = _1619 + 1.0;
    float _1645 = exp2(_1633);
    float _1647 = fma(_1639, -0.5, 0.5);
    float _1649 = fma(_1639, 0.5, 0.5);
    float _1651 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1641);
    float _1653 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1635);
    float _1655 = fma(_1649, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1657 = 1.0 / _1625;
    float _1659 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1651);
    float _1661 = fma(_1649, _1655, -0.212114393711090087890625);
    float _1663 = fma(_1649, _1661, 1.570728778839111328125);
    float _1665 = sqrt(_1647);
    float _1667 = -_1619;
    float _1669 = fma(_1645, _1643, _1667);
    float _1671 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1659);
    float _1673 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1653);
    float _1675 = _1627 * 0.693147182464599609375;
    float _1677 = fma(_1669, 0.5, 0.5);
    float _1679 = _1671 * _1657;
    float _1681 = _1673 * _1657;
    float _1683 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1685 = _1665 * 0.636619746685028076171875;
    float _1687 = fma(_1679, 0.5, 0.5);
    float _1689 = fma(_1681, -0.5, 0.5);
    float _1691 = -_1663;
    float _1693 = fma(_1685, _1691, 1.0);
    float3 _5234 = float3(_1687, _1689, _1683);
    float _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5234, float3(0.0), isnan(_5234)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5234, float3(0.0), isnan(_5234)), level(0.0)).x;
    float3 _5245 = float3(_1687, _1689, _1683);
    float4 _1698 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5245, float3(0.0), isnan(_5245)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5245, float3(0.0), isnan(_5245)), level(0.0)).xyzw;
    float _1700 = _1698.x;
    float _1702 = _1698.y;
    float _1704 = _1698.z;
    float _1706 = _1698.w;
    float2 _5262 = float2(_1693, _1677);
    float3 _1710 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5262, float2(0.0), isnan(_5262)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5262, float2(0.0), isnan(_5262)), level(0.0)).xyz;
    float _1712 = _1710.x;
    float _1714 = _1710.y;
    float _1716 = _1710.z;
    float _1718 = float(uint(_595));
    float _1720 = trunc(_681);
    int _1722 = int(_1720);
    int _1724 = ~_595;
    int _1726 = _1724 + 1;
    float _1728 = -_655;
    float _1730 = _1728 + 1.0;
    int _1732 = abs(_465);
    float _1734 = -_669;
    float _1736 = _1734 + 1.0;
    bool _1738 = _195 > 0.5;
    float _1740 = _863 * _965;
    bool _1742 = _197 > 0.5;
    float _1744 = 1.0 / _1718;
    float _1746 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1748 = -_979;
    float _1750 = fma(_895, _971, _1748);
    int _1752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1754 = _1752 != 0;
    float _1756 = fma(_895, _975, _969);
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1760 = float(uint(_1722));
    float _1762 = exp2(_1746);
    bool _1764 = !_1754;
    float _1766 = _1764 ? 7.345489978790283203125 : 1.0;
    float _1768 = _1758 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_70.w = _741;
    int _1770 = as_type<int>(_1744) + (-2);
    float _1772 = _1766 * _195;
    out.m_72.x = _909;
    float _1774 = as_type<float>(_1770) * _1760;
    float _1776 = floor(_1772);
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1780 = _1750 * _913;
    out.m_74.x = _1259;
    out.m_74.y = _1257;
    out.m_74.z = _1261;
    float _1782 = -_1762;
    float _1784 = _1782 + 1.0;
    float _1786 = _1778 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1788 = fma(_1756, _1019, _1780);
    out.m_76.x = _1025;
    out.m_76.y = _1015;
    out.m_76.z = _957;
    float _1790 = trunc(_1774);
    float _1792 = precise::max(_1790, 0.0);
    uint _1795 = uint(_1792);
    float _1797 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1799 = fma(_1740, _287, _1788);
    float _1801 = -_1776;
    float _1803 = _1772 + _1801;
    float _1805 = _1321 * _1377;
    int _1807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1809 = _1807 != 0;
    int _1811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1813 = _1811 != 0;
    int _1815 = _1726 * int(_1795);
    int _1817 = _1815 + _1722;
    int _1819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1821 = _1819 != 0;
    float _1823 = float(uint(_1817));
    float _1825 = as_type<float>(_1770) * _1823;
    float _1827 = float(_1722);
    float _1829 = trunc(_1825);
    float _1831 = precise::max(_1829, 0.0);
    uint _1833 = uint(_1831);
    bool _1835 = _1827 >= _643;
    bool _1837 = isnan(_1827);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(_643);
    bool _1843 = _1839 || _1841;
    float _1845 = float(_1843);
    float _1847 = trunc(_1845);
    int _1849 = int(_1847);
    int _1851 = int(_1795) + int(_1833);
    float _1853 = 1.0 / _149;
    int _1855 = _1726 * _1851;
    int _1857 = _1855 + _1722;
    bool _1859 = uint(_1857) >= uint(_595);
    bool _1861 = !_1859;
    int _1863 = _1861 ? 0 : (-1);
    bool _1865 = _595 == 0;
    int _1867 = ~_1851;
    int _1869 = _1867 + _1863;
    int _1871 = _1869 + 1;
    float _1873 = _1803 * _643;
    float _1875 = _667 * _1853;
    int _1877 = _595 + (-1);
    int _1879 = _595 * _1871;
    int _1881 = _1879 + _1722;
    int _1883 = ~_1849;
    int _1885 = _1883 + 1;
    int _1887 = _1885 + 1;
    float _1889 = trunc(_1873);
    int _1891 = int(_1889);
    bool _1893 = !_1865;
    int _1895 = _1893 ? _1881 : (-1);
    bool _1897 = !_1809;
    int _1899 = _1897 ? 0 : 1;
    int _1901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1903 = _1901 != 0;
    float _1905 = trunc(_1875);
    int _1907 = int(_1905);
    int _1909 = _1895 * _1887;
    int _1911 = abs(_459);
    int _1913 = abs(_1899);
    int _1915 = _1849 * _1877;
    int _1917 = _1915 + _1909;
    int _1919 = abs(_473);
    int _1921 = _1891 * _1913;
    int _1923 = _1921 + _1722;
    int _1925 = _1917 * _1911;
    bool _1927 = !_1903;
    int _1929 = _1927 ? 0 : 1;
    int _1931 = _1907 * _1732;
    int _1933 = _1931 + _1925;
    int _1935 = abs(_1929);
    int _1937 = ~_595;
    int _1939 = _1937 + 1;
    int _1941 = _1923 * _1919;
    int _1943 = _1941 + _1933;
    float _1945 = -_931;
    int _1947 = _1738 ? as_type<int>(_1945) : as_type<int>(_931);
    int _1949 = ~_595;
    int _1951 = _1949 + 1;
    int _1953 = _1891 * _1935;
    int _1955 = _1953 + _1943;
    int _1957 = ~_595;
    int _1959 = _1957 + 1;
    bool _1961 = !_1813;
    float _1963 = _1961 ? _931 : as_type<float>(_1947);
    float _1965 = _931 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1967 = float(uint(_1955));
    float _1969 = _1963 + 0.5;
    float _1971 = as_type<float>(_1770) * _1967;
    float _1973 = fma(_1969, (*spvDescriptorSet0.vp_c9)._m0[80].x, _653);
    float _1975 = trunc(_1971);
    float _1977 = precise::max(_1975, 0.0);
    uint _1979 = uint(_1977);
    float _1981 = -_1730;
    float _1983 = fma(_1963, _1981, _1973);
    int _1985 = _1959 * int(_1979);
    int _1987 = _1985 + _1955;
    float _1989 = float(uint(_1987));
    float _1991 = as_type<float>(_1770) * _1989;
    float _1993 = trunc(_1991);
    float _1995 = precise::max(_1993, 0.0);
    uint _1997 = uint(_1995);
    int _1999 = int(_1979) + int(_1997);
    float _2001 = float(uint(_1923));
    int _2003 = _1939 * _1999;
    int _2005 = _2003 + _1955;
    float _2007 = as_type<float>(_1770) * _2001;
    bool _2009 = uint(_2005) >= uint(_595);
    float _2011 = trunc(_2007);
    float _2013 = precise::max(_2011, 0.0);
    uint _2015 = uint(_2013);
    bool _2017 = !_2009;
    int _2019 = _2017 ? 0 : (-1);
    int _2021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2023 = _2021 != 0;
    int _2025 = ~_1999;
    int _2027 = _2025 + _2019;
    int _2029 = _2027 + 1;
    int _2031 = _595 * _2029;
    int _2033 = _2031 + _1955;
    float _2035 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2037 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2039 = -_925;
    int _2041 = _1742 ? as_type<int>(_2039) : as_type<int>(_925);
    bool _2043 = !_1865;
    int _2045 = _2043 ? _2033 : (-1);
    float _2047 = _2035 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2049 = !_1821;
    float _2051 = _2049 ? _925 : as_type<float>(_2041);
    float _2053 = _925 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2055 = _2045 >> 31;
    float _2057 = _2051 + (-0.5);
    int _2059 = _2055 & 3;
    out.m_78.x = _1786;
    out.m_78.y = _1768;
    out.m_78.z = _2047;
    out.m_78.w = _2037;
    int _2061 = _2045 & 3;
    bool _2063 = _2061 != 0;
    int _2065 = _1951 * int(_2015);
    int _2067 = _2065 + _1923;
    int _2069 = _2045 + _2059;
    float _2071 = -_2057;
    float _2073 = -_533;
    float _2075 = fma(_2071, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2073);
    int _2077 = _2069 >> 2;
    float _2079 = fma(_2051, _1736, _2075);
    float _2081 = float(uint(_2067));
    int _2083 = _2077 << 4;
    int _2085 = _2083 + 368;
    float _2087 = as_type<float>(_1770) * _2081;
    uint _2089 = uint(int(uint(_2085) >> uint(2)));
    uint _2091 = uint(int(uint(int(_2089)) >> uint(2)));
    int _2093 = int(_2089) & 3;
    float _2095 = (*spvDescriptorSet0.vp_c9)._m0[int(_2091)][_2093];
    int _2097 = int(_2089) + 1;
    uint _2099 = uint(int(uint(_2097) >> uint(2)));
    int _2101 = _2097 & 3;
    float _2103 = (*spvDescriptorSet0.vp_c9)._m0[int(_2099)][_2101];
    int _2105 = _2045 & 3;
    bool _2107 = _2105 != 0;
    out.m_80.x = _1983;
    out.m_80.y = _2079;
    float _2109 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2111 = trunc(_2087);
    float _2113 = precise::max(_2111, 0.0);
    uint _2115 = uint(_2113);
    int _2117 = _2085 + 8;
    uint _2119 = uint(int(uint(_2117) >> uint(2)));
    uint _2121 = uint(int(uint(int(_2119)) >> uint(2)));
    int _2123 = int(_2119) & 3;
    float _2125 = (*spvDescriptorSet0.vp_c9)._m0[int(_2121)][_2123];
    int _2127 = int(_2119) + 1;
    uint _2129 = uint(int(uint(_2127) >> uint(2)));
    int _2131 = _2127 & 3;
    float _2133 = (*spvDescriptorSet0.vp_c9)._m0[int(_2129)][_2131];
    bool _2135 = uint(_2105) > 1u;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2141 = _2109 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2143 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2145 = _2063 ? 0 : 1;
    float _2147 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2149 = _2139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2151 = ~_595;
    int _2153 = _2151 + 1;
    float _2155 = _981 * _911;
    bool _2157 = _2105 != 3;
    int _2159 = int(_2015) + int(_2115);
    out.m_82.x = _2141;
    out.m_82.y = _2143;
    out.m_82.z = _2149;
    out.m_82.w = _2147;
    int _2161 = ~_2145;
    int _2163 = _2161 + 1;
    int _2165 = _2163 + 1;
    int _2167 = _2165;
    float _2169 = _1671;
    float _2171 = _1805;
    if (!_2135)
    {
        int _2173 = ~_2145;
        int _2175 = _2173 + 1;
        _2167 = _2175;
    }
    int _2177 = _2167;
    bool _2179 = uint(_2105) >= 2u;
    int _2181 = abs(_2177);
    int _2183 = _2153 * _2159;
    int _2185 = _2183 + _1923;
    bool _2187 = !_2107;
    int _2189 = _2187 ? 0 : 1;
    int _2191 = _2179 ? 0 : 1;
    bool _2193 = uint(_2185) >= uint(_595);
    int _2195 = abs(_2189);
    int _2197 = ~_2191;
    int _2199 = _2197 + 1;
    int _2201 = _2199 + 1;
    int _2203 = _2201;
    if (_2157)
    {
        int _2205 = ~_2191;
        int _2207 = _2205 + 1;
        _2203 = _2207;
    }
    int _2209 = _2203;
    bool _2211 = !_2193;
    int _2213 = _2211 ? 0 : (-1);
    int _2215 = ~_2181;
    int _2217 = _2215 + 1;
    int _2219 = _2217 + 1;
    int _2221 = ~_2159;
    int _2223 = _2221 + _2213;
    int _2225 = _2223 + 1;
    int _2227 = ~_2195;
    int _2229 = _2227 + 1;
    int _2231 = _2229 + 1;
    int _2233 = _2219 * as_type<int>(_2103);
    bool _2235 = _2105 != 3;
    int _2237 = _595 * _2225;
    int _2239 = _2237 + _1923;
    int _2241 = abs(_2209);
    int _2243 = _2231 * as_type<int>(_2095);
    int _2245 = _2243 + _2233;
    bool _2247 = !_2235;
    int _2249 = _2247 ? 0 : (-1);
    float _2251 = _993 * _913;
    bool _2253 = !_2023;
    int _2255 = _2253 ? 0 : 1;
    float _2257 = fma(_987, _1019, _2251);
    int _2259 = abs(_2249);
    float _2261 = _981 * _913;
    int _2263 = abs(_2255);
    int _2265 = ~_2241;
    int _2267 = _2265 + 1;
    int _2269 = _2267 + 1;
    float _2271 = _993 * _915;
    bool _2273 = !_1865;
    int _2275 = _2273 ? _2239 : (-1);
    int _2277 = _2269 * as_type<int>(_2125);
    int _2279 = _2277 + _2245;
    int _2281 = ~_2259;
    int _2283 = _2281 + 1;
    int _2285 = _2283 + 1;
    float _2287 = _981 * _915;
    float _2289 = _993 * _911;
    float _2291 = _1750 * _911;
    float _2293 = _1750 * _915;
    int _2295 = _2285 * as_type<int>(_2133);
    int _2297 = _2295 + _2279;
    float _2299 = fma(_985, _1019, _2261);
    float _2301 = fma(_985, _1065, _2287);
    float _2303 = fma(_985, _1009, _2155);
    float _2305 = fma(_987, _1065, _2271);
    float _2307 = fma(_987, _1009, _2289);
    float _2309 = fma(_1756, _1009, _2291);
    float _2311 = fma(_989, _287, _2299);
    float _2313 = fma(_989, _351, _2301);
    float _2315 = fma(_989, _289, _2303);
    float _2317 = -_895;
    float _2319 = fma(_2317, _351, _2305);
    float _2321 = -_895;
    float _2323 = fma(_2321, _289, _2307);
    float _2325 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2327 = fma(_1740, _289, _2309);
    float _2329 = _2053 * _2311;
    float _2331 = _2053 * _2313;
    float _2333 = _2053 * _2315;
    int _2335 = ~_2263;
    int _2337 = _2335 + 1;
    int _2339 = _2337 + 1;
    float _2341 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2325);
    float _2343 = fma(_1756, _1065, _2293);
    float _2345 = fma(_1965, _2323, _2333);
    float _2347 = _1625 * 0.5;
    float _2349 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2341);
    int _2351 = _2297 * _2339;
    float _2353 = -_895;
    float _2355 = fma(_2353, _287, _2257);
    float _2357 = fma(_1740, _351, _2343);
    float _2359 = fma(_1673, -0.5, _2347);
    float _2361 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2349);
    float _2363 = _1797 * _1695;
    int _2365 = _2275 * _2263;
    int _2367 = _2365 + _2351;
    float _2369 = fma(_1965, _2355, _2329);
    float _2371 = fma(_1965, _2319, _2331);
    float _2373 = _2361 + _1625;
    float _2375 = _1671 + _1625;
    float _2377 = _1706 * _2363;
    float _2379 = -_1797;
    float _2381 = _2379 + 1.0;
    float _2383 = _1716 * _2363;
    float _2385 = float(_2367);
    float _2387 = _2357 + _2371;
    float _2389 = _2373 * 0.5;
    float _2391 = _2375 * 0.5;
    float _2393 = _1799 + _2369;
    float _2395 = _2327 + _2345;
    float _2397 = fma(_1712, _2377, _1700);
    float _2399 = fma(_1714, _2377, _1702);
    float _2401 = _1706 * _2381;
    float _2403 = fma(_1706, _2383, _1704);
    out.m_84.x = _2391;
    out.m_84.y = _2359;
    out.m_84.z = _2389;
    out.m_84.w = _1625;
    bool _2405 = _1399 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2407 = isnan(_1399);
    bool _2409 = _2405 || _2407;
    bool _2411 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2413 = _2409 || _2411;
    out.m_86.x = _2397;
    out.m_86.y = _2399;
    out.m_86.z = _2403;
    out.m_86.w = _2401;
    out.m_88.x = _2393;
    out.m_88.y = _2387;
    out.m_88.z = _2395;
    out.gl_Position.x = _1671;
    out.gl_Position.y = _1673;
    out.gl_Position.z = _2361;
    out.gl_Position.w = _1625;
    float _2415 = _2377;
    float _2417 = _2385;
    if (!_2413)
    {
        _2415 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2419 = _2415;
    out.m_90.x = _2385;
    float _2421 = _2419;
    float _2423 = _2419;
    if (!_2413)
    {
        _1125 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2425 = _1125;
    float _2427 = _2425;
    float _2429 = _2425;
    if (!_2413)
    {
        _1127 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2431 = _1127;
    float _2433 = _2431;
    float _2435 = _2431;
    if (!_2413)
    {
        _2417 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2437 = _2417;
    float _2439 = _1805 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2441 = _2437;
    float _2443 = _2437;
    if (!_2413)
    {
        _2169 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2445 = _2169;
    float _2447 = _2445;
    float _2449 = _2445;
    if (!_2413)
    {
        _2171 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2451 = _2171;
    bool _2453 = !_2413;
    float _2455 = _2451;
    float _2457 = _2451;
    if (!_2453)
    {
        bool _2459 = _1399 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2461 = isnan(_1399);
        bool _2463 = _2459 || _2461;
        bool _2465 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2467 = _2463 || _2465;
        if (!_2467)
        {
            float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2471 = _1399 + _2469;
            float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2475 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2473;
            float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2481 = 1.0 / _2475;
            float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2485 = _2483 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2493 = _2491 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2499 = _2471 * _2481;
            float _2501 = precise::clamp(_2499, 0.0, 1.0);
            float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2505 = _2503 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2507 = fma(_2501, _2479, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2509 = fma(_2501, _2505, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2511 = fma(_2501, _2485, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2513 = fma(_2501, _2489, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2515 = fma(_2501, _2493, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2517 = fma(_2501, _2497, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2449 = _2511;
            _2435 = _2515;
            _2423 = _2507;
            _2429 = _2513;
            _2443 = _2509;
            _2457 = _2517;
            _2519 = true;
        }
        else
        {
            bool _2521 = _1399 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2523 = isnan(_1399);
            bool _2525 = _2521 || _2523;
            bool _2527 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2529 = _2525 || _2527;
            if (!_2529)
            {
                _2421 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2531 = _2421;
            _2423 = _2531;
            if (!_2529)
            {
                _2447 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2533 = _2447;
            _2449 = _2533;
            if (!_2529)
            {
                _2441 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2535 = _2441;
            _2443 = _2535;
            if (!_2529)
            {
                _2427 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2537 = _2427;
            _2429 = _2537;
            if (!_2529)
            {
                _2433 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2539 = _2433;
            _2435 = _2539;
            if (!_2529)
            {
                _2455 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2541 = _2455;
            bool _2543 = !_2529;
            _2457 = _2541;
            if (!_2543)
            {
                bool _2545 = _1399 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2547 = isnan(_1399);
                bool _2549 = _2545 || _2547;
                bool _2551 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2553 = _2549 || _2551;
                if (!_2553)
                {
                    float _2555 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2557 = _1399 + _2555;
                    float _2559 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2561 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2559;
                    float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2567 = 1.0 / _2561;
                    float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2571 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2573 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2575 = _2573 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2581 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2583 = _2581 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2585 = _2557 * _2567;
                    float _2587 = precise::clamp(_2585, 0.0, 1.0);
                    float _2589 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2591 = _2589 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2593 = fma(_2587, _2565, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2595 = fma(_2587, _2591, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2597 = fma(_2587, _2571, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2599 = fma(_2587, _2575, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2601 = fma(_2587, _2579, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2603 = fma(_2587, _2583, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2449 = _2597;
                    _2435 = _2601;
                    _2423 = _2593;
                    _2429 = _2599;
                    _2443 = _2595;
                    _2457 = _2603;
                    _2519 = true;
                }
                else
                {
                    _2449 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2435 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2423 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2429 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2443 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2457 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2519 = false;
    float _2605 = _2449;
    float _2607 = _2435;
    float _2609 = _2423;
    float _2611 = _2429;
    float _2613 = _2443;
    float _2615 = _2457;
    float _2617 = fma(_2387, -0.5, 0.5);
    float _2619 = precise::clamp(_2617, 0.0, 1.0);
    float _2621 = -_2605;
    float _2623 = _2621 + _2607;
    float _2625 = _2439 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2627 = -_2609;
    float _2629 = _2627 + _2611;
    float _2631 = fma(_2619, _2623, _2605);
    out.m_92.x = 0.0;
    float _2633 = -_2613;
    float _2635 = _2633 + _2615;
    float _2637 = fma(_2619, _2629, _2609);
    float _2639 = _2631 * 0.586610972881317138671875;
    out.m_51.x = _2625;
    bool _2641 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2643 = fma(_2619, _2635, _2613);
    float _2645 = fma(_2637, 0.298911988735198974609375, _2639);
    bool _2647 = _1321 > 0.0;
    bool _2649 = isnan(_1321);
    bool _2651 = _2647 || _2649;
    bool _2653 = isnan(0.0);
    bool _2655 = _2651 || _2653;
    float _2657 = fma(_2643, 0.114477999508380889892578125, _2645);
    bool _2659 = _1377 <= 0.0;
    bool _2661 = !_2655;
    bool _2663 = _2659 || _2661;
    float _2665 = -_2657;
    float _2667 = _2637 + _2665;
    float _2669 = -_2657;
    float _2671 = _2631 + _2669;
    float _2673 = -_2657;
    float _2675 = _2643 + _2673;
    float _2677 = fma(_2667, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2657);
    float _2679 = fma(_2671, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2657);
    float _2681 = fma(_2675, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2657);
    bool _2683 = !_2641;
    if (!_2683)
    {
        float _2685 = -_1257;
        float _2687 = _2685 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2689 = -_1259;
        float _2691 = _2689 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2693 = -_1261;
        float _2695 = _2693 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2697 = _2687 * _2687;
        float _2699 = fma(_2691, _2691, _2697);
        float _2701 = fma(_2695, _2695, _2699);
        float _2703 = sqrt(_2701);
        float _2705 = rsqrt(_2701);
        float _2707 = -_2703;
        float _2709 = _2707 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2711 = _2709 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2713 = precise::clamp(_2711, 0.0, 1.0);
        float _2715 = _2691 * _2705;
        float _2717 = _2687 * _2705;
        float _2719 = abs(_2713);
        float _2721 = log2(_2719);
        float _2723 = _2695 * _2705;
        float _2725 = _2715 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2727 = _2387 * _2717;
        float _2729 = -_2717;
        float _2731 = -_2725;
        float _2733 = fma(_2729, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2731);
        float _2735 = fma(_2393, _2715, _2727);
        float _2737 = -_2723;
        float _2739 = fma(_2737, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2733);
        float _2741 = fma(_2395, _2723, _2735);
        float _2743 = precise::clamp(_2741, 0.0, 1.0);
        float _2745 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2747 = _2739 + _2745;
        float _2749 = _2721 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2751 = _2747 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2753 = precise::clamp(_2751, 0.0, 1.0);
        float _2755 = exp2(_2749);
        float _2757 = _2755 * _2753;
        float _2759 = _2743 * _2757;
        float _2761 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2763 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2765 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2761;
        out.m_92.y = _2763;
        out.m_92.z = _2765;
    }
    out.m_70.x = _2677;
    out.m_70.y = _2679;
    out.m_70.z = _2681;
    if (!_2663)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2767 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2767;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2519 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = in.m_46.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = _108;
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _131 = 0;
    if (!_121)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2835 = as_type<float>(_135);
        out.gl_Position.z = _2835;
    }
    if (!_121)
    {
        return out;
    }
    bool _139 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_108);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = float(_113);
    bool _151 = _117 >= _149;
    bool _153 = !_147;
    bool _155 = _151 || _153;
    if (_155)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _125;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _137 = as_type<int>(_159);
    }
    int _161 = _137;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2890 = as_type<float>(_161);
        out.gl_Position.z = _2890;
    }
    if (_155)
    {
        return out;
    }
    float _163 = in.m_44.x;
    float _165 = in.m_44.y;
    float _167 = in.m_44.z;
    float _169 = in.m_53.x;
    float _171 = in.m_53.y;
    float _173 = in.m_53.z;
    float _175 = in.m_53.w;
    float _177 = in.m_55.x;
    float _179 = in.m_55.y;
    float _181 = in.m_55.z;
    float _183 = in.m_55.w;
    float _185 = in.m_57.y;
    float _187 = in.m_59.x;
    float _189 = in.m_59.y;
    float _191 = in.m_59.z;
    float _193 = in.m_59.w;
    float _195 = in.m_61.x;
    float _197 = in.m_61.y;
    float _199 = _165 * _171;
    float _201 = _165 * _179;
    float _203 = fma(_163, _169, _199);
    float _205 = fma(_163, _177, _201);
    float _207 = fma(_167, _173, _203);
    float _209 = _165 + _185;
    float _211 = fma(_167, _181, _205);
    float _213 = _207 + _175;
    float _215 = -_209;
    float _217 = _215 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _219 = _165 * _189;
    float _221 = _211 + _183;
    float _223 = -_213;
    float _225 = _223 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _227 = _217 * _217;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _231 = -_221;
    float _233 = _231 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _235 = _197 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _237 = fma(_225, _225, _227);
    float _239 = fma(_163, _187, _219);
    float _241 = fma(_233, _233, _237);
    float _243 = fma(_235, -2.0, _229);
    float _245 = in.m_61.z;
    float _247 = rsqrt(_241);
    float _249 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _251 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _253 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _255 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _257 = -_249;
    float _259 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _257);
    float _261 = -_251;
    float _263 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _261);
    float _265 = -_253;
    float _267 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _265);
    float _269 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _271 = -_255;
    float _273 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _271);
    float _275 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _277 = _195 * 2.0;
    float _279 = _197 * 2.0;
    float _281 = fma(_167, _191, _239);
    float _283 = _195 + _197;
    float _285 = floor(_277);
    float _287 = _225 * _247;
    float _289 = _233 * _247;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _293 = _287 * _287;
    float _295 = _283 + (-1.0);
    float _297 = -_291;
    float _299 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[77].x, _297);
    float _301 = floor(_279);
    float _303 = fma(_289, _289, _293);
    float _305 = _245 * 2.0;
    float _307 = _267 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _309 = -_269;
    float _311 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _309);
    float _313 = -_275;
    float _315 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _313);
    float _317 = _281 + _193;
    float _319 = _263 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _321 = rsqrt(_303);
    float _323 = _197 + _245;
    bool _325 = _285 > 0.0;
    float _327 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _329 = _317 + _327;
    bool _331 = _285 >= 0.0;
    bool _333 = isnan(_285);
    bool _335 = _331 || _333;
    bool _337 = isnan(0.0);
    bool _339 = _335 || _337;
    float _341 = _323 + (-1.0);
    float _343 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _345 = _329 * _329;
    float _347 = floor(_305);
    float _349 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _351 = _217 * _247;
    float _353 = _263 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _355 = -_307;
    float _357 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[1].x, _355);
    float _359 = _267 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _363 = _361 != 0;
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _367 = _365 != 0;
    int _369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _371 = _369 != 0;
    float _373 = -_353;
    float _375 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[1].y, _373);
    float _377 = _289 * _321;
    float _379 = _287 * _321;
    float _381 = fma(_311, (*spvDescriptorSet0.vp_c8)._m0[1].w, _357);
    float _383 = -_359;
    float _385 = fma(_263, (*spvDescriptorSet0.vp_c8)._m0[1].x, _383);
    float _387 = -_377;
    float _389 = _289 * _387;
    float _391 = fma(_273, (*spvDescriptorSet0.vp_c8)._m0[1].w, _375);
    float _393 = _381 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _395 = _311 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _397 = -_389;
    float _399 = fma(_287, _379, _397);
    float _401 = fma(_315, (*spvDescriptorSet0.vp_c8)._m0[1].w, _385);
    float _403 = _351 * _379;
    float _405 = -_393;
    float _407 = fma(_391, (*spvDescriptorSet0.vp_c8)._m0[0].x, _405);
    float _409 = _399 * _399;
    float _411 = -_395;
    float _413 = fma(_273, (*spvDescriptorSet0.vp_c8)._m0[1].x, _411);
    int _415 = _339 ? 0 : 1;
    float _417 = -_377;
    float _419 = _351 * _417;
    float _421 = fma(_403, _403, _409);
    float _423 = fma(_401, (*spvDescriptorSet0.vp_c8)._m0[0].z, _407);
    float _425 = fma(_315, (*spvDescriptorSet0.vp_c8)._m0[1].z, _413);
    bool _427 = _301 > 0.0;
    float _429 = fma(_419, _419, _421);
    bool _431 = _301 >= 0.0;
    bool _433 = isnan(_301);
    bool _435 = _431 || _433;
    bool _437 = isnan(0.0);
    bool _439 = _435 || _437;
    float _441 = -_425;
    float _443 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[0].w, _423);
    bool _445 = _347 >= 0.0;
    bool _447 = isnan(_347);
    bool _449 = _445 || _447;
    bool _451 = isnan(0.0);
    bool _453 = _449 || _451;
    float _455 = _267 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    bool _457 = !_367;
    int _459 = _457 ? 0 : 1;
    float _461 = _267 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _463 = !_363;
    int _465 = _463 ? 0 : 1;
    float _467 = -_319;
    float _469 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[0].y, _467);
    bool _471 = !_371;
    int _473 = _471 ? 0 : 1;
    float _475 = -_455;
    float _477 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[0].x, _475);
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _481 = _479 != 0;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _489 = _487 != 0;
    float _491 = -_461;
    float _493 = fma(_263, (*spvDescriptorSet0.vp_c8)._m0[0].x, _491);
    float _495 = rsqrt(_429);
    int _497 = ~_415;
    int _499 = _497 + 1;
    int _501 = _499 + 1;
    float _503 = fma(_273, (*spvDescriptorSet0.vp_c8)._m0[0].w, _469);
    bool _505 = !_485;
    int _507 = _505 ? 0 : 1;
    float _509 = fma(_311, (*spvDescriptorSet0.vp_c8)._m0[0].w, _477);
    int _511 = _501;
    if (!_325)
    {
        int _513 = ~_415;
        int _515 = _513 + 1;
        _511 = _515;
    }
    int _517 = _511;
    float _519 = fma(_315, (*spvDescriptorSet0.vp_c8)._m0[0].w, _493);
    int _521 = abs(_507);
    float _523 = 1.0 / _443;
    bool _525 = _347 > 0.0;
    float _527 = in.m_63.x;
    float _529 = in.m_63.y;
    float _531 = float(_517);
    float _533 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _243);
    float _535 = float(_521);
    int _537 = _453 ? 0 : 1;
    float _539 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _541 = log2(_539);
    float _543 = _399 * _495;
    float _545 = precise::clamp(_543, 0.0, 1.0);
    float _547 = _535 * _531;
    int _549 = ~_537;
    int _551 = _549 + 1;
    int _553 = _551 + 1;
    float _555 = -_545;
    float _557 = _555 + 1.0;
    int _559 = _553;
    if (!_525)
    {
        int _561 = ~_537;
        int _563 = _561 + 1;
        _559 = _563;
    }
    int _565 = _559;
    float _567 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _569 = int(_567);
    float _571 = fma(_509, _523, -1.0);
    float _573 = _557 * _523;
    float _575 = fma(_557, _571, 1.0);
    float _577 = _503 * _573;
    bool _579 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _581 = isnan(1.0);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _587 = _583 || _585;
    float _589 = _541 * _117;
    float _591 = _575 * _575;
    float _593 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _595 = int(_593);
    float _597 = _519 * _573;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _601 = 1.0 + _599;
    float _603 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _605 = _213 + _603;
    float _607 = fma(_577, _577, _591);
    float _609 = _527 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _611 = float(_569);
    float _613 = exp2(_589);
    float _615 = in.m_65.x;
    float _617 = in.m_65.y;
    float _619 = in.m_65.z;
    float _621 = fma(_605, _605, _345);
    float _623 = fma(_597, _597, _607);
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _627 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _629 = isnan(0.0);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _635 = _631 || _633;
    float _637 = _609 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _639 = 1.0 / _611;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _643 = float(_595);
    float _645 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[78].z, _625);
    float _647 = float(_565);
    float _649 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[78].w, _641);
    float _651 = -_117;
    float _653 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[76].x, _299);
    float _655 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _645);
    float _657 = 1.0 / _601;
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _661 = _221 + _659;
    float _663 = -_613;
    float _665 = _663 + 1.0;
    float _667 = _643 * _117;
    float _669 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _649);
    float _671 = fma(_661, _661, _621);
    bool _673 = !_481;
    int _675 = _673 ? 0 : 1;
    float _677 = _529 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _679 = rsqrt(_623);
    float _681 = _639 * _117;
    float _683 = _635 ? _665 : 0.0;
    float _685 = _677 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _687 = _439 ? 0 : 1;
    int _689 = abs(_675);
    float _691 = sqrt(_671);
    if (_587)
    {
        float _693 = _683 * _657;
        _127 = _693;
    }
    float _695 = _127;
    float _697 = _547 * (-2.0);
    int _699 = ~_687;
    int _701 = _699 + 1;
    int _703 = _701 + 1;
    int _705 = _703;
    if (!_427)
    {
        int _707 = ~_687;
        int _709 = _707 + 1;
        _705 = _709;
    }
    int _711 = _705;
    float _713 = fma(_349, _697, _349);
    float _715 = fma(_697, _617, _617);
    float _717 = _597 * _679;
    float _719 = _637 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _721 = _575 * _679;
    float _723 = _577 * _679;
    float _725 = -_717;
    float _727 = _287 * _725;
    float _729 = float(_689);
    float _731 = float(_711);
    float _733 = _691 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _735 = _289 * _721;
    float _737 = _729 * _647;
    float _739 = rsqrt(_671);
    float _741 = precise::min(_719, _733);
    float _743 = -_723;
    float _745 = -_727;
    float _747 = fma(_289, _743, _745);
    float _749 = -_723;
    float _751 = _351 * _749;
    float _753 = -_717;
    float _755 = -_735;
    float _757 = fma(_351, _753, _755);
    float _759 = _737 * (-2.0);
    float _761 = _747 * _747;
    float _763 = -_751;
    float _765 = fma(_287, _721, _763);
    float _767 = _195 + (-0.5);
    float _769 = fma(_759, _615, _615);
    float _771 = fma(_757, _757, _761);
    float _773 = _197 + (-0.5);
    float _775 = fma(_343, _759, _343);
    float _777 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[196].x, _769);
    float _779 = fma(_765, _765, _771);
    float _781 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[196].y, _715);
    bool _783 = !_489;
    int _785 = _783 ? 0 : 1;
    float _787 = _739 * _741;
    float _789 = rsqrt(_779);
    float _791 = fma(_775, _695, _777);
    int _793 = abs(_785);
    float _795 = _329 * _787;
    float _797 = _605 * _787;
    float _799 = _661 * _787;
    float _801 = float(_793);
    float _803 = -_795;
    float _805 = _329 + _803;
    float _807 = -_797;
    float _809 = _605 + _807;
    float _811 = -_799;
    float _813 = _661 + _811;
    float _815 = _791 * 0.15915493667125701904296875;
    float _817 = _801 * _731;
    float _819 = _805 * _805;
    float _821 = fma(_713, _695, _781);
    float _823 = _815 * 6.283185482025146484375;
    float _825 = sin(_823);
    float _827 = _817 * (-2.0);
    float _829 = _757 * _789;
    float _831 = _765 * _789;
    float _833 = _747 * _789;
    float _835 = fma(_809, _809, _819);
    float _837 = _289 * _829;
    float _839 = _351 * _831;
    float _841 = _287 * _833;
    float _843 = fma(_813, _813, _835);
    float _845 = -_837;
    float _847 = fma(_287, _831, _845);
    float _849 = -_839;
    float _851 = fma(_289, _833, _849);
    float _853 = -_841;
    float _855 = fma(_351, _829, _853);
    float _857 = _195 + _245;
    float _859 = _847 * _847;
    float _861 = _815 * 6.283185482025146484375;
    float _863 = cos(_861);
    float _865 = _821 * 0.15915493667125701904296875;
    float _867 = _857 + (-1.0);
    float _869 = fma(_851, _851, _859);
    float _871 = as_type<float>(int(gl_VertexIndex));
    float _873 = _245 + (-0.5);
    float _875 = fma(_855, _855, _869);
    float _877 = sqrt(_843);
    float _879 = fma(_827, _619, _619);
    float _881 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _883 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[196].z, _879);
    float _885 = rsqrt(_875);
    float _887 = fma(_881, _827, _881);
    float _889 = fma(_887, _695, _883);
    float _891 = _739 * _877;
    float _893 = _865 * 6.283185482025146484375;
    float _895 = sin(_893);
    float _897 = _889 * 0.15915493667125701904296875;
    int _899 = as_type<int>(_871) & 1;
    bool _901 = _899 != 0;
    int _903 = as_type<int>(_871) & 2;
    bool _905 = _903 != 0;
    float _907 = _685 * _891;
    float _909 = _637 * _891;
    float _911 = _855 * _885;
    float _913 = _851 * _885;
    float _915 = _847 * _885;
    float _917 = _897 * 6.283185482025146484375;
    float _919 = sin(_917);
    float _921 = _287 * _911;
    bool _923 = !_905;
    float _925 = _923 ? (-0.5) : 0.5;
    float _927 = _289 * _915;
    bool _929 = !_901;
    float _931 = _929 ? (-0.5) : 0.5;
    float _933 = -_921;
    float _935 = fma(_289, _913, _933);
    float _937 = _351 * _913;
    float _939 = -_927;
    float _941 = fma(_351, _911, _939);
    float _943 = _897 * 6.283185482025146484375;
    float _945 = cos(_943);
    float _947 = _935 * _935;
    float _949 = -_937;
    float _951 = fma(_287, _915, _949);
    float _953 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _925);
    float _955 = -_799;
    float _957 = _221 + _955;
    float _959 = fma(_941, _941, _947);
    float _961 = _907 * _953;
    float _963 = _865 * 6.283185482025146484375;
    float _965 = cos(_963);
    float _967 = fma(_951, _951, _959);
    float _969 = _825 * _919;
    float _971 = _863 * _919;
    float _973 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _931);
    float _975 = _863 * _945;
    float _977 = rsqrt(_967);
    float _979 = _825 * _945;
    float _981 = fma(_895, _969, _975);
    float _983 = -_971;
    float _985 = fma(_895, _979, _983);
    float _987 = _965 * _945;
    float _989 = _825 * _965;
    float _991 = _909 * _973;
    float _993 = _965 * _919;
    float _995 = _981 * _961;
    float _997 = _985 * _961;
    float _999 = _989 * _961;
    float _1001 = fma(_993, _991, _995);
    float _1003 = fma(_987, _991, _997);
    float _1005 = -_895;
    float _1007 = fma(_1005, _991, _999);
    float _1009 = _951 * _977;
    float _1011 = _1001 * _911;
    float _1013 = -_795;
    float _1015 = _1013 + _209;
    float _1017 = _1001 * _913;
    float _1019 = _941 * _977;
    float _1021 = fma(_1003, _1009, _1011);
    float _1023 = -_797;
    float _1025 = _213 + _1023;
    float _1027 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1029 = fma(_1003, _1019, _1017);
    float _1031 = fma(_289, _1007, _1021);
    float _1033 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1035 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1027);
    float _1037 = fma(_287, _1007, _1029);
    float _1039 = _221 + _1031;
    float _1041 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1033);
    float _1043 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1035);
    float _1045 = _213 + _1037;
    float _1047 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1049 = _1039 + _1047;
    float _1051 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1041);
    float _1053 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1055 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1057 = _1045 + _1055;
    float _1059 = _1049 * _1049;
    float _1061 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1063 = 1.0 / _1053;
    float _1065 = _935 * _977;
    float _1067 = fma(_1057, _1057, _1059);
    float _1069 = _1061 + _1053;
    float _1071 = _1001 * _915;
    float _1073 = sqrt(_1067);
    float _1075 = fma(_1003, _1065, _1071);
    bool _1077 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan(0.5);
    bool _1085 = _1081 || _1083;
    float _1087 = fma(_351, _1007, _1075);
    bool _1089 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1093 = _1089 || _1091;
    bool _1095 = isnan(0.5);
    bool _1097 = _1093 || _1095;
    float _1099 = _1069 * _1063;
    float _1101 = _1099 * 0.5;
    float _1103 = _209 + _1087;
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1107 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1105);
    bool _1109 = _1073 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1111 = 1.0 / _1107;
    float _1113 = _1007;
    float _1115 = _1087;
    float _1117 = _1039;
    float _1119 = _1073;
    float _1121 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1123 = _1063;
    float _1125 = _957;
    float _1127 = _1015;
    if (!_1109)
    {
        _1113 = _1045;
    }
    float _1129 = _1113;
    float _1131 = _1129;
    if (!_1109)
    {
        _1115 = _1103;
    }
    float _1133 = _1115;
    bool _1135 = !_1109;
    float _1137 = _1133;
    if (!_1135)
    {
        float _1139 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1141 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1143 = _1073 + _1141;
        float _1145 = _1103 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1147 = rsqrt(_1067);
        float _1149 = _1143 * _1139;
        float _1151 = _1149 * 0.15915493667125701904296875;
        float _1153 = _1151 * 6.283185482025146484375;
        float _1155 = cos(_1153);
        float _1157 = _1151 * 6.283185482025146484375;
        float _1159 = sin(_1157);
        float _1161 = _1155 + (-1.0);
        float _1163 = _1161 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1165 = fma(_1159, _1145, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1167 = fma(_1103, _1155, _1163);
        float _1169 = _1147 * _1165;
        float _1171 = fma(_1057, _1169, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1173 = fma(_1049, _1169, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1131 = _1171;
        _1137 = _1167;
        _1117 = _1173;
        _1119 = _1151;
    }
    float _1175 = _1131;
    float _1177 = _1137;
    float _1179 = _1117;
    float _1181 = _1119;
    float _1183 = -_797;
    float _1185 = _1183 + _1175;
    float _1187 = -_795;
    float _1189 = _1187 + _1177;
    float _1191 = -_799;
    float _1193 = _1191 + _1179;
    float _1195 = _1181;
    float _1197 = _1189;
    float _1199 = _1185;
    float _1201 = _1193;
    if (_1097)
    {
        _1195 = 1.0;
    }
    float _1203 = _1195;
    float _1205 = _1203;
    if (!_1085)
    {
        float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1209 = _1015 + _1207;
        float _1211 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1213 = _1025 + _1211;
        float _1215 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1217 = -_213;
        float _1219 = _1217 + _1175;
        float _1221 = _1209 * _1209;
        float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1225 = _957 + _1223;
        float _1227 = -_209;
        float _1229 = _1227 + _1177;
        float _1231 = -_221;
        float _1233 = _1231 + _1179;
        float _1235 = fma(_1213, _1213, _1221);
        float _1237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1239 = fma(_1225, _1225, _1235);
        float _1241 = sqrt(_1239);
        float _1243 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1245 = precise::min(_1241, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1247 = _1245 * _1237;
        float _1249 = _1243 * _1247;
        float _1251 = fma(_1219, _1249, _1025);
        float _1253 = fma(_1229, _1249, _1015);
        float _1255 = fma(_1233, _1249, _957);
        _1197 = _1253;
        _1199 = _1251;
        _1201 = _1255;
    }
    float _1257 = _1197;
    float _1259 = _1199;
    float _1261 = _1201;
    if (_1097)
    {
        _1121 = 1.0;
    }
    float _1263 = _1121;
    float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1267 = _1111 * _1265;
    float _1269 = _1267;
    float _1271 = _1263;
    if (!_1097)
    {
        float _1273 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1277 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1275;
        float _1279 = _1273 * 0.15915493667125701904296875;
        float _1281 = _1279 * 6.283185482025146484375;
        float _1283 = cos(_1281);
        float _1285 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1287 = _1285 * 0.15915493667125701904296875;
        float _1289 = _1279 * 6.283185482025146484375;
        float _1291 = sin(_1289);
        float _1293 = 1.0 / _1283;
        float _1295 = _1287 * 6.283185482025146484375;
        float _1297 = cos(_1295);
        float _1299 = _1291 * _1293;
        float _1301 = _1287 * 6.283185482025146484375;
        float _1303 = sin(_1301);
        float _1305 = _1297 * _1299;
        float _1307 = 1.0 / _1277;
        float _1309 = 1.0 / _1305;
        float _1311 = _1303 * _1309;
        float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1315 = fma(_1267, _1311, _1313);
        float _1317 = _1315 * _1307;
        float _1319 = precise::clamp(_1317, 0.0, 1.0);
        _1205 = _1319;
    }
    float _1321 = _1205;
    if (!_1097)
    {
        float _1323 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1325 = _1323 * 0.15915493667125701904296875;
        float _1327 = _1325 * 6.283185482025146484375;
        float _1329 = cos(_1327);
        float _1331 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1333 = _1331 * 0.15915493667125701904296875;
        float _1335 = _1325 * 6.283185482025146484375;
        float _1337 = sin(_1335);
        float _1339 = 1.0 / _1329;
        float _1341 = _1333 * 6.283185482025146484375;
        float _1343 = cos(_1341);
        float _1345 = _1337 * _1339;
        float _1347 = _1333 * 6.283185482025146484375;
        float _1349 = sin(_1347);
        float _1351 = _1343 * _1345;
        float _1353 = 1.0 / _1351;
        float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1357 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1355;
        float _1359 = 1.0 / _1357;
        float _1361 = _1349 * _1353;
        float _1363 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1365 = fma(_1267, _1361, _1363);
        float _1367 = _1365 * _1359;
        float _1369 = precise::clamp(_1367, 0.0, 1.0);
        float _1371 = -_1369;
        float _1373 = _1371 + 1.0;
        _1269 = _1369;
        _1271 = _1373;
    }
    float _1375 = _1269;
    float _1377 = _1271;
    float _1379 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1381 = _1257 + _1379;
    float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1385 = _1259 + _1383;
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1389 = _1261 + _1387;
    float _1391 = _1381 * _1381;
    float _1393 = fma(_1385, _1385, _1391);
    float _1395 = fma(_1389, _1389, _1393);
    float _1397 = rsqrt(_1395);
    float _1399 = sqrt(_1395);
    float _1401 = _1397 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1403 = _1385 * _1401;
    float _1405 = _1389 * _1401;
    float _1407 = _1403 * _1403;
    float _1409 = _1405 * _1405;
    float _1411 = _1407 + _1409;
    float _1413 = sqrt(_1411);
    bool _1415 = _1413 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1417 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1419 = _1413 + _1417;
    float _1421 = _1389;
    float _1423 = _1397;
    float _1425 = _1419;
    float _1427 = _1375;
    float _1429 = _1381;
    if (_1415)
    {
        float _1431 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1421 = _1431;
    }
    float _1433 = _1421;
    if (_1415)
    {
        float _1435 = rsqrt(_1411);
        _1423 = _1435;
    }
    float _1437 = _1423;
    float _1439 = _1437;
    if (_1415)
    {
        float _1441 = _1419 * _1433;
        _1425 = _1441;
    }
    float _1443 = _1425;
    if (_1415)
    {
        float _1445 = _1443 * 0.15915493667125701904296875;
        _1427 = _1445;
    }
    float _1447 = _1427;
    float _1449 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1451 = _1433;
    float _1453 = _1447;
    if (_1415)
    {
        float _1455 = _1447 * 6.283185482025146484375;
        float _1457 = sin(_1455);
        _1451 = _1457;
    }
    float _1459 = _1451;
    float _1461 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1463 = precise::max(0.0, _1461);
    float _1465 = _1391;
    float _1467 = _1463;
    if (_1415)
    {
        float _1469 = _1447 * 6.283185482025146484375;
        float _1471 = cos(_1469);
        _1465 = _1471;
    }
    float _1473 = _1465;
    float _1475 = -_1401;
    float _1477 = -_1463;
    float _1479 = fma(_1381, _1475, _1477);
    if (_1415)
    {
        float _1481 = _1479 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1467 = _1481;
    }
    float _1483 = _1467;
    float _1485 = _1459;
    float _1487 = _1483;
    if (_1415)
    {
        float _1489 = fma(_1459, _1483, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1429 = _1489;
    }
    float _1491 = _1429;
    float _1493 = _1491;
    if (!_1415)
    {
        _1485 = _1403;
    }
    float _1495 = _1485;
    float _1497 = _1495;
    float _1499 = _1473;
    if (_1415)
    {
        float _1501 = _1473 + (-1.0);
        _1487 = _1501;
    }
    float _1503 = _1487;
    float _1505 = _1503;
    if (_1415)
    {
        float _1507 = _1437 * _1491;
        _1123 = _1507;
    }
    float _1509 = _1123;
    if (!_1415)
    {
        _1493 = _1479;
    }
    float _1511 = _1493;
    float _1513 = _1511;
    if (_1415)
    {
        float _1515 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1453 = _1515;
    }
    float _1517 = _1453;
    if (_1415)
    {
        float _1519 = _1403 * _1509;
        _1497 = _1519;
    }
    float _1521 = _1497;
    if (!_1415)
    {
        _1505 = _1405;
    }
    float _1523 = _1505;
    float _1525 = _1523;
    if (_1415)
    {
        float _1527 = _1405 * _1509;
        _1525 = _1527;
    }
    float _1529 = _1525;
    if (!_1415)
    {
        _1439 = _1407;
    }
    float _1531 = _1439;
    float _1533 = _1531;
    if (_1415)
    {
        float _1535 = fma(_1479, _1473, _1517);
        _1513 = _1535;
    }
    float _1537 = _1513;
    if (_1415)
    {
        float _1539 = _1521 * _1521;
        _1533 = _1539;
    }
    float _1541 = _1533;
    if (!_1415)
    {
        _1499 = _1409;
    }
    float _1543 = _1499;
    float _1545 = _1543;
    if (_1415)
    {
        float _1547 = _1529 * _1529;
        _1545 = _1547;
    }
    float _1549 = _1545;
    float _1551 = fma(_1537, _1537, _1541);
    float _1553 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1555 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1557 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1559 = _1551 + _1549;
    float _1561 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1563 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1553);
    float _1565 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1555);
    float _1567 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1569 = fma(_1399, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1567);
    float _1571 = precise::clamp(_1569, 0.0, 1.0);
    float _1573 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1561);
    float _1575 = rsqrt(_1559);
    float _1577 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1563);
    float _1579 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1565);
    float _1581 = -_1571;
    float _1583 = _1581 + 1.0;
    float _1585 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1573);
    float _1587 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1589 = _1579 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1591 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1557);
    float _1593 = _1585 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1595 = abs(_1583);
    float _1597 = log2(_1595);
    float _1599 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1601 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1603 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1591);
    float _1605 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1607 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1599);
    float _1609 = -_1601;
    float _1611 = fma(_1609, _1449, 1.0);
    float _1613 = _1575 * _1521;
    float _1615 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1617 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1607);
    float _1619 = _1575 * _1537;
    float _1621 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1623 = _1575 * _1529;
    float _1625 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1617);
    float _1627 = log2(_1611);
    float _1629 = -_1621;
    float _1631 = fma(_1619, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1629);
    float _1633 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1635 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1605);
    float _1637 = -_1623;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1631);
    float _1641 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1643 = _1619 + 1.0;
    float _1645 = exp2(_1633);
    float _1647 = fma(_1639, -0.5, 0.5);
    float _1649 = fma(_1639, 0.5, 0.5);
    float _1651 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1641);
    float _1653 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1635);
    float _1655 = fma(_1649, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1657 = 1.0 / _1625;
    float _1659 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1651);
    float _1661 = fma(_1649, _1655, -0.212114393711090087890625);
    float _1663 = fma(_1649, _1661, 1.570728778839111328125);
    float _1665 = sqrt(_1647);
    float _1667 = -_1619;
    float _1669 = fma(_1645, _1643, _1667);
    float _1671 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1659);
    float _1673 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1653);
    float _1675 = _1627 * 0.693147182464599609375;
    float _1677 = fma(_1669, 0.5, 0.5);
    float _1679 = _1671 * _1657;
    float _1681 = _1673 * _1657;
    float _1683 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1685 = _1665 * 0.636619746685028076171875;
    float _1687 = fma(_1679, 0.5, 0.5);
    float _1689 = fma(_1681, -0.5, 0.5);
    float _1691 = -_1663;
    float _1693 = fma(_1685, _1691, 1.0);
    float3 _5234 = float3(_1687, _1689, _1683);
    float _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5234, float3(0.0), isnan(_5234)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5234, float3(0.0), isnan(_5234)), level(0.0)).x;
    float3 _5245 = float3(_1687, _1689, _1683);
    float4 _1698 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5245, float3(0.0), isnan(_5245)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5245, float3(0.0), isnan(_5245)), level(0.0)).xyzw;
    float _1700 = _1698.x;
    float _1702 = _1698.y;
    float _1704 = _1698.z;
    float _1706 = _1698.w;
    float2 _5262 = float2(_1693, _1677);
    float3 _1710 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5262, float2(0.0), isnan(_5262)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5262, float2(0.0), isnan(_5262)), level(0.0)).xyz;
    float _1712 = _1710.x;
    float _1714 = _1710.y;
    float _1716 = _1710.z;
    float _1718 = float(uint(_595));
    float _1720 = trunc(_681);
    int _1722 = int(_1720);
    int _1724 = ~_595;
    int _1726 = _1724 + 1;
    float _1728 = -_655;
    float _1730 = _1728 + 1.0;
    int _1732 = abs(_465);
    float _1734 = -_669;
    float _1736 = _1734 + 1.0;
    bool _1738 = _195 > 0.5;
    float _1740 = _863 * _965;
    bool _1742 = _197 > 0.5;
    float _1744 = 1.0 / _1718;
    float _1746 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1748 = -_979;
    float _1750 = fma(_895, _971, _1748);
    int _1752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1754 = _1752 != 0;
    float _1756 = fma(_895, _975, _969);
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1760 = float(uint(_1722));
    float _1762 = exp2(_1746);
    bool _1764 = !_1754;
    float _1766 = _1764 ? 7.345489978790283203125 : 1.0;
    float _1768 = _1758 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_70.w = _741;
    int _1770 = as_type<int>(_1744) + (-2);
    float _1772 = _1766 * _195;
    out.m_72.x = _909;
    float _1774 = as_type<float>(_1770) * _1760;
    float _1776 = floor(_1772);
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1780 = _1750 * _913;
    out.m_74.x = _1259;
    out.m_74.y = _1257;
    out.m_74.z = _1261;
    float _1782 = -_1762;
    float _1784 = _1782 + 1.0;
    float _1786 = _1778 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1788 = fma(_1756, _1019, _1780);
    out.m_76.x = _1025;
    out.m_76.y = _1015;
    out.m_76.z = _957;
    float _1790 = trunc(_1774);
    float _1792 = precise::max(_1790, 0.0);
    uint _1795 = uint(_1792);
    float _1797 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1799 = fma(_1740, _287, _1788);
    float _1801 = -_1776;
    float _1803 = _1772 + _1801;
    float _1805 = _1321 * _1377;
    int _1807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1809 = _1807 != 0;
    int _1811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1813 = _1811 != 0;
    int _1815 = _1726 * int(_1795);
    int _1817 = _1815 + _1722;
    int _1819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1821 = _1819 != 0;
    float _1823 = float(uint(_1817));
    float _1825 = as_type<float>(_1770) * _1823;
    float _1827 = float(_1722);
    float _1829 = trunc(_1825);
    float _1831 = precise::max(_1829, 0.0);
    uint _1833 = uint(_1831);
    bool _1835 = _1827 >= _643;
    bool _1837 = isnan(_1827);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(_643);
    bool _1843 = _1839 || _1841;
    float _1845 = float(_1843);
    float _1847 = trunc(_1845);
    int _1849 = int(_1847);
    int _1851 = int(_1795) + int(_1833);
    float _1853 = 1.0 / _149;
    int _1855 = _1726 * _1851;
    int _1857 = _1855 + _1722;
    bool _1859 = uint(_1857) >= uint(_595);
    bool _1861 = !_1859;
    int _1863 = _1861 ? 0 : (-1);
    bool _1865 = _595 == 0;
    int _1867 = ~_1851;
    int _1869 = _1867 + _1863;
    int _1871 = _1869 + 1;
    float _1873 = _1803 * _643;
    float _1875 = _667 * _1853;
    int _1877 = _595 + (-1);
    int _1879 = _595 * _1871;
    int _1881 = _1879 + _1722;
    int _1883 = ~_1849;
    int _1885 = _1883 + 1;
    int _1887 = _1885 + 1;
    float _1889 = trunc(_1873);
    int _1891 = int(_1889);
    bool _1893 = !_1865;
    int _1895 = _1893 ? _1881 : (-1);
    bool _1897 = !_1809;
    int _1899 = _1897 ? 0 : 1;
    int _1901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1903 = _1901 != 0;
    float _1905 = trunc(_1875);
    int _1907 = int(_1905);
    int _1909 = _1895 * _1887;
    int _1911 = abs(_459);
    int _1913 = abs(_1899);
    int _1915 = _1849 * _1877;
    int _1917 = _1915 + _1909;
    int _1919 = abs(_473);
    int _1921 = _1891 * _1913;
    int _1923 = _1921 + _1722;
    int _1925 = _1917 * _1911;
    bool _1927 = !_1903;
    int _1929 = _1927 ? 0 : 1;
    int _1931 = _1907 * _1732;
    int _1933 = _1931 + _1925;
    int _1935 = abs(_1929);
    int _1937 = ~_595;
    int _1939 = _1937 + 1;
    int _1941 = _1923 * _1919;
    int _1943 = _1941 + _1933;
    float _1945 = -_931;
    int _1947 = _1738 ? as_type<int>(_1945) : as_type<int>(_931);
    int _1949 = ~_595;
    int _1951 = _1949 + 1;
    int _1953 = _1891 * _1935;
    int _1955 = _1953 + _1943;
    int _1957 = ~_595;
    int _1959 = _1957 + 1;
    bool _1961 = !_1813;
    float _1963 = _1961 ? _931 : as_type<float>(_1947);
    float _1965 = _931 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1967 = float(uint(_1955));
    float _1969 = _1963 + 0.5;
    float _1971 = as_type<float>(_1770) * _1967;
    float _1973 = fma(_1969, (*spvDescriptorSet0.vp_c9)._m0[80].x, _653);
    float _1975 = trunc(_1971);
    float _1977 = precise::max(_1975, 0.0);
    uint _1979 = uint(_1977);
    float _1981 = -_1730;
    float _1983 = fma(_1963, _1981, _1973);
    int _1985 = _1959 * int(_1979);
    int _1987 = _1985 + _1955;
    float _1989 = float(uint(_1987));
    float _1991 = as_type<float>(_1770) * _1989;
    float _1993 = trunc(_1991);
    float _1995 = precise::max(_1993, 0.0);
    uint _1997 = uint(_1995);
    int _1999 = int(_1979) + int(_1997);
    float _2001 = float(uint(_1923));
    int _2003 = _1939 * _1999;
    int _2005 = _2003 + _1955;
    float _2007 = as_type<float>(_1770) * _2001;
    bool _2009 = uint(_2005) >= uint(_595);
    float _2011 = trunc(_2007);
    float _2013 = precise::max(_2011, 0.0);
    uint _2015 = uint(_2013);
    bool _2017 = !_2009;
    int _2019 = _2017 ? 0 : (-1);
    int _2021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2023 = _2021 != 0;
    int _2025 = ~_1999;
    int _2027 = _2025 + _2019;
    int _2029 = _2027 + 1;
    int _2031 = _595 * _2029;
    int _2033 = _2031 + _1955;
    float _2035 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2037 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2039 = -_925;
    int _2041 = _1742 ? as_type<int>(_2039) : as_type<int>(_925);
    bool _2043 = !_1865;
    int _2045 = _2043 ? _2033 : (-1);
    float _2047 = _2035 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2049 = !_1821;
    float _2051 = _2049 ? _925 : as_type<float>(_2041);
    float _2053 = _925 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2055 = _2045 >> 31;
    float _2057 = _2051 + (-0.5);
    int _2059 = _2055 & 3;
    out.m_78.x = _1786;
    out.m_78.y = _1768;
    out.m_78.z = _2047;
    out.m_78.w = _2037;
    int _2061 = _2045 & 3;
    bool _2063 = _2061 != 0;
    int _2065 = _1951 * int(_2015);
    int _2067 = _2065 + _1923;
    int _2069 = _2045 + _2059;
    float _2071 = -_2057;
    float _2073 = -_533;
    float _2075 = fma(_2071, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2073);
    int _2077 = _2069 >> 2;
    float _2079 = fma(_2051, _1736, _2075);
    float _2081 = float(uint(_2067));
    int _2083 = _2077 << 4;
    int _2085 = _2083 + 368;
    float _2087 = as_type<float>(_1770) * _2081;
    uint _2089 = uint(int(uint(_2085) >> uint(2)));
    uint _2091 = uint(int(uint(int(_2089)) >> uint(2)));
    int _2093 = int(_2089) & 3;
    float _2095 = (*spvDescriptorSet0.vp_c9)._m0[int(_2091)][_2093];
    int _2097 = int(_2089) + 1;
    uint _2099 = uint(int(uint(_2097) >> uint(2)));
    int _2101 = _2097 & 3;
    float _2103 = (*spvDescriptorSet0.vp_c9)._m0[int(_2099)][_2101];
    int _2105 = _2045 & 3;
    bool _2107 = _2105 != 0;
    out.m_80.x = _1983;
    out.m_80.y = _2079;
    float _2109 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2111 = trunc(_2087);
    float _2113 = precise::max(_2111, 0.0);
    uint _2115 = uint(_2113);
    int _2117 = _2085 + 8;
    uint _2119 = uint(int(uint(_2117) >> uint(2)));
    uint _2121 = uint(int(uint(int(_2119)) >> uint(2)));
    int _2123 = int(_2119) & 3;
    float _2125 = (*spvDescriptorSet0.vp_c9)._m0[int(_2121)][_2123];
    int _2127 = int(_2119) + 1;
    uint _2129 = uint(int(uint(_2127) >> uint(2)));
    int _2131 = _2127 & 3;
    float _2133 = (*spvDescriptorSet0.vp_c9)._m0[int(_2129)][_2131];
    bool _2135 = uint(_2105) > 1u;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2141 = _2109 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2143 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2145 = _2063 ? 0 : 1;
    float _2147 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2149 = _2139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2151 = ~_595;
    int _2153 = _2151 + 1;
    float _2155 = _981 * _911;
    bool _2157 = _2105 != 3;
    int _2159 = int(_2015) + int(_2115);
    out.m_82.x = _2141;
    out.m_82.y = _2143;
    out.m_82.z = _2149;
    out.m_82.w = _2147;
    int _2161 = ~_2145;
    int _2163 = _2161 + 1;
    int _2165 = _2163 + 1;
    int _2167 = _2165;
    float _2169 = _1671;
    float _2171 = _1805;
    if (!_2135)
    {
        int _2173 = ~_2145;
        int _2175 = _2173 + 1;
        _2167 = _2175;
    }
    int _2177 = _2167;
    bool _2179 = uint(_2105) >= 2u;
    int _2181 = abs(_2177);
    int _2183 = _2153 * _2159;
    int _2185 = _2183 + _1923;
    bool _2187 = !_2107;
    int _2189 = _2187 ? 0 : 1;
    int _2191 = _2179 ? 0 : 1;
    bool _2193 = uint(_2185) >= uint(_595);
    int _2195 = abs(_2189);
    int _2197 = ~_2191;
    int _2199 = _2197 + 1;
    int _2201 = _2199 + 1;
    int _2203 = _2201;
    if (_2157)
    {
        int _2205 = ~_2191;
        int _2207 = _2205 + 1;
        _2203 = _2207;
    }
    int _2209 = _2203;
    bool _2211 = !_2193;
    int _2213 = _2211 ? 0 : (-1);
    int _2215 = ~_2181;
    int _2217 = _2215 + 1;
    int _2219 = _2217 + 1;
    int _2221 = ~_2159;
    int _2223 = _2221 + _2213;
    int _2225 = _2223 + 1;
    int _2227 = ~_2195;
    int _2229 = _2227 + 1;
    int _2231 = _2229 + 1;
    int _2233 = _2219 * as_type<int>(_2103);
    bool _2235 = _2105 != 3;
    int _2237 = _595 * _2225;
    int _2239 = _2237 + _1923;
    int _2241 = abs(_2209);
    int _2243 = _2231 * as_type<int>(_2095);
    int _2245 = _2243 + _2233;
    bool _2247 = !_2235;
    int _2249 = _2247 ? 0 : (-1);
    float _2251 = _993 * _913;
    bool _2253 = !_2023;
    int _2255 = _2253 ? 0 : 1;
    float _2257 = fma(_987, _1019, _2251);
    int _2259 = abs(_2249);
    float _2261 = _981 * _913;
    int _2263 = abs(_2255);
    int _2265 = ~_2241;
    int _2267 = _2265 + 1;
    int _2269 = _2267 + 1;
    float _2271 = _993 * _915;
    bool _2273 = !_1865;
    int _2275 = _2273 ? _2239 : (-1);
    int _2277 = _2269 * as_type<int>(_2125);
    int _2279 = _2277 + _2245;
    int _2281 = ~_2259;
    int _2283 = _2281 + 1;
    int _2285 = _2283 + 1;
    float _2287 = _981 * _915;
    float _2289 = _993 * _911;
    float _2291 = _1750 * _911;
    float _2293 = _1750 * _915;
    int _2295 = _2285 * as_type<int>(_2133);
    int _2297 = _2295 + _2279;
    float _2299 = fma(_985, _1019, _2261);
    float _2301 = fma(_985, _1065, _2287);
    float _2303 = fma(_985, _1009, _2155);
    float _2305 = fma(_987, _1065, _2271);
    float _2307 = fma(_987, _1009, _2289);
    float _2309 = fma(_1756, _1009, _2291);
    float _2311 = fma(_989, _287, _2299);
    float _2313 = fma(_989, _351, _2301);
    float _2315 = fma(_989, _289, _2303);
    float _2317 = -_895;
    float _2319 = fma(_2317, _351, _2305);
    float _2321 = -_895;
    float _2323 = fma(_2321, _289, _2307);
    float _2325 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2327 = fma(_1740, _289, _2309);
    float _2329 = _2053 * _2311;
    float _2331 = _2053 * _2313;
    float _2333 = _2053 * _2315;
    int _2335 = ~_2263;
    int _2337 = _2335 + 1;
    int _2339 = _2337 + 1;
    float _2341 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2325);
    float _2343 = fma(_1756, _1065, _2293);
    float _2345 = fma(_1965, _2323, _2333);
    float _2347 = _1625 * 0.5;
    float _2349 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2341);
    int _2351 = _2297 * _2339;
    float _2353 = -_895;
    float _2355 = fma(_2353, _287, _2257);
    float _2357 = fma(_1740, _351, _2343);
    float _2359 = fma(_1673, -0.5, _2347);
    float _2361 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2349);
    float _2363 = _1797 * _1695;
    int _2365 = _2275 * _2263;
    int _2367 = _2365 + _2351;
    float _2369 = fma(_1965, _2355, _2329);
    float _2371 = fma(_1965, _2319, _2331);
    float _2373 = _2361 + _1625;
    float _2375 = _1671 + _1625;
    float _2377 = _1706 * _2363;
    float _2379 = -_1797;
    float _2381 = _2379 + 1.0;
    float _2383 = _1716 * _2363;
    float _2385 = float(_2367);
    float _2387 = _2357 + _2371;
    float _2389 = _2373 * 0.5;
    float _2391 = _2375 * 0.5;
    float _2393 = _1799 + _2369;
    float _2395 = _2327 + _2345;
    float _2397 = fma(_1712, _2377, _1700);
    float _2399 = fma(_1714, _2377, _1702);
    float _2401 = _1706 * _2381;
    float _2403 = fma(_1706, _2383, _1704);
    out.m_84.x = _2391;
    out.m_84.y = _2359;
    out.m_84.z = _2389;
    out.m_84.w = _1625;
    bool _2405 = _1399 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2407 = isnan(_1399);
    bool _2409 = _2405 || _2407;
    bool _2411 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2413 = _2409 || _2411;
    out.m_86.x = _2397;
    out.m_86.y = _2399;
    out.m_86.z = _2403;
    out.m_86.w = _2401;
    out.m_88.x = _2393;
    out.m_88.y = _2387;
    out.m_88.z = _2395;
    out.gl_Position.x = _1671;
    out.gl_Position.y = _1673;
    out.gl_Position.z = _2361;
    out.gl_Position.w = _1625;
    float _2415 = _2377;
    float _2417 = _2385;
    if (!_2413)
    {
        _2415 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2419 = _2415;
    out.m_90.x = _2385;
    float _2421 = _2419;
    float _2423 = _2419;
    if (!_2413)
    {
        _1125 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2425 = _1125;
    float _2427 = _2425;
    float _2429 = _2425;
    if (!_2413)
    {
        _1127 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2431 = _1127;
    float _2433 = _2431;
    float _2435 = _2431;
    if (!_2413)
    {
        _2417 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2437 = _2417;
    float _2439 = _1805 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2441 = _2437;
    float _2443 = _2437;
    if (!_2413)
    {
        _2169 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2445 = _2169;
    float _2447 = _2445;
    float _2449 = _2445;
    if (!_2413)
    {
        _2171 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2451 = _2171;
    bool _2453 = !_2413;
    float _2455 = _2451;
    float _2457 = _2451;
    if (!_2453)
    {
        bool _2459 = _1399 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2461 = isnan(_1399);
        bool _2463 = _2459 || _2461;
        bool _2465 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2467 = _2463 || _2465;
        if (!_2467)
        {
            float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2471 = _1399 + _2469;
            float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2475 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2473;
            float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2481 = 1.0 / _2475;
            float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2485 = _2483 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2493 = _2491 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2499 = _2471 * _2481;
            float _2501 = precise::clamp(_2499, 0.0, 1.0);
            float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2505 = _2503 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2507 = fma(_2501, _2479, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2509 = fma(_2501, _2505, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2511 = fma(_2501, _2485, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2513 = fma(_2501, _2489, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2515 = fma(_2501, _2493, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2517 = fma(_2501, _2497, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2449 = _2511;
            _2435 = _2515;
            _2423 = _2507;
            _2429 = _2513;
            _2443 = _2509;
            _2457 = _2517;
            _2519 = true;
        }
        else
        {
            bool _2521 = _1399 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2523 = isnan(_1399);
            bool _2525 = _2521 || _2523;
            bool _2527 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2529 = _2525 || _2527;
            if (!_2529)
            {
                _2421 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2531 = _2421;
            _2423 = _2531;
            if (!_2529)
            {
                _2447 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2533 = _2447;
            _2449 = _2533;
            if (!_2529)
            {
                _2441 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2535 = _2441;
            _2443 = _2535;
            if (!_2529)
            {
                _2427 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2537 = _2427;
            _2429 = _2537;
            if (!_2529)
            {
                _2433 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2539 = _2433;
            _2435 = _2539;
            if (!_2529)
            {
                _2455 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2541 = _2455;
            bool _2543 = !_2529;
            _2457 = _2541;
            if (!_2543)
            {
                bool _2545 = _1399 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2547 = isnan(_1399);
                bool _2549 = _2545 || _2547;
                bool _2551 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2553 = _2549 || _2551;
                if (!_2553)
                {
                    float _2555 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2557 = _1399 + _2555;
                    float _2559 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2561 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2559;
                    float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2567 = 1.0 / _2561;
                    float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2571 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2573 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2575 = _2573 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2581 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2583 = _2581 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2585 = _2557 * _2567;
                    float _2587 = precise::clamp(_2585, 0.0, 1.0);
                    float _2589 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2591 = _2589 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2593 = fma(_2587, _2565, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2595 = fma(_2587, _2591, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2597 = fma(_2587, _2571, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2599 = fma(_2587, _2575, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2601 = fma(_2587, _2579, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2603 = fma(_2587, _2583, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2449 = _2597;
                    _2435 = _2601;
                    _2423 = _2593;
                    _2429 = _2599;
                    _2443 = _2595;
                    _2457 = _2603;
                    _2519 = true;
                }
                else
                {
                    _2449 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2435 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2423 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2429 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2443 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2457 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2519 = false;
    float _2605 = _2449;
    float _2607 = _2435;
    float _2609 = _2423;
    float _2611 = _2429;
    float _2613 = _2443;
    float _2615 = _2457;
    float _2617 = fma(_2387, -0.5, 0.5);
    float _2619 = precise::clamp(_2617, 0.0, 1.0);
    float _2621 = -_2605;
    float _2623 = _2621 + _2607;
    float _2625 = _2439 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2627 = -_2609;
    float _2629 = _2627 + _2611;
    float _2631 = fma(_2619, _2623, _2605);
    out.m_92.x = 0.0;
    float _2633 = -_2613;
    float _2635 = _2633 + _2615;
    float _2637 = fma(_2619, _2629, _2609);
    float _2639 = _2631 * 0.586610972881317138671875;
    out.m_51.x = _2625;
    bool _2641 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2643 = fma(_2619, _2635, _2613);
    float _2645 = fma(_2637, 0.298911988735198974609375, _2639);
    bool _2647 = _1321 > 0.0;
    bool _2649 = isnan(_1321);
    bool _2651 = _2647 || _2649;
    bool _2653 = isnan(0.0);
    bool _2655 = _2651 || _2653;
    float _2657 = fma(_2643, 0.114477999508380889892578125, _2645);
    bool _2659 = _1377 <= 0.0;
    bool _2661 = !_2655;
    bool _2663 = _2659 || _2661;
    float _2665 = -_2657;
    float _2667 = _2637 + _2665;
    float _2669 = -_2657;
    float _2671 = _2631 + _2669;
    float _2673 = -_2657;
    float _2675 = _2643 + _2673;
    float _2677 = fma(_2667, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2657);
    float _2679 = fma(_2671, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2657);
    float _2681 = fma(_2675, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2657);
    bool _2683 = !_2641;
    if (!_2683)
    {
        float _2685 = -_1257;
        float _2687 = _2685 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2689 = -_1259;
        float _2691 = _2689 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2693 = -_1261;
        float _2695 = _2693 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2697 = _2687 * _2687;
        float _2699 = fma(_2691, _2691, _2697);
        float _2701 = fma(_2695, _2695, _2699);
        float _2703 = sqrt(_2701);
        float _2705 = rsqrt(_2701);
        float _2707 = -_2703;
        float _2709 = _2707 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2711 = _2709 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2713 = precise::clamp(_2711, 0.0, 1.0);
        float _2715 = _2691 * _2705;
        float _2717 = _2687 * _2705;
        float _2719 = abs(_2713);
        float _2721 = log2(_2719);
        float _2723 = _2695 * _2705;
        float _2725 = _2715 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2727 = _2387 * _2717;
        float _2729 = -_2717;
        float _2731 = -_2725;
        float _2733 = fma(_2729, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2731);
        float _2735 = fma(_2393, _2715, _2727);
        float _2737 = -_2723;
        float _2739 = fma(_2737, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2733);
        float _2741 = fma(_2395, _2723, _2735);
        float _2743 = precise::clamp(_2741, 0.0, 1.0);
        float _2745 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2747 = _2739 + _2745;
        float _2749 = _2721 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2751 = _2747 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2753 = precise::clamp(_2751, 0.0, 1.0);
        float _2755 = exp2(_2749);
        float _2757 = _2755 * _2753;
        float _2759 = _2743 * _2757;
        float _2761 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2763 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2765 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2761;
        out.m_92.y = _2763;
        out.m_92.z = _2765;
    }
    out.m_70.x = _2677;
    out.m_70.y = _2679;
    out.m_70.z = _2681;
    if (!_2663)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2767 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2767;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2519 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = in.m_46.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = _108;
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _131 = 0;
    if (!_121)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2835 = as_type<float>(_135);
        out.gl_Position.z = _2835;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _139 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_108);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = float(_113);
    bool _151 = _117 >= _149;
    bool _153 = !_147;
    bool _155 = _151 || _153;
    if (_155)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _125;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _137 = as_type<int>(_159);
    }
    int _161 = _137;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2890 = as_type<float>(_161);
        out.gl_Position.z = _2890;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = in.m_44.x;
    float _165 = in.m_44.y;
    float _167 = in.m_44.z;
    float _169 = in.m_53.x;
    float _171 = in.m_53.y;
    float _173 = in.m_53.z;
    float _175 = in.m_53.w;
    float _177 = in.m_55.x;
    float _179 = in.m_55.y;
    float _181 = in.m_55.z;
    float _183 = in.m_55.w;
    float _185 = in.m_57.y;
    float _187 = in.m_59.x;
    float _189 = in.m_59.y;
    float _191 = in.m_59.z;
    float _193 = in.m_59.w;
    float _195 = in.m_61.x;
    float _197 = in.m_61.y;
    float _199 = _165 * _171;
    float _201 = _165 * _179;
    float _203 = fma(_163, _169, _199);
    float _205 = fma(_163, _177, _201);
    float _207 = fma(_167, _173, _203);
    float _209 = _165 + _185;
    float _211 = fma(_167, _181, _205);
    float _213 = _207 + _175;
    float _215 = -_209;
    float _217 = _215 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _219 = _165 * _189;
    float _221 = _211 + _183;
    float _223 = -_213;
    float _225 = _223 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _227 = _217 * _217;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _231 = -_221;
    float _233 = _231 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _235 = _197 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _237 = fma(_225, _225, _227);
    float _239 = fma(_163, _187, _219);
    float _241 = fma(_233, _233, _237);
    float _243 = fma(_235, -2.0, _229);
    float _245 = in.m_61.z;
    float _247 = rsqrt(_241);
    float _249 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _251 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _253 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _255 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _257 = -_249;
    float _259 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _257);
    float _261 = -_251;
    float _263 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _261);
    float _265 = -_253;
    float _267 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _265);
    float _269 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _271 = -_255;
    float _273 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _271);
    float _275 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _277 = _195 * 2.0;
    float _279 = _197 * 2.0;
    float _281 = fma(_167, _191, _239);
    float _283 = _195 + _197;
    float _285 = floor(_277);
    float _287 = _225 * _247;
    float _289 = _233 * _247;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _293 = _287 * _287;
    float _295 = _283 + (-1.0);
    float _297 = -_291;
    float _299 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[77].x, _297);
    float _301 = floor(_279);
    float _303 = fma(_289, _289, _293);
    float _305 = _245 * 2.0;
    float _307 = _267 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _309 = -_269;
    float _311 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _309);
    float _313 = -_275;
    float _315 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _313);
    float _317 = _281 + _193;
    float _319 = _263 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _321 = rsqrt(_303);
    float _323 = _197 + _245;
    bool _325 = _285 > 0.0;
    float _327 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _329 = _317 + _327;
    bool _331 = _285 >= 0.0;
    bool _333 = isnan(_285);
    bool _335 = _331 || _333;
    bool _337 = isnan(0.0);
    bool _339 = _335 || _337;
    float _341 = _323 + (-1.0);
    float _343 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _345 = _329 * _329;
    float _347 = floor(_305);
    float _349 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _351 = _217 * _247;
    float _353 = _263 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _355 = -_307;
    float _357 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[1].x, _355);
    float _359 = _267 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _363 = _361 != 0;
    int _365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _367 = _365 != 0;
    int _369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _371 = _369 != 0;
    float _373 = -_353;
    float _375 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[1].y, _373);
    float _377 = _289 * _321;
    float _379 = _287 * _321;
    float _381 = fma(_311, (*spvDescriptorSet0.vp_c8)._m0[1].w, _357);
    float _383 = -_359;
    float _385 = fma(_263, (*spvDescriptorSet0.vp_c8)._m0[1].x, _383);
    float _387 = -_377;
    float _389 = _289 * _387;
    float _391 = fma(_273, (*spvDescriptorSet0.vp_c8)._m0[1].w, _375);
    float _393 = _381 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _395 = _311 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _397 = -_389;
    float _399 = fma(_287, _379, _397);
    float _401 = fma(_315, (*spvDescriptorSet0.vp_c8)._m0[1].w, _385);
    float _403 = _351 * _379;
    float _405 = -_393;
    float _407 = fma(_391, (*spvDescriptorSet0.vp_c8)._m0[0].x, _405);
    float _409 = _399 * _399;
    float _411 = -_395;
    float _413 = fma(_273, (*spvDescriptorSet0.vp_c8)._m0[1].x, _411);
    int _415 = _339 ? 0 : 1;
    float _417 = -_377;
    float _419 = _351 * _417;
    float _421 = fma(_403, _403, _409);
    float _423 = fma(_401, (*spvDescriptorSet0.vp_c8)._m0[0].z, _407);
    float _425 = fma(_315, (*spvDescriptorSet0.vp_c8)._m0[1].z, _413);
    bool _427 = _301 > 0.0;
    float _429 = fma(_419, _419, _421);
    bool _431 = _301 >= 0.0;
    bool _433 = isnan(_301);
    bool _435 = _431 || _433;
    bool _437 = isnan(0.0);
    bool _439 = _435 || _437;
    float _441 = -_425;
    float _443 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[0].w, _423);
    bool _445 = _347 >= 0.0;
    bool _447 = isnan(_347);
    bool _449 = _445 || _447;
    bool _451 = isnan(0.0);
    bool _453 = _449 || _451;
    float _455 = _267 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    bool _457 = !_367;
    int _459 = _457 ? 0 : 1;
    float _461 = _267 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _463 = !_363;
    int _465 = _463 ? 0 : 1;
    float _467 = -_319;
    float _469 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[0].y, _467);
    bool _471 = !_371;
    int _473 = _471 ? 0 : 1;
    float _475 = -_455;
    float _477 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[0].x, _475);
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _481 = _479 != 0;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _489 = _487 != 0;
    float _491 = -_461;
    float _493 = fma(_263, (*spvDescriptorSet0.vp_c8)._m0[0].x, _491);
    float _495 = rsqrt(_429);
    int _497 = ~_415;
    int _499 = _497 + 1;
    int _501 = _499 + 1;
    float _503 = fma(_273, (*spvDescriptorSet0.vp_c8)._m0[0].w, _469);
    bool _505 = !_485;
    int _507 = _505 ? 0 : 1;
    float _509 = fma(_311, (*spvDescriptorSet0.vp_c8)._m0[0].w, _477);
    int _511 = _501;
    if (!_325)
    {
        int _513 = ~_415;
        int _515 = _513 + 1;
        _511 = _515;
    }
    int _517 = _511;
    float _519 = fma(_315, (*spvDescriptorSet0.vp_c8)._m0[0].w, _493);
    int _521 = abs(_507);
    float _523 = 1.0 / _443;
    bool _525 = _347 > 0.0;
    float _527 = in.m_63.x;
    float _529 = in.m_63.y;
    float _531 = float(_517);
    float _533 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _243);
    float _535 = float(_521);
    int _537 = _453 ? 0 : 1;
    float _539 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _541 = log2(_539);
    float _543 = _399 * _495;
    float _545 = precise::clamp(_543, 0.0, 1.0);
    float _547 = _535 * _531;
    int _549 = ~_537;
    int _551 = _549 + 1;
    int _553 = _551 + 1;
    float _555 = -_545;
    float _557 = _555 + 1.0;
    int _559 = _553;
    if (!_525)
    {
        int _561 = ~_537;
        int _563 = _561 + 1;
        _559 = _563;
    }
    int _565 = _559;
    float _567 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _569 = int(_567);
    float _571 = fma(_509, _523, -1.0);
    float _573 = _557 * _523;
    float _575 = fma(_557, _571, 1.0);
    float _577 = _503 * _573;
    bool _579 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _581 = isnan(1.0);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _587 = _583 || _585;
    float _589 = _541 * _117;
    float _591 = _575 * _575;
    float _593 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _595 = int(_593);
    float _597 = _519 * _573;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _601 = 1.0 + _599;
    float _603 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _605 = _213 + _603;
    float _607 = fma(_577, _577, _591);
    float _609 = _527 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _611 = float(_569);
    float _613 = exp2(_589);
    float _615 = in.m_65.x;
    float _617 = in.m_65.y;
    float _619 = in.m_65.z;
    float _621 = fma(_605, _605, _345);
    float _623 = fma(_597, _597, _607);
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _627 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _629 = isnan(0.0);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _635 = _631 || _633;
    float _637 = _609 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _639 = 1.0 / _611;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _643 = float(_595);
    float _645 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[78].z, _625);
    float _647 = float(_565);
    float _649 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[78].w, _641);
    float _651 = -_117;
    float _653 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[76].x, _299);
    float _655 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _645);
    float _657 = 1.0 / _601;
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _661 = _221 + _659;
    float _663 = -_613;
    float _665 = _663 + 1.0;
    float _667 = _643 * _117;
    float _669 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _649);
    float _671 = fma(_661, _661, _621);
    bool _673 = !_481;
    int _675 = _673 ? 0 : 1;
    float _677 = _529 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _679 = rsqrt(_623);
    float _681 = _639 * _117;
    float _683 = _635 ? _665 : 0.0;
    float _685 = _677 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _687 = _439 ? 0 : 1;
    int _689 = abs(_675);
    float _691 = sqrt(_671);
    if (_587)
    {
        float _693 = _683 * _657;
        _127 = _693;
    }
    float _695 = _127;
    float _697 = _547 * (-2.0);
    int _699 = ~_687;
    int _701 = _699 + 1;
    int _703 = _701 + 1;
    int _705 = _703;
    if (!_427)
    {
        int _707 = ~_687;
        int _709 = _707 + 1;
        _705 = _709;
    }
    int _711 = _705;
    float _713 = fma(_349, _697, _349);
    float _715 = fma(_697, _617, _617);
    float _717 = _597 * _679;
    float _719 = _637 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _721 = _575 * _679;
    float _723 = _577 * _679;
    float _725 = -_717;
    float _727 = _287 * _725;
    float _729 = float(_689);
    float _731 = float(_711);
    float _733 = _691 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _735 = _289 * _721;
    float _737 = _729 * _647;
    float _739 = rsqrt(_671);
    float _741 = precise::min(_719, _733);
    float _743 = -_723;
    float _745 = -_727;
    float _747 = fma(_289, _743, _745);
    float _749 = -_723;
    float _751 = _351 * _749;
    float _753 = -_717;
    float _755 = -_735;
    float _757 = fma(_351, _753, _755);
    float _759 = _737 * (-2.0);
    float _761 = _747 * _747;
    float _763 = -_751;
    float _765 = fma(_287, _721, _763);
    float _767 = _195 + (-0.5);
    float _769 = fma(_759, _615, _615);
    float _771 = fma(_757, _757, _761);
    float _773 = _197 + (-0.5);
    float _775 = fma(_343, _759, _343);
    float _777 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[196].x, _769);
    float _779 = fma(_765, _765, _771);
    float _781 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[196].y, _715);
    bool _783 = !_489;
    int _785 = _783 ? 0 : 1;
    float _787 = _739 * _741;
    float _789 = rsqrt(_779);
    float _791 = fma(_775, _695, _777);
    int _793 = abs(_785);
    float _795 = _329 * _787;
    float _797 = _605 * _787;
    float _799 = _661 * _787;
    float _801 = float(_793);
    float _803 = -_795;
    float _805 = _329 + _803;
    float _807 = -_797;
    float _809 = _605 + _807;
    float _811 = -_799;
    float _813 = _661 + _811;
    float _815 = _791 * 0.15915493667125701904296875;
    float _817 = _801 * _731;
    float _819 = _805 * _805;
    float _821 = fma(_713, _695, _781);
    float _823 = _815 * 6.283185482025146484375;
    float _825 = sin(_823);
    float _827 = _817 * (-2.0);
    float _829 = _757 * _789;
    float _831 = _765 * _789;
    float _833 = _747 * _789;
    float _835 = fma(_809, _809, _819);
    float _837 = _289 * _829;
    float _839 = _351 * _831;
    float _841 = _287 * _833;
    float _843 = fma(_813, _813, _835);
    float _845 = -_837;
    float _847 = fma(_287, _831, _845);
    float _849 = -_839;
    float _851 = fma(_289, _833, _849);
    float _853 = -_841;
    float _855 = fma(_351, _829, _853);
    float _857 = _195 + _245;
    float _859 = _847 * _847;
    float _861 = _815 * 6.283185482025146484375;
    float _863 = cos(_861);
    float _865 = _821 * 0.15915493667125701904296875;
    float _867 = _857 + (-1.0);
    float _869 = fma(_851, _851, _859);
    float _871 = as_type<float>(int(gl_VertexIndex));
    float _873 = _245 + (-0.5);
    float _875 = fma(_855, _855, _869);
    float _877 = sqrt(_843);
    float _879 = fma(_827, _619, _619);
    float _881 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _883 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[196].z, _879);
    float _885 = rsqrt(_875);
    float _887 = fma(_881, _827, _881);
    float _889 = fma(_887, _695, _883);
    float _891 = _739 * _877;
    float _893 = _865 * 6.283185482025146484375;
    float _895 = sin(_893);
    float _897 = _889 * 0.15915493667125701904296875;
    int _899 = as_type<int>(_871) & 1;
    bool _901 = _899 != 0;
    int _903 = as_type<int>(_871) & 2;
    bool _905 = _903 != 0;
    float _907 = _685 * _891;
    float _909 = _637 * _891;
    float _911 = _855 * _885;
    float _913 = _851 * _885;
    float _915 = _847 * _885;
    float _917 = _897 * 6.283185482025146484375;
    float _919 = sin(_917);
    float _921 = _287 * _911;
    bool _923 = !_905;
    float _925 = _923 ? (-0.5) : 0.5;
    float _927 = _289 * _915;
    bool _929 = !_901;
    float _931 = _929 ? (-0.5) : 0.5;
    float _933 = -_921;
    float _935 = fma(_289, _913, _933);
    float _937 = _351 * _913;
    float _939 = -_927;
    float _941 = fma(_351, _911, _939);
    float _943 = _897 * 6.283185482025146484375;
    float _945 = cos(_943);
    float _947 = _935 * _935;
    float _949 = -_937;
    float _951 = fma(_287, _915, _949);
    float _953 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _925);
    float _955 = -_799;
    float _957 = _221 + _955;
    float _959 = fma(_941, _941, _947);
    float _961 = _907 * _953;
    float _963 = _865 * 6.283185482025146484375;
    float _965 = cos(_963);
    float _967 = fma(_951, _951, _959);
    float _969 = _825 * _919;
    float _971 = _863 * _919;
    float _973 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _931);
    float _975 = _863 * _945;
    float _977 = rsqrt(_967);
    float _979 = _825 * _945;
    float _981 = fma(_895, _969, _975);
    float _983 = -_971;
    float _985 = fma(_895, _979, _983);
    float _987 = _965 * _945;
    float _989 = _825 * _965;
    float _991 = _909 * _973;
    float _993 = _965 * _919;
    float _995 = _981 * _961;
    float _997 = _985 * _961;
    float _999 = _989 * _961;
    float _1001 = fma(_993, _991, _995);
    float _1003 = fma(_987, _991, _997);
    float _1005 = -_895;
    float _1007 = fma(_1005, _991, _999);
    float _1009 = _951 * _977;
    float _1011 = _1001 * _911;
    float _1013 = -_795;
    float _1015 = _1013 + _209;
    float _1017 = _1001 * _913;
    float _1019 = _941 * _977;
    float _1021 = fma(_1003, _1009, _1011);
    float _1023 = -_797;
    float _1025 = _213 + _1023;
    float _1027 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1029 = fma(_1003, _1019, _1017);
    float _1031 = fma(_289, _1007, _1021);
    float _1033 = _1015 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1035 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1027);
    float _1037 = fma(_287, _1007, _1029);
    float _1039 = _221 + _1031;
    float _1041 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1033);
    float _1043 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1035);
    float _1045 = _213 + _1037;
    float _1047 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1049 = _1039 + _1047;
    float _1051 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1041);
    float _1053 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1055 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1057 = _1045 + _1055;
    float _1059 = _1049 * _1049;
    float _1061 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1063 = 1.0 / _1053;
    float _1065 = _935 * _977;
    float _1067 = fma(_1057, _1057, _1059);
    float _1069 = _1061 + _1053;
    float _1071 = _1001 * _915;
    float _1073 = sqrt(_1067);
    float _1075 = fma(_1003, _1065, _1071);
    bool _1077 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan(0.5);
    bool _1085 = _1081 || _1083;
    float _1087 = fma(_351, _1007, _1075);
    bool _1089 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1093 = _1089 || _1091;
    bool _1095 = isnan(0.5);
    bool _1097 = _1093 || _1095;
    float _1099 = _1069 * _1063;
    float _1101 = _1099 * 0.5;
    float _1103 = _209 + _1087;
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1107 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1105);
    bool _1109 = _1073 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1111 = 1.0 / _1107;
    float _1113 = _1007;
    float _1115 = _1087;
    float _1117 = _1039;
    float _1119 = _1073;
    float _1121 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1123 = _1063;
    float _1125 = _957;
    float _1127 = _1015;
    if (!_1109)
    {
        _1113 = _1045;
    }
    float _1129 = _1113;
    float _1131 = _1129;
    if (!_1109)
    {
        _1115 = _1103;
    }
    float _1133 = _1115;
    bool _1135 = !_1109;
    float _1137 = _1133;
    if (!_1135)
    {
        float _1139 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1141 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1143 = _1073 + _1141;
        float _1145 = _1103 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1147 = rsqrt(_1067);
        float _1149 = _1143 * _1139;
        float _1151 = _1149 * 0.15915493667125701904296875;
        float _1153 = _1151 * 6.283185482025146484375;
        float _1155 = cos(_1153);
        float _1157 = _1151 * 6.283185482025146484375;
        float _1159 = sin(_1157);
        float _1161 = _1155 + (-1.0);
        float _1163 = _1161 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1165 = fma(_1159, _1145, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1167 = fma(_1103, _1155, _1163);
        float _1169 = _1147 * _1165;
        float _1171 = fma(_1057, _1169, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1173 = fma(_1049, _1169, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1131 = _1171;
        _1137 = _1167;
        _1117 = _1173;
        _1119 = _1151;
    }
    float _1175 = _1131;
    float _1177 = _1137;
    float _1179 = _1117;
    float _1181 = _1119;
    float _1183 = -_797;
    float _1185 = _1183 + _1175;
    float _1187 = -_795;
    float _1189 = _1187 + _1177;
    float _1191 = -_799;
    float _1193 = _1191 + _1179;
    float _1195 = _1181;
    float _1197 = _1189;
    float _1199 = _1185;
    float _1201 = _1193;
    if (_1097)
    {
        _1195 = 1.0;
    }
    float _1203 = _1195;
    float _1205 = _1203;
    if (!_1085)
    {
        float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1209 = _1015 + _1207;
        float _1211 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1213 = _1025 + _1211;
        float _1215 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1217 = -_213;
        float _1219 = _1217 + _1175;
        float _1221 = _1209 * _1209;
        float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1225 = _957 + _1223;
        float _1227 = -_209;
        float _1229 = _1227 + _1177;
        float _1231 = -_221;
        float _1233 = _1231 + _1179;
        float _1235 = fma(_1213, _1213, _1221);
        float _1237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1239 = fma(_1225, _1225, _1235);
        float _1241 = sqrt(_1239);
        float _1243 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1245 = precise::min(_1241, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1247 = _1245 * _1237;
        float _1249 = _1243 * _1247;
        float _1251 = fma(_1219, _1249, _1025);
        float _1253 = fma(_1229, _1249, _1015);
        float _1255 = fma(_1233, _1249, _957);
        _1197 = _1253;
        _1199 = _1251;
        _1201 = _1255;
    }
    float _1257 = _1197;
    float _1259 = _1199;
    float _1261 = _1201;
    if (_1097)
    {
        _1121 = 1.0;
    }
    float _1263 = _1121;
    float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1267 = _1111 * _1265;
    float _1269 = _1267;
    float _1271 = _1263;
    if (!_1097)
    {
        float _1273 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1277 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1275;
        float _1279 = _1273 * 0.15915493667125701904296875;
        float _1281 = _1279 * 6.283185482025146484375;
        float _1283 = cos(_1281);
        float _1285 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1287 = _1285 * 0.15915493667125701904296875;
        float _1289 = _1279 * 6.283185482025146484375;
        float _1291 = sin(_1289);
        float _1293 = 1.0 / _1283;
        float _1295 = _1287 * 6.283185482025146484375;
        float _1297 = cos(_1295);
        float _1299 = _1291 * _1293;
        float _1301 = _1287 * 6.283185482025146484375;
        float _1303 = sin(_1301);
        float _1305 = _1297 * _1299;
        float _1307 = 1.0 / _1277;
        float _1309 = 1.0 / _1305;
        float _1311 = _1303 * _1309;
        float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1315 = fma(_1267, _1311, _1313);
        float _1317 = _1315 * _1307;
        float _1319 = precise::clamp(_1317, 0.0, 1.0);
        _1205 = _1319;
    }
    float _1321 = _1205;
    if (!_1097)
    {
        float _1323 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1325 = _1323 * 0.15915493667125701904296875;
        float _1327 = _1325 * 6.283185482025146484375;
        float _1329 = cos(_1327);
        float _1331 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1333 = _1331 * 0.15915493667125701904296875;
        float _1335 = _1325 * 6.283185482025146484375;
        float _1337 = sin(_1335);
        float _1339 = 1.0 / _1329;
        float _1341 = _1333 * 6.283185482025146484375;
        float _1343 = cos(_1341);
        float _1345 = _1337 * _1339;
        float _1347 = _1333 * 6.283185482025146484375;
        float _1349 = sin(_1347);
        float _1351 = _1343 * _1345;
        float _1353 = 1.0 / _1351;
        float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1357 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1355;
        float _1359 = 1.0 / _1357;
        float _1361 = _1349 * _1353;
        float _1363 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1365 = fma(_1267, _1361, _1363);
        float _1367 = _1365 * _1359;
        float _1369 = precise::clamp(_1367, 0.0, 1.0);
        float _1371 = -_1369;
        float _1373 = _1371 + 1.0;
        _1269 = _1369;
        _1271 = _1373;
    }
    float _1375 = _1269;
    float _1377 = _1271;
    float _1379 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1381 = _1257 + _1379;
    float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1385 = _1259 + _1383;
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1389 = _1261 + _1387;
    float _1391 = _1381 * _1381;
    float _1393 = fma(_1385, _1385, _1391);
    float _1395 = fma(_1389, _1389, _1393);
    float _1397 = rsqrt(_1395);
    float _1399 = sqrt(_1395);
    float _1401 = _1397 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1403 = _1385 * _1401;
    float _1405 = _1389 * _1401;
    float _1407 = _1403 * _1403;
    float _1409 = _1405 * _1405;
    float _1411 = _1407 + _1409;
    float _1413 = sqrt(_1411);
    bool _1415 = _1413 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1417 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1419 = _1413 + _1417;
    float _1421 = _1389;
    float _1423 = _1397;
    float _1425 = _1419;
    float _1427 = _1375;
    float _1429 = _1381;
    if (_1415)
    {
        float _1431 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1421 = _1431;
    }
    float _1433 = _1421;
    if (_1415)
    {
        float _1435 = rsqrt(_1411);
        _1423 = _1435;
    }
    float _1437 = _1423;
    float _1439 = _1437;
    if (_1415)
    {
        float _1441 = _1419 * _1433;
        _1425 = _1441;
    }
    float _1443 = _1425;
    if (_1415)
    {
        float _1445 = _1443 * 0.15915493667125701904296875;
        _1427 = _1445;
    }
    float _1447 = _1427;
    float _1449 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1451 = _1433;
    float _1453 = _1447;
    if (_1415)
    {
        float _1455 = _1447 * 6.283185482025146484375;
        float _1457 = sin(_1455);
        _1451 = _1457;
    }
    float _1459 = _1451;
    float _1461 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1463 = precise::max(0.0, _1461);
    float _1465 = _1391;
    float _1467 = _1463;
    if (_1415)
    {
        float _1469 = _1447 * 6.283185482025146484375;
        float _1471 = cos(_1469);
        _1465 = _1471;
    }
    float _1473 = _1465;
    float _1475 = -_1401;
    float _1477 = -_1463;
    float _1479 = fma(_1381, _1475, _1477);
    if (_1415)
    {
        float _1481 = _1479 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1467 = _1481;
    }
    float _1483 = _1467;
    float _1485 = _1459;
    float _1487 = _1483;
    if (_1415)
    {
        float _1489 = fma(_1459, _1483, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1429 = _1489;
    }
    float _1491 = _1429;
    float _1493 = _1491;
    if (!_1415)
    {
        _1485 = _1403;
    }
    float _1495 = _1485;
    float _1497 = _1495;
    float _1499 = _1473;
    if (_1415)
    {
        float _1501 = _1473 + (-1.0);
        _1487 = _1501;
    }
    float _1503 = _1487;
    float _1505 = _1503;
    if (_1415)
    {
        float _1507 = _1437 * _1491;
        _1123 = _1507;
    }
    float _1509 = _1123;
    if (!_1415)
    {
        _1493 = _1479;
    }
    float _1511 = _1493;
    float _1513 = _1511;
    if (_1415)
    {
        float _1515 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1453 = _1515;
    }
    float _1517 = _1453;
    if (_1415)
    {
        float _1519 = _1403 * _1509;
        _1497 = _1519;
    }
    float _1521 = _1497;
    if (!_1415)
    {
        _1505 = _1405;
    }
    float _1523 = _1505;
    float _1525 = _1523;
    if (_1415)
    {
        float _1527 = _1405 * _1509;
        _1525 = _1527;
    }
    float _1529 = _1525;
    if (!_1415)
    {
        _1439 = _1407;
    }
    float _1531 = _1439;
    float _1533 = _1531;
    if (_1415)
    {
        float _1535 = fma(_1479, _1473, _1517);
        _1513 = _1535;
    }
    float _1537 = _1513;
    if (_1415)
    {
        float _1539 = _1521 * _1521;
        _1533 = _1539;
    }
    float _1541 = _1533;
    if (!_1415)
    {
        _1499 = _1409;
    }
    float _1543 = _1499;
    float _1545 = _1543;
    if (_1415)
    {
        float _1547 = _1529 * _1529;
        _1545 = _1547;
    }
    float _1549 = _1545;
    float _1551 = fma(_1537, _1537, _1541);
    float _1553 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1555 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1557 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1559 = _1551 + _1549;
    float _1561 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1563 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1553);
    float _1565 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1555);
    float _1567 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1569 = fma(_1399, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1567);
    float _1571 = precise::clamp(_1569, 0.0, 1.0);
    float _1573 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1561);
    float _1575 = rsqrt(_1559);
    float _1577 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1563);
    float _1579 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1565);
    float _1581 = -_1571;
    float _1583 = _1581 + 1.0;
    float _1585 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1573);
    float _1587 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1589 = _1579 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1591 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1557);
    float _1593 = _1585 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1595 = abs(_1583);
    float _1597 = log2(_1595);
    float _1599 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1601 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1603 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1591);
    float _1605 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1607 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1599);
    float _1609 = -_1601;
    float _1611 = fma(_1609, _1449, 1.0);
    float _1613 = _1575 * _1521;
    float _1615 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1617 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1607);
    float _1619 = _1575 * _1537;
    float _1621 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1623 = _1575 * _1529;
    float _1625 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1617);
    float _1627 = log2(_1611);
    float _1629 = -_1621;
    float _1631 = fma(_1619, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1629);
    float _1633 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1635 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1605);
    float _1637 = -_1623;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1631);
    float _1641 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1643 = _1619 + 1.0;
    float _1645 = exp2(_1633);
    float _1647 = fma(_1639, -0.5, 0.5);
    float _1649 = fma(_1639, 0.5, 0.5);
    float _1651 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1641);
    float _1653 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1635);
    float _1655 = fma(_1649, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1657 = 1.0 / _1625;
    float _1659 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1651);
    float _1661 = fma(_1649, _1655, -0.212114393711090087890625);
    float _1663 = fma(_1649, _1661, 1.570728778839111328125);
    float _1665 = sqrt(_1647);
    float _1667 = -_1619;
    float _1669 = fma(_1645, _1643, _1667);
    float _1671 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1659);
    float _1673 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1653);
    float _1675 = _1627 * 0.693147182464599609375;
    float _1677 = fma(_1669, 0.5, 0.5);
    float _1679 = _1671 * _1657;
    float _1681 = _1673 * _1657;
    float _1683 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1685 = _1665 * 0.636619746685028076171875;
    float _1687 = fma(_1679, 0.5, 0.5);
    float _1689 = fma(_1681, -0.5, 0.5);
    float _1691 = -_1663;
    float _1693 = fma(_1685, _1691, 1.0);
    float3 _5234 = float3(_1687, _1689, _1683);
    float _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5234, float3(0.0), isnan(_5234)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5234, float3(0.0), isnan(_5234)), level(0.0)).x;
    float3 _5245 = float3(_1687, _1689, _1683);
    float4 _1698 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5245, float3(0.0), isnan(_5245)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5245, float3(0.0), isnan(_5245)), level(0.0)).xyzw;
    float _1700 = _1698.x;
    float _1702 = _1698.y;
    float _1704 = _1698.z;
    float _1706 = _1698.w;
    float2 _5262 = float2(_1693, _1677);
    float3 _1710 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5262, float2(0.0), isnan(_5262)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5262, float2(0.0), isnan(_5262)), level(0.0)).xyz;
    float _1712 = _1710.x;
    float _1714 = _1710.y;
    float _1716 = _1710.z;
    float _1718 = float(uint(_595));
    float _1720 = trunc(_681);
    int _1722 = int(_1720);
    int _1724 = ~_595;
    int _1726 = _1724 + 1;
    float _1728 = -_655;
    float _1730 = _1728 + 1.0;
    int _1732 = abs(_465);
    float _1734 = -_669;
    float _1736 = _1734 + 1.0;
    bool _1738 = _195 > 0.5;
    float _1740 = _863 * _965;
    bool _1742 = _197 > 0.5;
    float _1744 = 1.0 / _1718;
    float _1746 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1748 = -_979;
    float _1750 = fma(_895, _971, _1748);
    int _1752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1754 = _1752 != 0;
    float _1756 = fma(_895, _975, _969);
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1760 = float(uint(_1722));
    float _1762 = exp2(_1746);
    bool _1764 = !_1754;
    float _1766 = _1764 ? 7.345489978790283203125 : 1.0;
    float _1768 = _1758 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_70.w = _741;
    int _1770 = as_type<int>(_1744) + (-2);
    float _1772 = _1766 * _195;
    out.m_72.x = _909;
    float _1774 = as_type<float>(_1770) * _1760;
    float _1776 = floor(_1772);
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1780 = _1750 * _913;
    out.m_74.x = _1259;
    out.m_74.y = _1257;
    out.m_74.z = _1261;
    float _1782 = -_1762;
    float _1784 = _1782 + 1.0;
    float _1786 = _1778 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1788 = fma(_1756, _1019, _1780);
    out.m_76.x = _1025;
    out.m_76.y = _1015;
    out.m_76.z = _957;
    float _1790 = trunc(_1774);
    float _1792 = precise::max(_1790, 0.0);
    uint _1795 = uint(_1792);
    float _1797 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1799 = fma(_1740, _287, _1788);
    float _1801 = -_1776;
    float _1803 = _1772 + _1801;
    float _1805 = _1321 * _1377;
    int _1807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1809 = _1807 != 0;
    int _1811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1813 = _1811 != 0;
    int _1815 = _1726 * int(_1795);
    int _1817 = _1815 + _1722;
    int _1819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1821 = _1819 != 0;
    float _1823 = float(uint(_1817));
    float _1825 = as_type<float>(_1770) * _1823;
    float _1827 = float(_1722);
    float _1829 = trunc(_1825);
    float _1831 = precise::max(_1829, 0.0);
    uint _1833 = uint(_1831);
    bool _1835 = _1827 >= _643;
    bool _1837 = isnan(_1827);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(_643);
    bool _1843 = _1839 || _1841;
    float _1845 = float(_1843);
    float _1847 = trunc(_1845);
    int _1849 = int(_1847);
    int _1851 = int(_1795) + int(_1833);
    float _1853 = 1.0 / _149;
    int _1855 = _1726 * _1851;
    int _1857 = _1855 + _1722;
    bool _1859 = uint(_1857) >= uint(_595);
    bool _1861 = !_1859;
    int _1863 = _1861 ? 0 : (-1);
    bool _1865 = _595 == 0;
    int _1867 = ~_1851;
    int _1869 = _1867 + _1863;
    int _1871 = _1869 + 1;
    float _1873 = _1803 * _643;
    float _1875 = _667 * _1853;
    int _1877 = _595 + (-1);
    int _1879 = _595 * _1871;
    int _1881 = _1879 + _1722;
    int _1883 = ~_1849;
    int _1885 = _1883 + 1;
    int _1887 = _1885 + 1;
    float _1889 = trunc(_1873);
    int _1891 = int(_1889);
    bool _1893 = !_1865;
    int _1895 = _1893 ? _1881 : (-1);
    bool _1897 = !_1809;
    int _1899 = _1897 ? 0 : 1;
    int _1901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1903 = _1901 != 0;
    float _1905 = trunc(_1875);
    int _1907 = int(_1905);
    int _1909 = _1895 * _1887;
    int _1911 = abs(_459);
    int _1913 = abs(_1899);
    int _1915 = _1849 * _1877;
    int _1917 = _1915 + _1909;
    int _1919 = abs(_473);
    int _1921 = _1891 * _1913;
    int _1923 = _1921 + _1722;
    int _1925 = _1917 * _1911;
    bool _1927 = !_1903;
    int _1929 = _1927 ? 0 : 1;
    int _1931 = _1907 * _1732;
    int _1933 = _1931 + _1925;
    int _1935 = abs(_1929);
    int _1937 = ~_595;
    int _1939 = _1937 + 1;
    int _1941 = _1923 * _1919;
    int _1943 = _1941 + _1933;
    float _1945 = -_931;
    int _1947 = _1738 ? as_type<int>(_1945) : as_type<int>(_931);
    int _1949 = ~_595;
    int _1951 = _1949 + 1;
    int _1953 = _1891 * _1935;
    int _1955 = _1953 + _1943;
    int _1957 = ~_595;
    int _1959 = _1957 + 1;
    bool _1961 = !_1813;
    float _1963 = _1961 ? _931 : as_type<float>(_1947);
    float _1965 = _931 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1967 = float(uint(_1955));
    float _1969 = _1963 + 0.5;
    float _1971 = as_type<float>(_1770) * _1967;
    float _1973 = fma(_1969, (*spvDescriptorSet0.vp_c9)._m0[80].x, _653);
    float _1975 = trunc(_1971);
    float _1977 = precise::max(_1975, 0.0);
    uint _1979 = uint(_1977);
    float _1981 = -_1730;
    float _1983 = fma(_1963, _1981, _1973);
    int _1985 = _1959 * int(_1979);
    int _1987 = _1985 + _1955;
    float _1989 = float(uint(_1987));
    float _1991 = as_type<float>(_1770) * _1989;
    float _1993 = trunc(_1991);
    float _1995 = precise::max(_1993, 0.0);
    uint _1997 = uint(_1995);
    int _1999 = int(_1979) + int(_1997);
    float _2001 = float(uint(_1923));
    int _2003 = _1939 * _1999;
    int _2005 = _2003 + _1955;
    float _2007 = as_type<float>(_1770) * _2001;
    bool _2009 = uint(_2005) >= uint(_595);
    float _2011 = trunc(_2007);
    float _2013 = precise::max(_2011, 0.0);
    uint _2015 = uint(_2013);
    bool _2017 = !_2009;
    int _2019 = _2017 ? 0 : (-1);
    int _2021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2023 = _2021 != 0;
    int _2025 = ~_1999;
    int _2027 = _2025 + _2019;
    int _2029 = _2027 + 1;
    int _2031 = _595 * _2029;
    int _2033 = _2031 + _1955;
    float _2035 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2037 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2039 = -_925;
    int _2041 = _1742 ? as_type<int>(_2039) : as_type<int>(_925);
    bool _2043 = !_1865;
    int _2045 = _2043 ? _2033 : (-1);
    float _2047 = _2035 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2049 = !_1821;
    float _2051 = _2049 ? _925 : as_type<float>(_2041);
    float _2053 = _925 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2055 = _2045 >> 31;
    float _2057 = _2051 + (-0.5);
    int _2059 = _2055 & 3;
    out.m_78.x = _1786;
    out.m_78.y = _1768;
    out.m_78.z = _2047;
    out.m_78.w = _2037;
    int _2061 = _2045 & 3;
    bool _2063 = _2061 != 0;
    int _2065 = _1951 * int(_2015);
    int _2067 = _2065 + _1923;
    int _2069 = _2045 + _2059;
    float _2071 = -_2057;
    float _2073 = -_533;
    float _2075 = fma(_2071, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2073);
    int _2077 = _2069 >> 2;
    float _2079 = fma(_2051, _1736, _2075);
    float _2081 = float(uint(_2067));
    int _2083 = _2077 << 4;
    int _2085 = _2083 + 368;
    float _2087 = as_type<float>(_1770) * _2081;
    uint _2089 = uint(int(uint(_2085) >> uint(2)));
    uint _2091 = uint(int(uint(int(_2089)) >> uint(2)));
    int _2093 = int(_2089) & 3;
    float _2095 = (*spvDescriptorSet0.vp_c9)._m0[int(_2091)][_2093];
    int _2097 = int(_2089) + 1;
    uint _2099 = uint(int(uint(_2097) >> uint(2)));
    int _2101 = _2097 & 3;
    float _2103 = (*spvDescriptorSet0.vp_c9)._m0[int(_2099)][_2101];
    int _2105 = _2045 & 3;
    bool _2107 = _2105 != 0;
    out.m_80.x = _1983;
    out.m_80.y = _2079;
    float _2109 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2111 = trunc(_2087);
    float _2113 = precise::max(_2111, 0.0);
    uint _2115 = uint(_2113);
    int _2117 = _2085 + 8;
    uint _2119 = uint(int(uint(_2117) >> uint(2)));
    uint _2121 = uint(int(uint(int(_2119)) >> uint(2)));
    int _2123 = int(_2119) & 3;
    float _2125 = (*spvDescriptorSet0.vp_c9)._m0[int(_2121)][_2123];
    int _2127 = int(_2119) + 1;
    uint _2129 = uint(int(uint(_2127) >> uint(2)));
    int _2131 = _2127 & 3;
    float _2133 = (*spvDescriptorSet0.vp_c9)._m0[int(_2129)][_2131];
    bool _2135 = uint(_2105) > 1u;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2141 = _2109 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2143 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2145 = _2063 ? 0 : 1;
    float _2147 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2149 = _2139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2151 = ~_595;
    int _2153 = _2151 + 1;
    float _2155 = _981 * _911;
    bool _2157 = _2105 != 3;
    int _2159 = int(_2015) + int(_2115);
    out.m_82.x = _2141;
    out.m_82.y = _2143;
    out.m_82.z = _2149;
    out.m_82.w = _2147;
    int _2161 = ~_2145;
    int _2163 = _2161 + 1;
    int _2165 = _2163 + 1;
    int _2167 = _2165;
    float _2169 = _1671;
    float _2171 = _1805;
    if (!_2135)
    {
        int _2173 = ~_2145;
        int _2175 = _2173 + 1;
        _2167 = _2175;
    }
    int _2177 = _2167;
    bool _2179 = uint(_2105) >= 2u;
    int _2181 = abs(_2177);
    int _2183 = _2153 * _2159;
    int _2185 = _2183 + _1923;
    bool _2187 = !_2107;
    int _2189 = _2187 ? 0 : 1;
    int _2191 = _2179 ? 0 : 1;
    bool _2193 = uint(_2185) >= uint(_595);
    int _2195 = abs(_2189);
    int _2197 = ~_2191;
    int _2199 = _2197 + 1;
    int _2201 = _2199 + 1;
    int _2203 = _2201;
    if (_2157)
    {
        int _2205 = ~_2191;
        int _2207 = _2205 + 1;
        _2203 = _2207;
    }
    int _2209 = _2203;
    bool _2211 = !_2193;
    int _2213 = _2211 ? 0 : (-1);
    int _2215 = ~_2181;
    int _2217 = _2215 + 1;
    int _2219 = _2217 + 1;
    int _2221 = ~_2159;
    int _2223 = _2221 + _2213;
    int _2225 = _2223 + 1;
    int _2227 = ~_2195;
    int _2229 = _2227 + 1;
    int _2231 = _2229 + 1;
    int _2233 = _2219 * as_type<int>(_2103);
    bool _2235 = _2105 != 3;
    int _2237 = _595 * _2225;
    int _2239 = _2237 + _1923;
    int _2241 = abs(_2209);
    int _2243 = _2231 * as_type<int>(_2095);
    int _2245 = _2243 + _2233;
    bool _2247 = !_2235;
    int _2249 = _2247 ? 0 : (-1);
    float _2251 = _993 * _913;
    bool _2253 = !_2023;
    int _2255 = _2253 ? 0 : 1;
    float _2257 = fma(_987, _1019, _2251);
    int _2259 = abs(_2249);
    float _2261 = _981 * _913;
    int _2263 = abs(_2255);
    int _2265 = ~_2241;
    int _2267 = _2265 + 1;
    int _2269 = _2267 + 1;
    float _2271 = _993 * _915;
    bool _2273 = !_1865;
    int _2275 = _2273 ? _2239 : (-1);
    int _2277 = _2269 * as_type<int>(_2125);
    int _2279 = _2277 + _2245;
    int _2281 = ~_2259;
    int _2283 = _2281 + 1;
    int _2285 = _2283 + 1;
    float _2287 = _981 * _915;
    float _2289 = _993 * _911;
    float _2291 = _1750 * _911;
    float _2293 = _1750 * _915;
    int _2295 = _2285 * as_type<int>(_2133);
    int _2297 = _2295 + _2279;
    float _2299 = fma(_985, _1019, _2261);
    float _2301 = fma(_985, _1065, _2287);
    float _2303 = fma(_985, _1009, _2155);
    float _2305 = fma(_987, _1065, _2271);
    float _2307 = fma(_987, _1009, _2289);
    float _2309 = fma(_1756, _1009, _2291);
    float _2311 = fma(_989, _287, _2299);
    float _2313 = fma(_989, _351, _2301);
    float _2315 = fma(_989, _289, _2303);
    float _2317 = -_895;
    float _2319 = fma(_2317, _351, _2305);
    float _2321 = -_895;
    float _2323 = fma(_2321, _289, _2307);
    float _2325 = _1587 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2327 = fma(_1740, _289, _2309);
    float _2329 = _2053 * _2311;
    float _2331 = _2053 * _2313;
    float _2333 = _2053 * _2315;
    int _2335 = ~_2263;
    int _2337 = _2335 + 1;
    int _2339 = _2337 + 1;
    float _2341 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2325);
    float _2343 = fma(_1756, _1065, _2293);
    float _2345 = fma(_1965, _2323, _2333);
    float _2347 = _1625 * 0.5;
    float _2349 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2341);
    int _2351 = _2297 * _2339;
    float _2353 = -_895;
    float _2355 = fma(_2353, _287, _2257);
    float _2357 = fma(_1740, _351, _2343);
    float _2359 = fma(_1673, -0.5, _2347);
    float _2361 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2349);
    float _2363 = _1797 * _1695;
    int _2365 = _2275 * _2263;
    int _2367 = _2365 + _2351;
    float _2369 = fma(_1965, _2355, _2329);
    float _2371 = fma(_1965, _2319, _2331);
    float _2373 = _2361 + _1625;
    float _2375 = _1671 + _1625;
    float _2377 = _1706 * _2363;
    float _2379 = -_1797;
    float _2381 = _2379 + 1.0;
    float _2383 = _1716 * _2363;
    float _2385 = float(_2367);
    float _2387 = _2357 + _2371;
    float _2389 = _2373 * 0.5;
    float _2391 = _2375 * 0.5;
    float _2393 = _1799 + _2369;
    float _2395 = _2327 + _2345;
    float _2397 = fma(_1712, _2377, _1700);
    float _2399 = fma(_1714, _2377, _1702);
    float _2401 = _1706 * _2381;
    float _2403 = fma(_1706, _2383, _1704);
    out.m_84.x = _2391;
    out.m_84.y = _2359;
    out.m_84.z = _2389;
    out.m_84.w = _1625;
    bool _2405 = _1399 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2407 = isnan(_1399);
    bool _2409 = _2405 || _2407;
    bool _2411 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2413 = _2409 || _2411;
    out.m_86.x = _2397;
    out.m_86.y = _2399;
    out.m_86.z = _2403;
    out.m_86.w = _2401;
    out.m_88.x = _2393;
    out.m_88.y = _2387;
    out.m_88.z = _2395;
    out.gl_Position.x = _1671;
    out.gl_Position.y = _1673;
    out.gl_Position.z = _2361;
    out.gl_Position.w = _1625;
    float _2415 = _2377;
    float _2417 = _2385;
    if (!_2413)
    {
        _2415 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2419 = _2415;
    out.m_90.x = _2385;
    float _2421 = _2419;
    float _2423 = _2419;
    if (!_2413)
    {
        _1125 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2425 = _1125;
    float _2427 = _2425;
    float _2429 = _2425;
    if (!_2413)
    {
        _1127 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2431 = _1127;
    float _2433 = _2431;
    float _2435 = _2431;
    if (!_2413)
    {
        _2417 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2437 = _2417;
    float _2439 = _1805 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2441 = _2437;
    float _2443 = _2437;
    if (!_2413)
    {
        _2169 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2445 = _2169;
    float _2447 = _2445;
    float _2449 = _2445;
    if (!_2413)
    {
        _2171 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2451 = _2171;
    bool _2453 = !_2413;
    float _2455 = _2451;
    float _2457 = _2451;
    if (!_2453)
    {
        bool _2459 = _1399 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2461 = isnan(_1399);
        bool _2463 = _2459 || _2461;
        bool _2465 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2467 = _2463 || _2465;
        if (!_2467)
        {
            float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2471 = _1399 + _2469;
            float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2475 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2473;
            float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2481 = 1.0 / _2475;
            float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2485 = _2483 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2493 = _2491 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2499 = _2471 * _2481;
            float _2501 = precise::clamp(_2499, 0.0, 1.0);
            float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2505 = _2503 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2507 = fma(_2501, _2479, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2509 = fma(_2501, _2505, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2511 = fma(_2501, _2485, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2513 = fma(_2501, _2489, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2515 = fma(_2501, _2493, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2517 = fma(_2501, _2497, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2449 = _2511;
            _2435 = _2515;
            _2423 = _2507;
            _2429 = _2513;
            _2443 = _2509;
            _2457 = _2517;
            _2519 = true;
        }
        else
        {
            bool _2521 = _1399 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2523 = isnan(_1399);
            bool _2525 = _2521 || _2523;
            bool _2527 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2529 = _2525 || _2527;
            if (!_2529)
            {
                _2421 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2531 = _2421;
            _2423 = _2531;
            if (!_2529)
            {
                _2447 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2533 = _2447;
            _2449 = _2533;
            if (!_2529)
            {
                _2441 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2535 = _2441;
            _2443 = _2535;
            if (!_2529)
            {
                _2427 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2537 = _2427;
            _2429 = _2537;
            if (!_2529)
            {
                _2433 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2539 = _2433;
            _2435 = _2539;
            if (!_2529)
            {
                _2455 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2541 = _2455;
            bool _2543 = !_2529;
            _2457 = _2541;
            if (!_2543)
            {
                bool _2545 = _1399 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2547 = isnan(_1399);
                bool _2549 = _2545 || _2547;
                bool _2551 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2553 = _2549 || _2551;
                if (!_2553)
                {
                    float _2555 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2557 = _1399 + _2555;
                    float _2559 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2561 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2559;
                    float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2567 = 1.0 / _2561;
                    float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2571 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2573 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2575 = _2573 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2581 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2583 = _2581 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2585 = _2557 * _2567;
                    float _2587 = precise::clamp(_2585, 0.0, 1.0);
                    float _2589 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2591 = _2589 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2593 = fma(_2587, _2565, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2595 = fma(_2587, _2591, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2597 = fma(_2587, _2571, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2599 = fma(_2587, _2575, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2601 = fma(_2587, _2579, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2603 = fma(_2587, _2583, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2449 = _2597;
                    _2435 = _2601;
                    _2423 = _2593;
                    _2429 = _2599;
                    _2443 = _2595;
                    _2457 = _2603;
                    _2519 = true;
                }
                else
                {
                    _2449 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2435 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2423 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2429 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2443 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2457 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2519 = false;
    float _2605 = _2449;
    float _2607 = _2435;
    float _2609 = _2423;
    float _2611 = _2429;
    float _2613 = _2443;
    float _2615 = _2457;
    float _2617 = fma(_2387, -0.5, 0.5);
    float _2619 = precise::clamp(_2617, 0.0, 1.0);
    float _2621 = -_2605;
    float _2623 = _2621 + _2607;
    float _2625 = _2439 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2627 = -_2609;
    float _2629 = _2627 + _2611;
    float _2631 = fma(_2619, _2623, _2605);
    out.m_92.x = 0.0;
    float _2633 = -_2613;
    float _2635 = _2633 + _2615;
    float _2637 = fma(_2619, _2629, _2609);
    float _2639 = _2631 * 0.586610972881317138671875;
    out.m_51.x = _2625;
    bool _2641 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2643 = fma(_2619, _2635, _2613);
    float _2645 = fma(_2637, 0.298911988735198974609375, _2639);
    bool _2647 = _1321 > 0.0;
    bool _2649 = isnan(_1321);
    bool _2651 = _2647 || _2649;
    bool _2653 = isnan(0.0);
    bool _2655 = _2651 || _2653;
    float _2657 = fma(_2643, 0.114477999508380889892578125, _2645);
    bool _2659 = _1377 <= 0.0;
    bool _2661 = !_2655;
    bool _2663 = _2659 || _2661;
    float _2665 = -_2657;
    float _2667 = _2637 + _2665;
    float _2669 = -_2657;
    float _2671 = _2631 + _2669;
    float _2673 = -_2657;
    float _2675 = _2643 + _2673;
    float _2677 = fma(_2667, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2657);
    float _2679 = fma(_2671, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2657);
    float _2681 = fma(_2675, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2657);
    bool _2683 = !_2641;
    if (!_2683)
    {
        float _2685 = -_1257;
        float _2687 = _2685 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2689 = -_1259;
        float _2691 = _2689 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2693 = -_1261;
        float _2695 = _2693 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2697 = _2687 * _2687;
        float _2699 = fma(_2691, _2691, _2697);
        float _2701 = fma(_2695, _2695, _2699);
        float _2703 = sqrt(_2701);
        float _2705 = rsqrt(_2701);
        float _2707 = -_2703;
        float _2709 = _2707 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2711 = _2709 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2713 = precise::clamp(_2711, 0.0, 1.0);
        float _2715 = _2691 * _2705;
        float _2717 = _2687 * _2705;
        float _2719 = abs(_2713);
        float _2721 = log2(_2719);
        float _2723 = _2695 * _2705;
        float _2725 = _2715 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2727 = _2387 * _2717;
        float _2729 = -_2717;
        float _2731 = -_2725;
        float _2733 = fma(_2729, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2731);
        float _2735 = fma(_2393, _2715, _2727);
        float _2737 = -_2723;
        float _2739 = fma(_2737, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2733);
        float _2741 = fma(_2395, _2723, _2735);
        float _2743 = precise::clamp(_2741, 0.0, 1.0);
        float _2745 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2747 = _2739 + _2745;
        float _2749 = _2721 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2751 = _2747 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2753 = precise::clamp(_2751, 0.0, 1.0);
        float _2755 = exp2(_2749);
        float _2757 = _2755 * _2753;
        float _2759 = _2743 * _2757;
        float _2761 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2763 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2765 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2761;
        out.m_92.y = _2763;
        out.m_92.z = _2765;
    }
    out.m_70.x = _2677;
    out.m_70.y = _2679;
    out.m_70.z = _2681;
    if (!_2663)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2767 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2767;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

