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
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_78 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_80 [[user(locn4)]];
    float4 m_72 [[user(locn5)]];
    float4 m_92 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_51 [[user(locn9)]];
    float4 m_70 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_86 [[user(locn13)]];
    float4 m_66 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_82 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_48 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2647 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_46.w;
    float _108 = in.m_48.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = as_type<float>(_113);
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_53.x = 0.0;
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
        float _2964 = as_type<float>(_135);
        out.gl_Position.z = _2964;
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
        out.m_53.x = 0.0;
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
        float _3019 = as_type<float>(_161);
        out.gl_Position.z = _3019;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = in.m_55.x;
    float _165 = in.m_55.y;
    float _167 = in.m_55.z;
    float _169 = 1.0 / _149;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _117 * _169;
    float _175 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _177 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _179 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _175);
    float _183 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _177);
    float _185 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _187 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    float _189 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    float _191 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _185);
    bool _193 = !_171;
    float _195 = _173;
    float _213;
    if (!_193)
    {
        float _197 = in.m_57.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        _213 = _173;
    }
    _215 = false;
    float _217 = _213;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _217 + _219;
    float _223 = in.m_59.x;
    float _225 = in.m_59.y;
    bool _227 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _229 = isnan(_217);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    bool _243 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _245 = isnan(_217);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = -_237;
    float _257 = _255 + 1.0;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _259;
    float _263 = 1.0 / _241;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _267 = _253 * _257;
    float _269 = -_253;
    float _271 = _269 + 1.0;
    float _273 = _221 * _263;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _275;
    float _279 = fma(_261, _273, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _281 = fma(_277, _273, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _283 = _279 * _267;
    float _285 = _281 * _267;
    float _287 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[143].x, _283);
    float _289 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[143].y, _285);
    float _291 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[144].x, _287);
    float _293 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[144].y, _289);
    float _295 = _291 * _223;
    float _297 = _293 * _225;
    bool _299 = !_265;
    if (!_299)
    {
        float _301 = in.m_57.x;
        float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _305 = _301 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _309 = _307 * _303;
        float _311 = floor(_309);
        float _313 = -_311;
        float _315 = _309 + _313;
        _195 = _315;
    }
    float _317 = _195;
    float _319 = in.m_57.x;
    float _321 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _323 = log2(_321);
    float _325 = _297 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _327 = in.m_57.y;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _331 = in.m_57.z;
    float _333 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _335 = int(_333);
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _339 = in.m_46.x;
    float _341 = in.m_46.y;
    float _343 = in.m_46.z;
    int _345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _347 = _345 != 0;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _351 = _349 != 0;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _355 = _353 != 0;
    float _357 = _323 * _117;
    bool _359 = !_351;
    int _361 = _359 ? 0 : 1;
    bool _363 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _365 = isnan(0.0);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _371 = _367 || _369;
    float _373 = exp2(_357);
    float _375 = _319 * 2.0;
    float _377 = _319 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _379 = !_347;
    int _381 = _379 ? 0 : 1;
    float _383 = _327 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _385 = _327 * 2.0;
    float _387 = -_337;
    float _389 = fma(_377, 2.0, _387);
    float _391 = floor(_375);
    float _393 = fma(_383, -2.0, _329);
    float _395 = _331 * 2.0;
    float _397 = _319 + _327;
    float _399 = float(_335);
    float _401 = _341 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _403 = _341 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _405 = _341 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _407 = floor(_385);
    float _409 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[5].x, _401);
    float _411 = _397 + (-1.0);
    float _413 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[4].x, _403);
    float _415 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[6].x, _405);
    float _417 = -_373;
    float _419 = _417 + 1.0;
    float _421 = _327 + _331;
    float _423 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _425 = floor(_395);
    bool _427 = _391 >= 0.0;
    bool _429 = isnan(_391);
    bool _431 = _427 || _429;
    bool _433 = isnan(0.0);
    bool _435 = _431 || _433;
    float _437 = _421 + (-1.0);
    float _439 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].z, _415);
    int _441 = _435 ? 0 : 1;
    float _443 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _393);
    bool _445 = _391 > 0.0;
    float _447 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].z, _413);
    bool _449 = _407 > 0.0;
    float _451 = 1.0 / _399;
    bool _453 = _407 >= 0.0;
    bool _455 = isnan(_407);
    bool _457 = _453 || _455;
    bool _459 = isnan(0.0);
    bool _461 = _457 || _459;
    float _463 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].z, _409);
    float _465 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _467 = _371 ? _419 : 0.0;
    float _469 = _447 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _471 = _425 > 0.0;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _475 = _425 >= 0.0;
    bool _477 = isnan(_425);
    bool _479 = _475 || _477;
    bool _481 = isnan(0.0);
    bool _483 = _479 || _481;
    float _485 = _463 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _487 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[78].w, _473);
    int _489 = _483 ? 0 : 1;
    float _491 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _493 = _485 + _491;
    bool _495 = !_355;
    int _497 = _495 ? 0 : 1;
    float _499 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _501 = int(_499);
    int _503 = ~_489;
    int _505 = _503 + 1;
    int _507 = _505 + 1;
    float _509 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _487);
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _513 = _511 != 0;
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _517 = _515 != 0;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _521 = _519 != 0;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _525 = _507;
    if (!_471)
    {
        int _527 = ~_489;
        int _529 = _527 + 1;
        _525 = _529;
    }
    int _531 = _525;
    float _533 = _439 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _535 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _537 = isnan(1.0);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _543 = _539 || _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _547 = 1.0 + _545;
    float _549 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _551 = _469 + _549;
    float _553 = _493 * _493;
    bool _555 = !_513;
    int _557 = _555 ? 0 : 1;
    float _559 = 1.0 / _547;
    float _561 = in.m_61.x;
    float _563 = in.m_61.y;
    float _565 = in.m_61.z;
    float _567 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[78].z, _523);
    float _569 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _571 = _533 + _569;
    int _573 = abs(_557);
    float _575 = -_117;
    float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[76].x, _389);
    float _579 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _567);
    bool _581 = !_517;
    int _583 = _581 ? 0 : 1;
    float _585 = _451 * _117;
    float _587 = fma(_551, _551, _553);
    int _589 = abs(_583);
    float _591 = fma(_571, _571, _587);
    float _593 = float(_573);
    float _595 = float(_501);
    float _597 = sqrt(_591);
    float _599 = float(_531);
    int _601 = ~_441;
    int _603 = _601 + 1;
    int _605 = _603 + 1;
    float _607 = _595 * _117;
    int _609 = _605;
    if (_543)
    {
        float _611 = _467 * _559;
        _127 = _611;
    }
    float _613 = _127;
    float _615 = _593 * _599;
    if (!_445)
    {
        int _617 = ~_441;
        int _619 = _617 + 1;
        _609 = _619;
    }
    int _621 = _609;
    float _623 = rsqrt(_591);
    float _625 = _295 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _627 = _615 * (-2.0);
    float _629 = float(_621);
    float _631 = _319 + (-0.5);
    float _633 = float(_589);
    float _635 = _625 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _637 = fma(_627, _561, _561);
    float _639 = _597 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _641 = fma(_423, _627, _423);
    float _643 = _633 * _629;
    float _645 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[196].x, _637);
    bool _647 = !_521;
    int _649 = _647 ? 0 : 1;
    float _651 = precise::min(_635, _639);
    float _653 = _643 * (-2.0);
    int _655 = _461 ? 0 : 1;
    float _657 = fma(_641, _613, _645);
    float _659 = _623 * _651;
    float _661 = fma(_653, _563, _563);
    float _663 = fma(_465, _653, _465);
    int _665 = abs(_649);
    float _667 = _493 * _659;
    int _669 = ~_655;
    int _671 = _669 + 1;
    int _673 = _671 + 1;
    float _675 = _551 * _659;
    int _677 = _673;
    float _679 = _675;
    float _681 = _667;
    if (!_449)
    {
        int _683 = ~_655;
        int _685 = _683 + 1;
        _677 = _685;
    }
    int _687 = _677;
    float _689 = -_667;
    float _691 = _493 + _689;
    float _693 = _327 + (-0.5);
    float _695 = -_675;
    float _697 = _551 + _695;
    float _699 = float(_687);
    float _701 = _691 * _691;
    float _703 = float(_665);
    float _705 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[196].y, _661);
    float _707 = _657 * 0.15915493667125701904296875;
    float _709 = fma(_697, _697, _701);
    float _711 = _571 * _659;
    float _713 = fma(_663, _613, _705);
    float _715 = _703 * _699;
    float _717 = _319 + _331;
    float _719 = as_type<float>(int(gl_VertexIndex));
    float _721 = -_711;
    float _723 = _571 + _721;
    float _725 = _717 + (-1.0);
    float _727 = _715 * (-2.0);
    float _729 = _331 + (-0.5);
    float _731 = fma(_723, _723, _709);
    float _733 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _735 = fma(_727, _565, _565);
    float _737 = _707 * 6.283185482025146484375;
    float _739 = sin(_737);
    float _741 = _713 * 0.15915493667125701904296875;
    float _743 = fma(_733, _727, _733);
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[196].z, _735);
    float _747 = fma(_743, _613, _745);
    float _749 = _707 * 6.283185482025146484375;
    float _751 = cos(_749);
    float _753 = _747 * 0.15915493667125701904296875;
    int _755 = as_type<int>(_719) & 1;
    bool _757 = _755 != 0;
    int _759 = as_type<int>(_719) & 2;
    bool _761 = _759 != 0;
    float _763 = sqrt(_731);
    bool _765 = !_761;
    float _767 = _765 ? (-0.5) : 0.5;
    bool _769 = !_757;
    float _771 = _769 ? (-0.5) : 0.5;
    float _773 = _741 * 6.283185482025146484375;
    float _775 = cos(_773);
    float _777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _767);
    float _779 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _771);
    float _781 = _753 * 6.283185482025146484375;
    float _783 = cos(_781);
    float _785 = _623 * _763;
    float _787 = _325 * _785;
    float _789 = _741 * 6.283185482025146484375;
    float _791 = sin(_789);
    float _793 = _787 * _777;
    float _795 = _739 * _775;
    float _797 = _751 * _775;
    float _799 = _753 * 6.283185482025146484375;
    float _801 = sin(_799);
    float _803 = _775 * _783;
    float _805 = _625 * _785;
    float _807 = _805 * _779;
    float _809 = _751 * _791;
    float _811 = _739 * _791;
    float _813 = _751 * _783;
    float _815 = _739 * _783;
    float _817 = _791 * _783;
    float _819 = _785 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _821 = _819 * 0.5;
    float _823 = _813 * _793;
    float _825 = -_711;
    float _827 = _533 + _825;
    float _829 = fma(_801, _797, _811);
    float _831 = -_795;
    float _833 = fma(_801, _809, _831);
    float _835 = -_793;
    float _837 = _801 * _835;
    float _839 = -_809;
    float _841 = fma(_801, _795, _839);
    float _843 = fma(_829, _807, _823);
    float _845 = _815 * _793;
    float _847 = fma(_803, _807, _837);
    float _849 = fma(_801, _811, _797);
    float _851 = fma(_833, _821, _843);
    float _853 = fma(_841, _807, _845);
    float _855 = fma(_817, _821, _847);
    float _857 = _851 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _859 = fma(_849, _821, _853);
    float _861 = _851 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _863 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[26].x, _857);
    float _865 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[24].x, _861);
    float _867 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[26].z, _863);
    float _869 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[24].z, _865);
    float _871 = _867 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _873 = _851 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _875 = _869 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _877 = _533 + _871;
    float _879 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[25].x, _873);
    float _881 = _469 + _875;
    float _883 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _885 = _877 + _883;
    float _887 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[25].z, _879);
    float _889 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _891 = _881 + _889;
    float _893 = -_675;
    float _895 = _469 + _893;
    float _897 = _885 * _885;
    float _899 = _887 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _901 = fma(_891, _891, _897);
    float _903 = -_667;
    float _905 = _485 + _903;
    float _907 = _485 + _899;
    float _909 = sqrt(_901);
    float _911 = _905 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _913 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[11].x, _911);
    float _915 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[11].z, _913);
    bool _917 = _909 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _919 = _913;
    float _921 = _881;
    float _923 = _877;
    if (!_917)
    {
        _919 = _907;
    }
    float _925 = _919;
    bool _927 = !_917;
    float _929 = _925;
    if (!_927)
    {
        float _931 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _933 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _935 = _909 + _933;
        float _937 = _907 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _939 = rsqrt(_901);
        float _941 = _935 * _931;
        float _943 = _941 * 0.15915493667125701904296875;
        float _945 = _943 * 6.283185482025146484375;
        float _947 = cos(_945);
        float _949 = _943 * 6.283185482025146484375;
        float _951 = sin(_949);
        float _953 = _947 + (-1.0);
        float _955 = _953 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _957 = fma(_951, _937, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _959 = fma(_907, _947, _955);
        float _961 = _939 * _957;
        float _963 = fma(_891, _961, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _965 = fma(_885, _961, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _929 = _959;
        _921 = _963;
        _923 = _965;
    }
    float _967 = _929;
    float _969 = _921;
    float _971 = _923;
    float _973 = -_485;
    float _975 = _973 + _967;
    float _977 = -_469;
    float _979 = _977 + _969;
    float _981 = _915 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _983 = _905 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _985 = _975 * _975;
    float _987 = -_533;
    float _989 = _987 + _971;
    float _991 = 1.0 / _981;
    float _993 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[10].x, _983);
    float _995 = fma(_979, _979, _985);
    float _997 = -_675;
    float _999 = _997 + _969;
    float _1001 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[10].z, _993);
    float _1003 = fma(_989, _989, _995);
    float _1005 = -_711;
    float _1007 = _1005 + _971;
    float _1009 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1011 = sqrt(_1003);
    bool _1013 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1015 = isnan(0.5);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1021 = _1017 || _1019;
    float _1023 = _1009 + _981;
    float _1025 = -_667;
    float _1027 = _1025 + _967;
    bool _1029 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1031 = isnan(0.5);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1037 = _1033 || _1035;
    float _1039 = _1023 * _991;
    float _1041 = _1039 * 0.5;
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1045 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1043);
    float _1047 = 1.0 / _1045;
    bool _1049 = _1011 > 0.0;
    float _1051 = _1011;
    float _1053 = _979;
    float _1055 = _967;
    float _1057 = _995;
    float _1059 = _1045;
    float _1061 = _1027;
    float _1063 = _971;
    float _1065 = _999;
    if (!_1049)
    {
        _679 = _999;
    }
    float _1067 = _679;
    float _1069 = _1067;
    if (!_1049)
    {
        _681 = _1027;
    }
    float _1071 = _681;
    float _1073 = _1071;
    if (!_1049)
    {
        _1051 = _1007;
    }
    float _1075 = _1051;
    bool _1077 = !_1049;
    float _1079 = _1075;
    float _1081 = _1075;
    if (!_1077)
    {
        float _1083 = _189 * _189;
        float _1085 = fma(_187, _187, _1083);
        float _1087 = fma(_191, _191, _1085);
        float _1089 = rsqrt(_1003);
        float _1091 = sqrt(_1087);
        float _1093 = _979 * _1089;
        float _1095 = _975 * _1089;
        float _1097 = _989 * _1089;
        bool _1099 = _1091 > 0.0;
        float _1101 = _1091;
        float _1103 = _1089;
        _1053 = _1093;
        _1055 = _1095;
        _1057 = _1087;
        if (!_1099)
        {
            _1101 = _999;
        }
        float _1105 = _1101;
        _1069 = _1105;
        if (!_1099)
        {
            _1103 = _1027;
        }
        float _1107 = _1103;
        _1073 = _1107;
        if (!_1099)
        {
            _1079 = _1007;
        }
        float _1109 = _1079;
        bool _1111 = !_1099;
        _1081 = _1109;
        if (!_1111)
        {
            float _1113 = rsqrt(_1087);
            float _1115 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1117 = _189 * _1113;
            float _1119 = _187 * _1113;
            float _1121 = _191 * _1113;
            float _1123 = _1095 * _1117;
            float _1125 = fma(_1093, _1119, _1123);
            float _1127 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1129 = fma(_1097, _1121, _1125);
            float _1131 = _1129 * _1127;
            float _1133 = fma(_187, _1131, _999);
            float _1135 = fma(_189, _1131, _1027);
            float _1137 = fma(_191, _1131, _1007);
            _1069 = _1133;
            _1073 = _1135;
            _1081 = _1137;
            _1053 = _1131;
        }
    }
    float _1139 = _1069;
    float _1141 = _1073;
    float _1143 = _1081;
    float _1145 = _1053;
    float _1147 = _1055;
    float _1149 = _1057;
    float _1151 = _1141;
    float _1153 = _1139;
    float _1155 = _1143;
    float _1157 = _1145;
    float _1159 = _1149;
    float _1161 = _1147;
    if (_1037)
    {
        _1059 = 1.0;
    }
    float _1163 = _1059;
    float _1165 = _1163;
    if (!_1021)
    {
        float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1169 = _905 + _1167;
        float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1173 = _895 + _1171;
        float _1175 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1177 = _1169 * _1169;
        float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1181 = _827 + _1179;
        float _1183 = fma(_1173, _1173, _1177);
        float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1187 = fma(_1181, _1181, _1183);
        float _1189 = sqrt(_1187);
        float _1191 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1193 = precise::min(_1189, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1195 = _1193 * _1185;
        float _1197 = -_895;
        float _1199 = _1197 + _1139;
        float _1201 = _1191 * _1195;
        float _1203 = -_905;
        float _1205 = _1203 + _1141;
        float _1207 = -_827;
        float _1209 = _1207 + _1143;
        float _1211 = fma(_1199, _1201, _895);
        float _1213 = fma(_1205, _1201, _905);
        float _1215 = fma(_1209, _1201, _827);
        _1151 = _1213;
        _1153 = _1211;
        _1155 = _1215;
        _1157 = _1201;
    }
    float _1217 = _1151;
    float _1219 = _1153;
    float _1221 = _1155;
    float _1223 = _1157;
    float _1225 = _1223;
    if (_1037)
    {
        _1061 = 1.0;
    }
    float _1227 = _1061;
    float _1229 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1231 = _1047 * _1229;
    float _1233 = _1227;
    if (!_1037)
    {
        float _1235 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1237 = _1235 * 0.15915493667125701904296875;
        float _1239 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1241 = _1237 * 6.283185482025146484375;
        float _1243 = cos(_1241);
        float _1245 = _1239 * 0.15915493667125701904296875;
        float _1247 = _1237 * 6.283185482025146484375;
        float _1249 = sin(_1247);
        float _1251 = 1.0 / _1243;
        float _1253 = _1245 * 6.283185482025146484375;
        float _1255 = cos(_1253);
        float _1257 = _1249 * _1251;
        float _1259 = _1245 * 6.283185482025146484375;
        float _1261 = sin(_1259);
        float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1265 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1263;
        float _1267 = _1255 * _1257;
        float _1269 = 1.0 / _1265;
        float _1271 = 1.0 / _1267;
        float _1273 = _1261 * _1271;
        float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1277 = fma(_1231, _1273, _1275);
        float _1279 = _1277 * _1269;
        float _1281 = precise::clamp(_1279, 0.0, 1.0);
        _1225 = _1245;
        _1159 = _1237;
        _1165 = _1281;
    }
    float _1283 = _1225;
    float _1285 = _1159;
    float _1287 = _1165;
    float _1289 = _1283;
    if (!_1037)
    {
        float _1291 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1293 = _1291 * 0.15915493667125701904296875;
        float _1295 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1297 = _1293 * 6.283185482025146484375;
        float _1299 = cos(_1297);
        float _1301 = _1295 * 0.15915493667125701904296875;
        float _1303 = _1293 * 6.283185482025146484375;
        float _1305 = sin(_1303);
        float _1307 = 1.0 / _1299;
        float _1309 = _1301 * 6.283185482025146484375;
        float _1311 = cos(_1309);
        float _1313 = _1305 * _1307;
        float _1315 = _1301 * 6.283185482025146484375;
        float _1317 = sin(_1315);
        float _1319 = _1311 * _1313;
        float _1321 = 1.0 / _1319;
        float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1325 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1323;
        float _1327 = 1.0 / _1325;
        float _1329 = _1317 * _1321;
        float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1333 = fma(_1231, _1329, _1331);
        float _1335 = _1333 * _1327;
        float _1337 = precise::clamp(_1335, 0.0, 1.0);
        float _1339 = -_1337;
        float _1341 = _1339 + 1.0;
        _1063 = _1319;
        _1289 = _1321;
        _1233 = _1341;
    }
    float _1343 = _1063;
    float _1345 = _1289;
    float _1347 = _1233;
    float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1351 = _1217 + _1349;
    float _1353 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1355 = _1219 + _1353;
    float _1357 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1359 = _1221 + _1357;
    float _1361 = _1351 * _1351;
    float _1363 = fma(_1355, _1355, _1361);
    float _1365 = fma(_1359, _1359, _1363);
    float _1367 = rsqrt(_1365);
    float _1369 = sqrt(_1365);
    float _1371 = _1367 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1373 = _1355 * _1371;
    float _1375 = _1359 * _1371;
    float _1377 = _1373 * _1373;
    float _1379 = _1375 * _1375;
    float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1383 = fma(_1369, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1381);
    float _1385 = precise::clamp(_1383, 0.0, 1.0);
    float _1387 = _1377 + _1379;
    float _1389 = sqrt(_1387);
    bool _1391 = _1389 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1393 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1395 = _1389 + _1393;
    float _1397 = _1343;
    float _1399 = _1387;
    float _1401 = _1395;
    float _1403 = _1351;
    float _1405 = _1373;
    float _1407 = _1375;
    if (_1391)
    {
        float _1409 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1397 = _1409;
    }
    float _1411 = _1397;
    if (_1391)
    {
        float _1413 = rsqrt(_1387);
        _1399 = _1413;
    }
    float _1415 = _1399;
    float _1417 = _1411;
    if (_1391)
    {
        float _1419 = _1395 * _1411;
        _1401 = _1419;
    }
    float _1421 = _1401;
    if (_1391)
    {
        float _1423 = _1421 * 0.15915493667125701904296875;
        _1161 = _1423;
    }
    float _1425 = _1161;
    float _1427 = _1345;
    float _1429 = _1425;
    if (_1391)
    {
        float _1431 = _1425 * 6.283185482025146484375;
        float _1433 = sin(_1431);
        _1427 = _1433;
    }
    float _1435 = _1427;
    float _1437 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1439 = precise::max(0.0, _1437);
    float _1441 = _1285;
    if (_1391)
    {
        float _1443 = _1425 * 6.283185482025146484375;
        float _1445 = cos(_1443);
        _1441 = _1445;
    }
    float _1447 = _1441;
    float _1449 = -_1371;
    float _1451 = -_1439;
    float _1453 = fma(_1351, _1449, _1451);
    if (_1391)
    {
        float _1455 = _1453 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1403 = _1455;
    }
    float _1457 = _1403;
    float _1459 = fma(_895, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1461 = _1435;
    if (_1391)
    {
        float _1463 = fma(_1435, _1457, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1065 = _1463;
    }
    float _1465 = _1065;
    float _1467 = _1465;
    if (!_1391)
    {
        _1461 = _1453;
    }
    float _1469 = _1461;
    float _1471 = floor(_1459);
    float _1473 = _1469;
    float _1475 = _1447;
    if (_1391)
    {
        float _1477 = _1447 + (-1.0);
        _1417 = _1477;
    }
    float _1479 = _1417;
    float _1481 = _1479;
    if (_1391)
    {
        float _1483 = _1415 * _1465;
        _1429 = _1483;
    }
    float _1485 = _1429;
    if (_1391)
    {
        float _1487 = _1479 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1467 = _1487;
    }
    float _1489 = _1467;
    if (_1391)
    {
        float _1491 = _1373 * _1485;
        _1405 = _1491;
    }
    float _1493 = _1405;
    if (!_1391)
    {
        _1481 = _1377;
    }
    float _1495 = _1481;
    float _1497 = _1495;
    if (_1391)
    {
        float _1499 = _1375 * _1485;
        _1407 = _1499;
    }
    float _1501 = _1407;
    if (_1391)
    {
        float _1503 = fma(_1453, _1447, _1489);
        _1473 = _1503;
    }
    float _1505 = _1473;
    if (_1391)
    {
        float _1507 = _1493 * _1493;
        _1497 = _1507;
    }
    float _1509 = _1497;
    if (!_1391)
    {
        _1475 = _1379;
    }
    float _1511 = _1475;
    float _1513 = _1511;
    if (_1391)
    {
        float _1515 = _1501 * _1501;
        _1513 = _1515;
    }
    float _1517 = _1513;
    float _1519 = fma(_1505, _1505, _1509);
    float _1521 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1523 = fma(_827, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1525 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1527 = _1519 + _1517;
    float _1529 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1531 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1533 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1521);
    float _1535 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1525);
    float _1537 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1539 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1531);
    float _1541 = rsqrt(_1527);
    float _1543 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1533);
    float _1545 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1535);
    float _1547 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1539);
    float _1549 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1537);
    float _1551 = _1543 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1553 = -_1385;
    float _1555 = _1553 + 1.0;
    float _1557 = _1547 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1559 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1561 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1563 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1549);
    float _1565 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1567 = abs(_1555);
    float _1569 = log2(_1567);
    float _1571 = -_1561;
    float _1573 = fma(_1571, _1529, 1.0);
    float _1575 = _1563 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1577 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1565);
    float _1579 = _1541 * _1493;
    float _1581 = _1541 * _1501;
    float _1583 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1577);
    float _1585 = _1541 * _1505;
    float _1587 = floor(_1523);
    float _1589 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1591 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1583);
    float _1593 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1595 = -_1593;
    float _1597 = fma(_1585, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1595);
    float _1599 = _1569 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1601 = -_1471;
    float _1603 = _1459 + _1601;
    float _1605 = 1.0 / _1591;
    float _1607 = -_1581;
    float _1609 = fma(_1607, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1597);
    float _1611 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1613 = fma(_1609, -0.5, 0.5);
    float _1615 = -_1587;
    float _1617 = _1523 + _1615;
    float _1619 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1611);
    float _1621 = log2(_1573);
    float _1623 = fma(_1609, 0.5, 0.5);
    float _1625 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1589);
    float _1627 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1619);
    float _1629 = _1585 + 1.0;
    float _1631 = fma(_1623, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1633 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1625);
    float _1635 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1627);
    float _1637 = exp2(_1599);
    float _1639 = fma(_1623, _1631, -0.212114393711090087890625);
    float _1641 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1633);
    float _1643 = _1635 * _1605;
    float _1645 = fma(_1623, _1639, 1.570728778839111328125);
    float _1647 = _1641 * _1605;
    float _1649 = sqrt(_1613);
    float _1651 = _1621 * 0.693147182464599609375;
    float _1653 = fma(_1647, -0.5, 0.5);
    float _1655 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1657 = -_1585;
    float _1659 = fma(_1637, _1629, _1657);
    float2 _5318 = float2(_1603, _1617);
    float _1661 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5318, float2(0.0), isnan(_5318)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5318, float2(0.0), isnan(_5318)), level(0.0)).x;
    float _1663 = fma(_1659, 0.5, 0.5);
    float _1665 = _1649 * 0.636619746685028076171875;
    float _1667 = fma(_1643, 0.5, 0.5);
    float _1669 = -_1645;
    float _1671 = fma(_1665, _1669, 1.0);
    float3 _5341 = float3(_1667, _1653, _1655);
    float _1673 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5341, float3(0.0), isnan(_5341)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5341, float3(0.0), isnan(_5341)), level(0.0)).x;
    float3 _5352 = float3(_1667, _1653, _1655);
    float4 _1676 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5352, float3(0.0), isnan(_5352)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5352, float3(0.0), isnan(_5352)), level(0.0)).xyzw;
    float _1678 = _1676.x;
    float _1680 = _1676.y;
    float _1682 = _1676.z;
    float _1684 = _1676.w;
    float2 _5368 = float2(_1671, _1663);
    float3 _1688 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5368, float2(0.0), isnan(_5368)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5368, float2(0.0), isnan(_5368)), level(0.0)).xyz;
    float _1690 = _1688.x;
    float _1692 = _1688.y;
    float _1694 = _1688.z;
    float _1696 = float(uint(_501));
    float _1698 = trunc(_585);
    int _1700 = int(_1698);
    float _1702 = _607 * _169;
    bool _1704 = _327 > 0.5;
    float _1706 = -_509;
    float _1708 = _1706 + 1.0;
    float _1710 = -_579;
    float _1712 = _1710 + 1.0;
    out.m_66.x = _895;
    out.m_66.y = _905;
    out.m_66.z = _827;
    float _1714 = _1569 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1716 = 1.0 / _1696;
    int _1718 = ~_501;
    int _1720 = _1718 + 1;
    out.m_68.w = _651;
    int _1722 = ~_501;
    int _1724 = _1722 + 1;
    int _1726 = _501 + (-1);
    out.m_70.x = _805;
    float _1728 = float(uint(_1700));
    float _1730 = trunc(_1702);
    int _1732 = int(_1730);
    out.m_72.x = _1219;
    out.m_72.y = _1217;
    out.m_72.z = _1221;
    int _1734 = as_type<int>(_1716) + (-2);
    float _1736 = exp2(_1714);
    float _1738 = as_type<float>(_1734) * _1728;
    float _1740 = trunc(_1738);
    float _1742 = precise::max(_1740, 0.0);
    uint _1745 = uint(_1742);
    float _1747 = -_1736;
    float _1749 = _1747 + 1.0;
    int _1751 = _1720 * int(_1745);
    int _1753 = _1751 + _1700;
    float _1755 = float(uint(_1753));
    float _1757 = as_type<float>(_1734) * _1755;
    int _1759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1761 = _1759 != 0;
    float _1763 = trunc(_1757);
    float _1765 = precise::max(_1763, 0.0);
    uint _1767 = uint(_1765);
    bool _1769 = !_1761;
    float _1771 = _1769 ? 7.345489978790283203125 : 1.0;
    float _1773 = _1771 * _319;
    float _1775 = float(_1700);
    bool _1777 = _1775 >= _595;
    bool _1779 = isnan(_1775);
    bool _1781 = _1777 || _1779;
    bool _1783 = isnan(_595);
    bool _1785 = _1781 || _1783;
    float _1787 = float(_1785);
    int _1789 = int(_1745) + int(_1767);
    float _1791 = floor(_1773);
    int _1793 = _1724 * _1789;
    int _1795 = _1793 + _1700;
    bool _1797 = uint(_1795) >= uint(_501);
    float _1799 = trunc(_1787);
    int _1801 = int(_1799);
    bool _1803 = !_1797;
    int _1805 = _1803 ? 0 : (-1);
    bool _1807 = _501 == 0;
    int _1809 = ~_1789;
    int _1811 = _1809 + _1805;
    int _1813 = _1811 + 1;
    float _1815 = -_1791;
    float _1817 = _1773 + _1815;
    int _1819 = _501 * _1813;
    int _1821 = _1819 + _1700;
    float _1823 = _1817 * _595;
    int _1825 = ~_1801;
    int _1827 = _1825 + 1;
    int _1829 = _1827 + 1;
    float _1831 = trunc(_1823);
    int _1833 = int(_1831);
    bool _1835 = !_1807;
    int _1837 = _1835 ? _1821 : (-1);
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1841 = _1839 != 0;
    int _1843 = ~_501;
    int _1845 = _1843 + 1;
    int _1847 = _1837 * _1829;
    bool _1849 = !_1841;
    int _1851 = _1849 ? 0 : 1;
    int _1853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1855 = _1853 != 0;
    int _1857 = _1801 * _1726;
    int _1859 = _1857 + _1847;
    int _1861 = abs(_361);
    int _1863 = abs(_381);
    int _1865 = abs(_1851);
    bool _1867 = !_1855;
    int _1869 = _1867 ? 0 : 1;
    int _1871 = _1859 * _1861;
    int _1873 = abs(_497);
    int _1875 = _1833 * _1865;
    int _1877 = _1875 + _1700;
    int _1879 = abs(_1869);
    int _1881 = _1732 * _1863;
    int _1883 = _1881 + _1871;
    int _1885 = _1877 * _1873;
    int _1887 = _1885 + _1883;
    float _1889 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1893 = _1891 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1895 = float(uint(_1877));
    int _1897 = _1833 * _1879;
    int _1899 = _1897 + _1887;
    bool _1901 = _319 > 0.5;
    float _1903 = _1889 * _319;
    int _1905 = ~_501;
    int _1907 = _1905 + 1;
    float _1909 = 1.0 / _1893;
    float _1911 = float(uint(_1899));
    float _1913 = as_type<float>(_1734) * _1895;
    int _1915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1917 = _1915 != 0;
    float _1919 = -_771;
    int _1921 = _1901 ? as_type<int>(_1919) : as_type<int>(_771);
    float _1923 = as_type<float>(_1734) * _1911;
    int _1925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1927 = _1925 != 0;
    float _1929 = trunc(_1903);
    int _1931 = int(_1929);
    float _1933 = trunc(_1923);
    float _1935 = precise::max(_1933, 0.0);
    uint _1937 = uint(_1935);
    int _1939 = _1931 << 4;
    int _1941 = _1939 + 1968;
    float _1943 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1943;
    float _1947 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1949 = _317 + _1947;
    int _1951 = _1941 + 8;
    uint _1953 = uint(int(uint(_1951) >> uint(2)));
    uint _1955 = uint(int(uint(int(_1953)) >> uint(2)));
    int _1957 = int(_1953) & 3;
    float _1959 = (*spvDescriptorSet0.vp_c9)._m0[int(_1955)][_1957];
    float _1961 = _1945 * _1909;
    bool _1963 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1965 = isnan(_317);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1971 = _1967 || _1969;
    float _1973 = float(_1971);
    int _1975 = _1907 * int(_1937);
    int _1977 = _1975 + _1899;
    float _1979 = fma(_1961, _1949, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1981 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1983 = isnan(_317);
    bool _1985 = _1981 || _1983;
    bool _1987 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1989 = _1985 || _1987;
    float _1991 = float(_1989);
    float _1993 = trunc(_1913);
    float _1995 = precise::max(_1993, 0.0);
    uint _1997 = uint(_1995);
    float _1999 = float(uint(_1977));
    uint _2001 = uint(int(uint(_1941) >> uint(2)));
    uint _2003 = uint(int(uint(int(_2001)) >> uint(2)));
    int _2005 = int(_2001) & 3;
    float _2007 = (*spvDescriptorSet0.vp_c9)._m0[int(_2003)][_2005];
    int _2009 = int(_2001) + 1;
    uint _2011 = uint(int(uint(_2009) >> uint(2)));
    int _2013 = _2009 & 3;
    float _2015 = (*spvDescriptorSet0.vp_c9)._m0[int(_2011)][_2013];
    float _2017 = as_type<float>(_1734) * _1999;
    float _2019 = -_1973;
    float _2021 = _2019 + 1.0;
    float _2023 = _1991 * _2021;
    float _2025 = trunc(_2017);
    float _2027 = precise::max(_2025, 0.0);
    uint _2029 = uint(_2027);
    float _2031 = _1979 * _2023;
    int _2033 = ~_501;
    int _2035 = _2033 + 1;
    float _2037 = -_767;
    int _2039 = _1704 ? as_type<int>(_2037) : as_type<int>(_767);
    int _2041 = int(_1937) + int(_2029);
    float _2043 = -_1991;
    float _2045 = _2043 + 1.0;
    bool _2047 = !_1917;
    float _2049 = _2047 ? _771 : as_type<float>(_1921);
    float _2051 = _771 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2053 = !_1927;
    float _2055 = _2053 ? _767 : as_type<float>(_2039);
    int _2057 = _1845 * _2041;
    int _2059 = _2057 + _1899;
    float _2061 = fma(_2045, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2031);
    int _2063 = _2035 * int(_1997);
    int _2065 = _2063 + _1877;
    float _2067 = _2049 + 0.5;
    float _2069 = _2055 + (-0.5);
    bool _2071 = uint(_2059) >= uint(_501);
    float _2073 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2061);
    float _2075 = float(uint(_2065));
    float _2077 = fma(_2067, (*spvDescriptorSet0.vp_c9)._m0[80].x, _577);
    bool _2079 = !_2071;
    int _2081 = _2079 ? 0 : (-1);
    float _2083 = -_2069;
    float _2085 = -_443;
    float _2087 = fma(_2083, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2085);
    int _2089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2091 = _2089 != 0;
    float _2093 = as_type<float>(_1734) * _2075;
    int _2095 = ~_2041;
    int _2097 = _2095 + _2081;
    int _2099 = _2097 + 1;
    float _2101 = fma(_2055, _1708, _2087);
    float _2103 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2105 = -_1712;
    float _2107 = fma(_2049, _2105, _2077);
    float _2109 = trunc(_2093);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    int _2115 = _501 * _2099;
    int _2117 = _2115 + _1899;
    float _2119 = _2007 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2121 = _2015 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2123 = _2103 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2125 = !_1807;
    int _2127 = _2125 ? _2117 : (-1);
    float _2129 = _2119 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2131 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2133 = _2127 >> 31;
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_74.x = _2129;
    out.m_74.y = _2131;
    out.m_74.z = _2123;
    int _2141 = _2133 & 3;
    float _2143 = _2135 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2145 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2147 = _2139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2149 = _2073 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2151 = ~_501;
    int _2153 = _2151 + 1;
    out.m_76.x = _2107;
    out.m_76.y = _2101;
    int _2155 = int(_1997) + int(_2113);
    float _2157 = _833 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2159 = _2127 + _2141;
    out.m_78.x = _2143;
    out.m_78.y = _2145;
    out.m_78.z = _2147;
    out.m_78.w = _2149;
    float _2161 = _813 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2163 = _813 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2165 = _813 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2167 = _2159 >> 2;
    float _2169 = -_801;
    float _2171 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2161);
    float _2173 = -_801;
    float _2175 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2163);
    float _2177 = -_801;
    float _2179 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2165);
    int _2181 = _2167 << 4;
    int _2183 = _2181 + 368;
    float _2185 = abs(_1231);
    float _2187 = log2(_2185);
    float _2189 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2175);
    float _2191 = _829 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2193 = _2127 & 3;
    bool _2195 = _2193 != 0;
    float _2197 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2157);
    int _2199 = _2153 * _2155;
    int _2201 = _2199 + _1877;
    float _2203 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2179);
    float _2205 = _829 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2207 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2171);
    float _2209 = _829 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2211 = uint(_2201) >= uint(_501);
    float _2213 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2205);
    float _2215 = _767 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _2217 = uint(int(uint(_2183) >> uint(2)));
    uint _2219 = uint(int(uint(int(_2217)) >> uint(2)));
    int _2221 = int(_2217) & 3;
    float _2223 = (*spvDescriptorSet0.vp_c9)._m0[int(_2219)][_2221];
    int _2225 = int(_2217) + 1;
    uint _2227 = uint(int(uint(_2225) >> uint(2)));
    int _2229 = _2225 & 3;
    float _2231 = (*spvDescriptorSet0.vp_c9)._m0[int(_2227)][_2229];
    float _2233 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2209);
    float _2235 = _833 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2237 = _833 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2239 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2213);
    bool _2241 = uint(_2193) > 1u;
    float _2243 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2191);
    int _2245 = _2127 & 3;
    bool _2247 = _2245 != 0;
    int _2249 = _2183 + 8;
    uint _2251 = uint(int(uint(_2249) >> uint(2)));
    uint _2253 = uint(int(uint(int(_2251)) >> uint(2)));
    int _2255 = int(_2251) & 3;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[int(_2253)][_2255];
    int _2259 = int(_2251) + 1;
    uint _2261 = uint(int(uint(_2259) >> uint(2)));
    int _2263 = _2259 & 3;
    float _2265 = (*spvDescriptorSet0.vp_c9)._m0[int(_2261)][_2263];
    float _2267 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2233);
    float _2269 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2243);
    int _2271 = _2247 ? 0 : 1;
    float _2273 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2235);
    float _2275 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2237);
    float _2277 = _2215 * _2189;
    int _2279 = ~_2271;
    int _2281 = _2279 + 1;
    int _2283 = _2281 + 1;
    float _2285 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2287 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2275);
    int _2289 = _2283;
    float _2291 = _1635;
    if (!_2241)
    {
        int _2293 = ~_2271;
        int _2295 = _2293 + 1;
        _2289 = _2295;
    }
    int _2297 = _2289;
    float _2299 = _2215 * _2207;
    bool _2301 = _2193 != 3;
    float _2303 = exp2(_2285);
    bool _2305 = uint(_2193) >= 2u;
    float _2307 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2273);
    bool _2309 = !_2195;
    int _2311 = _2309 ? 0 : 1;
    float _2313 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2197);
    int _2315 = _2305 ? 0 : 1;
    float _2317 = fma(_2051, _2239, _2299);
    int _2319 = abs(_2297);
    float _2321 = _2215 * _2203;
    int _2323 = abs(_2311);
    float _2325 = fma(_2051, _2269, _2277);
    int _2327 = ~_2315;
    int _2329 = _2327 + 1;
    int _2331 = _2329 + 1;
    float _2333 = fma(_2051, _2267, _2321);
    bool _2335 = _2193 != 3;
    float _2337 = _1591 * 0.5;
    int _2339 = _2331;
    if (_2301)
    {
        int _2341 = ~_2315;
        int _2343 = _2341 + 1;
        _2339 = _2343;
    }
    int _2345 = _2339;
    float _2347 = _2313 + _2333;
    float _2349 = -_1661;
    float _2351 = _2349 + 1.0;
    int _2353 = ~_2319;
    int _2355 = _2353 + 1;
    int _2357 = _2355 + 1;
    float _2359 = _2287 + _2325;
    float _2361 = fma(_2303, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2363 = precise::clamp(_2361, 0.0, 1.0);
    bool _2365 = !_2335;
    int _2367 = _2365 ? 0 : (-1);
    float _2369 = _2307 + _2317;
    int _2371 = abs(_2345);
    int _2373 = _2357 * as_type<int>(_2231);
    int _2375 = ~_2323;
    int _2377 = _2375 + 1;
    int _2379 = _2377 + 1;
    out.m_80.x = _2369;
    out.m_80.y = _2359;
    out.m_80.z = _2347;
    bool _2381 = !_2091;
    int _2383 = _2381 ? 0 : 1;
    int _2385 = abs(_2367);
    int _2387 = _2379 * as_type<int>(_2223);
    int _2389 = _2387 + _2373;
    bool _2391 = !_2211;
    int _2393 = _2391 ? 0 : (-1);
    int _2395 = abs(_2383);
    int _2397 = ~_2371;
    int _2399 = _2397 + 1;
    int _2401 = _2399 + 1;
    int _2403 = ~_2155;
    int _2405 = _2403 + _2393;
    int _2407 = _2405 + 1;
    int _2409 = _2401 * as_type<int>(_2257);
    int _2411 = _2409 + _2389;
    int _2413 = _501 * _2407;
    int _2415 = _2413 + _1877;
    int _2417 = ~_2385;
    int _2419 = _2417 + 1;
    int _2421 = _2419 + 1;
    float _2423 = fma(_2363, -2.0, 3.0);
    int _2425 = ~_2395;
    int _2427 = _2425 + 1;
    int _2429 = _2427 + 1;
    float _2431 = _2363 * _2363;
    bool _2433 = !_1807;
    int _2435 = _2433 ? _2415 : (-1);
    int _2437 = _2421 * as_type<int>(_2265);
    int _2439 = _2437 + _2411;
    float _2441 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2443 = _2431 * _2423;
    bool _2445 = _1231 <= 8000.0;
    bool _2447 = isnan(_1231);
    bool _2449 = _2445 || _2447;
    bool _2451 = isnan(8000.0);
    bool _2453 = _2449 || _2451;
    float _2455 = float(_2453);
    int _2457 = _2439 * _2429;
    float _2459 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2441);
    float _2461 = -_2443;
    float _2463 = _2461 + 1.0;
    float _2465 = fma(_1641, -0.5, _2337);
    int _2467 = _2435 * _2395;
    int _2469 = _2467 + _2457;
    float _2471 = in.m_82.x;
    float _2473 = fma(_2463, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2443);
    float _2475 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2477 = float(_2469);
    float _2479 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2459);
    float _2481 = _2455 * _2473;
    float _2483 = _2475 * _1673;
    float _2485 = -_2475;
    float _2487 = _2485 + 1.0;
    out.m_84.x = _2477;
    float _2489 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2491 = _1694 * _2483;
    float _2493 = _1684 * _2487;
    bool _2495 = _1369 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2497 = isnan(_1369);
    bool _2499 = _2495 || _2497;
    bool _2501 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2503 = _2499 || _2501;
    float _2505 = _2351 * _2489;
    float _2507 = precise::clamp(_2505, 0.0, 1.0);
    float _2509 = fma(_1684, _2491, _1682);
    float _2511 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2479);
    float _2513 = _1684 * _2483;
    float _2515 = -_2507;
    float _2517 = fma(_2515, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2519 = _1635 + _1591;
    float _2521 = _2511 + _1591;
    float _2523 = fma(_1690, _2513, _1678);
    float _2525 = fma(_1692, _2513, _1680);
    float _2527 = _2521 * 0.5;
    float _2529 = _2517 * _2471;
    float _2531 = _2519 * 0.5;
    out.m_86.x = _2523;
    out.m_86.y = _2525;
    out.m_86.z = _2509;
    out.m_86.w = _2493;
    float _2533 = _1287 * _1347;
    float _2535 = _2529 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _1635;
    out.gl_Position.y = _1641;
    out.gl_Position.z = _2511;
    out.gl_Position.w = _1591;
    out.m_88.x = _2535;
    out.m_90.x = _2531;
    out.m_90.y = _2465;
    out.m_90.z = _2527;
    out.m_90.w = _1591;
    float _2537 = _2533 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2539 = _2533;
    float _2541 = _1591;
    float _2543 = _2527;
    float _2545 = _2465;
    float _2547 = _2531;
    if (!_2503)
    {
        _2291 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2549 = _2291;
    float _2551 = _2549;
    float _2553 = _2549;
    if (!_2503)
    {
        _2539 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2555 = _2539;
    float _2557 = _2555;
    float _2559 = _2555;
    if (!_2503)
    {
        _2541 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2561 = _2541;
    float _2563 = _2561;
    float _2565 = _2561;
    if (!_2503)
    {
        _2543 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2567 = _2543;
    float _2569 = _2567;
    float _2571 = _2567;
    if (!_2503)
    {
        _2545 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2573 = _2545;
    float _2575 = _2573;
    float _2577 = _2573;
    if (!_2503)
    {
        _2547 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2579 = _2547;
    bool _2581 = !_2503;
    float _2583 = _2579;
    float _2585 = _2579;
    if (!_2581)
    {
        bool _2587 = _1369 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2589 = isnan(_1369);
        bool _2591 = _2587 || _2589;
        bool _2593 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2595 = _2591 || _2593;
        if (!_2595)
        {
            float _2597 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2599 = _1369 + _2597;
            float _2601 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2603 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2601;
            float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2609 = 1.0 / _2603;
            float _2611 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2615 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2617 = _2615 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2619 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2621 = _2619 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2627 = _2599 * _2609;
            float _2629 = precise::clamp(_2627, 0.0, 1.0);
            float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2635 = fma(_2629, _2607, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2637 = fma(_2629, _2633, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2639 = fma(_2629, _2613, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2641 = fma(_2629, _2617, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2643 = fma(_2629, _2621, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2645 = fma(_2629, _2625, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2565 = _2639;
            _2585 = _2643;
            _2553 = _2635;
            _2577 = _2641;
            _2571 = _2637;
            _2559 = _2645;
            _2647 = true;
        }
        else
        {
            bool _2649 = _1369 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2651 = isnan(_1369);
            bool _2653 = _2649 || _2651;
            bool _2655 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2657 = _2653 || _2655;
            if (!_2657)
            {
                _2551 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2659 = _2551;
            _2553 = _2659;
            if (!_2657)
            {
                _2563 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2661 = _2563;
            _2565 = _2661;
            if (!_2657)
            {
                _2569 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2663 = _2569;
            _2571 = _2663;
            if (!_2657)
            {
                _2575 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2665 = _2575;
            _2577 = _2665;
            if (!_2657)
            {
                _2583 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2667 = _2583;
            _2585 = _2667;
            if (!_2657)
            {
                _2557 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2669 = _2557;
            bool _2671 = !_2657;
            _2559 = _2669;
            if (!_2671)
            {
                bool _2673 = _1369 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2675 = isnan(_1369);
                bool _2677 = _2673 || _2675;
                bool _2679 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2681 = _2677 || _2679;
                if (!_2681)
                {
                    float _2683 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2685 = _1369 + _2683;
                    float _2687 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2689 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2687;
                    float _2691 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2693 = _2691 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2695 = 1.0 / _2689;
                    float _2697 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2703 = _2701 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2707 = _2705 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2711 = _2709 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2713 = _2685 * _2695;
                    float _2715 = precise::clamp(_2713, 0.0, 1.0);
                    float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2721 = fma(_2715, _2693, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2723 = fma(_2715, _2719, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2725 = fma(_2715, _2699, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2727 = fma(_2715, _2703, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2729 = fma(_2715, _2707, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2731 = fma(_2715, _2711, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2565 = _2725;
                    _2585 = _2729;
                    _2553 = _2721;
                    _2577 = _2727;
                    _2571 = _2723;
                    _2559 = _2731;
                    _2647 = true;
                }
                else
                {
                    _2565 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2585 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2553 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2577 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2571 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2559 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2647 = false;
    float _2733 = _2565;
    float _2735 = _2585;
    float _2737 = _2553;
    float _2739 = _2577;
    float _2741 = _2571;
    float _2743 = _2559;
    float _2745 = fma(_2359, -0.5, 0.5);
    float _2747 = precise::clamp(_2745, 0.0, 1.0);
    float _2749 = -_2733;
    float _2751 = _2749 + _2735;
    float _2753 = _2537 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2755 = -_2737;
    float _2757 = _2755 + _2739;
    float _2759 = fma(_2747, _2751, _2733);
    out.m_92.x = 0.0;
    float _2761 = -_2741;
    float _2763 = _2761 + _2743;
    float _2765 = fma(_2747, _2757, _2737);
    float _2767 = _2759 * 0.586610972881317138671875;
    out.m_53.x = _2753;
    bool _2769 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2771 = fma(_2747, _2763, _2741);
    float _2773 = fma(_2765, 0.298911988735198974609375, _2767);
    bool _2775 = _1287 > 0.0;
    bool _2777 = isnan(_1287);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan(0.0);
    bool _2783 = _2779 || _2781;
    float _2785 = fma(_2771, 0.114477999508380889892578125, _2773);
    bool _2787 = _1347 <= 0.0;
    bool _2789 = !_2783;
    bool _2791 = _2787 || _2789;
    float _2793 = -_2785;
    float _2795 = _2765 + _2793;
    float _2797 = -_2785;
    float _2799 = _2759 + _2797;
    float _2801 = -_2785;
    float _2803 = _2771 + _2801;
    float _2805 = fma(_2795, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2785);
    float _2807 = fma(_2799, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2785);
    float _2809 = fma(_2803, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2785);
    bool _2811 = !_2769;
    if (!_2811)
    {
        float _2813 = -_1217;
        float _2815 = _2813 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2817 = -_1219;
        float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2821 = -_1221;
        float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2825 = _2815 * _2815;
        float _2827 = fma(_2819, _2819, _2825);
        float _2829 = fma(_2823, _2823, _2827);
        float _2831 = sqrt(_2829);
        float _2833 = rsqrt(_2829);
        float _2835 = -_2831;
        float _2837 = _2835 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2839 = _2837 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2841 = precise::clamp(_2839, 0.0, 1.0);
        float _2843 = _2819 * _2833;
        float _2845 = _2815 * _2833;
        float _2847 = abs(_2841);
        float _2849 = log2(_2847);
        float _2851 = _2823 * _2833;
        float _2853 = _2843 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2855 = _2359 * _2845;
        float _2857 = -_2845;
        float _2859 = -_2853;
        float _2861 = fma(_2857, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2859);
        float _2863 = fma(_2369, _2843, _2855);
        float _2865 = -_2851;
        float _2867 = fma(_2865, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2861);
        float _2869 = fma(_2347, _2851, _2863);
        float _2871 = precise::clamp(_2869, 0.0, 1.0);
        float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2875 = _2867 + _2873;
        float _2877 = _2849 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2879 = _2875 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2881 = precise::clamp(_2879, 0.0, 1.0);
        float _2883 = exp2(_2877);
        float _2885 = _2883 * _2881;
        float _2887 = _2871 * _2885;
        float _2889 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2891 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2893 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2889;
        out.m_92.y = _2891;
        out.m_92.z = _2893;
    }
    out.m_68.x = _2805;
    out.m_68.y = _2807;
    out.m_68.z = _2809;
    if (!_2791)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2895 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2895;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2647 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_46.w;
    float _108 = in.m_48.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = as_type<float>(_113);
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_53.x = 0.0;
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
        float _2964 = as_type<float>(_135);
        out.gl_Position.z = _2964;
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
        out.m_53.x = 0.0;
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
        float _3019 = as_type<float>(_161);
        out.gl_Position.z = _3019;
    }
    if (_155)
    {
        return out;
    }
    float _163 = in.m_55.x;
    float _165 = in.m_55.y;
    float _167 = in.m_55.z;
    float _169 = 1.0 / _149;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _117 * _169;
    float _175 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _177 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _179 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _175);
    float _183 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _177);
    float _185 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _187 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    float _189 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    float _191 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _185);
    bool _193 = !_171;
    float _195 = _173;
    float _213;
    if (!_193)
    {
        float _197 = in.m_57.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        _213 = _173;
    }
    _215 = false;
    float _217 = _213;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _217 + _219;
    float _223 = in.m_59.x;
    float _225 = in.m_59.y;
    bool _227 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _229 = isnan(_217);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    bool _243 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _245 = isnan(_217);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = -_237;
    float _257 = _255 + 1.0;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _259;
    float _263 = 1.0 / _241;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _267 = _253 * _257;
    float _269 = -_253;
    float _271 = _269 + 1.0;
    float _273 = _221 * _263;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _275;
    float _279 = fma(_261, _273, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _281 = fma(_277, _273, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _283 = _279 * _267;
    float _285 = _281 * _267;
    float _287 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[143].x, _283);
    float _289 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[143].y, _285);
    float _291 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[144].x, _287);
    float _293 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[144].y, _289);
    float _295 = _291 * _223;
    float _297 = _293 * _225;
    bool _299 = !_265;
    if (!_299)
    {
        float _301 = in.m_57.x;
        float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _305 = _301 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _309 = _307 * _303;
        float _311 = floor(_309);
        float _313 = -_311;
        float _315 = _309 + _313;
        _195 = _315;
    }
    float _317 = _195;
    float _319 = in.m_57.x;
    float _321 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _323 = log2(_321);
    float _325 = _297 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _327 = in.m_57.y;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _331 = in.m_57.z;
    float _333 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _335 = int(_333);
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _339 = in.m_46.x;
    float _341 = in.m_46.y;
    float _343 = in.m_46.z;
    int _345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _347 = _345 != 0;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _351 = _349 != 0;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _355 = _353 != 0;
    float _357 = _323 * _117;
    bool _359 = !_351;
    int _361 = _359 ? 0 : 1;
    bool _363 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _365 = isnan(0.0);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _371 = _367 || _369;
    float _373 = exp2(_357);
    float _375 = _319 * 2.0;
    float _377 = _319 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _379 = !_347;
    int _381 = _379 ? 0 : 1;
    float _383 = _327 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _385 = _327 * 2.0;
    float _387 = -_337;
    float _389 = fma(_377, 2.0, _387);
    float _391 = floor(_375);
    float _393 = fma(_383, -2.0, _329);
    float _395 = _331 * 2.0;
    float _397 = _319 + _327;
    float _399 = float(_335);
    float _401 = _341 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _403 = _341 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _405 = _341 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _407 = floor(_385);
    float _409 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[5].x, _401);
    float _411 = _397 + (-1.0);
    float _413 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[4].x, _403);
    float _415 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[6].x, _405);
    float _417 = -_373;
    float _419 = _417 + 1.0;
    float _421 = _327 + _331;
    float _423 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _425 = floor(_395);
    bool _427 = _391 >= 0.0;
    bool _429 = isnan(_391);
    bool _431 = _427 || _429;
    bool _433 = isnan(0.0);
    bool _435 = _431 || _433;
    float _437 = _421 + (-1.0);
    float _439 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].z, _415);
    int _441 = _435 ? 0 : 1;
    float _443 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _393);
    bool _445 = _391 > 0.0;
    float _447 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].z, _413);
    bool _449 = _407 > 0.0;
    float _451 = 1.0 / _399;
    bool _453 = _407 >= 0.0;
    bool _455 = isnan(_407);
    bool _457 = _453 || _455;
    bool _459 = isnan(0.0);
    bool _461 = _457 || _459;
    float _463 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].z, _409);
    float _465 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _467 = _371 ? _419 : 0.0;
    float _469 = _447 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _471 = _425 > 0.0;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _475 = _425 >= 0.0;
    bool _477 = isnan(_425);
    bool _479 = _475 || _477;
    bool _481 = isnan(0.0);
    bool _483 = _479 || _481;
    float _485 = _463 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _487 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[78].w, _473);
    int _489 = _483 ? 0 : 1;
    float _491 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _493 = _485 + _491;
    bool _495 = !_355;
    int _497 = _495 ? 0 : 1;
    float _499 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _501 = int(_499);
    int _503 = ~_489;
    int _505 = _503 + 1;
    int _507 = _505 + 1;
    float _509 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _487);
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _513 = _511 != 0;
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _517 = _515 != 0;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _521 = _519 != 0;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _525 = _507;
    if (!_471)
    {
        int _527 = ~_489;
        int _529 = _527 + 1;
        _525 = _529;
    }
    int _531 = _525;
    float _533 = _439 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _535 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _537 = isnan(1.0);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _543 = _539 || _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _547 = 1.0 + _545;
    float _549 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _551 = _469 + _549;
    float _553 = _493 * _493;
    bool _555 = !_513;
    int _557 = _555 ? 0 : 1;
    float _559 = 1.0 / _547;
    float _561 = in.m_61.x;
    float _563 = in.m_61.y;
    float _565 = in.m_61.z;
    float _567 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[78].z, _523);
    float _569 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _571 = _533 + _569;
    int _573 = abs(_557);
    float _575 = -_117;
    float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[76].x, _389);
    float _579 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _567);
    bool _581 = !_517;
    int _583 = _581 ? 0 : 1;
    float _585 = _451 * _117;
    float _587 = fma(_551, _551, _553);
    int _589 = abs(_583);
    float _591 = fma(_571, _571, _587);
    float _593 = float(_573);
    float _595 = float(_501);
    float _597 = sqrt(_591);
    float _599 = float(_531);
    int _601 = ~_441;
    int _603 = _601 + 1;
    int _605 = _603 + 1;
    float _607 = _595 * _117;
    int _609 = _605;
    if (_543)
    {
        float _611 = _467 * _559;
        _127 = _611;
    }
    float _613 = _127;
    float _615 = _593 * _599;
    if (!_445)
    {
        int _617 = ~_441;
        int _619 = _617 + 1;
        _609 = _619;
    }
    int _621 = _609;
    float _623 = rsqrt(_591);
    float _625 = _295 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _627 = _615 * (-2.0);
    float _629 = float(_621);
    float _631 = _319 + (-0.5);
    float _633 = float(_589);
    float _635 = _625 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _637 = fma(_627, _561, _561);
    float _639 = _597 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _641 = fma(_423, _627, _423);
    float _643 = _633 * _629;
    float _645 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[196].x, _637);
    bool _647 = !_521;
    int _649 = _647 ? 0 : 1;
    float _651 = precise::min(_635, _639);
    float _653 = _643 * (-2.0);
    int _655 = _461 ? 0 : 1;
    float _657 = fma(_641, _613, _645);
    float _659 = _623 * _651;
    float _661 = fma(_653, _563, _563);
    float _663 = fma(_465, _653, _465);
    int _665 = abs(_649);
    float _667 = _493 * _659;
    int _669 = ~_655;
    int _671 = _669 + 1;
    int _673 = _671 + 1;
    float _675 = _551 * _659;
    int _677 = _673;
    float _679 = _675;
    float _681 = _667;
    if (!_449)
    {
        int _683 = ~_655;
        int _685 = _683 + 1;
        _677 = _685;
    }
    int _687 = _677;
    float _689 = -_667;
    float _691 = _493 + _689;
    float _693 = _327 + (-0.5);
    float _695 = -_675;
    float _697 = _551 + _695;
    float _699 = float(_687);
    float _701 = _691 * _691;
    float _703 = float(_665);
    float _705 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[196].y, _661);
    float _707 = _657 * 0.15915493667125701904296875;
    float _709 = fma(_697, _697, _701);
    float _711 = _571 * _659;
    float _713 = fma(_663, _613, _705);
    float _715 = _703 * _699;
    float _717 = _319 + _331;
    float _719 = as_type<float>(int(gl_VertexIndex));
    float _721 = -_711;
    float _723 = _571 + _721;
    float _725 = _717 + (-1.0);
    float _727 = _715 * (-2.0);
    float _729 = _331 + (-0.5);
    float _731 = fma(_723, _723, _709);
    float _733 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _735 = fma(_727, _565, _565);
    float _737 = _707 * 6.283185482025146484375;
    float _739 = sin(_737);
    float _741 = _713 * 0.15915493667125701904296875;
    float _743 = fma(_733, _727, _733);
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[196].z, _735);
    float _747 = fma(_743, _613, _745);
    float _749 = _707 * 6.283185482025146484375;
    float _751 = cos(_749);
    float _753 = _747 * 0.15915493667125701904296875;
    int _755 = as_type<int>(_719) & 1;
    bool _757 = _755 != 0;
    int _759 = as_type<int>(_719) & 2;
    bool _761 = _759 != 0;
    float _763 = sqrt(_731);
    bool _765 = !_761;
    float _767 = _765 ? (-0.5) : 0.5;
    bool _769 = !_757;
    float _771 = _769 ? (-0.5) : 0.5;
    float _773 = _741 * 6.283185482025146484375;
    float _775 = cos(_773);
    float _777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _767);
    float _779 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _771);
    float _781 = _753 * 6.283185482025146484375;
    float _783 = cos(_781);
    float _785 = _623 * _763;
    float _787 = _325 * _785;
    float _789 = _741 * 6.283185482025146484375;
    float _791 = sin(_789);
    float _793 = _787 * _777;
    float _795 = _739 * _775;
    float _797 = _751 * _775;
    float _799 = _753 * 6.283185482025146484375;
    float _801 = sin(_799);
    float _803 = _775 * _783;
    float _805 = _625 * _785;
    float _807 = _805 * _779;
    float _809 = _751 * _791;
    float _811 = _739 * _791;
    float _813 = _751 * _783;
    float _815 = _739 * _783;
    float _817 = _791 * _783;
    float _819 = _785 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _821 = _819 * 0.5;
    float _823 = _813 * _793;
    float _825 = -_711;
    float _827 = _533 + _825;
    float _829 = fma(_801, _797, _811);
    float _831 = -_795;
    float _833 = fma(_801, _809, _831);
    float _835 = -_793;
    float _837 = _801 * _835;
    float _839 = -_809;
    float _841 = fma(_801, _795, _839);
    float _843 = fma(_829, _807, _823);
    float _845 = _815 * _793;
    float _847 = fma(_803, _807, _837);
    float _849 = fma(_801, _811, _797);
    float _851 = fma(_833, _821, _843);
    float _853 = fma(_841, _807, _845);
    float _855 = fma(_817, _821, _847);
    float _857 = _851 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _859 = fma(_849, _821, _853);
    float _861 = _851 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _863 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[26].x, _857);
    float _865 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[24].x, _861);
    float _867 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[26].z, _863);
    float _869 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[24].z, _865);
    float _871 = _867 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _873 = _851 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _875 = _869 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _877 = _533 + _871;
    float _879 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[25].x, _873);
    float _881 = _469 + _875;
    float _883 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _885 = _877 + _883;
    float _887 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[25].z, _879);
    float _889 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _891 = _881 + _889;
    float _893 = -_675;
    float _895 = _469 + _893;
    float _897 = _885 * _885;
    float _899 = _887 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _901 = fma(_891, _891, _897);
    float _903 = -_667;
    float _905 = _485 + _903;
    float _907 = _485 + _899;
    float _909 = sqrt(_901);
    float _911 = _905 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _913 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[11].x, _911);
    float _915 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[11].z, _913);
    bool _917 = _909 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _919 = _913;
    float _921 = _881;
    float _923 = _877;
    if (!_917)
    {
        _919 = _907;
    }
    float _925 = _919;
    bool _927 = !_917;
    float _929 = _925;
    if (!_927)
    {
        float _931 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _933 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _935 = _909 + _933;
        float _937 = _907 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _939 = rsqrt(_901);
        float _941 = _935 * _931;
        float _943 = _941 * 0.15915493667125701904296875;
        float _945 = _943 * 6.283185482025146484375;
        float _947 = cos(_945);
        float _949 = _943 * 6.283185482025146484375;
        float _951 = sin(_949);
        float _953 = _947 + (-1.0);
        float _955 = _953 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _957 = fma(_951, _937, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _959 = fma(_907, _947, _955);
        float _961 = _939 * _957;
        float _963 = fma(_891, _961, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _965 = fma(_885, _961, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _929 = _959;
        _921 = _963;
        _923 = _965;
    }
    float _967 = _929;
    float _969 = _921;
    float _971 = _923;
    float _973 = -_485;
    float _975 = _973 + _967;
    float _977 = -_469;
    float _979 = _977 + _969;
    float _981 = _915 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _983 = _905 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _985 = _975 * _975;
    float _987 = -_533;
    float _989 = _987 + _971;
    float _991 = 1.0 / _981;
    float _993 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[10].x, _983);
    float _995 = fma(_979, _979, _985);
    float _997 = -_675;
    float _999 = _997 + _969;
    float _1001 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[10].z, _993);
    float _1003 = fma(_989, _989, _995);
    float _1005 = -_711;
    float _1007 = _1005 + _971;
    float _1009 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1011 = sqrt(_1003);
    bool _1013 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1015 = isnan(0.5);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1021 = _1017 || _1019;
    float _1023 = _1009 + _981;
    float _1025 = -_667;
    float _1027 = _1025 + _967;
    bool _1029 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1031 = isnan(0.5);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1037 = _1033 || _1035;
    float _1039 = _1023 * _991;
    float _1041 = _1039 * 0.5;
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1045 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1043);
    float _1047 = 1.0 / _1045;
    bool _1049 = _1011 > 0.0;
    float _1051 = _1011;
    float _1053 = _979;
    float _1055 = _967;
    float _1057 = _995;
    float _1059 = _1045;
    float _1061 = _1027;
    float _1063 = _971;
    float _1065 = _999;
    if (!_1049)
    {
        _679 = _999;
    }
    float _1067 = _679;
    float _1069 = _1067;
    if (!_1049)
    {
        _681 = _1027;
    }
    float _1071 = _681;
    float _1073 = _1071;
    if (!_1049)
    {
        _1051 = _1007;
    }
    float _1075 = _1051;
    bool _1077 = !_1049;
    float _1079 = _1075;
    float _1081 = _1075;
    if (!_1077)
    {
        float _1083 = _189 * _189;
        float _1085 = fma(_187, _187, _1083);
        float _1087 = fma(_191, _191, _1085);
        float _1089 = rsqrt(_1003);
        float _1091 = sqrt(_1087);
        float _1093 = _979 * _1089;
        float _1095 = _975 * _1089;
        float _1097 = _989 * _1089;
        bool _1099 = _1091 > 0.0;
        float _1101 = _1091;
        float _1103 = _1089;
        _1053 = _1093;
        _1055 = _1095;
        _1057 = _1087;
        if (!_1099)
        {
            _1101 = _999;
        }
        float _1105 = _1101;
        _1069 = _1105;
        if (!_1099)
        {
            _1103 = _1027;
        }
        float _1107 = _1103;
        _1073 = _1107;
        if (!_1099)
        {
            _1079 = _1007;
        }
        float _1109 = _1079;
        bool _1111 = !_1099;
        _1081 = _1109;
        if (!_1111)
        {
            float _1113 = rsqrt(_1087);
            float _1115 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1117 = _189 * _1113;
            float _1119 = _187 * _1113;
            float _1121 = _191 * _1113;
            float _1123 = _1095 * _1117;
            float _1125 = fma(_1093, _1119, _1123);
            float _1127 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1129 = fma(_1097, _1121, _1125);
            float _1131 = _1129 * _1127;
            float _1133 = fma(_187, _1131, _999);
            float _1135 = fma(_189, _1131, _1027);
            float _1137 = fma(_191, _1131, _1007);
            _1069 = _1133;
            _1073 = _1135;
            _1081 = _1137;
            _1053 = _1131;
        }
    }
    float _1139 = _1069;
    float _1141 = _1073;
    float _1143 = _1081;
    float _1145 = _1053;
    float _1147 = _1055;
    float _1149 = _1057;
    float _1151 = _1141;
    float _1153 = _1139;
    float _1155 = _1143;
    float _1157 = _1145;
    float _1159 = _1149;
    float _1161 = _1147;
    if (_1037)
    {
        _1059 = 1.0;
    }
    float _1163 = _1059;
    float _1165 = _1163;
    if (!_1021)
    {
        float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1169 = _905 + _1167;
        float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1173 = _895 + _1171;
        float _1175 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1177 = _1169 * _1169;
        float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1181 = _827 + _1179;
        float _1183 = fma(_1173, _1173, _1177);
        float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1187 = fma(_1181, _1181, _1183);
        float _1189 = sqrt(_1187);
        float _1191 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1193 = precise::min(_1189, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1195 = _1193 * _1185;
        float _1197 = -_895;
        float _1199 = _1197 + _1139;
        float _1201 = _1191 * _1195;
        float _1203 = -_905;
        float _1205 = _1203 + _1141;
        float _1207 = -_827;
        float _1209 = _1207 + _1143;
        float _1211 = fma(_1199, _1201, _895);
        float _1213 = fma(_1205, _1201, _905);
        float _1215 = fma(_1209, _1201, _827);
        _1151 = _1213;
        _1153 = _1211;
        _1155 = _1215;
        _1157 = _1201;
    }
    float _1217 = _1151;
    float _1219 = _1153;
    float _1221 = _1155;
    float _1223 = _1157;
    float _1225 = _1223;
    if (_1037)
    {
        _1061 = 1.0;
    }
    float _1227 = _1061;
    float _1229 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1231 = _1047 * _1229;
    float _1233 = _1227;
    if (!_1037)
    {
        float _1235 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1237 = _1235 * 0.15915493667125701904296875;
        float _1239 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1241 = _1237 * 6.283185482025146484375;
        float _1243 = cos(_1241);
        float _1245 = _1239 * 0.15915493667125701904296875;
        float _1247 = _1237 * 6.283185482025146484375;
        float _1249 = sin(_1247);
        float _1251 = 1.0 / _1243;
        float _1253 = _1245 * 6.283185482025146484375;
        float _1255 = cos(_1253);
        float _1257 = _1249 * _1251;
        float _1259 = _1245 * 6.283185482025146484375;
        float _1261 = sin(_1259);
        float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1265 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1263;
        float _1267 = _1255 * _1257;
        float _1269 = 1.0 / _1265;
        float _1271 = 1.0 / _1267;
        float _1273 = _1261 * _1271;
        float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1277 = fma(_1231, _1273, _1275);
        float _1279 = _1277 * _1269;
        float _1281 = precise::clamp(_1279, 0.0, 1.0);
        _1225 = _1245;
        _1159 = _1237;
        _1165 = _1281;
    }
    float _1283 = _1225;
    float _1285 = _1159;
    float _1287 = _1165;
    float _1289 = _1283;
    if (!_1037)
    {
        float _1291 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1293 = _1291 * 0.15915493667125701904296875;
        float _1295 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1297 = _1293 * 6.283185482025146484375;
        float _1299 = cos(_1297);
        float _1301 = _1295 * 0.15915493667125701904296875;
        float _1303 = _1293 * 6.283185482025146484375;
        float _1305 = sin(_1303);
        float _1307 = 1.0 / _1299;
        float _1309 = _1301 * 6.283185482025146484375;
        float _1311 = cos(_1309);
        float _1313 = _1305 * _1307;
        float _1315 = _1301 * 6.283185482025146484375;
        float _1317 = sin(_1315);
        float _1319 = _1311 * _1313;
        float _1321 = 1.0 / _1319;
        float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1325 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1323;
        float _1327 = 1.0 / _1325;
        float _1329 = _1317 * _1321;
        float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1333 = fma(_1231, _1329, _1331);
        float _1335 = _1333 * _1327;
        float _1337 = precise::clamp(_1335, 0.0, 1.0);
        float _1339 = -_1337;
        float _1341 = _1339 + 1.0;
        _1063 = _1319;
        _1289 = _1321;
        _1233 = _1341;
    }
    float _1343 = _1063;
    float _1345 = _1289;
    float _1347 = _1233;
    float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1351 = _1217 + _1349;
    float _1353 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1355 = _1219 + _1353;
    float _1357 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1359 = _1221 + _1357;
    float _1361 = _1351 * _1351;
    float _1363 = fma(_1355, _1355, _1361);
    float _1365 = fma(_1359, _1359, _1363);
    float _1367 = rsqrt(_1365);
    float _1369 = sqrt(_1365);
    float _1371 = _1367 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1373 = _1355 * _1371;
    float _1375 = _1359 * _1371;
    float _1377 = _1373 * _1373;
    float _1379 = _1375 * _1375;
    float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1383 = fma(_1369, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1381);
    float _1385 = precise::clamp(_1383, 0.0, 1.0);
    float _1387 = _1377 + _1379;
    float _1389 = sqrt(_1387);
    bool _1391 = _1389 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1393 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1395 = _1389 + _1393;
    float _1397 = _1343;
    float _1399 = _1387;
    float _1401 = _1395;
    float _1403 = _1351;
    float _1405 = _1373;
    float _1407 = _1375;
    if (_1391)
    {
        float _1409 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1397 = _1409;
    }
    float _1411 = _1397;
    if (_1391)
    {
        float _1413 = rsqrt(_1387);
        _1399 = _1413;
    }
    float _1415 = _1399;
    float _1417 = _1411;
    if (_1391)
    {
        float _1419 = _1395 * _1411;
        _1401 = _1419;
    }
    float _1421 = _1401;
    if (_1391)
    {
        float _1423 = _1421 * 0.15915493667125701904296875;
        _1161 = _1423;
    }
    float _1425 = _1161;
    float _1427 = _1345;
    float _1429 = _1425;
    if (_1391)
    {
        float _1431 = _1425 * 6.283185482025146484375;
        float _1433 = sin(_1431);
        _1427 = _1433;
    }
    float _1435 = _1427;
    float _1437 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1439 = precise::max(0.0, _1437);
    float _1441 = _1285;
    if (_1391)
    {
        float _1443 = _1425 * 6.283185482025146484375;
        float _1445 = cos(_1443);
        _1441 = _1445;
    }
    float _1447 = _1441;
    float _1449 = -_1371;
    float _1451 = -_1439;
    float _1453 = fma(_1351, _1449, _1451);
    if (_1391)
    {
        float _1455 = _1453 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1403 = _1455;
    }
    float _1457 = _1403;
    float _1459 = fma(_895, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1461 = _1435;
    if (_1391)
    {
        float _1463 = fma(_1435, _1457, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1065 = _1463;
    }
    float _1465 = _1065;
    float _1467 = _1465;
    if (!_1391)
    {
        _1461 = _1453;
    }
    float _1469 = _1461;
    float _1471 = floor(_1459);
    float _1473 = _1469;
    float _1475 = _1447;
    if (_1391)
    {
        float _1477 = _1447 + (-1.0);
        _1417 = _1477;
    }
    float _1479 = _1417;
    float _1481 = _1479;
    if (_1391)
    {
        float _1483 = _1415 * _1465;
        _1429 = _1483;
    }
    float _1485 = _1429;
    if (_1391)
    {
        float _1487 = _1479 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1467 = _1487;
    }
    float _1489 = _1467;
    if (_1391)
    {
        float _1491 = _1373 * _1485;
        _1405 = _1491;
    }
    float _1493 = _1405;
    if (!_1391)
    {
        _1481 = _1377;
    }
    float _1495 = _1481;
    float _1497 = _1495;
    if (_1391)
    {
        float _1499 = _1375 * _1485;
        _1407 = _1499;
    }
    float _1501 = _1407;
    if (_1391)
    {
        float _1503 = fma(_1453, _1447, _1489);
        _1473 = _1503;
    }
    float _1505 = _1473;
    if (_1391)
    {
        float _1507 = _1493 * _1493;
        _1497 = _1507;
    }
    float _1509 = _1497;
    if (!_1391)
    {
        _1475 = _1379;
    }
    float _1511 = _1475;
    float _1513 = _1511;
    if (_1391)
    {
        float _1515 = _1501 * _1501;
        _1513 = _1515;
    }
    float _1517 = _1513;
    float _1519 = fma(_1505, _1505, _1509);
    float _1521 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1523 = fma(_827, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1525 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1527 = _1519 + _1517;
    float _1529 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1531 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1533 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1521);
    float _1535 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1525);
    float _1537 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1539 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1531);
    float _1541 = rsqrt(_1527);
    float _1543 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1533);
    float _1545 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1535);
    float _1547 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1539);
    float _1549 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1537);
    float _1551 = _1543 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1553 = -_1385;
    float _1555 = _1553 + 1.0;
    float _1557 = _1547 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1559 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1561 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1563 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1549);
    float _1565 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1567 = abs(_1555);
    float _1569 = log2(_1567);
    float _1571 = -_1561;
    float _1573 = fma(_1571, _1529, 1.0);
    float _1575 = _1563 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1577 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1565);
    float _1579 = _1541 * _1493;
    float _1581 = _1541 * _1501;
    float _1583 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1577);
    float _1585 = _1541 * _1505;
    float _1587 = floor(_1523);
    float _1589 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1591 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1583);
    float _1593 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1595 = -_1593;
    float _1597 = fma(_1585, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1595);
    float _1599 = _1569 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1601 = -_1471;
    float _1603 = _1459 + _1601;
    float _1605 = 1.0 / _1591;
    float _1607 = -_1581;
    float _1609 = fma(_1607, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1597);
    float _1611 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1613 = fma(_1609, -0.5, 0.5);
    float _1615 = -_1587;
    float _1617 = _1523 + _1615;
    float _1619 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1611);
    float _1621 = log2(_1573);
    float _1623 = fma(_1609, 0.5, 0.5);
    float _1625 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1589);
    float _1627 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1619);
    float _1629 = _1585 + 1.0;
    float _1631 = fma(_1623, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1633 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1625);
    float _1635 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1627);
    float _1637 = exp2(_1599);
    float _1639 = fma(_1623, _1631, -0.212114393711090087890625);
    float _1641 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1633);
    float _1643 = _1635 * _1605;
    float _1645 = fma(_1623, _1639, 1.570728778839111328125);
    float _1647 = _1641 * _1605;
    float _1649 = sqrt(_1613);
    float _1651 = _1621 * 0.693147182464599609375;
    float _1653 = fma(_1647, -0.5, 0.5);
    float _1655 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1657 = -_1585;
    float _1659 = fma(_1637, _1629, _1657);
    float2 _5318 = float2(_1603, _1617);
    float _1661 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5318, float2(0.0), isnan(_5318)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5318, float2(0.0), isnan(_5318)), level(0.0)).x;
    float _1663 = fma(_1659, 0.5, 0.5);
    float _1665 = _1649 * 0.636619746685028076171875;
    float _1667 = fma(_1643, 0.5, 0.5);
    float _1669 = -_1645;
    float _1671 = fma(_1665, _1669, 1.0);
    float3 _5341 = float3(_1667, _1653, _1655);
    float _1673 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5341, float3(0.0), isnan(_5341)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5341, float3(0.0), isnan(_5341)), level(0.0)).x;
    float3 _5352 = float3(_1667, _1653, _1655);
    float4 _1676 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5352, float3(0.0), isnan(_5352)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5352, float3(0.0), isnan(_5352)), level(0.0)).xyzw;
    float _1678 = _1676.x;
    float _1680 = _1676.y;
    float _1682 = _1676.z;
    float _1684 = _1676.w;
    float2 _5368 = float2(_1671, _1663);
    float3 _1688 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5368, float2(0.0), isnan(_5368)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5368, float2(0.0), isnan(_5368)), level(0.0)).xyz;
    float _1690 = _1688.x;
    float _1692 = _1688.y;
    float _1694 = _1688.z;
    float _1696 = float(uint(_501));
    float _1698 = trunc(_585);
    int _1700 = int(_1698);
    float _1702 = _607 * _169;
    bool _1704 = _327 > 0.5;
    float _1706 = -_509;
    float _1708 = _1706 + 1.0;
    float _1710 = -_579;
    float _1712 = _1710 + 1.0;
    out.m_66.x = _895;
    out.m_66.y = _905;
    out.m_66.z = _827;
    float _1714 = _1569 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1716 = 1.0 / _1696;
    int _1718 = ~_501;
    int _1720 = _1718 + 1;
    out.m_68.w = _651;
    int _1722 = ~_501;
    int _1724 = _1722 + 1;
    int _1726 = _501 + (-1);
    out.m_70.x = _805;
    float _1728 = float(uint(_1700));
    float _1730 = trunc(_1702);
    int _1732 = int(_1730);
    out.m_72.x = _1219;
    out.m_72.y = _1217;
    out.m_72.z = _1221;
    int _1734 = as_type<int>(_1716) + (-2);
    float _1736 = exp2(_1714);
    float _1738 = as_type<float>(_1734) * _1728;
    float _1740 = trunc(_1738);
    float _1742 = precise::max(_1740, 0.0);
    uint _1745 = uint(_1742);
    float _1747 = -_1736;
    float _1749 = _1747 + 1.0;
    int _1751 = _1720 * int(_1745);
    int _1753 = _1751 + _1700;
    float _1755 = float(uint(_1753));
    float _1757 = as_type<float>(_1734) * _1755;
    int _1759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1761 = _1759 != 0;
    float _1763 = trunc(_1757);
    float _1765 = precise::max(_1763, 0.0);
    uint _1767 = uint(_1765);
    bool _1769 = !_1761;
    float _1771 = _1769 ? 7.345489978790283203125 : 1.0;
    float _1773 = _1771 * _319;
    float _1775 = float(_1700);
    bool _1777 = _1775 >= _595;
    bool _1779 = isnan(_1775);
    bool _1781 = _1777 || _1779;
    bool _1783 = isnan(_595);
    bool _1785 = _1781 || _1783;
    float _1787 = float(_1785);
    int _1789 = int(_1745) + int(_1767);
    float _1791 = floor(_1773);
    int _1793 = _1724 * _1789;
    int _1795 = _1793 + _1700;
    bool _1797 = uint(_1795) >= uint(_501);
    float _1799 = trunc(_1787);
    int _1801 = int(_1799);
    bool _1803 = !_1797;
    int _1805 = _1803 ? 0 : (-1);
    bool _1807 = _501 == 0;
    int _1809 = ~_1789;
    int _1811 = _1809 + _1805;
    int _1813 = _1811 + 1;
    float _1815 = -_1791;
    float _1817 = _1773 + _1815;
    int _1819 = _501 * _1813;
    int _1821 = _1819 + _1700;
    float _1823 = _1817 * _595;
    int _1825 = ~_1801;
    int _1827 = _1825 + 1;
    int _1829 = _1827 + 1;
    float _1831 = trunc(_1823);
    int _1833 = int(_1831);
    bool _1835 = !_1807;
    int _1837 = _1835 ? _1821 : (-1);
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1841 = _1839 != 0;
    int _1843 = ~_501;
    int _1845 = _1843 + 1;
    int _1847 = _1837 * _1829;
    bool _1849 = !_1841;
    int _1851 = _1849 ? 0 : 1;
    int _1853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1855 = _1853 != 0;
    int _1857 = _1801 * _1726;
    int _1859 = _1857 + _1847;
    int _1861 = abs(_361);
    int _1863 = abs(_381);
    int _1865 = abs(_1851);
    bool _1867 = !_1855;
    int _1869 = _1867 ? 0 : 1;
    int _1871 = _1859 * _1861;
    int _1873 = abs(_497);
    int _1875 = _1833 * _1865;
    int _1877 = _1875 + _1700;
    int _1879 = abs(_1869);
    int _1881 = _1732 * _1863;
    int _1883 = _1881 + _1871;
    int _1885 = _1877 * _1873;
    int _1887 = _1885 + _1883;
    float _1889 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1893 = _1891 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1895 = float(uint(_1877));
    int _1897 = _1833 * _1879;
    int _1899 = _1897 + _1887;
    bool _1901 = _319 > 0.5;
    float _1903 = _1889 * _319;
    int _1905 = ~_501;
    int _1907 = _1905 + 1;
    float _1909 = 1.0 / _1893;
    float _1911 = float(uint(_1899));
    float _1913 = as_type<float>(_1734) * _1895;
    int _1915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1917 = _1915 != 0;
    float _1919 = -_771;
    int _1921 = _1901 ? as_type<int>(_1919) : as_type<int>(_771);
    float _1923 = as_type<float>(_1734) * _1911;
    int _1925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1927 = _1925 != 0;
    float _1929 = trunc(_1903);
    int _1931 = int(_1929);
    float _1933 = trunc(_1923);
    float _1935 = precise::max(_1933, 0.0);
    uint _1937 = uint(_1935);
    int _1939 = _1931 << 4;
    int _1941 = _1939 + 1968;
    float _1943 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1943;
    float _1947 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1949 = _317 + _1947;
    int _1951 = _1941 + 8;
    uint _1953 = uint(int(uint(_1951) >> uint(2)));
    uint _1955 = uint(int(uint(int(_1953)) >> uint(2)));
    int _1957 = int(_1953) & 3;
    float _1959 = (*spvDescriptorSet0.vp_c9)._m0[int(_1955)][_1957];
    float _1961 = _1945 * _1909;
    bool _1963 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1965 = isnan(_317);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1971 = _1967 || _1969;
    float _1973 = float(_1971);
    int _1975 = _1907 * int(_1937);
    int _1977 = _1975 + _1899;
    float _1979 = fma(_1961, _1949, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1981 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1983 = isnan(_317);
    bool _1985 = _1981 || _1983;
    bool _1987 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1989 = _1985 || _1987;
    float _1991 = float(_1989);
    float _1993 = trunc(_1913);
    float _1995 = precise::max(_1993, 0.0);
    uint _1997 = uint(_1995);
    float _1999 = float(uint(_1977));
    uint _2001 = uint(int(uint(_1941) >> uint(2)));
    uint _2003 = uint(int(uint(int(_2001)) >> uint(2)));
    int _2005 = int(_2001) & 3;
    float _2007 = (*spvDescriptorSet0.vp_c9)._m0[int(_2003)][_2005];
    int _2009 = int(_2001) + 1;
    uint _2011 = uint(int(uint(_2009) >> uint(2)));
    int _2013 = _2009 & 3;
    float _2015 = (*spvDescriptorSet0.vp_c9)._m0[int(_2011)][_2013];
    float _2017 = as_type<float>(_1734) * _1999;
    float _2019 = -_1973;
    float _2021 = _2019 + 1.0;
    float _2023 = _1991 * _2021;
    float _2025 = trunc(_2017);
    float _2027 = precise::max(_2025, 0.0);
    uint _2029 = uint(_2027);
    float _2031 = _1979 * _2023;
    int _2033 = ~_501;
    int _2035 = _2033 + 1;
    float _2037 = -_767;
    int _2039 = _1704 ? as_type<int>(_2037) : as_type<int>(_767);
    int _2041 = int(_1937) + int(_2029);
    float _2043 = -_1991;
    float _2045 = _2043 + 1.0;
    bool _2047 = !_1917;
    float _2049 = _2047 ? _771 : as_type<float>(_1921);
    float _2051 = _771 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2053 = !_1927;
    float _2055 = _2053 ? _767 : as_type<float>(_2039);
    int _2057 = _1845 * _2041;
    int _2059 = _2057 + _1899;
    float _2061 = fma(_2045, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2031);
    int _2063 = _2035 * int(_1997);
    int _2065 = _2063 + _1877;
    float _2067 = _2049 + 0.5;
    float _2069 = _2055 + (-0.5);
    bool _2071 = uint(_2059) >= uint(_501);
    float _2073 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2061);
    float _2075 = float(uint(_2065));
    float _2077 = fma(_2067, (*spvDescriptorSet0.vp_c9)._m0[80].x, _577);
    bool _2079 = !_2071;
    int _2081 = _2079 ? 0 : (-1);
    float _2083 = -_2069;
    float _2085 = -_443;
    float _2087 = fma(_2083, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2085);
    int _2089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2091 = _2089 != 0;
    float _2093 = as_type<float>(_1734) * _2075;
    int _2095 = ~_2041;
    int _2097 = _2095 + _2081;
    int _2099 = _2097 + 1;
    float _2101 = fma(_2055, _1708, _2087);
    float _2103 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2105 = -_1712;
    float _2107 = fma(_2049, _2105, _2077);
    float _2109 = trunc(_2093);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    int _2115 = _501 * _2099;
    int _2117 = _2115 + _1899;
    float _2119 = _2007 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2121 = _2015 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2123 = _2103 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2125 = !_1807;
    int _2127 = _2125 ? _2117 : (-1);
    float _2129 = _2119 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2131 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2133 = _2127 >> 31;
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_74.x = _2129;
    out.m_74.y = _2131;
    out.m_74.z = _2123;
    int _2141 = _2133 & 3;
    float _2143 = _2135 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2145 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2147 = _2139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2149 = _2073 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2151 = ~_501;
    int _2153 = _2151 + 1;
    out.m_76.x = _2107;
    out.m_76.y = _2101;
    int _2155 = int(_1997) + int(_2113);
    float _2157 = _833 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2159 = _2127 + _2141;
    out.m_78.x = _2143;
    out.m_78.y = _2145;
    out.m_78.z = _2147;
    out.m_78.w = _2149;
    float _2161 = _813 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2163 = _813 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2165 = _813 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2167 = _2159 >> 2;
    float _2169 = -_801;
    float _2171 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2161);
    float _2173 = -_801;
    float _2175 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2163);
    float _2177 = -_801;
    float _2179 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2165);
    int _2181 = _2167 << 4;
    int _2183 = _2181 + 368;
    float _2185 = abs(_1231);
    float _2187 = log2(_2185);
    float _2189 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2175);
    float _2191 = _829 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2193 = _2127 & 3;
    bool _2195 = _2193 != 0;
    float _2197 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2157);
    int _2199 = _2153 * _2155;
    int _2201 = _2199 + _1877;
    float _2203 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2179);
    float _2205 = _829 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2207 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2171);
    float _2209 = _829 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2211 = uint(_2201) >= uint(_501);
    float _2213 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2205);
    float _2215 = _767 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _2217 = uint(int(uint(_2183) >> uint(2)));
    uint _2219 = uint(int(uint(int(_2217)) >> uint(2)));
    int _2221 = int(_2217) & 3;
    float _2223 = (*spvDescriptorSet0.vp_c9)._m0[int(_2219)][_2221];
    int _2225 = int(_2217) + 1;
    uint _2227 = uint(int(uint(_2225) >> uint(2)));
    int _2229 = _2225 & 3;
    float _2231 = (*spvDescriptorSet0.vp_c9)._m0[int(_2227)][_2229];
    float _2233 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2209);
    float _2235 = _833 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2237 = _833 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2239 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2213);
    bool _2241 = uint(_2193) > 1u;
    float _2243 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2191);
    int _2245 = _2127 & 3;
    bool _2247 = _2245 != 0;
    int _2249 = _2183 + 8;
    uint _2251 = uint(int(uint(_2249) >> uint(2)));
    uint _2253 = uint(int(uint(int(_2251)) >> uint(2)));
    int _2255 = int(_2251) & 3;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[int(_2253)][_2255];
    int _2259 = int(_2251) + 1;
    uint _2261 = uint(int(uint(_2259) >> uint(2)));
    int _2263 = _2259 & 3;
    float _2265 = (*spvDescriptorSet0.vp_c9)._m0[int(_2261)][_2263];
    float _2267 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2233);
    float _2269 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2243);
    int _2271 = _2247 ? 0 : 1;
    float _2273 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2235);
    float _2275 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2237);
    float _2277 = _2215 * _2189;
    int _2279 = ~_2271;
    int _2281 = _2279 + 1;
    int _2283 = _2281 + 1;
    float _2285 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2287 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2275);
    int _2289 = _2283;
    float _2291 = _1635;
    if (!_2241)
    {
        int _2293 = ~_2271;
        int _2295 = _2293 + 1;
        _2289 = _2295;
    }
    int _2297 = _2289;
    float _2299 = _2215 * _2207;
    bool _2301 = _2193 != 3;
    float _2303 = exp2(_2285);
    bool _2305 = uint(_2193) >= 2u;
    float _2307 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2273);
    bool _2309 = !_2195;
    int _2311 = _2309 ? 0 : 1;
    float _2313 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2197);
    int _2315 = _2305 ? 0 : 1;
    float _2317 = fma(_2051, _2239, _2299);
    int _2319 = abs(_2297);
    float _2321 = _2215 * _2203;
    int _2323 = abs(_2311);
    float _2325 = fma(_2051, _2269, _2277);
    int _2327 = ~_2315;
    int _2329 = _2327 + 1;
    int _2331 = _2329 + 1;
    float _2333 = fma(_2051, _2267, _2321);
    bool _2335 = _2193 != 3;
    float _2337 = _1591 * 0.5;
    int _2339 = _2331;
    if (_2301)
    {
        int _2341 = ~_2315;
        int _2343 = _2341 + 1;
        _2339 = _2343;
    }
    int _2345 = _2339;
    float _2347 = _2313 + _2333;
    float _2349 = -_1661;
    float _2351 = _2349 + 1.0;
    int _2353 = ~_2319;
    int _2355 = _2353 + 1;
    int _2357 = _2355 + 1;
    float _2359 = _2287 + _2325;
    float _2361 = fma(_2303, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2363 = precise::clamp(_2361, 0.0, 1.0);
    bool _2365 = !_2335;
    int _2367 = _2365 ? 0 : (-1);
    float _2369 = _2307 + _2317;
    int _2371 = abs(_2345);
    int _2373 = _2357 * as_type<int>(_2231);
    int _2375 = ~_2323;
    int _2377 = _2375 + 1;
    int _2379 = _2377 + 1;
    out.m_80.x = _2369;
    out.m_80.y = _2359;
    out.m_80.z = _2347;
    bool _2381 = !_2091;
    int _2383 = _2381 ? 0 : 1;
    int _2385 = abs(_2367);
    int _2387 = _2379 * as_type<int>(_2223);
    int _2389 = _2387 + _2373;
    bool _2391 = !_2211;
    int _2393 = _2391 ? 0 : (-1);
    int _2395 = abs(_2383);
    int _2397 = ~_2371;
    int _2399 = _2397 + 1;
    int _2401 = _2399 + 1;
    int _2403 = ~_2155;
    int _2405 = _2403 + _2393;
    int _2407 = _2405 + 1;
    int _2409 = _2401 * as_type<int>(_2257);
    int _2411 = _2409 + _2389;
    int _2413 = _501 * _2407;
    int _2415 = _2413 + _1877;
    int _2417 = ~_2385;
    int _2419 = _2417 + 1;
    int _2421 = _2419 + 1;
    float _2423 = fma(_2363, -2.0, 3.0);
    int _2425 = ~_2395;
    int _2427 = _2425 + 1;
    int _2429 = _2427 + 1;
    float _2431 = _2363 * _2363;
    bool _2433 = !_1807;
    int _2435 = _2433 ? _2415 : (-1);
    int _2437 = _2421 * as_type<int>(_2265);
    int _2439 = _2437 + _2411;
    float _2441 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2443 = _2431 * _2423;
    bool _2445 = _1231 <= 8000.0;
    bool _2447 = isnan(_1231);
    bool _2449 = _2445 || _2447;
    bool _2451 = isnan(8000.0);
    bool _2453 = _2449 || _2451;
    float _2455 = float(_2453);
    int _2457 = _2439 * _2429;
    float _2459 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2441);
    float _2461 = -_2443;
    float _2463 = _2461 + 1.0;
    float _2465 = fma(_1641, -0.5, _2337);
    int _2467 = _2435 * _2395;
    int _2469 = _2467 + _2457;
    float _2471 = in.m_82.x;
    float _2473 = fma(_2463, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2443);
    float _2475 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2477 = float(_2469);
    float _2479 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2459);
    float _2481 = _2455 * _2473;
    float _2483 = _2475 * _1673;
    float _2485 = -_2475;
    float _2487 = _2485 + 1.0;
    out.m_84.x = _2477;
    float _2489 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2491 = _1694 * _2483;
    float _2493 = _1684 * _2487;
    bool _2495 = _1369 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2497 = isnan(_1369);
    bool _2499 = _2495 || _2497;
    bool _2501 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2503 = _2499 || _2501;
    float _2505 = _2351 * _2489;
    float _2507 = precise::clamp(_2505, 0.0, 1.0);
    float _2509 = fma(_1684, _2491, _1682);
    float _2511 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2479);
    float _2513 = _1684 * _2483;
    float _2515 = -_2507;
    float _2517 = fma(_2515, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2519 = _1635 + _1591;
    float _2521 = _2511 + _1591;
    float _2523 = fma(_1690, _2513, _1678);
    float _2525 = fma(_1692, _2513, _1680);
    float _2527 = _2521 * 0.5;
    float _2529 = _2517 * _2471;
    float _2531 = _2519 * 0.5;
    out.m_86.x = _2523;
    out.m_86.y = _2525;
    out.m_86.z = _2509;
    out.m_86.w = _2493;
    float _2533 = _1287 * _1347;
    float _2535 = _2529 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _1635;
    out.gl_Position.y = _1641;
    out.gl_Position.z = _2511;
    out.gl_Position.w = _1591;
    out.m_88.x = _2535;
    out.m_90.x = _2531;
    out.m_90.y = _2465;
    out.m_90.z = _2527;
    out.m_90.w = _1591;
    float _2537 = _2533 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2539 = _2533;
    float _2541 = _1591;
    float _2543 = _2527;
    float _2545 = _2465;
    float _2547 = _2531;
    if (!_2503)
    {
        _2291 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2549 = _2291;
    float _2551 = _2549;
    float _2553 = _2549;
    if (!_2503)
    {
        _2539 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2555 = _2539;
    float _2557 = _2555;
    float _2559 = _2555;
    if (!_2503)
    {
        _2541 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2561 = _2541;
    float _2563 = _2561;
    float _2565 = _2561;
    if (!_2503)
    {
        _2543 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2567 = _2543;
    float _2569 = _2567;
    float _2571 = _2567;
    if (!_2503)
    {
        _2545 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2573 = _2545;
    float _2575 = _2573;
    float _2577 = _2573;
    if (!_2503)
    {
        _2547 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2579 = _2547;
    bool _2581 = !_2503;
    float _2583 = _2579;
    float _2585 = _2579;
    if (!_2581)
    {
        bool _2587 = _1369 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2589 = isnan(_1369);
        bool _2591 = _2587 || _2589;
        bool _2593 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2595 = _2591 || _2593;
        if (!_2595)
        {
            float _2597 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2599 = _1369 + _2597;
            float _2601 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2603 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2601;
            float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2609 = 1.0 / _2603;
            float _2611 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2615 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2617 = _2615 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2619 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2621 = _2619 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2627 = _2599 * _2609;
            float _2629 = precise::clamp(_2627, 0.0, 1.0);
            float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2635 = fma(_2629, _2607, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2637 = fma(_2629, _2633, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2639 = fma(_2629, _2613, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2641 = fma(_2629, _2617, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2643 = fma(_2629, _2621, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2645 = fma(_2629, _2625, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2565 = _2639;
            _2585 = _2643;
            _2553 = _2635;
            _2577 = _2641;
            _2571 = _2637;
            _2559 = _2645;
            _2647 = true;
        }
        else
        {
            bool _2649 = _1369 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2651 = isnan(_1369);
            bool _2653 = _2649 || _2651;
            bool _2655 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2657 = _2653 || _2655;
            if (!_2657)
            {
                _2551 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2659 = _2551;
            _2553 = _2659;
            if (!_2657)
            {
                _2563 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2661 = _2563;
            _2565 = _2661;
            if (!_2657)
            {
                _2569 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2663 = _2569;
            _2571 = _2663;
            if (!_2657)
            {
                _2575 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2665 = _2575;
            _2577 = _2665;
            if (!_2657)
            {
                _2583 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2667 = _2583;
            _2585 = _2667;
            if (!_2657)
            {
                _2557 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2669 = _2557;
            bool _2671 = !_2657;
            _2559 = _2669;
            if (!_2671)
            {
                bool _2673 = _1369 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2675 = isnan(_1369);
                bool _2677 = _2673 || _2675;
                bool _2679 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2681 = _2677 || _2679;
                if (!_2681)
                {
                    float _2683 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2685 = _1369 + _2683;
                    float _2687 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2689 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2687;
                    float _2691 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2693 = _2691 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2695 = 1.0 / _2689;
                    float _2697 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2703 = _2701 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2707 = _2705 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2711 = _2709 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2713 = _2685 * _2695;
                    float _2715 = precise::clamp(_2713, 0.0, 1.0);
                    float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2721 = fma(_2715, _2693, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2723 = fma(_2715, _2719, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2725 = fma(_2715, _2699, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2727 = fma(_2715, _2703, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2729 = fma(_2715, _2707, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2731 = fma(_2715, _2711, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2565 = _2725;
                    _2585 = _2729;
                    _2553 = _2721;
                    _2577 = _2727;
                    _2571 = _2723;
                    _2559 = _2731;
                    _2647 = true;
                }
                else
                {
                    _2565 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2585 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2553 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2577 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2571 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2559 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2647 = false;
    float _2733 = _2565;
    float _2735 = _2585;
    float _2737 = _2553;
    float _2739 = _2577;
    float _2741 = _2571;
    float _2743 = _2559;
    float _2745 = fma(_2359, -0.5, 0.5);
    float _2747 = precise::clamp(_2745, 0.0, 1.0);
    float _2749 = -_2733;
    float _2751 = _2749 + _2735;
    float _2753 = _2537 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2755 = -_2737;
    float _2757 = _2755 + _2739;
    float _2759 = fma(_2747, _2751, _2733);
    out.m_92.x = 0.0;
    float _2761 = -_2741;
    float _2763 = _2761 + _2743;
    float _2765 = fma(_2747, _2757, _2737);
    float _2767 = _2759 * 0.586610972881317138671875;
    out.m_53.x = _2753;
    bool _2769 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2771 = fma(_2747, _2763, _2741);
    float _2773 = fma(_2765, 0.298911988735198974609375, _2767);
    bool _2775 = _1287 > 0.0;
    bool _2777 = isnan(_1287);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan(0.0);
    bool _2783 = _2779 || _2781;
    float _2785 = fma(_2771, 0.114477999508380889892578125, _2773);
    bool _2787 = _1347 <= 0.0;
    bool _2789 = !_2783;
    bool _2791 = _2787 || _2789;
    float _2793 = -_2785;
    float _2795 = _2765 + _2793;
    float _2797 = -_2785;
    float _2799 = _2759 + _2797;
    float _2801 = -_2785;
    float _2803 = _2771 + _2801;
    float _2805 = fma(_2795, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2785);
    float _2807 = fma(_2799, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2785);
    float _2809 = fma(_2803, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2785);
    bool _2811 = !_2769;
    if (!_2811)
    {
        float _2813 = -_1217;
        float _2815 = _2813 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2817 = -_1219;
        float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2821 = -_1221;
        float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2825 = _2815 * _2815;
        float _2827 = fma(_2819, _2819, _2825);
        float _2829 = fma(_2823, _2823, _2827);
        float _2831 = sqrt(_2829);
        float _2833 = rsqrt(_2829);
        float _2835 = -_2831;
        float _2837 = _2835 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2839 = _2837 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2841 = precise::clamp(_2839, 0.0, 1.0);
        float _2843 = _2819 * _2833;
        float _2845 = _2815 * _2833;
        float _2847 = abs(_2841);
        float _2849 = log2(_2847);
        float _2851 = _2823 * _2833;
        float _2853 = _2843 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2855 = _2359 * _2845;
        float _2857 = -_2845;
        float _2859 = -_2853;
        float _2861 = fma(_2857, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2859);
        float _2863 = fma(_2369, _2843, _2855);
        float _2865 = -_2851;
        float _2867 = fma(_2865, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2861);
        float _2869 = fma(_2347, _2851, _2863);
        float _2871 = precise::clamp(_2869, 0.0, 1.0);
        float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2875 = _2867 + _2873;
        float _2877 = _2849 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2879 = _2875 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2881 = precise::clamp(_2879, 0.0, 1.0);
        float _2883 = exp2(_2877);
        float _2885 = _2883 * _2881;
        float _2887 = _2871 * _2885;
        float _2889 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2891 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2893 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2889;
        out.m_92.y = _2891;
        out.m_92.z = _2893;
    }
    out.m_68.x = _2805;
    out.m_68.y = _2807;
    out.m_68.z = _2809;
    if (!_2791)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2895 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2895;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2647 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_46.w;
    float _108 = in.m_48.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = as_type<float>(_113);
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_53.x = 0.0;
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
        float _2964 = as_type<float>(_135);
        out.gl_Position.z = _2964;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        out.m_53.x = 0.0;
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
        float _3019 = as_type<float>(_161);
        out.gl_Position.z = _3019;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = in.m_55.x;
    float _165 = in.m_55.y;
    float _167 = in.m_55.z;
    float _169 = 1.0 / _149;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _117 * _169;
    float _175 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _177 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _179 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _175);
    float _183 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _177);
    float _185 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _187 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    float _189 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    float _191 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _185);
    bool _193 = !_171;
    float _195 = _173;
    float _213;
    if (!_193)
    {
        float _197 = in.m_57.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        _213 = _173;
    }
    _215 = false;
    float _217 = _213;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _217 + _219;
    float _223 = in.m_59.x;
    float _225 = in.m_59.y;
    bool _227 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _229 = isnan(_217);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    bool _243 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _245 = isnan(_217);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = -_237;
    float _257 = _255 + 1.0;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _259;
    float _263 = 1.0 / _241;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _267 = _253 * _257;
    float _269 = -_253;
    float _271 = _269 + 1.0;
    float _273 = _221 * _263;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _275;
    float _279 = fma(_261, _273, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _281 = fma(_277, _273, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _283 = _279 * _267;
    float _285 = _281 * _267;
    float _287 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[143].x, _283);
    float _289 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[143].y, _285);
    float _291 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[144].x, _287);
    float _293 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[144].y, _289);
    float _295 = _291 * _223;
    float _297 = _293 * _225;
    bool _299 = !_265;
    if (!_299)
    {
        float _301 = in.m_57.x;
        float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _305 = _301 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _309 = _307 * _303;
        float _311 = floor(_309);
        float _313 = -_311;
        float _315 = _309 + _313;
        _195 = _315;
    }
    float _317 = _195;
    float _319 = in.m_57.x;
    float _321 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _323 = log2(_321);
    float _325 = _297 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _327 = in.m_57.y;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _331 = in.m_57.z;
    float _333 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _335 = int(_333);
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _339 = in.m_46.x;
    float _341 = in.m_46.y;
    float _343 = in.m_46.z;
    int _345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _347 = _345 != 0;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _351 = _349 != 0;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _355 = _353 != 0;
    float _357 = _323 * _117;
    bool _359 = !_351;
    int _361 = _359 ? 0 : 1;
    bool _363 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _365 = isnan(0.0);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _371 = _367 || _369;
    float _373 = exp2(_357);
    float _375 = _319 * 2.0;
    float _377 = _319 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _379 = !_347;
    int _381 = _379 ? 0 : 1;
    float _383 = _327 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _385 = _327 * 2.0;
    float _387 = -_337;
    float _389 = fma(_377, 2.0, _387);
    float _391 = floor(_375);
    float _393 = fma(_383, -2.0, _329);
    float _395 = _331 * 2.0;
    float _397 = _319 + _327;
    float _399 = float(_335);
    float _401 = _341 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _403 = _341 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _405 = _341 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _407 = floor(_385);
    float _409 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[5].x, _401);
    float _411 = _397 + (-1.0);
    float _413 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[4].x, _403);
    float _415 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[6].x, _405);
    float _417 = -_373;
    float _419 = _417 + 1.0;
    float _421 = _327 + _331;
    float _423 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _425 = floor(_395);
    bool _427 = _391 >= 0.0;
    bool _429 = isnan(_391);
    bool _431 = _427 || _429;
    bool _433 = isnan(0.0);
    bool _435 = _431 || _433;
    float _437 = _421 + (-1.0);
    float _439 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].z, _415);
    int _441 = _435 ? 0 : 1;
    float _443 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _393);
    bool _445 = _391 > 0.0;
    float _447 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].z, _413);
    bool _449 = _407 > 0.0;
    float _451 = 1.0 / _399;
    bool _453 = _407 >= 0.0;
    bool _455 = isnan(_407);
    bool _457 = _453 || _455;
    bool _459 = isnan(0.0);
    bool _461 = _457 || _459;
    float _463 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].z, _409);
    float _465 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _467 = _371 ? _419 : 0.0;
    float _469 = _447 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _471 = _425 > 0.0;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _475 = _425 >= 0.0;
    bool _477 = isnan(_425);
    bool _479 = _475 || _477;
    bool _481 = isnan(0.0);
    bool _483 = _479 || _481;
    float _485 = _463 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _487 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[78].w, _473);
    int _489 = _483 ? 0 : 1;
    float _491 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _493 = _485 + _491;
    bool _495 = !_355;
    int _497 = _495 ? 0 : 1;
    float _499 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _501 = int(_499);
    int _503 = ~_489;
    int _505 = _503 + 1;
    int _507 = _505 + 1;
    float _509 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _487);
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _513 = _511 != 0;
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _517 = _515 != 0;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _521 = _519 != 0;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _525 = _507;
    if (!_471)
    {
        int _527 = ~_489;
        int _529 = _527 + 1;
        _525 = _529;
    }
    int _531 = _525;
    float _533 = _439 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _535 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _537 = isnan(1.0);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _543 = _539 || _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _547 = 1.0 + _545;
    float _549 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _551 = _469 + _549;
    float _553 = _493 * _493;
    bool _555 = !_513;
    int _557 = _555 ? 0 : 1;
    float _559 = 1.0 / _547;
    float _561 = in.m_61.x;
    float _563 = in.m_61.y;
    float _565 = in.m_61.z;
    float _567 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[78].z, _523);
    float _569 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _571 = _533 + _569;
    int _573 = abs(_557);
    float _575 = -_117;
    float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[76].x, _389);
    float _579 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _567);
    bool _581 = !_517;
    int _583 = _581 ? 0 : 1;
    float _585 = _451 * _117;
    float _587 = fma(_551, _551, _553);
    int _589 = abs(_583);
    float _591 = fma(_571, _571, _587);
    float _593 = float(_573);
    float _595 = float(_501);
    float _597 = sqrt(_591);
    float _599 = float(_531);
    int _601 = ~_441;
    int _603 = _601 + 1;
    int _605 = _603 + 1;
    float _607 = _595 * _117;
    int _609 = _605;
    if (_543)
    {
        float _611 = _467 * _559;
        _127 = _611;
    }
    float _613 = _127;
    float _615 = _593 * _599;
    if (!_445)
    {
        int _617 = ~_441;
        int _619 = _617 + 1;
        _609 = _619;
    }
    int _621 = _609;
    float _623 = rsqrt(_591);
    float _625 = _295 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _627 = _615 * (-2.0);
    float _629 = float(_621);
    float _631 = _319 + (-0.5);
    float _633 = float(_589);
    float _635 = _625 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _637 = fma(_627, _561, _561);
    float _639 = _597 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _641 = fma(_423, _627, _423);
    float _643 = _633 * _629;
    float _645 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[196].x, _637);
    bool _647 = !_521;
    int _649 = _647 ? 0 : 1;
    float _651 = precise::min(_635, _639);
    float _653 = _643 * (-2.0);
    int _655 = _461 ? 0 : 1;
    float _657 = fma(_641, _613, _645);
    float _659 = _623 * _651;
    float _661 = fma(_653, _563, _563);
    float _663 = fma(_465, _653, _465);
    int _665 = abs(_649);
    float _667 = _493 * _659;
    int _669 = ~_655;
    int _671 = _669 + 1;
    int _673 = _671 + 1;
    float _675 = _551 * _659;
    int _677 = _673;
    float _679 = _675;
    float _681 = _667;
    if (!_449)
    {
        int _683 = ~_655;
        int _685 = _683 + 1;
        _677 = _685;
    }
    int _687 = _677;
    float _689 = -_667;
    float _691 = _493 + _689;
    float _693 = _327 + (-0.5);
    float _695 = -_675;
    float _697 = _551 + _695;
    float _699 = float(_687);
    float _701 = _691 * _691;
    float _703 = float(_665);
    float _705 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[196].y, _661);
    float _707 = _657 * 0.15915493667125701904296875;
    float _709 = fma(_697, _697, _701);
    float _711 = _571 * _659;
    float _713 = fma(_663, _613, _705);
    float _715 = _703 * _699;
    float _717 = _319 + _331;
    float _719 = as_type<float>(int(gl_VertexIndex));
    float _721 = -_711;
    float _723 = _571 + _721;
    float _725 = _717 + (-1.0);
    float _727 = _715 * (-2.0);
    float _729 = _331 + (-0.5);
    float _731 = fma(_723, _723, _709);
    float _733 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _735 = fma(_727, _565, _565);
    float _737 = _707 * 6.283185482025146484375;
    float _739 = sin(_737);
    float _741 = _713 * 0.15915493667125701904296875;
    float _743 = fma(_733, _727, _733);
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[196].z, _735);
    float _747 = fma(_743, _613, _745);
    float _749 = _707 * 6.283185482025146484375;
    float _751 = cos(_749);
    float _753 = _747 * 0.15915493667125701904296875;
    int _755 = as_type<int>(_719) & 1;
    bool _757 = _755 != 0;
    int _759 = as_type<int>(_719) & 2;
    bool _761 = _759 != 0;
    float _763 = sqrt(_731);
    bool _765 = !_761;
    float _767 = _765 ? (-0.5) : 0.5;
    bool _769 = !_757;
    float _771 = _769 ? (-0.5) : 0.5;
    float _773 = _741 * 6.283185482025146484375;
    float _775 = cos(_773);
    float _777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _767);
    float _779 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _771);
    float _781 = _753 * 6.283185482025146484375;
    float _783 = cos(_781);
    float _785 = _623 * _763;
    float _787 = _325 * _785;
    float _789 = _741 * 6.283185482025146484375;
    float _791 = sin(_789);
    float _793 = _787 * _777;
    float _795 = _739 * _775;
    float _797 = _751 * _775;
    float _799 = _753 * 6.283185482025146484375;
    float _801 = sin(_799);
    float _803 = _775 * _783;
    float _805 = _625 * _785;
    float _807 = _805 * _779;
    float _809 = _751 * _791;
    float _811 = _739 * _791;
    float _813 = _751 * _783;
    float _815 = _739 * _783;
    float _817 = _791 * _783;
    float _819 = _785 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _821 = _819 * 0.5;
    float _823 = _813 * _793;
    float _825 = -_711;
    float _827 = _533 + _825;
    float _829 = fma(_801, _797, _811);
    float _831 = -_795;
    float _833 = fma(_801, _809, _831);
    float _835 = -_793;
    float _837 = _801 * _835;
    float _839 = -_809;
    float _841 = fma(_801, _795, _839);
    float _843 = fma(_829, _807, _823);
    float _845 = _815 * _793;
    float _847 = fma(_803, _807, _837);
    float _849 = fma(_801, _811, _797);
    float _851 = fma(_833, _821, _843);
    float _853 = fma(_841, _807, _845);
    float _855 = fma(_817, _821, _847);
    float _857 = _851 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _859 = fma(_849, _821, _853);
    float _861 = _851 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _863 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[26].x, _857);
    float _865 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[24].x, _861);
    float _867 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[26].z, _863);
    float _869 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[24].z, _865);
    float _871 = _867 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _873 = _851 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _875 = _869 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _877 = _533 + _871;
    float _879 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[25].x, _873);
    float _881 = _469 + _875;
    float _883 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _885 = _877 + _883;
    float _887 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[25].z, _879);
    float _889 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _891 = _881 + _889;
    float _893 = -_675;
    float _895 = _469 + _893;
    float _897 = _885 * _885;
    float _899 = _887 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _901 = fma(_891, _891, _897);
    float _903 = -_667;
    float _905 = _485 + _903;
    float _907 = _485 + _899;
    float _909 = sqrt(_901);
    float _911 = _905 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _913 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[11].x, _911);
    float _915 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[11].z, _913);
    bool _917 = _909 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _919 = _913;
    float _921 = _881;
    float _923 = _877;
    if (!_917)
    {
        _919 = _907;
    }
    float _925 = _919;
    bool _927 = !_917;
    float _929 = _925;
    if (!_927)
    {
        float _931 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _933 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _935 = _909 + _933;
        float _937 = _907 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _939 = rsqrt(_901);
        float _941 = _935 * _931;
        float _943 = _941 * 0.15915493667125701904296875;
        float _945 = _943 * 6.283185482025146484375;
        float _947 = cos(_945);
        float _949 = _943 * 6.283185482025146484375;
        float _951 = sin(_949);
        float _953 = _947 + (-1.0);
        float _955 = _953 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _957 = fma(_951, _937, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _959 = fma(_907, _947, _955);
        float _961 = _939 * _957;
        float _963 = fma(_891, _961, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _965 = fma(_885, _961, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _929 = _959;
        _921 = _963;
        _923 = _965;
    }
    float _967 = _929;
    float _969 = _921;
    float _971 = _923;
    float _973 = -_485;
    float _975 = _973 + _967;
    float _977 = -_469;
    float _979 = _977 + _969;
    float _981 = _915 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _983 = _905 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _985 = _975 * _975;
    float _987 = -_533;
    float _989 = _987 + _971;
    float _991 = 1.0 / _981;
    float _993 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[10].x, _983);
    float _995 = fma(_979, _979, _985);
    float _997 = -_675;
    float _999 = _997 + _969;
    float _1001 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[10].z, _993);
    float _1003 = fma(_989, _989, _995);
    float _1005 = -_711;
    float _1007 = _1005 + _971;
    float _1009 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1011 = sqrt(_1003);
    bool _1013 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1015 = isnan(0.5);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1021 = _1017 || _1019;
    float _1023 = _1009 + _981;
    float _1025 = -_667;
    float _1027 = _1025 + _967;
    bool _1029 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1031 = isnan(0.5);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1037 = _1033 || _1035;
    float _1039 = _1023 * _991;
    float _1041 = _1039 * 0.5;
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1045 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1043);
    float _1047 = 1.0 / _1045;
    bool _1049 = _1011 > 0.0;
    float _1051 = _1011;
    float _1053 = _979;
    float _1055 = _967;
    float _1057 = _995;
    float _1059 = _1045;
    float _1061 = _1027;
    float _1063 = _971;
    float _1065 = _999;
    if (!_1049)
    {
        _679 = _999;
    }
    float _1067 = _679;
    float _1069 = _1067;
    if (!_1049)
    {
        _681 = _1027;
    }
    float _1071 = _681;
    float _1073 = _1071;
    if (!_1049)
    {
        _1051 = _1007;
    }
    float _1075 = _1051;
    bool _1077 = !_1049;
    float _1079 = _1075;
    float _1081 = _1075;
    if (!_1077)
    {
        float _1083 = _189 * _189;
        float _1085 = fma(_187, _187, _1083);
        float _1087 = fma(_191, _191, _1085);
        float _1089 = rsqrt(_1003);
        float _1091 = sqrt(_1087);
        float _1093 = _979 * _1089;
        float _1095 = _975 * _1089;
        float _1097 = _989 * _1089;
        bool _1099 = _1091 > 0.0;
        float _1101 = _1091;
        float _1103 = _1089;
        _1053 = _1093;
        _1055 = _1095;
        _1057 = _1087;
        if (!_1099)
        {
            _1101 = _999;
        }
        float _1105 = _1101;
        _1069 = _1105;
        if (!_1099)
        {
            _1103 = _1027;
        }
        float _1107 = _1103;
        _1073 = _1107;
        if (!_1099)
        {
            _1079 = _1007;
        }
        float _1109 = _1079;
        bool _1111 = !_1099;
        _1081 = _1109;
        if (!_1111)
        {
            float _1113 = rsqrt(_1087);
            float _1115 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1117 = _189 * _1113;
            float _1119 = _187 * _1113;
            float _1121 = _191 * _1113;
            float _1123 = _1095 * _1117;
            float _1125 = fma(_1093, _1119, _1123);
            float _1127 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1129 = fma(_1097, _1121, _1125);
            float _1131 = _1129 * _1127;
            float _1133 = fma(_187, _1131, _999);
            float _1135 = fma(_189, _1131, _1027);
            float _1137 = fma(_191, _1131, _1007);
            _1069 = _1133;
            _1073 = _1135;
            _1081 = _1137;
            _1053 = _1131;
        }
    }
    float _1139 = _1069;
    float _1141 = _1073;
    float _1143 = _1081;
    float _1145 = _1053;
    float _1147 = _1055;
    float _1149 = _1057;
    float _1151 = _1141;
    float _1153 = _1139;
    float _1155 = _1143;
    float _1157 = _1145;
    float _1159 = _1149;
    float _1161 = _1147;
    if (_1037)
    {
        _1059 = 1.0;
    }
    float _1163 = _1059;
    float _1165 = _1163;
    if (!_1021)
    {
        float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1169 = _905 + _1167;
        float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1173 = _895 + _1171;
        float _1175 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1177 = _1169 * _1169;
        float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1181 = _827 + _1179;
        float _1183 = fma(_1173, _1173, _1177);
        float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1187 = fma(_1181, _1181, _1183);
        float _1189 = sqrt(_1187);
        float _1191 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1193 = precise::min(_1189, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1195 = _1193 * _1185;
        float _1197 = -_895;
        float _1199 = _1197 + _1139;
        float _1201 = _1191 * _1195;
        float _1203 = -_905;
        float _1205 = _1203 + _1141;
        float _1207 = -_827;
        float _1209 = _1207 + _1143;
        float _1211 = fma(_1199, _1201, _895);
        float _1213 = fma(_1205, _1201, _905);
        float _1215 = fma(_1209, _1201, _827);
        _1151 = _1213;
        _1153 = _1211;
        _1155 = _1215;
        _1157 = _1201;
    }
    float _1217 = _1151;
    float _1219 = _1153;
    float _1221 = _1155;
    float _1223 = _1157;
    float _1225 = _1223;
    if (_1037)
    {
        _1061 = 1.0;
    }
    float _1227 = _1061;
    float _1229 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1231 = _1047 * _1229;
    float _1233 = _1227;
    if (!_1037)
    {
        float _1235 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1237 = _1235 * 0.15915493667125701904296875;
        float _1239 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1241 = _1237 * 6.283185482025146484375;
        float _1243 = cos(_1241);
        float _1245 = _1239 * 0.15915493667125701904296875;
        float _1247 = _1237 * 6.283185482025146484375;
        float _1249 = sin(_1247);
        float _1251 = 1.0 / _1243;
        float _1253 = _1245 * 6.283185482025146484375;
        float _1255 = cos(_1253);
        float _1257 = _1249 * _1251;
        float _1259 = _1245 * 6.283185482025146484375;
        float _1261 = sin(_1259);
        float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1265 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1263;
        float _1267 = _1255 * _1257;
        float _1269 = 1.0 / _1265;
        float _1271 = 1.0 / _1267;
        float _1273 = _1261 * _1271;
        float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1277 = fma(_1231, _1273, _1275);
        float _1279 = _1277 * _1269;
        float _1281 = precise::clamp(_1279, 0.0, 1.0);
        _1225 = _1245;
        _1159 = _1237;
        _1165 = _1281;
    }
    float _1283 = _1225;
    float _1285 = _1159;
    float _1287 = _1165;
    float _1289 = _1283;
    if (!_1037)
    {
        float _1291 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1293 = _1291 * 0.15915493667125701904296875;
        float _1295 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1297 = _1293 * 6.283185482025146484375;
        float _1299 = cos(_1297);
        float _1301 = _1295 * 0.15915493667125701904296875;
        float _1303 = _1293 * 6.283185482025146484375;
        float _1305 = sin(_1303);
        float _1307 = 1.0 / _1299;
        float _1309 = _1301 * 6.283185482025146484375;
        float _1311 = cos(_1309);
        float _1313 = _1305 * _1307;
        float _1315 = _1301 * 6.283185482025146484375;
        float _1317 = sin(_1315);
        float _1319 = _1311 * _1313;
        float _1321 = 1.0 / _1319;
        float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1325 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1323;
        float _1327 = 1.0 / _1325;
        float _1329 = _1317 * _1321;
        float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1333 = fma(_1231, _1329, _1331);
        float _1335 = _1333 * _1327;
        float _1337 = precise::clamp(_1335, 0.0, 1.0);
        float _1339 = -_1337;
        float _1341 = _1339 + 1.0;
        _1063 = _1319;
        _1289 = _1321;
        _1233 = _1341;
    }
    float _1343 = _1063;
    float _1345 = _1289;
    float _1347 = _1233;
    float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1351 = _1217 + _1349;
    float _1353 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1355 = _1219 + _1353;
    float _1357 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1359 = _1221 + _1357;
    float _1361 = _1351 * _1351;
    float _1363 = fma(_1355, _1355, _1361);
    float _1365 = fma(_1359, _1359, _1363);
    float _1367 = rsqrt(_1365);
    float _1369 = sqrt(_1365);
    float _1371 = _1367 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1373 = _1355 * _1371;
    float _1375 = _1359 * _1371;
    float _1377 = _1373 * _1373;
    float _1379 = _1375 * _1375;
    float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1383 = fma(_1369, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1381);
    float _1385 = precise::clamp(_1383, 0.0, 1.0);
    float _1387 = _1377 + _1379;
    float _1389 = sqrt(_1387);
    bool _1391 = _1389 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1393 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1395 = _1389 + _1393;
    float _1397 = _1343;
    float _1399 = _1387;
    float _1401 = _1395;
    float _1403 = _1351;
    float _1405 = _1373;
    float _1407 = _1375;
    if (_1391)
    {
        float _1409 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1397 = _1409;
    }
    float _1411 = _1397;
    if (_1391)
    {
        float _1413 = rsqrt(_1387);
        _1399 = _1413;
    }
    float _1415 = _1399;
    float _1417 = _1411;
    if (_1391)
    {
        float _1419 = _1395 * _1411;
        _1401 = _1419;
    }
    float _1421 = _1401;
    if (_1391)
    {
        float _1423 = _1421 * 0.15915493667125701904296875;
        _1161 = _1423;
    }
    float _1425 = _1161;
    float _1427 = _1345;
    float _1429 = _1425;
    if (_1391)
    {
        float _1431 = _1425 * 6.283185482025146484375;
        float _1433 = sin(_1431);
        _1427 = _1433;
    }
    float _1435 = _1427;
    float _1437 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1439 = precise::max(0.0, _1437);
    float _1441 = _1285;
    if (_1391)
    {
        float _1443 = _1425 * 6.283185482025146484375;
        float _1445 = cos(_1443);
        _1441 = _1445;
    }
    float _1447 = _1441;
    float _1449 = -_1371;
    float _1451 = -_1439;
    float _1453 = fma(_1351, _1449, _1451);
    if (_1391)
    {
        float _1455 = _1453 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1403 = _1455;
    }
    float _1457 = _1403;
    float _1459 = fma(_895, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1461 = _1435;
    if (_1391)
    {
        float _1463 = fma(_1435, _1457, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1065 = _1463;
    }
    float _1465 = _1065;
    float _1467 = _1465;
    if (!_1391)
    {
        _1461 = _1453;
    }
    float _1469 = _1461;
    float _1471 = floor(_1459);
    float _1473 = _1469;
    float _1475 = _1447;
    if (_1391)
    {
        float _1477 = _1447 + (-1.0);
        _1417 = _1477;
    }
    float _1479 = _1417;
    float _1481 = _1479;
    if (_1391)
    {
        float _1483 = _1415 * _1465;
        _1429 = _1483;
    }
    float _1485 = _1429;
    if (_1391)
    {
        float _1487 = _1479 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1467 = _1487;
    }
    float _1489 = _1467;
    if (_1391)
    {
        float _1491 = _1373 * _1485;
        _1405 = _1491;
    }
    float _1493 = _1405;
    if (!_1391)
    {
        _1481 = _1377;
    }
    float _1495 = _1481;
    float _1497 = _1495;
    if (_1391)
    {
        float _1499 = _1375 * _1485;
        _1407 = _1499;
    }
    float _1501 = _1407;
    if (_1391)
    {
        float _1503 = fma(_1453, _1447, _1489);
        _1473 = _1503;
    }
    float _1505 = _1473;
    if (_1391)
    {
        float _1507 = _1493 * _1493;
        _1497 = _1507;
    }
    float _1509 = _1497;
    if (!_1391)
    {
        _1475 = _1379;
    }
    float _1511 = _1475;
    float _1513 = _1511;
    if (_1391)
    {
        float _1515 = _1501 * _1501;
        _1513 = _1515;
    }
    float _1517 = _1513;
    float _1519 = fma(_1505, _1505, _1509);
    float _1521 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1523 = fma(_827, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1525 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1527 = _1519 + _1517;
    float _1529 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1531 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1533 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1521);
    float _1535 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1525);
    float _1537 = _1217 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1539 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1531);
    float _1541 = rsqrt(_1527);
    float _1543 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1533);
    float _1545 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1535);
    float _1547 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1539);
    float _1549 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1537);
    float _1551 = _1543 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1553 = -_1385;
    float _1555 = _1553 + 1.0;
    float _1557 = _1547 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1559 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1561 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1563 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1549);
    float _1565 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1567 = abs(_1555);
    float _1569 = log2(_1567);
    float _1571 = -_1561;
    float _1573 = fma(_1571, _1529, 1.0);
    float _1575 = _1563 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1577 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1565);
    float _1579 = _1541 * _1493;
    float _1581 = _1541 * _1501;
    float _1583 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1577);
    float _1585 = _1541 * _1505;
    float _1587 = floor(_1523);
    float _1589 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1591 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1583);
    float _1593 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1595 = -_1593;
    float _1597 = fma(_1585, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1595);
    float _1599 = _1569 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1601 = -_1471;
    float _1603 = _1459 + _1601;
    float _1605 = 1.0 / _1591;
    float _1607 = -_1581;
    float _1609 = fma(_1607, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1597);
    float _1611 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1613 = fma(_1609, -0.5, 0.5);
    float _1615 = -_1587;
    float _1617 = _1523 + _1615;
    float _1619 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1611);
    float _1621 = log2(_1573);
    float _1623 = fma(_1609, 0.5, 0.5);
    float _1625 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1589);
    float _1627 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1619);
    float _1629 = _1585 + 1.0;
    float _1631 = fma(_1623, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1633 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1625);
    float _1635 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1627);
    float _1637 = exp2(_1599);
    float _1639 = fma(_1623, _1631, -0.212114393711090087890625);
    float _1641 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1633);
    float _1643 = _1635 * _1605;
    float _1645 = fma(_1623, _1639, 1.570728778839111328125);
    float _1647 = _1641 * _1605;
    float _1649 = sqrt(_1613);
    float _1651 = _1621 * 0.693147182464599609375;
    float _1653 = fma(_1647, -0.5, 0.5);
    float _1655 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1657 = -_1585;
    float _1659 = fma(_1637, _1629, _1657);
    float2 _5318 = float2(_1603, _1617);
    float _1661 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5318, float2(0.0), isnan(_5318)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5318, float2(0.0), isnan(_5318)), level(0.0)).x;
    float _1663 = fma(_1659, 0.5, 0.5);
    float _1665 = _1649 * 0.636619746685028076171875;
    float _1667 = fma(_1643, 0.5, 0.5);
    float _1669 = -_1645;
    float _1671 = fma(_1665, _1669, 1.0);
    float3 _5341 = float3(_1667, _1653, _1655);
    float _1673 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5341, float3(0.0), isnan(_5341)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5341, float3(0.0), isnan(_5341)), level(0.0)).x;
    float3 _5352 = float3(_1667, _1653, _1655);
    float4 _1676 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5352, float3(0.0), isnan(_5352)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5352, float3(0.0), isnan(_5352)), level(0.0)).xyzw;
    float _1678 = _1676.x;
    float _1680 = _1676.y;
    float _1682 = _1676.z;
    float _1684 = _1676.w;
    float2 _5368 = float2(_1671, _1663);
    float3 _1688 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5368, float2(0.0), isnan(_5368)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5368, float2(0.0), isnan(_5368)), level(0.0)).xyz;
    float _1690 = _1688.x;
    float _1692 = _1688.y;
    float _1694 = _1688.z;
    float _1696 = float(uint(_501));
    float _1698 = trunc(_585);
    int _1700 = int(_1698);
    float _1702 = _607 * _169;
    bool _1704 = _327 > 0.5;
    float _1706 = -_509;
    float _1708 = _1706 + 1.0;
    float _1710 = -_579;
    float _1712 = _1710 + 1.0;
    out.m_66.x = _895;
    out.m_66.y = _905;
    out.m_66.z = _827;
    float _1714 = _1569 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1716 = 1.0 / _1696;
    int _1718 = ~_501;
    int _1720 = _1718 + 1;
    out.m_68.w = _651;
    int _1722 = ~_501;
    int _1724 = _1722 + 1;
    int _1726 = _501 + (-1);
    out.m_70.x = _805;
    float _1728 = float(uint(_1700));
    float _1730 = trunc(_1702);
    int _1732 = int(_1730);
    out.m_72.x = _1219;
    out.m_72.y = _1217;
    out.m_72.z = _1221;
    int _1734 = as_type<int>(_1716) + (-2);
    float _1736 = exp2(_1714);
    float _1738 = as_type<float>(_1734) * _1728;
    float _1740 = trunc(_1738);
    float _1742 = precise::max(_1740, 0.0);
    uint _1745 = uint(_1742);
    float _1747 = -_1736;
    float _1749 = _1747 + 1.0;
    int _1751 = _1720 * int(_1745);
    int _1753 = _1751 + _1700;
    float _1755 = float(uint(_1753));
    float _1757 = as_type<float>(_1734) * _1755;
    int _1759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1761 = _1759 != 0;
    float _1763 = trunc(_1757);
    float _1765 = precise::max(_1763, 0.0);
    uint _1767 = uint(_1765);
    bool _1769 = !_1761;
    float _1771 = _1769 ? 7.345489978790283203125 : 1.0;
    float _1773 = _1771 * _319;
    float _1775 = float(_1700);
    bool _1777 = _1775 >= _595;
    bool _1779 = isnan(_1775);
    bool _1781 = _1777 || _1779;
    bool _1783 = isnan(_595);
    bool _1785 = _1781 || _1783;
    float _1787 = float(_1785);
    int _1789 = int(_1745) + int(_1767);
    float _1791 = floor(_1773);
    int _1793 = _1724 * _1789;
    int _1795 = _1793 + _1700;
    bool _1797 = uint(_1795) >= uint(_501);
    float _1799 = trunc(_1787);
    int _1801 = int(_1799);
    bool _1803 = !_1797;
    int _1805 = _1803 ? 0 : (-1);
    bool _1807 = _501 == 0;
    int _1809 = ~_1789;
    int _1811 = _1809 + _1805;
    int _1813 = _1811 + 1;
    float _1815 = -_1791;
    float _1817 = _1773 + _1815;
    int _1819 = _501 * _1813;
    int _1821 = _1819 + _1700;
    float _1823 = _1817 * _595;
    int _1825 = ~_1801;
    int _1827 = _1825 + 1;
    int _1829 = _1827 + 1;
    float _1831 = trunc(_1823);
    int _1833 = int(_1831);
    bool _1835 = !_1807;
    int _1837 = _1835 ? _1821 : (-1);
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1841 = _1839 != 0;
    int _1843 = ~_501;
    int _1845 = _1843 + 1;
    int _1847 = _1837 * _1829;
    bool _1849 = !_1841;
    int _1851 = _1849 ? 0 : 1;
    int _1853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1855 = _1853 != 0;
    int _1857 = _1801 * _1726;
    int _1859 = _1857 + _1847;
    int _1861 = abs(_361);
    int _1863 = abs(_381);
    int _1865 = abs(_1851);
    bool _1867 = !_1855;
    int _1869 = _1867 ? 0 : 1;
    int _1871 = _1859 * _1861;
    int _1873 = abs(_497);
    int _1875 = _1833 * _1865;
    int _1877 = _1875 + _1700;
    int _1879 = abs(_1869);
    int _1881 = _1732 * _1863;
    int _1883 = _1881 + _1871;
    int _1885 = _1877 * _1873;
    int _1887 = _1885 + _1883;
    float _1889 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1893 = _1891 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1895 = float(uint(_1877));
    int _1897 = _1833 * _1879;
    int _1899 = _1897 + _1887;
    bool _1901 = _319 > 0.5;
    float _1903 = _1889 * _319;
    int _1905 = ~_501;
    int _1907 = _1905 + 1;
    float _1909 = 1.0 / _1893;
    float _1911 = float(uint(_1899));
    float _1913 = as_type<float>(_1734) * _1895;
    int _1915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1917 = _1915 != 0;
    float _1919 = -_771;
    int _1921 = _1901 ? as_type<int>(_1919) : as_type<int>(_771);
    float _1923 = as_type<float>(_1734) * _1911;
    int _1925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1927 = _1925 != 0;
    float _1929 = trunc(_1903);
    int _1931 = int(_1929);
    float _1933 = trunc(_1923);
    float _1935 = precise::max(_1933, 0.0);
    uint _1937 = uint(_1935);
    int _1939 = _1931 << 4;
    int _1941 = _1939 + 1968;
    float _1943 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1943;
    float _1947 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1949 = _317 + _1947;
    int _1951 = _1941 + 8;
    uint _1953 = uint(int(uint(_1951) >> uint(2)));
    uint _1955 = uint(int(uint(int(_1953)) >> uint(2)));
    int _1957 = int(_1953) & 3;
    float _1959 = (*spvDescriptorSet0.vp_c9)._m0[int(_1955)][_1957];
    float _1961 = _1945 * _1909;
    bool _1963 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1965 = isnan(_317);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1971 = _1967 || _1969;
    float _1973 = float(_1971);
    int _1975 = _1907 * int(_1937);
    int _1977 = _1975 + _1899;
    float _1979 = fma(_1961, _1949, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1981 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1983 = isnan(_317);
    bool _1985 = _1981 || _1983;
    bool _1987 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1989 = _1985 || _1987;
    float _1991 = float(_1989);
    float _1993 = trunc(_1913);
    float _1995 = precise::max(_1993, 0.0);
    uint _1997 = uint(_1995);
    float _1999 = float(uint(_1977));
    uint _2001 = uint(int(uint(_1941) >> uint(2)));
    uint _2003 = uint(int(uint(int(_2001)) >> uint(2)));
    int _2005 = int(_2001) & 3;
    float _2007 = (*spvDescriptorSet0.vp_c9)._m0[int(_2003)][_2005];
    int _2009 = int(_2001) + 1;
    uint _2011 = uint(int(uint(_2009) >> uint(2)));
    int _2013 = _2009 & 3;
    float _2015 = (*spvDescriptorSet0.vp_c9)._m0[int(_2011)][_2013];
    float _2017 = as_type<float>(_1734) * _1999;
    float _2019 = -_1973;
    float _2021 = _2019 + 1.0;
    float _2023 = _1991 * _2021;
    float _2025 = trunc(_2017);
    float _2027 = precise::max(_2025, 0.0);
    uint _2029 = uint(_2027);
    float _2031 = _1979 * _2023;
    int _2033 = ~_501;
    int _2035 = _2033 + 1;
    float _2037 = -_767;
    int _2039 = _1704 ? as_type<int>(_2037) : as_type<int>(_767);
    int _2041 = int(_1937) + int(_2029);
    float _2043 = -_1991;
    float _2045 = _2043 + 1.0;
    bool _2047 = !_1917;
    float _2049 = _2047 ? _771 : as_type<float>(_1921);
    float _2051 = _771 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2053 = !_1927;
    float _2055 = _2053 ? _767 : as_type<float>(_2039);
    int _2057 = _1845 * _2041;
    int _2059 = _2057 + _1899;
    float _2061 = fma(_2045, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2031);
    int _2063 = _2035 * int(_1997);
    int _2065 = _2063 + _1877;
    float _2067 = _2049 + 0.5;
    float _2069 = _2055 + (-0.5);
    bool _2071 = uint(_2059) >= uint(_501);
    float _2073 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2061);
    float _2075 = float(uint(_2065));
    float _2077 = fma(_2067, (*spvDescriptorSet0.vp_c9)._m0[80].x, _577);
    bool _2079 = !_2071;
    int _2081 = _2079 ? 0 : (-1);
    float _2083 = -_2069;
    float _2085 = -_443;
    float _2087 = fma(_2083, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2085);
    int _2089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2091 = _2089 != 0;
    float _2093 = as_type<float>(_1734) * _2075;
    int _2095 = ~_2041;
    int _2097 = _2095 + _2081;
    int _2099 = _2097 + 1;
    float _2101 = fma(_2055, _1708, _2087);
    float _2103 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2105 = -_1712;
    float _2107 = fma(_2049, _2105, _2077);
    float _2109 = trunc(_2093);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    int _2115 = _501 * _2099;
    int _2117 = _2115 + _1899;
    float _2119 = _2007 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2121 = _2015 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2123 = _2103 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2125 = !_1807;
    int _2127 = _2125 ? _2117 : (-1);
    float _2129 = _2119 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2131 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2133 = _2127 >> 31;
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_74.x = _2129;
    out.m_74.y = _2131;
    out.m_74.z = _2123;
    int _2141 = _2133 & 3;
    float _2143 = _2135 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2145 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2147 = _2139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2149 = _2073 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2151 = ~_501;
    int _2153 = _2151 + 1;
    out.m_76.x = _2107;
    out.m_76.y = _2101;
    int _2155 = int(_1997) + int(_2113);
    float _2157 = _833 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2159 = _2127 + _2141;
    out.m_78.x = _2143;
    out.m_78.y = _2145;
    out.m_78.z = _2147;
    out.m_78.w = _2149;
    float _2161 = _813 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2163 = _813 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2165 = _813 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2167 = _2159 >> 2;
    float _2169 = -_801;
    float _2171 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2161);
    float _2173 = -_801;
    float _2175 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2163);
    float _2177 = -_801;
    float _2179 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2165);
    int _2181 = _2167 << 4;
    int _2183 = _2181 + 368;
    float _2185 = abs(_1231);
    float _2187 = log2(_2185);
    float _2189 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2175);
    float _2191 = _829 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2193 = _2127 & 3;
    bool _2195 = _2193 != 0;
    float _2197 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2157);
    int _2199 = _2153 * _2155;
    int _2201 = _2199 + _1877;
    float _2203 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2179);
    float _2205 = _829 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2207 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2171);
    float _2209 = _829 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2211 = uint(_2201) >= uint(_501);
    float _2213 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2205);
    float _2215 = _767 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _2217 = uint(int(uint(_2183) >> uint(2)));
    uint _2219 = uint(int(uint(int(_2217)) >> uint(2)));
    int _2221 = int(_2217) & 3;
    float _2223 = (*spvDescriptorSet0.vp_c9)._m0[int(_2219)][_2221];
    int _2225 = int(_2217) + 1;
    uint _2227 = uint(int(uint(_2225) >> uint(2)));
    int _2229 = _2225 & 3;
    float _2231 = (*spvDescriptorSet0.vp_c9)._m0[int(_2227)][_2229];
    float _2233 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2209);
    float _2235 = _833 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2237 = _833 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2239 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2213);
    bool _2241 = uint(_2193) > 1u;
    float _2243 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2191);
    int _2245 = _2127 & 3;
    bool _2247 = _2245 != 0;
    int _2249 = _2183 + 8;
    uint _2251 = uint(int(uint(_2249) >> uint(2)));
    uint _2253 = uint(int(uint(int(_2251)) >> uint(2)));
    int _2255 = int(_2251) & 3;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[int(_2253)][_2255];
    int _2259 = int(_2251) + 1;
    uint _2261 = uint(int(uint(_2259) >> uint(2)));
    int _2263 = _2259 & 3;
    float _2265 = (*spvDescriptorSet0.vp_c9)._m0[int(_2261)][_2263];
    float _2267 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2233);
    float _2269 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2243);
    int _2271 = _2247 ? 0 : 1;
    float _2273 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2235);
    float _2275 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2237);
    float _2277 = _2215 * _2189;
    int _2279 = ~_2271;
    int _2281 = _2279 + 1;
    int _2283 = _2281 + 1;
    float _2285 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2287 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2275);
    int _2289 = _2283;
    float _2291 = _1635;
    if (!_2241)
    {
        int _2293 = ~_2271;
        int _2295 = _2293 + 1;
        _2289 = _2295;
    }
    int _2297 = _2289;
    float _2299 = _2215 * _2207;
    bool _2301 = _2193 != 3;
    float _2303 = exp2(_2285);
    bool _2305 = uint(_2193) >= 2u;
    float _2307 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2273);
    bool _2309 = !_2195;
    int _2311 = _2309 ? 0 : 1;
    float _2313 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2197);
    int _2315 = _2305 ? 0 : 1;
    float _2317 = fma(_2051, _2239, _2299);
    int _2319 = abs(_2297);
    float _2321 = _2215 * _2203;
    int _2323 = abs(_2311);
    float _2325 = fma(_2051, _2269, _2277);
    int _2327 = ~_2315;
    int _2329 = _2327 + 1;
    int _2331 = _2329 + 1;
    float _2333 = fma(_2051, _2267, _2321);
    bool _2335 = _2193 != 3;
    float _2337 = _1591 * 0.5;
    int _2339 = _2331;
    if (_2301)
    {
        int _2341 = ~_2315;
        int _2343 = _2341 + 1;
        _2339 = _2343;
    }
    int _2345 = _2339;
    float _2347 = _2313 + _2333;
    float _2349 = -_1661;
    float _2351 = _2349 + 1.0;
    int _2353 = ~_2319;
    int _2355 = _2353 + 1;
    int _2357 = _2355 + 1;
    float _2359 = _2287 + _2325;
    float _2361 = fma(_2303, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2363 = precise::clamp(_2361, 0.0, 1.0);
    bool _2365 = !_2335;
    int _2367 = _2365 ? 0 : (-1);
    float _2369 = _2307 + _2317;
    int _2371 = abs(_2345);
    int _2373 = _2357 * as_type<int>(_2231);
    int _2375 = ~_2323;
    int _2377 = _2375 + 1;
    int _2379 = _2377 + 1;
    out.m_80.x = _2369;
    out.m_80.y = _2359;
    out.m_80.z = _2347;
    bool _2381 = !_2091;
    int _2383 = _2381 ? 0 : 1;
    int _2385 = abs(_2367);
    int _2387 = _2379 * as_type<int>(_2223);
    int _2389 = _2387 + _2373;
    bool _2391 = !_2211;
    int _2393 = _2391 ? 0 : (-1);
    int _2395 = abs(_2383);
    int _2397 = ~_2371;
    int _2399 = _2397 + 1;
    int _2401 = _2399 + 1;
    int _2403 = ~_2155;
    int _2405 = _2403 + _2393;
    int _2407 = _2405 + 1;
    int _2409 = _2401 * as_type<int>(_2257);
    int _2411 = _2409 + _2389;
    int _2413 = _501 * _2407;
    int _2415 = _2413 + _1877;
    int _2417 = ~_2385;
    int _2419 = _2417 + 1;
    int _2421 = _2419 + 1;
    float _2423 = fma(_2363, -2.0, 3.0);
    int _2425 = ~_2395;
    int _2427 = _2425 + 1;
    int _2429 = _2427 + 1;
    float _2431 = _2363 * _2363;
    bool _2433 = !_1807;
    int _2435 = _2433 ? _2415 : (-1);
    int _2437 = _2421 * as_type<int>(_2265);
    int _2439 = _2437 + _2411;
    float _2441 = _1557 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2443 = _2431 * _2423;
    bool _2445 = _1231 <= 8000.0;
    bool _2447 = isnan(_1231);
    bool _2449 = _2445 || _2447;
    bool _2451 = isnan(8000.0);
    bool _2453 = _2449 || _2451;
    float _2455 = float(_2453);
    int _2457 = _2439 * _2429;
    float _2459 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2441);
    float _2461 = -_2443;
    float _2463 = _2461 + 1.0;
    float _2465 = fma(_1641, -0.5, _2337);
    int _2467 = _2435 * _2395;
    int _2469 = _2467 + _2457;
    float _2471 = in.m_82.x;
    float _2473 = fma(_2463, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2443);
    float _2475 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2477 = float(_2469);
    float _2479 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2459);
    float _2481 = _2455 * _2473;
    float _2483 = _2475 * _1673;
    float _2485 = -_2475;
    float _2487 = _2485 + 1.0;
    out.m_84.x = _2477;
    float _2489 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2491 = _1694 * _2483;
    float _2493 = _1684 * _2487;
    bool _2495 = _1369 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2497 = isnan(_1369);
    bool _2499 = _2495 || _2497;
    bool _2501 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2503 = _2499 || _2501;
    float _2505 = _2351 * _2489;
    float _2507 = precise::clamp(_2505, 0.0, 1.0);
    float _2509 = fma(_1684, _2491, _1682);
    float _2511 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2479);
    float _2513 = _1684 * _2483;
    float _2515 = -_2507;
    float _2517 = fma(_2515, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2519 = _1635 + _1591;
    float _2521 = _2511 + _1591;
    float _2523 = fma(_1690, _2513, _1678);
    float _2525 = fma(_1692, _2513, _1680);
    float _2527 = _2521 * 0.5;
    float _2529 = _2517 * _2471;
    float _2531 = _2519 * 0.5;
    out.m_86.x = _2523;
    out.m_86.y = _2525;
    out.m_86.z = _2509;
    out.m_86.w = _2493;
    float _2533 = _1287 * _1347;
    float _2535 = _2529 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _1635;
    out.gl_Position.y = _1641;
    out.gl_Position.z = _2511;
    out.gl_Position.w = _1591;
    out.m_88.x = _2535;
    out.m_90.x = _2531;
    out.m_90.y = _2465;
    out.m_90.z = _2527;
    out.m_90.w = _1591;
    float _2537 = _2533 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2539 = _2533;
    float _2541 = _1591;
    float _2543 = _2527;
    float _2545 = _2465;
    float _2547 = _2531;
    if (!_2503)
    {
        _2291 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2549 = _2291;
    float _2551 = _2549;
    float _2553 = _2549;
    if (!_2503)
    {
        _2539 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2555 = _2539;
    float _2557 = _2555;
    float _2559 = _2555;
    if (!_2503)
    {
        _2541 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2561 = _2541;
    float _2563 = _2561;
    float _2565 = _2561;
    if (!_2503)
    {
        _2543 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2567 = _2543;
    float _2569 = _2567;
    float _2571 = _2567;
    if (!_2503)
    {
        _2545 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2573 = _2545;
    float _2575 = _2573;
    float _2577 = _2573;
    if (!_2503)
    {
        _2547 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2579 = _2547;
    bool _2581 = !_2503;
    float _2583 = _2579;
    float _2585 = _2579;
    if (!_2581)
    {
        bool _2587 = _1369 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2589 = isnan(_1369);
        bool _2591 = _2587 || _2589;
        bool _2593 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2595 = _2591 || _2593;
        if (!_2595)
        {
            float _2597 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2599 = _1369 + _2597;
            float _2601 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2603 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2601;
            float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2609 = 1.0 / _2603;
            float _2611 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2615 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2617 = _2615 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2619 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2621 = _2619 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2627 = _2599 * _2609;
            float _2629 = precise::clamp(_2627, 0.0, 1.0);
            float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2635 = fma(_2629, _2607, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2637 = fma(_2629, _2633, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2639 = fma(_2629, _2613, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2641 = fma(_2629, _2617, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2643 = fma(_2629, _2621, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2645 = fma(_2629, _2625, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2565 = _2639;
            _2585 = _2643;
            _2553 = _2635;
            _2577 = _2641;
            _2571 = _2637;
            _2559 = _2645;
            _2647 = true;
        }
        else
        {
            bool _2649 = _1369 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2651 = isnan(_1369);
            bool _2653 = _2649 || _2651;
            bool _2655 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2657 = _2653 || _2655;
            if (!_2657)
            {
                _2551 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2659 = _2551;
            _2553 = _2659;
            if (!_2657)
            {
                _2563 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2661 = _2563;
            _2565 = _2661;
            if (!_2657)
            {
                _2569 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2663 = _2569;
            _2571 = _2663;
            if (!_2657)
            {
                _2575 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2665 = _2575;
            _2577 = _2665;
            if (!_2657)
            {
                _2583 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2667 = _2583;
            _2585 = _2667;
            if (!_2657)
            {
                _2557 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2669 = _2557;
            bool _2671 = !_2657;
            _2559 = _2669;
            if (!_2671)
            {
                bool _2673 = _1369 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2675 = isnan(_1369);
                bool _2677 = _2673 || _2675;
                bool _2679 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2681 = _2677 || _2679;
                if (!_2681)
                {
                    float _2683 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2685 = _1369 + _2683;
                    float _2687 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2689 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2687;
                    float _2691 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2693 = _2691 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2695 = 1.0 / _2689;
                    float _2697 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2703 = _2701 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2707 = _2705 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2711 = _2709 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2713 = _2685 * _2695;
                    float _2715 = precise::clamp(_2713, 0.0, 1.0);
                    float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2721 = fma(_2715, _2693, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2723 = fma(_2715, _2719, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2725 = fma(_2715, _2699, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2727 = fma(_2715, _2703, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2729 = fma(_2715, _2707, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2731 = fma(_2715, _2711, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2565 = _2725;
                    _2585 = _2729;
                    _2553 = _2721;
                    _2577 = _2727;
                    _2571 = _2723;
                    _2559 = _2731;
                    _2647 = true;
                }
                else
                {
                    _2565 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2585 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2553 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2577 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2571 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2559 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2647 = false;
    float _2733 = _2565;
    float _2735 = _2585;
    float _2737 = _2553;
    float _2739 = _2577;
    float _2741 = _2571;
    float _2743 = _2559;
    float _2745 = fma(_2359, -0.5, 0.5);
    float _2747 = precise::clamp(_2745, 0.0, 1.0);
    float _2749 = -_2733;
    float _2751 = _2749 + _2735;
    float _2753 = _2537 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2755 = -_2737;
    float _2757 = _2755 + _2739;
    float _2759 = fma(_2747, _2751, _2733);
    out.m_92.x = 0.0;
    float _2761 = -_2741;
    float _2763 = _2761 + _2743;
    float _2765 = fma(_2747, _2757, _2737);
    float _2767 = _2759 * 0.586610972881317138671875;
    out.m_53.x = _2753;
    bool _2769 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2771 = fma(_2747, _2763, _2741);
    float _2773 = fma(_2765, 0.298911988735198974609375, _2767);
    bool _2775 = _1287 > 0.0;
    bool _2777 = isnan(_1287);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan(0.0);
    bool _2783 = _2779 || _2781;
    float _2785 = fma(_2771, 0.114477999508380889892578125, _2773);
    bool _2787 = _1347 <= 0.0;
    bool _2789 = !_2783;
    bool _2791 = _2787 || _2789;
    float _2793 = -_2785;
    float _2795 = _2765 + _2793;
    float _2797 = -_2785;
    float _2799 = _2759 + _2797;
    float _2801 = -_2785;
    float _2803 = _2771 + _2801;
    float _2805 = fma(_2795, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2785);
    float _2807 = fma(_2799, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2785);
    float _2809 = fma(_2803, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2785);
    bool _2811 = !_2769;
    if (!_2811)
    {
        float _2813 = -_1217;
        float _2815 = _2813 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2817 = -_1219;
        float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2821 = -_1221;
        float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2825 = _2815 * _2815;
        float _2827 = fma(_2819, _2819, _2825);
        float _2829 = fma(_2823, _2823, _2827);
        float _2831 = sqrt(_2829);
        float _2833 = rsqrt(_2829);
        float _2835 = -_2831;
        float _2837 = _2835 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2839 = _2837 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2841 = precise::clamp(_2839, 0.0, 1.0);
        float _2843 = _2819 * _2833;
        float _2845 = _2815 * _2833;
        float _2847 = abs(_2841);
        float _2849 = log2(_2847);
        float _2851 = _2823 * _2833;
        float _2853 = _2843 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2855 = _2359 * _2845;
        float _2857 = -_2845;
        float _2859 = -_2853;
        float _2861 = fma(_2857, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2859);
        float _2863 = fma(_2369, _2843, _2855);
        float _2865 = -_2851;
        float _2867 = fma(_2865, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2861);
        float _2869 = fma(_2347, _2851, _2863);
        float _2871 = precise::clamp(_2869, 0.0, 1.0);
        float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2875 = _2867 + _2873;
        float _2877 = _2849 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2879 = _2875 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2881 = precise::clamp(_2879, 0.0, 1.0);
        float _2883 = exp2(_2877);
        float _2885 = _2883 * _2881;
        float _2887 = _2871 * _2885;
        float _2889 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2891 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2893 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2889;
        out.m_92.y = _2891;
        out.m_92.z = _2893;
    }
    out.m_68.x = _2805;
    out.m_68.y = _2807;
    out.m_68.z = _2809;
    if (!_2791)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2895 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2895;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

