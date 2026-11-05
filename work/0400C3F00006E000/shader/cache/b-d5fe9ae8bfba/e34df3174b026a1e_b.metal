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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_53 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _673 = false;
    bool _561 = false;
    bool _459 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2315 = as_type<float>(_101);
        out.gl_Position.z = _2315;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = _119;
    if (_115)
    {
        float _123 = float(_85);
        _95 = _123;
    }
    float _125 = _95;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _103 = as_type<int>(_137);
    }
    int _139 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2385 = as_type<float>(_139);
        out.gl_Position.z = _2385;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_49.w;
    float _143 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = in.m_47.x;
    float _157 = in.m_47.y;
    float _159 = in.m_47.z;
    float _161 = in.m_42.x;
    float _163 = in.m_42.y;
    float _165 = in.m_42.z;
    float _167 = 0.0;
    float _169 = _143;
    if (!_153)
    {
        float _171 = _143 * _143;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _175;
    if (!_153)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    bool _183 = !_153;
    float _185 = _181;
    float _187 = 0.0;
    float _189 = _159;
    float _191 = _159;
    if (!_183)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _143 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _143);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _221;
        _187 = _199;
    }
    float _223 = _185;
    float _225 = _187;
    float _227 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _229 = !_153;
    float _231 = _225;
    float _233 = _223;
    if (!_229)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _143 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _231 = _243;
        _169 = _253;
    }
    float _255 = _231;
    float _257 = _169;
    float _259 = _227 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _261 = _227 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _263 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _265 = _227 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _267 = _255;
    if (!_153)
    {
        float _269 = _119 * _119;
        float _271 = _269 * 0.5;
        _267 = _271;
    }
    float _273 = _267;
    float _275 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[8].x, _259);
    float _277 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[8].y, _261);
    float _279 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[8].z, _265);
    float _281 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_153)
    {
        float _283 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _283;
    }
    float _285 = _233;
    bool _287 = !_153;
    float _289 = _285;
    if (!_287)
    {
        float _291 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _293 = log2(_291);
        float _295 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _297 = _295 + 1.0;
        float _299 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _301 = _119 * _293;
        float _303 = 1.0 / _297;
        float _305 = _299 * 0.693147182464599609375;
        float _307 = exp2(_301);
        float _309 = 1.0 / _305;
        float _311 = _307 + (-1.0);
        float _313 = -_311;
        float _315 = fma(_313, _309, _119);
        float _317 = _315 * _303;
        float _319 = _317 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _289 = _319;
    }
    float _321 = _289;
    float _323 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _325 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[10].x, _275);
    float _327 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[10].y, _277);
    float _329 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _331 = _323 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _333 = _323 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _335 = _323 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _337 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[10].z, _279);
    float _339 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[8].x, _331);
    float _341 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[8].y, _333);
    float _343 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[8].z, _335);
    float _345 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _347 = fma(_257, _155, _325);
    float _349 = fma(_257, _157, _327);
    float _351 = fma(_257, _159, _337);
    float _353 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[10].x, _339);
    float _355 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[10].y, _341);
    float _357 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[10].z, _343);
    float _359 = _337;
    if (!_153)
    {
        _359 = _119;
    }
    float _361 = _359;
    bool _363 = !_153;
    float _365 = _361;
    if (!_363)
    {
        float _367 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _369 = log2(_367);
        float _371 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _373 = _371 + 1.0;
        float _375 = 1.0 / _373;
        float _377 = _119 * _369;
        float _379 = exp2(_377);
        float _381 = -_379;
        float _383 = _381 + 1.0;
        float _385 = _383 * _375;
        _365 = _385;
    }
    float _387 = _365;
    float _389 = fma(_387, _157, _355);
    float _391 = fma(_387, _159, _357);
    bool _393 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _395 = fma(_349, _141, _163);
    float _397 = fma(_387, _155, _353);
    float _399 = -_389;
    float _401 = _349 + _399;
    float _403 = fma(_347, _141, _161);
    float _405 = -_391;
    float _407 = _351 + _405;
    float _409 = -_397;
    float _411 = _347 + _409;
    float _413 = _401 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _415 = _401 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _417 = _401 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _419 = fma(_351, _141, _165);
    float _421 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].x, _413);
    float _423 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].x, _415);
    float _425 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].x, _417);
    float _427 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].z, _421);
    float _429 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].z, _423);
    float _431 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].z, _425);
    bool _433 = !_393;
    float _435 = _429;
    float _437 = _427;
    float _439 = _431;
    float _457;
    if (!_433)
    {
        float _441 = in.m_51.x;
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _445 = _441 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        float _461 = float(_85);
        float _463 = 1.0 / _461;
        float _465 = _119 * _463;
        _457 = _465;
    }
    _459 = false;
    float _467 = _457;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _471 = _467 + _469;
    bool _473 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _475 = isnan(_467);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _485;
    float _489 = -_483;
    float _491 = _489 + 1.0;
    bool _493 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _495 = isnan(_467);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _505;
    bool _509 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _511 = 1.0 / _487;
    float _513 = _503 * _491;
    float _515 = -_503;
    float _517 = _515 + 1.0;
    float _519 = _471 * _511;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _521;
    float _525 = fma(_507, _519, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _527 = fma(_523, _519, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _529 = _525 * _513;
    float _531 = _527 * _513;
    float _533 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[143].x, _529);
    float _535 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[143].y, _531);
    float _537 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[144].x, _533);
    float _539 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[144].y, _535);
    bool _541 = !_509;
    float _559;
    if (!_541)
    {
        float _543 = in.m_51.x;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _547 = _543 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _549 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _551 = _549 * _545;
        float _553 = floor(_551);
        float _555 = -_553;
        float _557 = _551 + _555;
        _559 = _557;
        _561 = true;
    }
    else
    {
        float _563 = float(_85);
        float _565 = 1.0 / _563;
        float _567 = _119 * _565;
        _559 = _567;
    }
    _561 = false;
    float _569 = _559;
    float _571 = in.m_49.x;
    float _573 = in.m_49.y;
    bool _575 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _577 = isnan(_569);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _591 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _593 = isnan(_569);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _603;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _609 = _569 + _607;
    float _611 = -_585;
    float _613 = _611 + 1.0;
    float _615 = 1.0 / _589;
    float _617 = _601 * _613;
    float _619 = -_601;
    float _621 = _619 + 1.0;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _627 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _631 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _633 = _625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _635 = _629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = _539 * _573;
    float _639 = _537 * _571;
    float _641 = _605 * _615;
    float _643 = fma(_641, _609, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _645 = _643 * _617;
    float _647 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[115].x, _645);
    float _649 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[116].x, _647);
    float _651 = _649 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _631;
    out.m_53.y = _633;
    out.m_53.z = _635;
    out.m_53.w = _651;
    bool _653 = !_627;
    float _671;
    if (!_653)
    {
        float _655 = in.m_51.x;
        float _657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _659 = _655 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _661 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _663 = _661 * _657;
        float _665 = floor(_663);
        float _667 = -_665;
        float _669 = _663 + _667;
        _671 = _669;
        _673 = true;
    }
    else
    {
        float _675 = float(_85);
        float _677 = 1.0 / _675;
        float _679 = _119 * _677;
        _671 = _679;
    }
    _673 = false;
    float _681 = _671;
    float _683 = in.m_51.z;
    float _685 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _687 = log2(_685);
    float _689 = _637 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _691 = in.m_51.x;
    float _693 = in.m_51.y;
    float _695 = _639 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _697 = _119 * _687;
    float _699 = exp2(_697);
    float _701 = _683 * 2.0;
    float _703 = _691 * 2.0;
    float _705 = _693 * 2.0;
    float _707 = floor(_701);
    float _709 = _693 + _691;
    float _711 = _709 + (-1.0);
    float _713 = -_699;
    float _715 = _713 + 1.0;
    float _717 = floor(_703);
    bool _719 = _707 > 0.0;
    float _721 = floor(_705);
    bool _723 = _707 >= 0.0;
    bool _725 = isnan(_707);
    bool _727 = _723 || _725;
    bool _729 = isnan(0.0);
    bool _731 = _727 || _729;
    float _733 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _737 = 1.0 + _735;
    int _739 = _731 ? 0 : 1;
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _743 = _741 != 0;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _751 = _749 != 0;
    float _753 = 1.0 / _737;
    int _755 = ~_739;
    int _757 = _755 + 1;
    int _759 = _757 + 1;
    bool _761 = _717 > 0.0;
    int _763 = _759;
    if (!_719)
    {
        int _765 = ~_739;
        int _767 = _765 + 1;
        _763 = _767;
    }
    int _769 = _763;
    float _771 = in.m_55.x;
    float _773 = in.m_55.y;
    float _775 = in.m_55.z;
    bool _777 = _717 >= 0.0;
    bool _779 = isnan(_717);
    bool _781 = _777 || _779;
    bool _783 = isnan(0.0);
    bool _785 = _781 || _783;
    bool _787 = !_743;
    int _789 = _787 ? 0 : 1;
    bool _791 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _793 = isnan(0.0);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _799 = _795 || _797;
    int _801 = abs(_789);
    bool _803 = _721 > 0.0;
    int _805 = _785 ? 0 : 1;
    bool _807 = _721 >= 0.0;
    bool _809 = isnan(_721);
    bool _811 = _807 || _809;
    bool _813 = isnan(0.0);
    bool _815 = _811 || _813;
    bool _817 = !_747;
    int _819 = _817 ? 0 : 1;
    float _821 = float(_801);
    float _823 = float(_769);
    float _825 = _799 ? _715 : 0.0;
    int _827 = abs(_819);
    float _829 = _821 * _823;
    int _831 = _815 ? 0 : 1;
    float _833 = _825 * _753;
    int _835 = ~_805;
    int _837 = _835 + 1;
    int _839 = _837 + 1;
    float _841 = _829 * (-2.0);
    int _843 = _839;
    if (!_761)
    {
        int _845 = ~_805;
        int _847 = _845 + 1;
        _843 = _847;
    }
    int _849 = _843;
    int _851 = ~_831;
    int _853 = _851 + 1;
    int _855 = _853 + 1;
    float _857 = fma(_841, _771, _771);
    int _859 = _855;
    if (!_803)
    {
        int _861 = ~_831;
        int _863 = _861 + 1;
        _859 = _863;
    }
    int _865 = _859;
    float _867 = fma(_733, _841, _733);
    float _869 = float(_827);
    float _871 = _691 + (-0.5);
    bool _873 = !_751;
    int _875 = _873 ? 0 : 1;
    float _877 = float(_849);
    int _879 = abs(_875);
    float _881 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[196].x, _857);
    float _883 = _693 + _683;
    float _885 = _869 * _877;
    bool _887 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _889 = isnan(1.0);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _895 = _891 || _893;
    float _897 = _883 + (-1.0);
    bool _899 = !_895;
    float _901 = _899 ? _119 : _833;
    float _903 = _885 * (-2.0);
    float _905 = float(_879);
    float _907 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _909 = float(_865);
    float _911 = fma(_901, _867, _881);
    float _913 = fma(_903, _773, _773);
    float _915 = fma(_907, _903, _907);
    float _917 = _683 + _691;
    float _919 = _905 * _909;
    float _921 = _693 + (-0.5);
    float _923 = as_type<float>(int(gl_VertexIndex));
    float _925 = _911 * 0.15915493667125701904296875;
    float _927 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[196].y, _913);
    float _929 = _917 + (-1.0);
    float _931 = _919 * (-2.0);
    float _933 = _683 + (-0.5);
    float _935 = fma(_901, _915, _927);
    float _937 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _939 = fma(_931, _775, _775);
    float _941 = _925 * 6.283185482025146484375;
    float _943 = sin(_941);
    float _945 = _935 * 0.15915493667125701904296875;
    float _947 = fma(_937, _931, _937);
    float _949 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[196].z, _939);
    float _951 = fma(_901, _947, _949);
    float _953 = _925 * 6.283185482025146484375;
    float _955 = cos(_953);
    float _957 = _951 * 0.15915493667125701904296875;
    int _959 = as_type<int>(_923) & 1;
    bool _961 = _959 != 0;
    int _963 = as_type<int>(_923) & 2;
    bool _965 = _963 != 0;
    float _967 = _945 * 6.283185482025146484375;
    float _969 = sin(_967);
    bool _971 = !_965;
    float _973 = _971 ? (-0.5) : 0.5;
    bool _975 = !_961;
    float _977 = _975 ? (-0.5) : 0.5;
    bool _979 = _691 > 0.5;
    float _981 = _945 * 6.283185482025146484375;
    float _983 = cos(_981);
    float _985 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _973);
    float _987 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _977);
    float _989 = _689 * _985;
    float _991 = _695 * _987;
    bool _993 = _693 > 0.5;
    float _995 = _957 * 6.283185482025146484375;
    float _997 = sin(_995);
    float _999 = _955 * _969;
    float _1001 = _943 * _969;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1003;
    float _1007 = _957 * 6.283185482025146484375;
    float _1009 = cos(_1007);
    float _1011 = _943 * _983;
    float _1013 = _955 * _983;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1015;
    float _1019 = -_999;
    float _1021 = fma(_997, _1011, _1019);
    float _1023 = -_1011;
    float _1025 = fma(_997, _999, _1023);
    float _1027 = _1009 * _989;
    float _1029 = _969 * _1009;
    float _1031 = _983 * _1009;
    float _1033 = fma(_997, _1013, _1001);
    float _1035 = -_989;
    float _1037 = _997 * _1035;
    float _1039 = fma(_997, _1001, _1013);
    float _1041 = _955 * _1027;
    float _1043 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1045 = fma(_1031, _991, _1037);
    float _1047 = _943 * _1027;
    float _1049 = fma(_1033, _991, _1041);
    float _1051 = _395 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1053 = fma(_1029, _1043, _1045);
    float _1055 = fma(_1021, _991, _1047);
    float _1057 = fma(_1025, _1043, _1049);
    float _1059 = _395 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1061 = _395 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1063 = fma(_1039, _1043, _1055);
    float _1065 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1067 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1069 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1061);
    float _1071 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1051);
    float _1073 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1065);
    float _1075 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1067);
    float _1077 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1069);
    float _1079 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1071);
    float _1081 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1073);
    float _1083 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1075);
    float _1085 = _1077 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1087 = _1079 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1089 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1091 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1093 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1059);
    float _1095 = _1085 + _1089;
    float _1097 = _1087 + _1091;
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1099;
    float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1105 = _1095 + _1103;
    float _1107 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1109 = _1097 + _1107;
    float _1111 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1113 = 1.0 / _1101;
    float _1115 = _1105 * _1105;
    int _1117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1119 = _1117 != 0;
    float _1121 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1111);
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1125 = _1123 != 0;
    float _1127 = fma(_1109, _1109, _1115);
    float _1129 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1093);
    float _1131 = -_977;
    int _1133 = _979 ? as_type<int>(_1131) : as_type<int>(_977);
    float _1135 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1121);
    float _1137 = sqrt(_1127);
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1141 = _681 + _1139;
    float _1143 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1145 = !_1119;
    float _1147 = _1145 ? _977 : as_type<float>(_1133);
    float _1149 = -_973;
    int _1151 = _993 ? as_type<int>(_1149) : as_type<int>(_973);
    float _1153 = _1141 * _1113;
    bool _1155 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1157 = isnan(_681);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1169 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1171 = isnan(_681);
    bool _1173 = _1169 || _1171;
    bool _1175 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1177 = _1173 || _1175;
    float _1179 = float(_1177);
    float _1181 = fma(_1005, _1153, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1183;
    float _1187 = -_1165;
    float _1189 = _1187 + 1.0;
    float _1191 = fma(_1017, _1153, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1193 = !_1125;
    float _1195 = _1193 ? _973 : as_type<float>(_1151);
    float _1197 = fma(_1185, _1153, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1199 = _1137 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1201 = _1179 * _1189;
    float _1203 = _1129 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1205 = -_1179;
    float _1207 = _1205 + 1.0;
    float _1209 = _1181 * _1201;
    float _1211 = _1203 + _1143;
    float _1213 = _1191 * _1201;
    float _1215 = _1197 * _1201;
    float _1217 = _1197;
    float _1219 = _1181;
    float _1221 = _1191;
    if (!_1199)
    {
        _1217 = _1097;
    }
    float _1223 = _1217;
    float _1225 = _1223;
    if (!_1199)
    {
        _1219 = _1095;
    }
    float _1227 = _1219;
    float _1229 = _1227;
    if (!_1199)
    {
        _1221 = _1211;
    }
    float _1231 = _1221;
    bool _1233 = !_1199;
    float _1235 = _1231;
    if (!_1233)
    {
        float _1237 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1239 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1241 = _1137 + _1239;
        float _1243 = _1211 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1245 = rsqrt(_1127);
        float _1247 = _1241 * _1237;
        float _1249 = _1247 * 0.15915493667125701904296875;
        float _1251 = _1249 * 6.283185482025146484375;
        float _1253 = cos(_1251);
        float _1255 = _1249 * 6.283185482025146484375;
        float _1257 = sin(_1255);
        float _1259 = _1253 + (-1.0);
        float _1261 = _1259 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1263 = fma(_1257, _1243, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1265 = fma(_1211, _1253, _1261);
        float _1267 = _1245 * _1263;
        float _1269 = fma(_1109, _1267, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1271 = fma(_1105, _1267, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1235 = _1265;
        _1225 = _1269;
        _1229 = _1271;
    }
    float _1273 = _1235;
    float _1275 = _1225;
    float _1277 = _1229;
    float _1279 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1213);
    float _1281 = -_1203;
    float _1283 = _1281 + _1273;
    float _1285 = -_1087;
    float _1287 = _1285 + _1275;
    float _1289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1291 = -_1085;
    float _1293 = _1291 + _1277;
    float _1295 = _1283 * _1283;
    float _1297 = _1147 + 0.5;
    float _1299 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1209);
    float _1301 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1215);
    float _1303 = fma(_1287, _1287, _1295);
    float _1305 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1307 = -_1195;
    float _1309 = _1307 + 0.5;
    float _1311 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1299);
    float _1313 = fma(_1293, _1293, _1303);
    float _1315 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1279);
    float _1317 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1301);
    float _1319 = _1305 * _1167;
    float _1321 = sqrt(_1313);
    float _1323 = _1309 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1325 = _1311 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1327 = _1315 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1329 = _1317 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1331 = _1323 * _1289;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1335 = _1325 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1337 = _1327 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1339 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _1319;
    out.m_60.y = _1331;
    out.m_62.x = _1335;
    out.m_62.y = _1337;
    out.m_62.z = _1339;
    out.m_62.w = _1333;
    bool _1341 = _1321 > 0.0;
    bool _1343 = !_1341;
    float _1345 = _1333;
    float _1347 = _1335;
    float _1349 = _1337;
    float _1351 = _1273;
    float _1353 = _1277;
    float _1355 = _1275;
    float _1357 = _1335;
    if (!_1343)
    {
        bool _1359 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1361 = _1339;
        if (_1359)
        {
            float _1363 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1361 = _1363;
        }
        float _1365 = _1361;
        if (_1359)
        {
            float _1367 = _427 * _1365;
            _1345 = _1367;
        }
        float _1369 = _1345;
        float _1371 = _1369;
        if (_1359)
        {
            float _1373 = _429 * _1365;
            _1347 = _1373;
        }
        float _1375 = _1347;
        float _1377 = _1375;
        if (_1359)
        {
            float _1379 = _431 * _1365;
            _1349 = _1379;
        }
        float _1381 = _1349;
        float _1383 = _1381;
        if (!_1359)
        {
            float _1385 = _119 + 1.0;
            if (!_153)
            {
                float _1387 = _1385 * _1385;
                float _1389 = _1387 * 0.5;
                _121 = _1389;
            }
            float _1391 = _121;
            float _1393 = _1391;
            if (!_153)
            {
                float _1395 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1393 = _1395;
            }
            float _1397 = _1393;
            bool _1399 = !_153;
            float _1401 = _1397;
            if (!_1399)
            {
                float _1403 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1405 = log2(_1403);
                float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1409 = 1.0 + _1407;
                float _1411 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1413 = _1405 * _1385;
                float _1415 = 1.0 / _1409;
                float _1417 = _1411 * 0.693147182464599609375;
                float _1419 = exp2(_1413);
                float _1421 = 1.0 / _1417;
                float _1423 = _1419 + (-1.0);
                float _1425 = -_1423;
                float _1427 = fma(_1425, _1421, _1385);
                float _1429 = _1427 * _1415;
                float _1431 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1401 = _1431;
            }
            float _1433 = _1401;
            float _1435 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1437 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1439 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1441 = _1433;
            if (!_153)
            {
                _1441 = _1385;
            }
            float _1443 = _1441;
            float _1445 = _1435 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _1447 = _1435 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _1449 = _1435 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _1451 = fma(_1437, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1445);
            float _1453 = fma(_1437, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1447);
            float _1455 = fma(_1439, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1451);
            bool _1457 = !_153;
            float _1459 = _1443;
            if (!_1457)
            {
                float _1461 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1463 = log2(_1461);
                float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1467 = 1.0 + _1465;
                float _1469 = 1.0 / _1467;
                float _1471 = _1463 * _1385;
                float _1473 = exp2(_1471);
                float _1475 = -_1473;
                float _1477 = _1475 + 1.0;
                float _1479 = _1477 * _1469;
                _1459 = _1479;
            }
            float _1481 = _1459;
            float _1483 = fma(_1437, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1449);
            float _1485 = fma(_1439, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1453);
            float _1487 = fma(_1481, _157, _1455);
            float _1489 = fma(_1439, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1483);
            float _1491 = fma(_1481, _155, _1485);
            float _1493 = -_389;
            float _1495 = _1493 + _1487;
            float _1497 = fma(_1481, _159, _1489);
            float _1499 = -_397;
            float _1501 = _1499 + _1491;
            float _1503 = _1495 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1505 = _1495 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1507 = _1495 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1509 = -_391;
            float _1511 = _1509 + _1497;
            float _1513 = fma(_1501, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1503);
            float _1515 = fma(_1501, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1505);
            float _1517 = fma(_1501, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1507);
            float _1519 = fma(_1511, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1513);
            float _1521 = fma(_1511, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1515);
            float _1523 = fma(_1511, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1517);
            _435 = _1521;
            _437 = _1519;
            _439 = _1523;
            _1371 = _1519;
            _1377 = _1521;
            _1383 = _1523;
            _189 = _1513;
        }
        float _1525 = _435;
        float _1527 = _437;
        float _1529 = _439;
        float _1531 = _1371;
        float _1533 = _1377;
        float _1535 = _1383;
        float _1537 = _189;
        float _1539 = _1525 * _1525;
        float _1541 = rsqrt(_1313);
        float _1543 = fma(_1527, _1527, _1539);
        float _1545 = fma(_1529, _1529, _1543);
        float _1547 = sqrt(_1545);
        float _1549 = _1287 * _1541;
        float _1551 = _1283 * _1541;
        float _1553 = _1293 * _1541;
        bool _1555 = _1547 > 0.0;
        bool _1557 = !_1555;
        _1357 = _1533;
        _191 = _1537;
        if (!_1557)
        {
            float _1559 = rsqrt(_1545);
            float _1561 = _1559 * _1525;
            float _1563 = _1559 * _1527;
            float _1565 = _1559 * _1529;
            float _1567 = _1551 * _1561;
            float _1569 = fma(_1549, _1563, _1567);
            float _1571 = fma(_1553, _1565, _1569);
            float _1573 = _1571 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1575 = fma(_1531, _1573, _1275);
            float _1577 = fma(_1533, _1573, _1273);
            float _1579 = fma(_1535, _1573, _1277);
            _1351 = _1577;
            _1353 = _1579;
            _1355 = _1575;
            _191 = _1567;
        }
    }
    float _1581 = _1351;
    float _1583 = _1353;
    float _1585 = _1355;
    float _1587 = _1357;
    float _1589 = _191;
    float _1591 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1593 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1595 = isnan(0.5);
    bool _1597 = _1593 || _1595;
    bool _1599 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1601 = _1597 || _1599;
    float _1603 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1591);
    bool _1605 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1607 = isnan(0.5);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1613 = _1609 || _1611;
    float _1615 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1603);
    float _1617 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1619 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1621 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1617);
    float _1623 = 1.0 / _1619;
    float _1625 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1621);
    float _1627 = _1587;
    float _1629 = _1589;
    float _1631 = _1581;
    float _1633 = _1619;
    float _1635 = _1583;
    if (_1601)
    {
        _1627 = _1581;
    }
    float _1637 = _1627;
    float _1639 = _1637;
    if (_1601)
    {
        _1629 = _1583;
    }
    float _1641 = _1629;
    float _1643 = _1625 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1645 = _1643 + _1619;
    float _1647 = _1645 * _1623;
    float _1649 = _1647 * 0.5;
    float _1651 = _1623;
    float _1653 = _1649;
    float _1655 = _1641;
    if (_1601)
    {
        _1651 = _1585;
    }
    float _1657 = _1651;
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1661 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1659);
    float _1663 = _1657;
    if (_1613)
    {
        _1653 = 1.0;
    }
    float _1665 = _1653;
    float _1667 = 1.0 / _1661;
    float _1669 = _1665;
    if (!_1601)
    {
        float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1673 = _1203 + _1671;
        float _1675 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1677 = _1087 + _1675;
        float _1679 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1681 = -_1087;
        float _1683 = _1681 + _1585;
        float _1685 = _1673 * _1673;
        float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1689 = _1085 + _1687;
        float _1691 = -_1203;
        float _1693 = _1691 + _1581;
        float _1695 = fma(_1677, _1677, _1685);
        float _1697 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1699 = fma(_1689, _1689, _1695);
        float _1701 = sqrt(_1699);
        float _1703 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1705 = precise::min(_1701, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1707 = _1705 * _1697;
        float _1709 = _1703 * _1707;
        float _1711 = -_1085;
        float _1713 = _1711 + _1583;
        float _1715 = fma(_1683, _1709, _1087);
        float _1717 = fma(_1693, _1709, _1203);
        float _1719 = fma(_1713, _1709, _1085);
        _1631 = _1693;
        _1639 = _1717;
        _1663 = _1715;
        _1655 = _1719;
        _1633 = _1701;
    }
    float _1721 = _1631;
    float _1723 = _1639;
    float _1725 = _1663;
    float _1727 = _1655;
    float _1729 = _1633;
    float _1731 = _1729;
    float _1733 = _1721;
    if (_1613)
    {
        _1731 = 1.0;
    }
    float _1735 = _1731;
    float _1737 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1739 = _1667 * _1737;
    float _1741 = _1735;
    float _1743 = _1739;
    if (!_1613)
    {
        float _1745 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1747 = _1745 * 0.15915493667125701904296875;
        float _1749 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1751 = _1747 * 6.283185482025146484375;
        float _1753 = cos(_1751);
        float _1755 = _1749 * 0.15915493667125701904296875;
        float _1757 = _1747 * 6.283185482025146484375;
        float _1759 = sin(_1757);
        float _1761 = 1.0 / _1753;
        float _1763 = _1755 * 6.283185482025146484375;
        float _1765 = cos(_1763);
        float _1767 = _1759 * _1761;
        float _1769 = _1755 * 6.283185482025146484375;
        float _1771 = sin(_1769);
        float _1773 = _1765 * _1767;
        float _1775 = 1.0 / _1773;
        float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1779 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1777;
        float _1781 = 1.0 / _1779;
        float _1783 = _1771 * _1775;
        float _1785 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1787 = fma(_1739, _1783, _1785);
        float _1789 = _1787 * _1781;
        float _1791 = precise::clamp(_1789, 0.0, 1.0);
        _1733 = _1781;
        _1669 = _1791;
    }
    float _1793 = _1733;
    float _1795 = _1669;
    float _1797 = _1793;
    if (!_1613)
    {
        float _1799 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1801 = _1799 * 0.15915493667125701904296875;
        float _1803 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1805 = _1801 * 6.283185482025146484375;
        float _1807 = cos(_1805);
        float _1809 = _1803 * 0.15915493667125701904296875;
        float _1811 = _1801 * 6.283185482025146484375;
        float _1813 = sin(_1811);
        float _1815 = 1.0 / _1807;
        float _1817 = _1809 * 6.283185482025146484375;
        float _1819 = cos(_1817);
        float _1821 = _1813 * _1815;
        float _1823 = _1809 * 6.283185482025146484375;
        float _1825 = sin(_1823);
        float _1827 = _1819 * _1821;
        float _1829 = 1.0 / _1827;
        float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1833 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1831;
        float _1835 = 1.0 / _1833;
        float _1837 = _1825 * _1829;
        float _1839 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1841 = fma(_1739, _1837, _1839);
        float _1843 = _1841 * _1835;
        float _1845 = precise::clamp(_1843, 0.0, 1.0);
        float _1847 = -_1845;
        float _1849 = _1847 + 1.0;
        _1797 = _1815;
        _1741 = _1849;
    }
    float _1851 = _1797;
    float _1853 = _1741;
    float _1855 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1857 = _1723 + _1855;
    float _1859 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1861 = _1725 + _1859;
    float _1863 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1865 = _1727 + _1863;
    float _1867 = _1857 * _1857;
    float _1869 = fma(_1861, _1861, _1867);
    float _1871 = fma(_1865, _1865, _1869);
    float _1873 = rsqrt(_1871);
    float _1875 = sqrt(_1871);
    float _1877 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1879 = _1861 * _1877;
    float _1881 = _1865 * _1877;
    float _1883 = _1879 * _1879;
    float _1885 = _1881 * _1881;
    float _1887 = _1883 + _1885;
    float _1889 = sqrt(_1887);
    bool _1891 = _1889 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1895 = _1889 + _1893;
    float _1897 = _1873;
    float _1899 = _1851;
    float _1901 = _1895;
    float _1903 = _1857;
    float _1905 = _1879;
    if (_1891)
    {
        float _1907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1897 = _1907;
    }
    float _1909 = _1897;
    if (_1891)
    {
        float _1911 = rsqrt(_1887);
        _1899 = _1911;
    }
    float _1913 = _1899;
    float _1915 = _1913;
    if (_1891)
    {
        float _1917 = _1895 * _1909;
        _1901 = _1917;
    }
    float _1919 = _1901;
    if (_1891)
    {
        float _1921 = _1919 * 0.15915493667125701904296875;
        _1743 = _1921;
    }
    float _1923 = _1743;
    float _1925 = _1865;
    if (_1891)
    {
        float _1927 = _1923 * 6.283185482025146484375;
        float _1929 = sin(_1927);
        _1925 = _1929;
    }
    float _1931 = _1925;
    float _1933 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1935 = precise::max(0.0, _1933);
    float _1937 = _1909;
    float _1939 = _1935;
    if (_1891)
    {
        float _1941 = _1923 * 6.283185482025146484375;
        float _1943 = cos(_1941);
        _1937 = _1943;
    }
    float _1945 = _1937;
    float _1947 = -_1877;
    float _1949 = -_1935;
    float _1951 = fma(_1857, _1947, _1949);
    if (_1891)
    {
        float _1953 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1903 = _1953;
    }
    float _1955 = _1903;
    float _1957 = _1955;
    float _1959 = _1931;
    if (_1891)
    {
        float _1961 = fma(_1931, _1955, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1957 = _1961;
    }
    float _1963 = _1957;
    float _1965 = _1963;
    if (!_1891)
    {
        _1959 = _1951;
    }
    float _1967 = _1959;
    float _1969 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1971 = fma(_1875, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1969);
    float _1973 = precise::clamp(_1971, 0.0, 1.0);
    float _1975 = _1967;
    float _1977 = _1945;
    if (_1891)
    {
        float _1979 = _1945 + (-1.0);
        _1939 = _1979;
    }
    float _1981 = _1939;
    float _1983 = _1981;
    if (_1891)
    {
        float _1985 = _1913 * _1963;
        _1635 = _1985;
    }
    float _1987 = _1635;
    if (!_1891)
    {
        _1965 = _1883;
    }
    float _1989 = _1965;
    float _1991 = _1989;
    if (_1891)
    {
        float _1993 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1915 = _1993;
    }
    float _1995 = _1915;
    if (_1891)
    {
        float _1997 = _1879 * _1987;
        _1905 = _1997;
    }
    float _1999 = _1905;
    if (!_1891)
    {
        _1983 = _1881;
    }
    float _2001 = _1983;
    float _2003 = _2001;
    if (_1891)
    {
        float _2005 = _1881 * _1987;
        _2003 = _2005;
    }
    float _2007 = _2003;
    if (_1891)
    {
        float _2009 = fma(_1951, _1945, _1995);
        _1975 = _2009;
    }
    float _2011 = _1975;
    if (_1891)
    {
        float _2013 = _1999 * _1999;
        _1991 = _2013;
    }
    float _2015 = _1991;
    if (!_1891)
    {
        _1977 = _1885;
    }
    float _2017 = _1977;
    float _2019 = _2017;
    if (_1891)
    {
        float _2021 = _2007 * _2007;
        _2019 = _2021;
    }
    float _2023 = _2019;
    float _2025 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2027 = fma(_2011, _2011, _2015);
    float _2029 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2031 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2033 = _2027 + _2023;
    float _2035 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2029);
    float _2037 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2039 = -_1973;
    float _2041 = _2039 + 1.0;
    float _2043 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2045 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2035);
    float _2047 = rsqrt(_2033);
    float _2049 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2037);
    float _2051 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2053 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2043);
    float _2055 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2049);
    float _2057 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2031);
    float _2059 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2061 = abs(_2041);
    float _2063 = log2(_2061);
    float _2065 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2053);
    float _2067 = _2055 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2069 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2057);
    float _2071 = -_2059;
    float _2073 = fma(_2071, _2025, 1.0);
    float _2075 = _2065 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2077 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2079 = _2069 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2081 = _2047 * _1999;
    float _2083 = _2047 * _2011;
    float _2085 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2077);
    float _2087 = _2047 * _2007;
    float _2089 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2091 = log2(_2073);
    float _2093 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2085);
    float _2095 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2097 = -_2089;
    float _2099 = fma(_2083, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2097);
    float _2101 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2103 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2093);
    float _2105 = -_2087;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2099);
    float _2109 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2111 = 1.0 / _2103;
    float _2113 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2095);
    float _2115 = fma(_2107, -0.5, 0.5);
    float _2117 = fma(_2107, 0.5, 0.5);
    float _2119 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2109);
    float _2121 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2113);
    float _2123 = _2083 + 1.0;
    float _2125 = fma(_2117, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2127 = exp2(_2101);
    float _2129 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2119);
    float _2131 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2121);
    float _2133 = fma(_2117, _2125, -0.212114393711090087890625);
    float _2135 = _2091 * 0.693147182464599609375;
    float _2137 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2129);
    float _2139 = fma(_2117, _2133, 1.570728778839111328125);
    float _2141 = sqrt(_2115);
    float _2143 = _2131 * _2111;
    float _2145 = _2135 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2147 = fma(_2143, -0.5, 0.5);
    float _2149 = -_2083;
    float _2151 = fma(_2127, _2123, _2149);
    float _2153 = _2137 * _2111;
    float _2155 = fma(_2151, 0.5, 0.5);
    float _2157 = fma(_2153, 0.5, 0.5);
    float _2159 = _2141 * 0.636619746685028076171875;
    float3 _5531 = float3(_2157, _2147, _2145);
    float _2161 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5531, float3(0.0), isnan(_5531)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5531, float3(0.0), isnan(_5531)), level(0.0)).x;
    float3 _5542 = float3(_2157, _2147, _2145);
    float4 _2164 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5542, float3(0.0), isnan(_5542)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5542, float3(0.0), isnan(_5542)), level(0.0)).xyzw;
    float _2166 = _2164.x;
    float _2168 = _2164.y;
    float _2170 = _2164.z;
    float _2172 = _2164.w;
    float _2174 = -_2139;
    float _2176 = fma(_2159, _2174, 1.0);
    float2 _5564 = float2(_2176, _2155);
    float3 _2180 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5564, float2(0.0), isnan(_5564)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5564, float2(0.0), isnan(_5564)), level(0.0)).xyz;
    float _2182 = _2180.x;
    float _2184 = _2180.y;
    float _2186 = _2180.z;
    float _2188 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2190 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2192 = _1795 > 0.0;
    bool _2194 = isnan(_1795);
    bool _2196 = _2192 || _2194;
    bool _2198 = isnan(0.0);
    bool _2200 = _2196 || _2198;
    float _2202 = _1795 * _1853;
    float _2204 = _2137 + _2103;
    float _2206 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2190);
    float _2208 = exp2(_2188);
    bool _2210 = _1853 <= 0.0;
    bool _2212 = !_2200;
    bool _2214 = _2210 || _2212;
    float _2216 = _2103 * 0.5;
    float _2218 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2206);
    float _2220 = _2202 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2222 = _2204 * 0.5;
    float _2224 = fma(_2131, -0.5, _2216);
    float _2226 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2218);
    float _2228 = _2220 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2230 = _2226 + _2103;
    out.gl_Position.x = _2137;
    out.gl_Position.y = _2131;
    out.gl_Position.z = _2226;
    out.gl_Position.w = _2103;
    float _2232 = _2230 * 0.5;
    float _2234 = -_2208;
    float _2236 = _2234 + 1.0;
    out.m_45.x = _2228;
    float _2238 = _2236 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.x = _2222;
    out.m_64.y = _2224;
    out.m_64.z = _2232;
    out.m_64.w = _2103;
    float _2240 = -_2238;
    float _2242 = _2240 + 1.0;
    float _2244 = _2238 * _2161;
    float _2246 = _2172 * _2244;
    float _2248 = _2186 * _2244;
    float _2250 = fma(_2182, _2246, _2166);
    float _2252 = fma(_2184, _2246, _2168);
    float _2254 = _2172 * _2242;
    float _2256 = fma(_2172, _2248, _2170);
    out.m_66.x = _2250;
    out.m_66.y = _2252;
    out.m_66.z = _2256;
    out.m_66.w = _2254;
    if (!_2214)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2258 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2258;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _673 = false;
    bool _561 = false;
    bool _459 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2315 = as_type<float>(_101);
        out.gl_Position.z = _2315;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = _119;
    if (_115)
    {
        float _123 = float(_85);
        _95 = _123;
    }
    float _125 = _95;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _103 = as_type<int>(_137);
    }
    int _139 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2385 = as_type<float>(_139);
        out.gl_Position.z = _2385;
    }
    if (_131)
    {
        return out;
    }
    float _141 = in.m_49.w;
    float _143 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = in.m_47.x;
    float _157 = in.m_47.y;
    float _159 = in.m_47.z;
    float _161 = in.m_42.x;
    float _163 = in.m_42.y;
    float _165 = in.m_42.z;
    float _167 = 0.0;
    float _169 = _143;
    if (!_153)
    {
        float _171 = _143 * _143;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _175;
    if (!_153)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    bool _183 = !_153;
    float _185 = _181;
    float _187 = 0.0;
    float _189 = _159;
    float _191 = _159;
    if (!_183)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _143 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _143);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _221;
        _187 = _199;
    }
    float _223 = _185;
    float _225 = _187;
    float _227 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _229 = !_153;
    float _231 = _225;
    float _233 = _223;
    if (!_229)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _143 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _231 = _243;
        _169 = _253;
    }
    float _255 = _231;
    float _257 = _169;
    float _259 = _227 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _261 = _227 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _263 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _265 = _227 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _267 = _255;
    if (!_153)
    {
        float _269 = _119 * _119;
        float _271 = _269 * 0.5;
        _267 = _271;
    }
    float _273 = _267;
    float _275 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[8].x, _259);
    float _277 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[8].y, _261);
    float _279 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[8].z, _265);
    float _281 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_153)
    {
        float _283 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _283;
    }
    float _285 = _233;
    bool _287 = !_153;
    float _289 = _285;
    if (!_287)
    {
        float _291 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _293 = log2(_291);
        float _295 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _297 = _295 + 1.0;
        float _299 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _301 = _119 * _293;
        float _303 = 1.0 / _297;
        float _305 = _299 * 0.693147182464599609375;
        float _307 = exp2(_301);
        float _309 = 1.0 / _305;
        float _311 = _307 + (-1.0);
        float _313 = -_311;
        float _315 = fma(_313, _309, _119);
        float _317 = _315 * _303;
        float _319 = _317 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _289 = _319;
    }
    float _321 = _289;
    float _323 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _325 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[10].x, _275);
    float _327 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[10].y, _277);
    float _329 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _331 = _323 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _333 = _323 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _335 = _323 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _337 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[10].z, _279);
    float _339 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[8].x, _331);
    float _341 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[8].y, _333);
    float _343 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[8].z, _335);
    float _345 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _347 = fma(_257, _155, _325);
    float _349 = fma(_257, _157, _327);
    float _351 = fma(_257, _159, _337);
    float _353 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[10].x, _339);
    float _355 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[10].y, _341);
    float _357 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[10].z, _343);
    float _359 = _337;
    if (!_153)
    {
        _359 = _119;
    }
    float _361 = _359;
    bool _363 = !_153;
    float _365 = _361;
    if (!_363)
    {
        float _367 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _369 = log2(_367);
        float _371 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _373 = _371 + 1.0;
        float _375 = 1.0 / _373;
        float _377 = _119 * _369;
        float _379 = exp2(_377);
        float _381 = -_379;
        float _383 = _381 + 1.0;
        float _385 = _383 * _375;
        _365 = _385;
    }
    float _387 = _365;
    float _389 = fma(_387, _157, _355);
    float _391 = fma(_387, _159, _357);
    bool _393 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _395 = fma(_349, _141, _163);
    float _397 = fma(_387, _155, _353);
    float _399 = -_389;
    float _401 = _349 + _399;
    float _403 = fma(_347, _141, _161);
    float _405 = -_391;
    float _407 = _351 + _405;
    float _409 = -_397;
    float _411 = _347 + _409;
    float _413 = _401 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _415 = _401 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _417 = _401 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _419 = fma(_351, _141, _165);
    float _421 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].x, _413);
    float _423 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].x, _415);
    float _425 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].x, _417);
    float _427 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].z, _421);
    float _429 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].z, _423);
    float _431 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].z, _425);
    bool _433 = !_393;
    float _435 = _429;
    float _437 = _427;
    float _439 = _431;
    float _457;
    if (!_433)
    {
        float _441 = in.m_51.x;
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _445 = _441 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        float _461 = float(_85);
        float _463 = 1.0 / _461;
        float _465 = _119 * _463;
        _457 = _465;
    }
    _459 = false;
    float _467 = _457;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _471 = _467 + _469;
    bool _473 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _475 = isnan(_467);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _485;
    float _489 = -_483;
    float _491 = _489 + 1.0;
    bool _493 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _495 = isnan(_467);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _505;
    bool _509 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _511 = 1.0 / _487;
    float _513 = _503 * _491;
    float _515 = -_503;
    float _517 = _515 + 1.0;
    float _519 = _471 * _511;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _521;
    float _525 = fma(_507, _519, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _527 = fma(_523, _519, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _529 = _525 * _513;
    float _531 = _527 * _513;
    float _533 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[143].x, _529);
    float _535 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[143].y, _531);
    float _537 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[144].x, _533);
    float _539 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[144].y, _535);
    bool _541 = !_509;
    float _559;
    if (!_541)
    {
        float _543 = in.m_51.x;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _547 = _543 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _549 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _551 = _549 * _545;
        float _553 = floor(_551);
        float _555 = -_553;
        float _557 = _551 + _555;
        _559 = _557;
        _561 = true;
    }
    else
    {
        float _563 = float(_85);
        float _565 = 1.0 / _563;
        float _567 = _119 * _565;
        _559 = _567;
    }
    _561 = false;
    float _569 = _559;
    float _571 = in.m_49.x;
    float _573 = in.m_49.y;
    bool _575 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _577 = isnan(_569);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _591 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _593 = isnan(_569);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _603;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _609 = _569 + _607;
    float _611 = -_585;
    float _613 = _611 + 1.0;
    float _615 = 1.0 / _589;
    float _617 = _601 * _613;
    float _619 = -_601;
    float _621 = _619 + 1.0;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _627 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _631 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _633 = _625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _635 = _629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = _539 * _573;
    float _639 = _537 * _571;
    float _641 = _605 * _615;
    float _643 = fma(_641, _609, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _645 = _643 * _617;
    float _647 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[115].x, _645);
    float _649 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[116].x, _647);
    float _651 = _649 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _631;
    out.m_53.y = _633;
    out.m_53.z = _635;
    out.m_53.w = _651;
    bool _653 = !_627;
    float _671;
    if (!_653)
    {
        float _655 = in.m_51.x;
        float _657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _659 = _655 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _661 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _663 = _661 * _657;
        float _665 = floor(_663);
        float _667 = -_665;
        float _669 = _663 + _667;
        _671 = _669;
        _673 = true;
    }
    else
    {
        float _675 = float(_85);
        float _677 = 1.0 / _675;
        float _679 = _119 * _677;
        _671 = _679;
    }
    _673 = false;
    float _681 = _671;
    float _683 = in.m_51.z;
    float _685 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _687 = log2(_685);
    float _689 = _637 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _691 = in.m_51.x;
    float _693 = in.m_51.y;
    float _695 = _639 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _697 = _119 * _687;
    float _699 = exp2(_697);
    float _701 = _683 * 2.0;
    float _703 = _691 * 2.0;
    float _705 = _693 * 2.0;
    float _707 = floor(_701);
    float _709 = _693 + _691;
    float _711 = _709 + (-1.0);
    float _713 = -_699;
    float _715 = _713 + 1.0;
    float _717 = floor(_703);
    bool _719 = _707 > 0.0;
    float _721 = floor(_705);
    bool _723 = _707 >= 0.0;
    bool _725 = isnan(_707);
    bool _727 = _723 || _725;
    bool _729 = isnan(0.0);
    bool _731 = _727 || _729;
    float _733 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _737 = 1.0 + _735;
    int _739 = _731 ? 0 : 1;
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _743 = _741 != 0;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _751 = _749 != 0;
    float _753 = 1.0 / _737;
    int _755 = ~_739;
    int _757 = _755 + 1;
    int _759 = _757 + 1;
    bool _761 = _717 > 0.0;
    int _763 = _759;
    if (!_719)
    {
        int _765 = ~_739;
        int _767 = _765 + 1;
        _763 = _767;
    }
    int _769 = _763;
    float _771 = in.m_55.x;
    float _773 = in.m_55.y;
    float _775 = in.m_55.z;
    bool _777 = _717 >= 0.0;
    bool _779 = isnan(_717);
    bool _781 = _777 || _779;
    bool _783 = isnan(0.0);
    bool _785 = _781 || _783;
    bool _787 = !_743;
    int _789 = _787 ? 0 : 1;
    bool _791 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _793 = isnan(0.0);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _799 = _795 || _797;
    int _801 = abs(_789);
    bool _803 = _721 > 0.0;
    int _805 = _785 ? 0 : 1;
    bool _807 = _721 >= 0.0;
    bool _809 = isnan(_721);
    bool _811 = _807 || _809;
    bool _813 = isnan(0.0);
    bool _815 = _811 || _813;
    bool _817 = !_747;
    int _819 = _817 ? 0 : 1;
    float _821 = float(_801);
    float _823 = float(_769);
    float _825 = _799 ? _715 : 0.0;
    int _827 = abs(_819);
    float _829 = _821 * _823;
    int _831 = _815 ? 0 : 1;
    float _833 = _825 * _753;
    int _835 = ~_805;
    int _837 = _835 + 1;
    int _839 = _837 + 1;
    float _841 = _829 * (-2.0);
    int _843 = _839;
    if (!_761)
    {
        int _845 = ~_805;
        int _847 = _845 + 1;
        _843 = _847;
    }
    int _849 = _843;
    int _851 = ~_831;
    int _853 = _851 + 1;
    int _855 = _853 + 1;
    float _857 = fma(_841, _771, _771);
    int _859 = _855;
    if (!_803)
    {
        int _861 = ~_831;
        int _863 = _861 + 1;
        _859 = _863;
    }
    int _865 = _859;
    float _867 = fma(_733, _841, _733);
    float _869 = float(_827);
    float _871 = _691 + (-0.5);
    bool _873 = !_751;
    int _875 = _873 ? 0 : 1;
    float _877 = float(_849);
    int _879 = abs(_875);
    float _881 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[196].x, _857);
    float _883 = _693 + _683;
    float _885 = _869 * _877;
    bool _887 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _889 = isnan(1.0);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _895 = _891 || _893;
    float _897 = _883 + (-1.0);
    bool _899 = !_895;
    float _901 = _899 ? _119 : _833;
    float _903 = _885 * (-2.0);
    float _905 = float(_879);
    float _907 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _909 = float(_865);
    float _911 = fma(_901, _867, _881);
    float _913 = fma(_903, _773, _773);
    float _915 = fma(_907, _903, _907);
    float _917 = _683 + _691;
    float _919 = _905 * _909;
    float _921 = _693 + (-0.5);
    float _923 = as_type<float>(int(gl_VertexIndex));
    float _925 = _911 * 0.15915493667125701904296875;
    float _927 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[196].y, _913);
    float _929 = _917 + (-1.0);
    float _931 = _919 * (-2.0);
    float _933 = _683 + (-0.5);
    float _935 = fma(_901, _915, _927);
    float _937 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _939 = fma(_931, _775, _775);
    float _941 = _925 * 6.283185482025146484375;
    float _943 = sin(_941);
    float _945 = _935 * 0.15915493667125701904296875;
    float _947 = fma(_937, _931, _937);
    float _949 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[196].z, _939);
    float _951 = fma(_901, _947, _949);
    float _953 = _925 * 6.283185482025146484375;
    float _955 = cos(_953);
    float _957 = _951 * 0.15915493667125701904296875;
    int _959 = as_type<int>(_923) & 1;
    bool _961 = _959 != 0;
    int _963 = as_type<int>(_923) & 2;
    bool _965 = _963 != 0;
    float _967 = _945 * 6.283185482025146484375;
    float _969 = sin(_967);
    bool _971 = !_965;
    float _973 = _971 ? (-0.5) : 0.5;
    bool _975 = !_961;
    float _977 = _975 ? (-0.5) : 0.5;
    bool _979 = _691 > 0.5;
    float _981 = _945 * 6.283185482025146484375;
    float _983 = cos(_981);
    float _985 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _973);
    float _987 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _977);
    float _989 = _689 * _985;
    float _991 = _695 * _987;
    bool _993 = _693 > 0.5;
    float _995 = _957 * 6.283185482025146484375;
    float _997 = sin(_995);
    float _999 = _955 * _969;
    float _1001 = _943 * _969;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1003;
    float _1007 = _957 * 6.283185482025146484375;
    float _1009 = cos(_1007);
    float _1011 = _943 * _983;
    float _1013 = _955 * _983;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1015;
    float _1019 = -_999;
    float _1021 = fma(_997, _1011, _1019);
    float _1023 = -_1011;
    float _1025 = fma(_997, _999, _1023);
    float _1027 = _1009 * _989;
    float _1029 = _969 * _1009;
    float _1031 = _983 * _1009;
    float _1033 = fma(_997, _1013, _1001);
    float _1035 = -_989;
    float _1037 = _997 * _1035;
    float _1039 = fma(_997, _1001, _1013);
    float _1041 = _955 * _1027;
    float _1043 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1045 = fma(_1031, _991, _1037);
    float _1047 = _943 * _1027;
    float _1049 = fma(_1033, _991, _1041);
    float _1051 = _395 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1053 = fma(_1029, _1043, _1045);
    float _1055 = fma(_1021, _991, _1047);
    float _1057 = fma(_1025, _1043, _1049);
    float _1059 = _395 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1061 = _395 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1063 = fma(_1039, _1043, _1055);
    float _1065 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1067 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1069 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1061);
    float _1071 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1051);
    float _1073 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1065);
    float _1075 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1067);
    float _1077 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1069);
    float _1079 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1071);
    float _1081 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1073);
    float _1083 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1075);
    float _1085 = _1077 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1087 = _1079 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1089 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1091 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1093 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1059);
    float _1095 = _1085 + _1089;
    float _1097 = _1087 + _1091;
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1099;
    float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1105 = _1095 + _1103;
    float _1107 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1109 = _1097 + _1107;
    float _1111 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1113 = 1.0 / _1101;
    float _1115 = _1105 * _1105;
    int _1117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1119 = _1117 != 0;
    float _1121 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1111);
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1125 = _1123 != 0;
    float _1127 = fma(_1109, _1109, _1115);
    float _1129 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1093);
    float _1131 = -_977;
    int _1133 = _979 ? as_type<int>(_1131) : as_type<int>(_977);
    float _1135 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1121);
    float _1137 = sqrt(_1127);
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1141 = _681 + _1139;
    float _1143 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1145 = !_1119;
    float _1147 = _1145 ? _977 : as_type<float>(_1133);
    float _1149 = -_973;
    int _1151 = _993 ? as_type<int>(_1149) : as_type<int>(_973);
    float _1153 = _1141 * _1113;
    bool _1155 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1157 = isnan(_681);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1169 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1171 = isnan(_681);
    bool _1173 = _1169 || _1171;
    bool _1175 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1177 = _1173 || _1175;
    float _1179 = float(_1177);
    float _1181 = fma(_1005, _1153, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1183;
    float _1187 = -_1165;
    float _1189 = _1187 + 1.0;
    float _1191 = fma(_1017, _1153, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1193 = !_1125;
    float _1195 = _1193 ? _973 : as_type<float>(_1151);
    float _1197 = fma(_1185, _1153, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1199 = _1137 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1201 = _1179 * _1189;
    float _1203 = _1129 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1205 = -_1179;
    float _1207 = _1205 + 1.0;
    float _1209 = _1181 * _1201;
    float _1211 = _1203 + _1143;
    float _1213 = _1191 * _1201;
    float _1215 = _1197 * _1201;
    float _1217 = _1197;
    float _1219 = _1181;
    float _1221 = _1191;
    if (!_1199)
    {
        _1217 = _1097;
    }
    float _1223 = _1217;
    float _1225 = _1223;
    if (!_1199)
    {
        _1219 = _1095;
    }
    float _1227 = _1219;
    float _1229 = _1227;
    if (!_1199)
    {
        _1221 = _1211;
    }
    float _1231 = _1221;
    bool _1233 = !_1199;
    float _1235 = _1231;
    if (!_1233)
    {
        float _1237 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1239 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1241 = _1137 + _1239;
        float _1243 = _1211 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1245 = rsqrt(_1127);
        float _1247 = _1241 * _1237;
        float _1249 = _1247 * 0.15915493667125701904296875;
        float _1251 = _1249 * 6.283185482025146484375;
        float _1253 = cos(_1251);
        float _1255 = _1249 * 6.283185482025146484375;
        float _1257 = sin(_1255);
        float _1259 = _1253 + (-1.0);
        float _1261 = _1259 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1263 = fma(_1257, _1243, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1265 = fma(_1211, _1253, _1261);
        float _1267 = _1245 * _1263;
        float _1269 = fma(_1109, _1267, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1271 = fma(_1105, _1267, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1235 = _1265;
        _1225 = _1269;
        _1229 = _1271;
    }
    float _1273 = _1235;
    float _1275 = _1225;
    float _1277 = _1229;
    float _1279 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1213);
    float _1281 = -_1203;
    float _1283 = _1281 + _1273;
    float _1285 = -_1087;
    float _1287 = _1285 + _1275;
    float _1289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1291 = -_1085;
    float _1293 = _1291 + _1277;
    float _1295 = _1283 * _1283;
    float _1297 = _1147 + 0.5;
    float _1299 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1209);
    float _1301 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1215);
    float _1303 = fma(_1287, _1287, _1295);
    float _1305 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1307 = -_1195;
    float _1309 = _1307 + 0.5;
    float _1311 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1299);
    float _1313 = fma(_1293, _1293, _1303);
    float _1315 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1279);
    float _1317 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1301);
    float _1319 = _1305 * _1167;
    float _1321 = sqrt(_1313);
    float _1323 = _1309 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1325 = _1311 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1327 = _1315 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1329 = _1317 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1331 = _1323 * _1289;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1335 = _1325 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1337 = _1327 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1339 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _1319;
    out.m_60.y = _1331;
    out.m_62.x = _1335;
    out.m_62.y = _1337;
    out.m_62.z = _1339;
    out.m_62.w = _1333;
    bool _1341 = _1321 > 0.0;
    bool _1343 = !_1341;
    float _1345 = _1333;
    float _1347 = _1335;
    float _1349 = _1337;
    float _1351 = _1273;
    float _1353 = _1277;
    float _1355 = _1275;
    float _1357 = _1335;
    if (!_1343)
    {
        bool _1359 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1361 = _1339;
        if (_1359)
        {
            float _1363 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1361 = _1363;
        }
        float _1365 = _1361;
        if (_1359)
        {
            float _1367 = _427 * _1365;
            _1345 = _1367;
        }
        float _1369 = _1345;
        float _1371 = _1369;
        if (_1359)
        {
            float _1373 = _429 * _1365;
            _1347 = _1373;
        }
        float _1375 = _1347;
        float _1377 = _1375;
        if (_1359)
        {
            float _1379 = _431 * _1365;
            _1349 = _1379;
        }
        float _1381 = _1349;
        float _1383 = _1381;
        if (!_1359)
        {
            float _1385 = _119 + 1.0;
            if (!_153)
            {
                float _1387 = _1385 * _1385;
                float _1389 = _1387 * 0.5;
                _121 = _1389;
            }
            float _1391 = _121;
            float _1393 = _1391;
            if (!_153)
            {
                float _1395 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1393 = _1395;
            }
            float _1397 = _1393;
            bool _1399 = !_153;
            float _1401 = _1397;
            if (!_1399)
            {
                float _1403 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1405 = log2(_1403);
                float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1409 = 1.0 + _1407;
                float _1411 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1413 = _1405 * _1385;
                float _1415 = 1.0 / _1409;
                float _1417 = _1411 * 0.693147182464599609375;
                float _1419 = exp2(_1413);
                float _1421 = 1.0 / _1417;
                float _1423 = _1419 + (-1.0);
                float _1425 = -_1423;
                float _1427 = fma(_1425, _1421, _1385);
                float _1429 = _1427 * _1415;
                float _1431 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1401 = _1431;
            }
            float _1433 = _1401;
            float _1435 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1437 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1439 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1441 = _1433;
            if (!_153)
            {
                _1441 = _1385;
            }
            float _1443 = _1441;
            float _1445 = _1435 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _1447 = _1435 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _1449 = _1435 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _1451 = fma(_1437, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1445);
            float _1453 = fma(_1437, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1447);
            float _1455 = fma(_1439, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1451);
            bool _1457 = !_153;
            float _1459 = _1443;
            if (!_1457)
            {
                float _1461 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1463 = log2(_1461);
                float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1467 = 1.0 + _1465;
                float _1469 = 1.0 / _1467;
                float _1471 = _1463 * _1385;
                float _1473 = exp2(_1471);
                float _1475 = -_1473;
                float _1477 = _1475 + 1.0;
                float _1479 = _1477 * _1469;
                _1459 = _1479;
            }
            float _1481 = _1459;
            float _1483 = fma(_1437, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1449);
            float _1485 = fma(_1439, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1453);
            float _1487 = fma(_1481, _157, _1455);
            float _1489 = fma(_1439, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1483);
            float _1491 = fma(_1481, _155, _1485);
            float _1493 = -_389;
            float _1495 = _1493 + _1487;
            float _1497 = fma(_1481, _159, _1489);
            float _1499 = -_397;
            float _1501 = _1499 + _1491;
            float _1503 = _1495 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1505 = _1495 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1507 = _1495 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1509 = -_391;
            float _1511 = _1509 + _1497;
            float _1513 = fma(_1501, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1503);
            float _1515 = fma(_1501, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1505);
            float _1517 = fma(_1501, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1507);
            float _1519 = fma(_1511, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1513);
            float _1521 = fma(_1511, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1515);
            float _1523 = fma(_1511, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1517);
            _435 = _1521;
            _437 = _1519;
            _439 = _1523;
            _1371 = _1519;
            _1377 = _1521;
            _1383 = _1523;
            _189 = _1513;
        }
        float _1525 = _435;
        float _1527 = _437;
        float _1529 = _439;
        float _1531 = _1371;
        float _1533 = _1377;
        float _1535 = _1383;
        float _1537 = _189;
        float _1539 = _1525 * _1525;
        float _1541 = rsqrt(_1313);
        float _1543 = fma(_1527, _1527, _1539);
        float _1545 = fma(_1529, _1529, _1543);
        float _1547 = sqrt(_1545);
        float _1549 = _1287 * _1541;
        float _1551 = _1283 * _1541;
        float _1553 = _1293 * _1541;
        bool _1555 = _1547 > 0.0;
        bool _1557 = !_1555;
        _1357 = _1533;
        _191 = _1537;
        if (!_1557)
        {
            float _1559 = rsqrt(_1545);
            float _1561 = _1559 * _1525;
            float _1563 = _1559 * _1527;
            float _1565 = _1559 * _1529;
            float _1567 = _1551 * _1561;
            float _1569 = fma(_1549, _1563, _1567);
            float _1571 = fma(_1553, _1565, _1569);
            float _1573 = _1571 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1575 = fma(_1531, _1573, _1275);
            float _1577 = fma(_1533, _1573, _1273);
            float _1579 = fma(_1535, _1573, _1277);
            _1351 = _1577;
            _1353 = _1579;
            _1355 = _1575;
            _191 = _1567;
        }
    }
    float _1581 = _1351;
    float _1583 = _1353;
    float _1585 = _1355;
    float _1587 = _1357;
    float _1589 = _191;
    float _1591 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1593 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1595 = isnan(0.5);
    bool _1597 = _1593 || _1595;
    bool _1599 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1601 = _1597 || _1599;
    float _1603 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1591);
    bool _1605 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1607 = isnan(0.5);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1613 = _1609 || _1611;
    float _1615 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1603);
    float _1617 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1619 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1621 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1617);
    float _1623 = 1.0 / _1619;
    float _1625 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1621);
    float _1627 = _1587;
    float _1629 = _1589;
    float _1631 = _1581;
    float _1633 = _1619;
    float _1635 = _1583;
    if (_1601)
    {
        _1627 = _1581;
    }
    float _1637 = _1627;
    float _1639 = _1637;
    if (_1601)
    {
        _1629 = _1583;
    }
    float _1641 = _1629;
    float _1643 = _1625 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1645 = _1643 + _1619;
    float _1647 = _1645 * _1623;
    float _1649 = _1647 * 0.5;
    float _1651 = _1623;
    float _1653 = _1649;
    float _1655 = _1641;
    if (_1601)
    {
        _1651 = _1585;
    }
    float _1657 = _1651;
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1661 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1659);
    float _1663 = _1657;
    if (_1613)
    {
        _1653 = 1.0;
    }
    float _1665 = _1653;
    float _1667 = 1.0 / _1661;
    float _1669 = _1665;
    if (!_1601)
    {
        float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1673 = _1203 + _1671;
        float _1675 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1677 = _1087 + _1675;
        float _1679 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1681 = -_1087;
        float _1683 = _1681 + _1585;
        float _1685 = _1673 * _1673;
        float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1689 = _1085 + _1687;
        float _1691 = -_1203;
        float _1693 = _1691 + _1581;
        float _1695 = fma(_1677, _1677, _1685);
        float _1697 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1699 = fma(_1689, _1689, _1695);
        float _1701 = sqrt(_1699);
        float _1703 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1705 = precise::min(_1701, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1707 = _1705 * _1697;
        float _1709 = _1703 * _1707;
        float _1711 = -_1085;
        float _1713 = _1711 + _1583;
        float _1715 = fma(_1683, _1709, _1087);
        float _1717 = fma(_1693, _1709, _1203);
        float _1719 = fma(_1713, _1709, _1085);
        _1631 = _1693;
        _1639 = _1717;
        _1663 = _1715;
        _1655 = _1719;
        _1633 = _1701;
    }
    float _1721 = _1631;
    float _1723 = _1639;
    float _1725 = _1663;
    float _1727 = _1655;
    float _1729 = _1633;
    float _1731 = _1729;
    float _1733 = _1721;
    if (_1613)
    {
        _1731 = 1.0;
    }
    float _1735 = _1731;
    float _1737 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1739 = _1667 * _1737;
    float _1741 = _1735;
    float _1743 = _1739;
    if (!_1613)
    {
        float _1745 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1747 = _1745 * 0.15915493667125701904296875;
        float _1749 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1751 = _1747 * 6.283185482025146484375;
        float _1753 = cos(_1751);
        float _1755 = _1749 * 0.15915493667125701904296875;
        float _1757 = _1747 * 6.283185482025146484375;
        float _1759 = sin(_1757);
        float _1761 = 1.0 / _1753;
        float _1763 = _1755 * 6.283185482025146484375;
        float _1765 = cos(_1763);
        float _1767 = _1759 * _1761;
        float _1769 = _1755 * 6.283185482025146484375;
        float _1771 = sin(_1769);
        float _1773 = _1765 * _1767;
        float _1775 = 1.0 / _1773;
        float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1779 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1777;
        float _1781 = 1.0 / _1779;
        float _1783 = _1771 * _1775;
        float _1785 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1787 = fma(_1739, _1783, _1785);
        float _1789 = _1787 * _1781;
        float _1791 = precise::clamp(_1789, 0.0, 1.0);
        _1733 = _1781;
        _1669 = _1791;
    }
    float _1793 = _1733;
    float _1795 = _1669;
    float _1797 = _1793;
    if (!_1613)
    {
        float _1799 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1801 = _1799 * 0.15915493667125701904296875;
        float _1803 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1805 = _1801 * 6.283185482025146484375;
        float _1807 = cos(_1805);
        float _1809 = _1803 * 0.15915493667125701904296875;
        float _1811 = _1801 * 6.283185482025146484375;
        float _1813 = sin(_1811);
        float _1815 = 1.0 / _1807;
        float _1817 = _1809 * 6.283185482025146484375;
        float _1819 = cos(_1817);
        float _1821 = _1813 * _1815;
        float _1823 = _1809 * 6.283185482025146484375;
        float _1825 = sin(_1823);
        float _1827 = _1819 * _1821;
        float _1829 = 1.0 / _1827;
        float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1833 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1831;
        float _1835 = 1.0 / _1833;
        float _1837 = _1825 * _1829;
        float _1839 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1841 = fma(_1739, _1837, _1839);
        float _1843 = _1841 * _1835;
        float _1845 = precise::clamp(_1843, 0.0, 1.0);
        float _1847 = -_1845;
        float _1849 = _1847 + 1.0;
        _1797 = _1815;
        _1741 = _1849;
    }
    float _1851 = _1797;
    float _1853 = _1741;
    float _1855 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1857 = _1723 + _1855;
    float _1859 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1861 = _1725 + _1859;
    float _1863 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1865 = _1727 + _1863;
    float _1867 = _1857 * _1857;
    float _1869 = fma(_1861, _1861, _1867);
    float _1871 = fma(_1865, _1865, _1869);
    float _1873 = rsqrt(_1871);
    float _1875 = sqrt(_1871);
    float _1877 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1879 = _1861 * _1877;
    float _1881 = _1865 * _1877;
    float _1883 = _1879 * _1879;
    float _1885 = _1881 * _1881;
    float _1887 = _1883 + _1885;
    float _1889 = sqrt(_1887);
    bool _1891 = _1889 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1895 = _1889 + _1893;
    float _1897 = _1873;
    float _1899 = _1851;
    float _1901 = _1895;
    float _1903 = _1857;
    float _1905 = _1879;
    if (_1891)
    {
        float _1907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1897 = _1907;
    }
    float _1909 = _1897;
    if (_1891)
    {
        float _1911 = rsqrt(_1887);
        _1899 = _1911;
    }
    float _1913 = _1899;
    float _1915 = _1913;
    if (_1891)
    {
        float _1917 = _1895 * _1909;
        _1901 = _1917;
    }
    float _1919 = _1901;
    if (_1891)
    {
        float _1921 = _1919 * 0.15915493667125701904296875;
        _1743 = _1921;
    }
    float _1923 = _1743;
    float _1925 = _1865;
    if (_1891)
    {
        float _1927 = _1923 * 6.283185482025146484375;
        float _1929 = sin(_1927);
        _1925 = _1929;
    }
    float _1931 = _1925;
    float _1933 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1935 = precise::max(0.0, _1933);
    float _1937 = _1909;
    float _1939 = _1935;
    if (_1891)
    {
        float _1941 = _1923 * 6.283185482025146484375;
        float _1943 = cos(_1941);
        _1937 = _1943;
    }
    float _1945 = _1937;
    float _1947 = -_1877;
    float _1949 = -_1935;
    float _1951 = fma(_1857, _1947, _1949);
    if (_1891)
    {
        float _1953 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1903 = _1953;
    }
    float _1955 = _1903;
    float _1957 = _1955;
    float _1959 = _1931;
    if (_1891)
    {
        float _1961 = fma(_1931, _1955, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1957 = _1961;
    }
    float _1963 = _1957;
    float _1965 = _1963;
    if (!_1891)
    {
        _1959 = _1951;
    }
    float _1967 = _1959;
    float _1969 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1971 = fma(_1875, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1969);
    float _1973 = precise::clamp(_1971, 0.0, 1.0);
    float _1975 = _1967;
    float _1977 = _1945;
    if (_1891)
    {
        float _1979 = _1945 + (-1.0);
        _1939 = _1979;
    }
    float _1981 = _1939;
    float _1983 = _1981;
    if (_1891)
    {
        float _1985 = _1913 * _1963;
        _1635 = _1985;
    }
    float _1987 = _1635;
    if (!_1891)
    {
        _1965 = _1883;
    }
    float _1989 = _1965;
    float _1991 = _1989;
    if (_1891)
    {
        float _1993 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1915 = _1993;
    }
    float _1995 = _1915;
    if (_1891)
    {
        float _1997 = _1879 * _1987;
        _1905 = _1997;
    }
    float _1999 = _1905;
    if (!_1891)
    {
        _1983 = _1881;
    }
    float _2001 = _1983;
    float _2003 = _2001;
    if (_1891)
    {
        float _2005 = _1881 * _1987;
        _2003 = _2005;
    }
    float _2007 = _2003;
    if (_1891)
    {
        float _2009 = fma(_1951, _1945, _1995);
        _1975 = _2009;
    }
    float _2011 = _1975;
    if (_1891)
    {
        float _2013 = _1999 * _1999;
        _1991 = _2013;
    }
    float _2015 = _1991;
    if (!_1891)
    {
        _1977 = _1885;
    }
    float _2017 = _1977;
    float _2019 = _2017;
    if (_1891)
    {
        float _2021 = _2007 * _2007;
        _2019 = _2021;
    }
    float _2023 = _2019;
    float _2025 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2027 = fma(_2011, _2011, _2015);
    float _2029 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2031 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2033 = _2027 + _2023;
    float _2035 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2029);
    float _2037 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2039 = -_1973;
    float _2041 = _2039 + 1.0;
    float _2043 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2045 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2035);
    float _2047 = rsqrt(_2033);
    float _2049 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2037);
    float _2051 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2053 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2043);
    float _2055 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2049);
    float _2057 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2031);
    float _2059 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2061 = abs(_2041);
    float _2063 = log2(_2061);
    float _2065 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2053);
    float _2067 = _2055 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2069 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2057);
    float _2071 = -_2059;
    float _2073 = fma(_2071, _2025, 1.0);
    float _2075 = _2065 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2077 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2079 = _2069 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2081 = _2047 * _1999;
    float _2083 = _2047 * _2011;
    float _2085 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2077);
    float _2087 = _2047 * _2007;
    float _2089 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2091 = log2(_2073);
    float _2093 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2085);
    float _2095 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2097 = -_2089;
    float _2099 = fma(_2083, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2097);
    float _2101 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2103 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2093);
    float _2105 = -_2087;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2099);
    float _2109 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2111 = 1.0 / _2103;
    float _2113 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2095);
    float _2115 = fma(_2107, -0.5, 0.5);
    float _2117 = fma(_2107, 0.5, 0.5);
    float _2119 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2109);
    float _2121 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2113);
    float _2123 = _2083 + 1.0;
    float _2125 = fma(_2117, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2127 = exp2(_2101);
    float _2129 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2119);
    float _2131 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2121);
    float _2133 = fma(_2117, _2125, -0.212114393711090087890625);
    float _2135 = _2091 * 0.693147182464599609375;
    float _2137 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2129);
    float _2139 = fma(_2117, _2133, 1.570728778839111328125);
    float _2141 = sqrt(_2115);
    float _2143 = _2131 * _2111;
    float _2145 = _2135 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2147 = fma(_2143, -0.5, 0.5);
    float _2149 = -_2083;
    float _2151 = fma(_2127, _2123, _2149);
    float _2153 = _2137 * _2111;
    float _2155 = fma(_2151, 0.5, 0.5);
    float _2157 = fma(_2153, 0.5, 0.5);
    float _2159 = _2141 * 0.636619746685028076171875;
    float3 _5531 = float3(_2157, _2147, _2145);
    float _2161 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5531, float3(0.0), isnan(_5531)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5531, float3(0.0), isnan(_5531)), level(0.0)).x;
    float3 _5542 = float3(_2157, _2147, _2145);
    float4 _2164 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5542, float3(0.0), isnan(_5542)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5542, float3(0.0), isnan(_5542)), level(0.0)).xyzw;
    float _2166 = _2164.x;
    float _2168 = _2164.y;
    float _2170 = _2164.z;
    float _2172 = _2164.w;
    float _2174 = -_2139;
    float _2176 = fma(_2159, _2174, 1.0);
    float2 _5564 = float2(_2176, _2155);
    float3 _2180 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5564, float2(0.0), isnan(_5564)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5564, float2(0.0), isnan(_5564)), level(0.0)).xyz;
    float _2182 = _2180.x;
    float _2184 = _2180.y;
    float _2186 = _2180.z;
    float _2188 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2190 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2192 = _1795 > 0.0;
    bool _2194 = isnan(_1795);
    bool _2196 = _2192 || _2194;
    bool _2198 = isnan(0.0);
    bool _2200 = _2196 || _2198;
    float _2202 = _1795 * _1853;
    float _2204 = _2137 + _2103;
    float _2206 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2190);
    float _2208 = exp2(_2188);
    bool _2210 = _1853 <= 0.0;
    bool _2212 = !_2200;
    bool _2214 = _2210 || _2212;
    float _2216 = _2103 * 0.5;
    float _2218 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2206);
    float _2220 = _2202 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2222 = _2204 * 0.5;
    float _2224 = fma(_2131, -0.5, _2216);
    float _2226 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2218);
    float _2228 = _2220 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2230 = _2226 + _2103;
    out.gl_Position.x = _2137;
    out.gl_Position.y = _2131;
    out.gl_Position.z = _2226;
    out.gl_Position.w = _2103;
    float _2232 = _2230 * 0.5;
    float _2234 = -_2208;
    float _2236 = _2234 + 1.0;
    out.m_45.x = _2228;
    float _2238 = _2236 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.x = _2222;
    out.m_64.y = _2224;
    out.m_64.z = _2232;
    out.m_64.w = _2103;
    float _2240 = -_2238;
    float _2242 = _2240 + 1.0;
    float _2244 = _2238 * _2161;
    float _2246 = _2172 * _2244;
    float _2248 = _2186 * _2244;
    float _2250 = fma(_2182, _2246, _2166);
    float _2252 = fma(_2184, _2246, _2168);
    float _2254 = _2172 * _2242;
    float _2256 = fma(_2172, _2248, _2170);
    out.m_66.x = _2250;
    out.m_66.y = _2252;
    out.m_66.z = _2256;
    out.m_66.w = _2254;
    if (!_2214)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2258 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2258;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _673 = false;
    bool _561 = false;
    bool _459 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2315 = as_type<float>(_101);
        out.gl_Position.z = _2315;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = _119;
    if (_115)
    {
        float _123 = float(_85);
        _95 = _123;
    }
    float _125 = _95;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _103 = as_type<int>(_137);
    }
    int _139 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2385 = as_type<float>(_139);
        out.gl_Position.z = _2385;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_49.w;
    float _143 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = in.m_47.x;
    float _157 = in.m_47.y;
    float _159 = in.m_47.z;
    float _161 = in.m_42.x;
    float _163 = in.m_42.y;
    float _165 = in.m_42.z;
    float _167 = 0.0;
    float _169 = _143;
    if (!_153)
    {
        float _171 = _143 * _143;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _175;
    if (!_153)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    bool _183 = !_153;
    float _185 = _181;
    float _187 = 0.0;
    float _189 = _159;
    float _191 = _159;
    if (!_183)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _143 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _143);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _221;
        _187 = _199;
    }
    float _223 = _185;
    float _225 = _187;
    float _227 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _229 = !_153;
    float _231 = _225;
    float _233 = _223;
    if (!_229)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _143 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _231 = _243;
        _169 = _253;
    }
    float _255 = _231;
    float _257 = _169;
    float _259 = _227 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _261 = _227 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _263 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _265 = _227 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _267 = _255;
    if (!_153)
    {
        float _269 = _119 * _119;
        float _271 = _269 * 0.5;
        _267 = _271;
    }
    float _273 = _267;
    float _275 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[8].x, _259);
    float _277 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[8].y, _261);
    float _279 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[8].z, _265);
    float _281 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_153)
    {
        float _283 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _283;
    }
    float _285 = _233;
    bool _287 = !_153;
    float _289 = _285;
    if (!_287)
    {
        float _291 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _293 = log2(_291);
        float _295 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _297 = _295 + 1.0;
        float _299 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _301 = _119 * _293;
        float _303 = 1.0 / _297;
        float _305 = _299 * 0.693147182464599609375;
        float _307 = exp2(_301);
        float _309 = 1.0 / _305;
        float _311 = _307 + (-1.0);
        float _313 = -_311;
        float _315 = fma(_313, _309, _119);
        float _317 = _315 * _303;
        float _319 = _317 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _289 = _319;
    }
    float _321 = _289;
    float _323 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _325 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[10].x, _275);
    float _327 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[10].y, _277);
    float _329 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _331 = _323 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _333 = _323 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _335 = _323 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _337 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[10].z, _279);
    float _339 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[8].x, _331);
    float _341 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[8].y, _333);
    float _343 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[8].z, _335);
    float _345 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _347 = fma(_257, _155, _325);
    float _349 = fma(_257, _157, _327);
    float _351 = fma(_257, _159, _337);
    float _353 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[10].x, _339);
    float _355 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[10].y, _341);
    float _357 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[10].z, _343);
    float _359 = _337;
    if (!_153)
    {
        _359 = _119;
    }
    float _361 = _359;
    bool _363 = !_153;
    float _365 = _361;
    if (!_363)
    {
        float _367 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _369 = log2(_367);
        float _371 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _373 = _371 + 1.0;
        float _375 = 1.0 / _373;
        float _377 = _119 * _369;
        float _379 = exp2(_377);
        float _381 = -_379;
        float _383 = _381 + 1.0;
        float _385 = _383 * _375;
        _365 = _385;
    }
    float _387 = _365;
    float _389 = fma(_387, _157, _355);
    float _391 = fma(_387, _159, _357);
    bool _393 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _395 = fma(_349, _141, _163);
    float _397 = fma(_387, _155, _353);
    float _399 = -_389;
    float _401 = _349 + _399;
    float _403 = fma(_347, _141, _161);
    float _405 = -_391;
    float _407 = _351 + _405;
    float _409 = -_397;
    float _411 = _347 + _409;
    float _413 = _401 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _415 = _401 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _417 = _401 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _419 = fma(_351, _141, _165);
    float _421 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].x, _413);
    float _423 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].x, _415);
    float _425 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].x, _417);
    float _427 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].z, _421);
    float _429 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].z, _423);
    float _431 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].z, _425);
    bool _433 = !_393;
    float _435 = _429;
    float _437 = _427;
    float _439 = _431;
    float _457;
    if (!_433)
    {
        float _441 = in.m_51.x;
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _445 = _441 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        float _461 = float(_85);
        float _463 = 1.0 / _461;
        float _465 = _119 * _463;
        _457 = _465;
    }
    _459 = false;
    float _467 = _457;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _471 = _467 + _469;
    bool _473 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _475 = isnan(_467);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _485;
    float _489 = -_483;
    float _491 = _489 + 1.0;
    bool _493 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _495 = isnan(_467);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _505;
    bool _509 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _511 = 1.0 / _487;
    float _513 = _503 * _491;
    float _515 = -_503;
    float _517 = _515 + 1.0;
    float _519 = _471 * _511;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _521;
    float _525 = fma(_507, _519, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _527 = fma(_523, _519, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _529 = _525 * _513;
    float _531 = _527 * _513;
    float _533 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[143].x, _529);
    float _535 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[143].y, _531);
    float _537 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[144].x, _533);
    float _539 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[144].y, _535);
    bool _541 = !_509;
    float _559;
    if (!_541)
    {
        float _543 = in.m_51.x;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _547 = _543 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _549 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _551 = _549 * _545;
        float _553 = floor(_551);
        float _555 = -_553;
        float _557 = _551 + _555;
        _559 = _557;
        _561 = true;
    }
    else
    {
        float _563 = float(_85);
        float _565 = 1.0 / _563;
        float _567 = _119 * _565;
        _559 = _567;
    }
    _561 = false;
    float _569 = _559;
    float _571 = in.m_49.x;
    float _573 = in.m_49.y;
    bool _575 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _577 = isnan(_569);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _591 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _593 = isnan(_569);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _603;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _609 = _569 + _607;
    float _611 = -_585;
    float _613 = _611 + 1.0;
    float _615 = 1.0 / _589;
    float _617 = _601 * _613;
    float _619 = -_601;
    float _621 = _619 + 1.0;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _627 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _631 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _633 = _625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _635 = _629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = _539 * _573;
    float _639 = _537 * _571;
    float _641 = _605 * _615;
    float _643 = fma(_641, _609, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _645 = _643 * _617;
    float _647 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[115].x, _645);
    float _649 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[116].x, _647);
    float _651 = _649 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _631;
    out.m_53.y = _633;
    out.m_53.z = _635;
    out.m_53.w = _651;
    bool _653 = !_627;
    float _671;
    if (!_653)
    {
        float _655 = in.m_51.x;
        float _657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _659 = _655 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _661 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _663 = _661 * _657;
        float _665 = floor(_663);
        float _667 = -_665;
        float _669 = _663 + _667;
        _671 = _669;
        _673 = true;
    }
    else
    {
        float _675 = float(_85);
        float _677 = 1.0 / _675;
        float _679 = _119 * _677;
        _671 = _679;
    }
    _673 = false;
    float _681 = _671;
    float _683 = in.m_51.z;
    float _685 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _687 = log2(_685);
    float _689 = _637 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _691 = in.m_51.x;
    float _693 = in.m_51.y;
    float _695 = _639 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _697 = _119 * _687;
    float _699 = exp2(_697);
    float _701 = _683 * 2.0;
    float _703 = _691 * 2.0;
    float _705 = _693 * 2.0;
    float _707 = floor(_701);
    float _709 = _693 + _691;
    float _711 = _709 + (-1.0);
    float _713 = -_699;
    float _715 = _713 + 1.0;
    float _717 = floor(_703);
    bool _719 = _707 > 0.0;
    float _721 = floor(_705);
    bool _723 = _707 >= 0.0;
    bool _725 = isnan(_707);
    bool _727 = _723 || _725;
    bool _729 = isnan(0.0);
    bool _731 = _727 || _729;
    float _733 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _737 = 1.0 + _735;
    int _739 = _731 ? 0 : 1;
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _743 = _741 != 0;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _751 = _749 != 0;
    float _753 = 1.0 / _737;
    int _755 = ~_739;
    int _757 = _755 + 1;
    int _759 = _757 + 1;
    bool _761 = _717 > 0.0;
    int _763 = _759;
    if (!_719)
    {
        int _765 = ~_739;
        int _767 = _765 + 1;
        _763 = _767;
    }
    int _769 = _763;
    float _771 = in.m_55.x;
    float _773 = in.m_55.y;
    float _775 = in.m_55.z;
    bool _777 = _717 >= 0.0;
    bool _779 = isnan(_717);
    bool _781 = _777 || _779;
    bool _783 = isnan(0.0);
    bool _785 = _781 || _783;
    bool _787 = !_743;
    int _789 = _787 ? 0 : 1;
    bool _791 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _793 = isnan(0.0);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _799 = _795 || _797;
    int _801 = abs(_789);
    bool _803 = _721 > 0.0;
    int _805 = _785 ? 0 : 1;
    bool _807 = _721 >= 0.0;
    bool _809 = isnan(_721);
    bool _811 = _807 || _809;
    bool _813 = isnan(0.0);
    bool _815 = _811 || _813;
    bool _817 = !_747;
    int _819 = _817 ? 0 : 1;
    float _821 = float(_801);
    float _823 = float(_769);
    float _825 = _799 ? _715 : 0.0;
    int _827 = abs(_819);
    float _829 = _821 * _823;
    int _831 = _815 ? 0 : 1;
    float _833 = _825 * _753;
    int _835 = ~_805;
    int _837 = _835 + 1;
    int _839 = _837 + 1;
    float _841 = _829 * (-2.0);
    int _843 = _839;
    if (!_761)
    {
        int _845 = ~_805;
        int _847 = _845 + 1;
        _843 = _847;
    }
    int _849 = _843;
    int _851 = ~_831;
    int _853 = _851 + 1;
    int _855 = _853 + 1;
    float _857 = fma(_841, _771, _771);
    int _859 = _855;
    if (!_803)
    {
        int _861 = ~_831;
        int _863 = _861 + 1;
        _859 = _863;
    }
    int _865 = _859;
    float _867 = fma(_733, _841, _733);
    float _869 = float(_827);
    float _871 = _691 + (-0.5);
    bool _873 = !_751;
    int _875 = _873 ? 0 : 1;
    float _877 = float(_849);
    int _879 = abs(_875);
    float _881 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[196].x, _857);
    float _883 = _693 + _683;
    float _885 = _869 * _877;
    bool _887 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _889 = isnan(1.0);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _895 = _891 || _893;
    float _897 = _883 + (-1.0);
    bool _899 = !_895;
    float _901 = _899 ? _119 : _833;
    float _903 = _885 * (-2.0);
    float _905 = float(_879);
    float _907 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _909 = float(_865);
    float _911 = fma(_901, _867, _881);
    float _913 = fma(_903, _773, _773);
    float _915 = fma(_907, _903, _907);
    float _917 = _683 + _691;
    float _919 = _905 * _909;
    float _921 = _693 + (-0.5);
    float _923 = as_type<float>(int(gl_VertexIndex));
    float _925 = _911 * 0.15915493667125701904296875;
    float _927 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[196].y, _913);
    float _929 = _917 + (-1.0);
    float _931 = _919 * (-2.0);
    float _933 = _683 + (-0.5);
    float _935 = fma(_901, _915, _927);
    float _937 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _939 = fma(_931, _775, _775);
    float _941 = _925 * 6.283185482025146484375;
    float _943 = sin(_941);
    float _945 = _935 * 0.15915493667125701904296875;
    float _947 = fma(_937, _931, _937);
    float _949 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[196].z, _939);
    float _951 = fma(_901, _947, _949);
    float _953 = _925 * 6.283185482025146484375;
    float _955 = cos(_953);
    float _957 = _951 * 0.15915493667125701904296875;
    int _959 = as_type<int>(_923) & 1;
    bool _961 = _959 != 0;
    int _963 = as_type<int>(_923) & 2;
    bool _965 = _963 != 0;
    float _967 = _945 * 6.283185482025146484375;
    float _969 = sin(_967);
    bool _971 = !_965;
    float _973 = _971 ? (-0.5) : 0.5;
    bool _975 = !_961;
    float _977 = _975 ? (-0.5) : 0.5;
    bool _979 = _691 > 0.5;
    float _981 = _945 * 6.283185482025146484375;
    float _983 = cos(_981);
    float _985 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _973);
    float _987 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _977);
    float _989 = _689 * _985;
    float _991 = _695 * _987;
    bool _993 = _693 > 0.5;
    float _995 = _957 * 6.283185482025146484375;
    float _997 = sin(_995);
    float _999 = _955 * _969;
    float _1001 = _943 * _969;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1003;
    float _1007 = _957 * 6.283185482025146484375;
    float _1009 = cos(_1007);
    float _1011 = _943 * _983;
    float _1013 = _955 * _983;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1015;
    float _1019 = -_999;
    float _1021 = fma(_997, _1011, _1019);
    float _1023 = -_1011;
    float _1025 = fma(_997, _999, _1023);
    float _1027 = _1009 * _989;
    float _1029 = _969 * _1009;
    float _1031 = _983 * _1009;
    float _1033 = fma(_997, _1013, _1001);
    float _1035 = -_989;
    float _1037 = _997 * _1035;
    float _1039 = fma(_997, _1001, _1013);
    float _1041 = _955 * _1027;
    float _1043 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1045 = fma(_1031, _991, _1037);
    float _1047 = _943 * _1027;
    float _1049 = fma(_1033, _991, _1041);
    float _1051 = _395 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1053 = fma(_1029, _1043, _1045);
    float _1055 = fma(_1021, _991, _1047);
    float _1057 = fma(_1025, _1043, _1049);
    float _1059 = _395 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1061 = _395 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1063 = fma(_1039, _1043, _1055);
    float _1065 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1067 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1069 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1061);
    float _1071 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1051);
    float _1073 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1065);
    float _1075 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1067);
    float _1077 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1069);
    float _1079 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1071);
    float _1081 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1073);
    float _1083 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1075);
    float _1085 = _1077 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1087 = _1079 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1089 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1091 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1093 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1059);
    float _1095 = _1085 + _1089;
    float _1097 = _1087 + _1091;
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1099;
    float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1105 = _1095 + _1103;
    float _1107 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1109 = _1097 + _1107;
    float _1111 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1113 = 1.0 / _1101;
    float _1115 = _1105 * _1105;
    int _1117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1119 = _1117 != 0;
    float _1121 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1111);
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1125 = _1123 != 0;
    float _1127 = fma(_1109, _1109, _1115);
    float _1129 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1093);
    float _1131 = -_977;
    int _1133 = _979 ? as_type<int>(_1131) : as_type<int>(_977);
    float _1135 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1121);
    float _1137 = sqrt(_1127);
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1141 = _681 + _1139;
    float _1143 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1145 = !_1119;
    float _1147 = _1145 ? _977 : as_type<float>(_1133);
    float _1149 = -_973;
    int _1151 = _993 ? as_type<int>(_1149) : as_type<int>(_973);
    float _1153 = _1141 * _1113;
    bool _1155 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1157 = isnan(_681);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1169 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1171 = isnan(_681);
    bool _1173 = _1169 || _1171;
    bool _1175 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1177 = _1173 || _1175;
    float _1179 = float(_1177);
    float _1181 = fma(_1005, _1153, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1183;
    float _1187 = -_1165;
    float _1189 = _1187 + 1.0;
    float _1191 = fma(_1017, _1153, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1193 = !_1125;
    float _1195 = _1193 ? _973 : as_type<float>(_1151);
    float _1197 = fma(_1185, _1153, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1199 = _1137 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1201 = _1179 * _1189;
    float _1203 = _1129 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1205 = -_1179;
    float _1207 = _1205 + 1.0;
    float _1209 = _1181 * _1201;
    float _1211 = _1203 + _1143;
    float _1213 = _1191 * _1201;
    float _1215 = _1197 * _1201;
    float _1217 = _1197;
    float _1219 = _1181;
    float _1221 = _1191;
    if (!_1199)
    {
        _1217 = _1097;
    }
    float _1223 = _1217;
    float _1225 = _1223;
    if (!_1199)
    {
        _1219 = _1095;
    }
    float _1227 = _1219;
    float _1229 = _1227;
    if (!_1199)
    {
        _1221 = _1211;
    }
    float _1231 = _1221;
    bool _1233 = !_1199;
    float _1235 = _1231;
    if (!_1233)
    {
        float _1237 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1239 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1241 = _1137 + _1239;
        float _1243 = _1211 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1245 = rsqrt(_1127);
        float _1247 = _1241 * _1237;
        float _1249 = _1247 * 0.15915493667125701904296875;
        float _1251 = _1249 * 6.283185482025146484375;
        float _1253 = cos(_1251);
        float _1255 = _1249 * 6.283185482025146484375;
        float _1257 = sin(_1255);
        float _1259 = _1253 + (-1.0);
        float _1261 = _1259 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1263 = fma(_1257, _1243, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1265 = fma(_1211, _1253, _1261);
        float _1267 = _1245 * _1263;
        float _1269 = fma(_1109, _1267, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1271 = fma(_1105, _1267, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1235 = _1265;
        _1225 = _1269;
        _1229 = _1271;
    }
    float _1273 = _1235;
    float _1275 = _1225;
    float _1277 = _1229;
    float _1279 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1213);
    float _1281 = -_1203;
    float _1283 = _1281 + _1273;
    float _1285 = -_1087;
    float _1287 = _1285 + _1275;
    float _1289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1291 = -_1085;
    float _1293 = _1291 + _1277;
    float _1295 = _1283 * _1283;
    float _1297 = _1147 + 0.5;
    float _1299 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1209);
    float _1301 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1215);
    float _1303 = fma(_1287, _1287, _1295);
    float _1305 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1307 = -_1195;
    float _1309 = _1307 + 0.5;
    float _1311 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1299);
    float _1313 = fma(_1293, _1293, _1303);
    float _1315 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1279);
    float _1317 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1301);
    float _1319 = _1305 * _1167;
    float _1321 = sqrt(_1313);
    float _1323 = _1309 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1325 = _1311 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1327 = _1315 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1329 = _1317 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1331 = _1323 * _1289;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1335 = _1325 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1337 = _1327 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1339 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _1319;
    out.m_60.y = _1331;
    out.m_62.x = _1335;
    out.m_62.y = _1337;
    out.m_62.z = _1339;
    out.m_62.w = _1333;
    bool _1341 = _1321 > 0.0;
    bool _1343 = !_1341;
    float _1345 = _1333;
    float _1347 = _1335;
    float _1349 = _1337;
    float _1351 = _1273;
    float _1353 = _1277;
    float _1355 = _1275;
    float _1357 = _1335;
    if (!_1343)
    {
        bool _1359 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1361 = _1339;
        if (_1359)
        {
            float _1363 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1361 = _1363;
        }
        float _1365 = _1361;
        if (_1359)
        {
            float _1367 = _427 * _1365;
            _1345 = _1367;
        }
        float _1369 = _1345;
        float _1371 = _1369;
        if (_1359)
        {
            float _1373 = _429 * _1365;
            _1347 = _1373;
        }
        float _1375 = _1347;
        float _1377 = _1375;
        if (_1359)
        {
            float _1379 = _431 * _1365;
            _1349 = _1379;
        }
        float _1381 = _1349;
        float _1383 = _1381;
        if (!_1359)
        {
            float _1385 = _119 + 1.0;
            if (!_153)
            {
                float _1387 = _1385 * _1385;
                float _1389 = _1387 * 0.5;
                _121 = _1389;
            }
            float _1391 = _121;
            float _1393 = _1391;
            if (!_153)
            {
                float _1395 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1393 = _1395;
            }
            float _1397 = _1393;
            bool _1399 = !_153;
            float _1401 = _1397;
            if (!_1399)
            {
                float _1403 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1405 = log2(_1403);
                float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1409 = 1.0 + _1407;
                float _1411 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1413 = _1405 * _1385;
                float _1415 = 1.0 / _1409;
                float _1417 = _1411 * 0.693147182464599609375;
                float _1419 = exp2(_1413);
                float _1421 = 1.0 / _1417;
                float _1423 = _1419 + (-1.0);
                float _1425 = -_1423;
                float _1427 = fma(_1425, _1421, _1385);
                float _1429 = _1427 * _1415;
                float _1431 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1401 = _1431;
            }
            float _1433 = _1401;
            float _1435 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1437 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1439 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1441 = _1433;
            if (!_153)
            {
                _1441 = _1385;
            }
            float _1443 = _1441;
            float _1445 = _1435 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _1447 = _1435 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _1449 = _1435 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _1451 = fma(_1437, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1445);
            float _1453 = fma(_1437, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1447);
            float _1455 = fma(_1439, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1451);
            bool _1457 = !_153;
            float _1459 = _1443;
            if (!_1457)
            {
                float _1461 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1463 = log2(_1461);
                float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1467 = 1.0 + _1465;
                float _1469 = 1.0 / _1467;
                float _1471 = _1463 * _1385;
                float _1473 = exp2(_1471);
                float _1475 = -_1473;
                float _1477 = _1475 + 1.0;
                float _1479 = _1477 * _1469;
                _1459 = _1479;
            }
            float _1481 = _1459;
            float _1483 = fma(_1437, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1449);
            float _1485 = fma(_1439, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1453);
            float _1487 = fma(_1481, _157, _1455);
            float _1489 = fma(_1439, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1483);
            float _1491 = fma(_1481, _155, _1485);
            float _1493 = -_389;
            float _1495 = _1493 + _1487;
            float _1497 = fma(_1481, _159, _1489);
            float _1499 = -_397;
            float _1501 = _1499 + _1491;
            float _1503 = _1495 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1505 = _1495 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1507 = _1495 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1509 = -_391;
            float _1511 = _1509 + _1497;
            float _1513 = fma(_1501, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1503);
            float _1515 = fma(_1501, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1505);
            float _1517 = fma(_1501, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1507);
            float _1519 = fma(_1511, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1513);
            float _1521 = fma(_1511, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1515);
            float _1523 = fma(_1511, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1517);
            _435 = _1521;
            _437 = _1519;
            _439 = _1523;
            _1371 = _1519;
            _1377 = _1521;
            _1383 = _1523;
            _189 = _1513;
        }
        float _1525 = _435;
        float _1527 = _437;
        float _1529 = _439;
        float _1531 = _1371;
        float _1533 = _1377;
        float _1535 = _1383;
        float _1537 = _189;
        float _1539 = _1525 * _1525;
        float _1541 = rsqrt(_1313);
        float _1543 = fma(_1527, _1527, _1539);
        float _1545 = fma(_1529, _1529, _1543);
        float _1547 = sqrt(_1545);
        float _1549 = _1287 * _1541;
        float _1551 = _1283 * _1541;
        float _1553 = _1293 * _1541;
        bool _1555 = _1547 > 0.0;
        bool _1557 = !_1555;
        _1357 = _1533;
        _191 = _1537;
        if (!_1557)
        {
            float _1559 = rsqrt(_1545);
            float _1561 = _1559 * _1525;
            float _1563 = _1559 * _1527;
            float _1565 = _1559 * _1529;
            float _1567 = _1551 * _1561;
            float _1569 = fma(_1549, _1563, _1567);
            float _1571 = fma(_1553, _1565, _1569);
            float _1573 = _1571 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1575 = fma(_1531, _1573, _1275);
            float _1577 = fma(_1533, _1573, _1273);
            float _1579 = fma(_1535, _1573, _1277);
            _1351 = _1577;
            _1353 = _1579;
            _1355 = _1575;
            _191 = _1567;
        }
    }
    float _1581 = _1351;
    float _1583 = _1353;
    float _1585 = _1355;
    float _1587 = _1357;
    float _1589 = _191;
    float _1591 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1593 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1595 = isnan(0.5);
    bool _1597 = _1593 || _1595;
    bool _1599 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1601 = _1597 || _1599;
    float _1603 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1591);
    bool _1605 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1607 = isnan(0.5);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1613 = _1609 || _1611;
    float _1615 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1603);
    float _1617 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1619 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1621 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1617);
    float _1623 = 1.0 / _1619;
    float _1625 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1621);
    float _1627 = _1587;
    float _1629 = _1589;
    float _1631 = _1581;
    float _1633 = _1619;
    float _1635 = _1583;
    if (_1601)
    {
        _1627 = _1581;
    }
    float _1637 = _1627;
    float _1639 = _1637;
    if (_1601)
    {
        _1629 = _1583;
    }
    float _1641 = _1629;
    float _1643 = _1625 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1645 = _1643 + _1619;
    float _1647 = _1645 * _1623;
    float _1649 = _1647 * 0.5;
    float _1651 = _1623;
    float _1653 = _1649;
    float _1655 = _1641;
    if (_1601)
    {
        _1651 = _1585;
    }
    float _1657 = _1651;
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1661 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1659);
    float _1663 = _1657;
    if (_1613)
    {
        _1653 = 1.0;
    }
    float _1665 = _1653;
    float _1667 = 1.0 / _1661;
    float _1669 = _1665;
    if (!_1601)
    {
        float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1673 = _1203 + _1671;
        float _1675 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1677 = _1087 + _1675;
        float _1679 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1681 = -_1087;
        float _1683 = _1681 + _1585;
        float _1685 = _1673 * _1673;
        float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1689 = _1085 + _1687;
        float _1691 = -_1203;
        float _1693 = _1691 + _1581;
        float _1695 = fma(_1677, _1677, _1685);
        float _1697 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1699 = fma(_1689, _1689, _1695);
        float _1701 = sqrt(_1699);
        float _1703 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1705 = precise::min(_1701, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1707 = _1705 * _1697;
        float _1709 = _1703 * _1707;
        float _1711 = -_1085;
        float _1713 = _1711 + _1583;
        float _1715 = fma(_1683, _1709, _1087);
        float _1717 = fma(_1693, _1709, _1203);
        float _1719 = fma(_1713, _1709, _1085);
        _1631 = _1693;
        _1639 = _1717;
        _1663 = _1715;
        _1655 = _1719;
        _1633 = _1701;
    }
    float _1721 = _1631;
    float _1723 = _1639;
    float _1725 = _1663;
    float _1727 = _1655;
    float _1729 = _1633;
    float _1731 = _1729;
    float _1733 = _1721;
    if (_1613)
    {
        _1731 = 1.0;
    }
    float _1735 = _1731;
    float _1737 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1739 = _1667 * _1737;
    float _1741 = _1735;
    float _1743 = _1739;
    if (!_1613)
    {
        float _1745 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1747 = _1745 * 0.15915493667125701904296875;
        float _1749 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1751 = _1747 * 6.283185482025146484375;
        float _1753 = cos(_1751);
        float _1755 = _1749 * 0.15915493667125701904296875;
        float _1757 = _1747 * 6.283185482025146484375;
        float _1759 = sin(_1757);
        float _1761 = 1.0 / _1753;
        float _1763 = _1755 * 6.283185482025146484375;
        float _1765 = cos(_1763);
        float _1767 = _1759 * _1761;
        float _1769 = _1755 * 6.283185482025146484375;
        float _1771 = sin(_1769);
        float _1773 = _1765 * _1767;
        float _1775 = 1.0 / _1773;
        float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1779 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1777;
        float _1781 = 1.0 / _1779;
        float _1783 = _1771 * _1775;
        float _1785 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1787 = fma(_1739, _1783, _1785);
        float _1789 = _1787 * _1781;
        float _1791 = precise::clamp(_1789, 0.0, 1.0);
        _1733 = _1781;
        _1669 = _1791;
    }
    float _1793 = _1733;
    float _1795 = _1669;
    float _1797 = _1793;
    if (!_1613)
    {
        float _1799 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1801 = _1799 * 0.15915493667125701904296875;
        float _1803 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1805 = _1801 * 6.283185482025146484375;
        float _1807 = cos(_1805);
        float _1809 = _1803 * 0.15915493667125701904296875;
        float _1811 = _1801 * 6.283185482025146484375;
        float _1813 = sin(_1811);
        float _1815 = 1.0 / _1807;
        float _1817 = _1809 * 6.283185482025146484375;
        float _1819 = cos(_1817);
        float _1821 = _1813 * _1815;
        float _1823 = _1809 * 6.283185482025146484375;
        float _1825 = sin(_1823);
        float _1827 = _1819 * _1821;
        float _1829 = 1.0 / _1827;
        float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1833 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1831;
        float _1835 = 1.0 / _1833;
        float _1837 = _1825 * _1829;
        float _1839 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1841 = fma(_1739, _1837, _1839);
        float _1843 = _1841 * _1835;
        float _1845 = precise::clamp(_1843, 0.0, 1.0);
        float _1847 = -_1845;
        float _1849 = _1847 + 1.0;
        _1797 = _1815;
        _1741 = _1849;
    }
    float _1851 = _1797;
    float _1853 = _1741;
    float _1855 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1857 = _1723 + _1855;
    float _1859 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1861 = _1725 + _1859;
    float _1863 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1865 = _1727 + _1863;
    float _1867 = _1857 * _1857;
    float _1869 = fma(_1861, _1861, _1867);
    float _1871 = fma(_1865, _1865, _1869);
    float _1873 = rsqrt(_1871);
    float _1875 = sqrt(_1871);
    float _1877 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1879 = _1861 * _1877;
    float _1881 = _1865 * _1877;
    float _1883 = _1879 * _1879;
    float _1885 = _1881 * _1881;
    float _1887 = _1883 + _1885;
    float _1889 = sqrt(_1887);
    bool _1891 = _1889 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1895 = _1889 + _1893;
    float _1897 = _1873;
    float _1899 = _1851;
    float _1901 = _1895;
    float _1903 = _1857;
    float _1905 = _1879;
    if (_1891)
    {
        float _1907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1897 = _1907;
    }
    float _1909 = _1897;
    if (_1891)
    {
        float _1911 = rsqrt(_1887);
        _1899 = _1911;
    }
    float _1913 = _1899;
    float _1915 = _1913;
    if (_1891)
    {
        float _1917 = _1895 * _1909;
        _1901 = _1917;
    }
    float _1919 = _1901;
    if (_1891)
    {
        float _1921 = _1919 * 0.15915493667125701904296875;
        _1743 = _1921;
    }
    float _1923 = _1743;
    float _1925 = _1865;
    if (_1891)
    {
        float _1927 = _1923 * 6.283185482025146484375;
        float _1929 = sin(_1927);
        _1925 = _1929;
    }
    float _1931 = _1925;
    float _1933 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1935 = precise::max(0.0, _1933);
    float _1937 = _1909;
    float _1939 = _1935;
    if (_1891)
    {
        float _1941 = _1923 * 6.283185482025146484375;
        float _1943 = cos(_1941);
        _1937 = _1943;
    }
    float _1945 = _1937;
    float _1947 = -_1877;
    float _1949 = -_1935;
    float _1951 = fma(_1857, _1947, _1949);
    if (_1891)
    {
        float _1953 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1903 = _1953;
    }
    float _1955 = _1903;
    float _1957 = _1955;
    float _1959 = _1931;
    if (_1891)
    {
        float _1961 = fma(_1931, _1955, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1957 = _1961;
    }
    float _1963 = _1957;
    float _1965 = _1963;
    if (!_1891)
    {
        _1959 = _1951;
    }
    float _1967 = _1959;
    float _1969 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1971 = fma(_1875, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1969);
    float _1973 = precise::clamp(_1971, 0.0, 1.0);
    float _1975 = _1967;
    float _1977 = _1945;
    if (_1891)
    {
        float _1979 = _1945 + (-1.0);
        _1939 = _1979;
    }
    float _1981 = _1939;
    float _1983 = _1981;
    if (_1891)
    {
        float _1985 = _1913 * _1963;
        _1635 = _1985;
    }
    float _1987 = _1635;
    if (!_1891)
    {
        _1965 = _1883;
    }
    float _1989 = _1965;
    float _1991 = _1989;
    if (_1891)
    {
        float _1993 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1915 = _1993;
    }
    float _1995 = _1915;
    if (_1891)
    {
        float _1997 = _1879 * _1987;
        _1905 = _1997;
    }
    float _1999 = _1905;
    if (!_1891)
    {
        _1983 = _1881;
    }
    float _2001 = _1983;
    float _2003 = _2001;
    if (_1891)
    {
        float _2005 = _1881 * _1987;
        _2003 = _2005;
    }
    float _2007 = _2003;
    if (_1891)
    {
        float _2009 = fma(_1951, _1945, _1995);
        _1975 = _2009;
    }
    float _2011 = _1975;
    if (_1891)
    {
        float _2013 = _1999 * _1999;
        _1991 = _2013;
    }
    float _2015 = _1991;
    if (!_1891)
    {
        _1977 = _1885;
    }
    float _2017 = _1977;
    float _2019 = _2017;
    if (_1891)
    {
        float _2021 = _2007 * _2007;
        _2019 = _2021;
    }
    float _2023 = _2019;
    float _2025 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2027 = fma(_2011, _2011, _2015);
    float _2029 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2031 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2033 = _2027 + _2023;
    float _2035 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2029);
    float _2037 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2039 = -_1973;
    float _2041 = _2039 + 1.0;
    float _2043 = _1723 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2045 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2035);
    float _2047 = rsqrt(_2033);
    float _2049 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2037);
    float _2051 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2053 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2043);
    float _2055 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2049);
    float _2057 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2031);
    float _2059 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2061 = abs(_2041);
    float _2063 = log2(_2061);
    float _2065 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2053);
    float _2067 = _2055 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2069 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2057);
    float _2071 = -_2059;
    float _2073 = fma(_2071, _2025, 1.0);
    float _2075 = _2065 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2077 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2079 = _2069 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2081 = _2047 * _1999;
    float _2083 = _2047 * _2011;
    float _2085 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2077);
    float _2087 = _2047 * _2007;
    float _2089 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2091 = log2(_2073);
    float _2093 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2085);
    float _2095 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2097 = -_2089;
    float _2099 = fma(_2083, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2097);
    float _2101 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2103 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2093);
    float _2105 = -_2087;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2099);
    float _2109 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2111 = 1.0 / _2103;
    float _2113 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2095);
    float _2115 = fma(_2107, -0.5, 0.5);
    float _2117 = fma(_2107, 0.5, 0.5);
    float _2119 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2109);
    float _2121 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2113);
    float _2123 = _2083 + 1.0;
    float _2125 = fma(_2117, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2127 = exp2(_2101);
    float _2129 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2119);
    float _2131 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2121);
    float _2133 = fma(_2117, _2125, -0.212114393711090087890625);
    float _2135 = _2091 * 0.693147182464599609375;
    float _2137 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2129);
    float _2139 = fma(_2117, _2133, 1.570728778839111328125);
    float _2141 = sqrt(_2115);
    float _2143 = _2131 * _2111;
    float _2145 = _2135 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2147 = fma(_2143, -0.5, 0.5);
    float _2149 = -_2083;
    float _2151 = fma(_2127, _2123, _2149);
    float _2153 = _2137 * _2111;
    float _2155 = fma(_2151, 0.5, 0.5);
    float _2157 = fma(_2153, 0.5, 0.5);
    float _2159 = _2141 * 0.636619746685028076171875;
    float3 _5531 = float3(_2157, _2147, _2145);
    float _2161 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5531, float3(0.0), isnan(_5531)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5531, float3(0.0), isnan(_5531)), level(0.0)).x;
    float3 _5542 = float3(_2157, _2147, _2145);
    float4 _2164 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5542, float3(0.0), isnan(_5542)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5542, float3(0.0), isnan(_5542)), level(0.0)).xyzw;
    float _2166 = _2164.x;
    float _2168 = _2164.y;
    float _2170 = _2164.z;
    float _2172 = _2164.w;
    float _2174 = -_2139;
    float _2176 = fma(_2159, _2174, 1.0);
    float2 _5564 = float2(_2176, _2155);
    float3 _2180 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5564, float2(0.0), isnan(_5564)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5564, float2(0.0), isnan(_5564)), level(0.0)).xyz;
    float _2182 = _2180.x;
    float _2184 = _2180.y;
    float _2186 = _2180.z;
    float _2188 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2190 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2192 = _1795 > 0.0;
    bool _2194 = isnan(_1795);
    bool _2196 = _2192 || _2194;
    bool _2198 = isnan(0.0);
    bool _2200 = _2196 || _2198;
    float _2202 = _1795 * _1853;
    float _2204 = _2137 + _2103;
    float _2206 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2190);
    float _2208 = exp2(_2188);
    bool _2210 = _1853 <= 0.0;
    bool _2212 = !_2200;
    bool _2214 = _2210 || _2212;
    float _2216 = _2103 * 0.5;
    float _2218 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2206);
    float _2220 = _2202 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2222 = _2204 * 0.5;
    float _2224 = fma(_2131, -0.5, _2216);
    float _2226 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2218);
    float _2228 = _2220 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2230 = _2226 + _2103;
    out.gl_Position.x = _2137;
    out.gl_Position.y = _2131;
    out.gl_Position.z = _2226;
    out.gl_Position.w = _2103;
    float _2232 = _2230 * 0.5;
    float _2234 = -_2208;
    float _2236 = _2234 + 1.0;
    out.m_45.x = _2228;
    float _2238 = _2236 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.x = _2222;
    out.m_64.y = _2224;
    out.m_64.z = _2232;
    out.m_64.w = _2103;
    float _2240 = -_2238;
    float _2242 = _2240 + 1.0;
    float _2244 = _2238 * _2161;
    float _2246 = _2172 * _2244;
    float _2248 = _2186 * _2244;
    float _2250 = fma(_2182, _2246, _2166);
    float _2252 = fma(_2184, _2246, _2168);
    float _2254 = _2172 * _2242;
    float _2256 = fma(_2172, _2248, _2170);
    out.m_66.x = _2250;
    out.m_66.y = _2252;
    out.m_66.z = _2256;
    out.m_66.w = _2254;
    if (!_2214)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2258 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2258;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

