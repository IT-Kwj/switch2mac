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
    float4 m_62 [[user(locn0)]];
    float4 m_64 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _465 = false;
    bool _273 = false;
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
        float _2021 = as_type<float>(_101);
        out.gl_Position.z = _2021;
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
        float _2091 = as_type<float>(_139);
        out.gl_Position.z = _2091;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_49.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = in.m_51.x;
    float _149 = in.m_51.y;
    float _151 = in.m_51.z;
    float _153 = _145 * _143;
    float _155 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    float _157 = floor(_155);
    int _159 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _161 = _159 != 0;
    float _163 = _155 * 6.283185482025146484375;
    float _165 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _167 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _171 = _169 != 0;
    int _173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _175 = _173 != 0;
    float _177 = _163 * 0.15915493667125701904296875;
    float _179 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _165);
    float _183 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _167);
    bool _185 = !_171;
    int _187 = _185 ? 0 : 1;
    float _189 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _191 = _177 * 6.283185482025146484375;
    float _193 = cos(_191);
    bool _195 = !_161;
    int _197 = _195 ? 0 : 1;
    int _199 = abs(_187);
    float _201 = -_157;
    float _203 = _155 + _201;
    bool _205 = !_175;
    int _207 = _205 ? 0 : 1;
    float _209 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _189);
    int _211 = abs(_197);
    float _213 = float(_199);
    float _215 = -_203;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _221 = abs(_207);
    float _223 = fma(_193, 0.5, 0.5);
    float _225 = abs(_217);
    float _227 = _213 * _225;
    bool _229 = _203 < 0.5;
    float _231 = float(_229);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_211);
    float _239 = -_231;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_221);
    float _245 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    float _247 = fma(_237, _235, _227);
    float _249 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    float _251 = abs(_241);
    float _253 = fma(_243, _251, _247);
    bool _255 = !_219;
    float _271;
    if (!_255)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _263 = _261 * _257;
        float _265 = floor(_263);
        float _267 = -_265;
        float _269 = _263 + _267;
        _271 = _269;
        _273 = true;
    }
    else
    {
        float _275 = float(_85);
        float _277 = 1.0 / _275;
        float _279 = _119 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = _281 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = _281 + _287;
    bool _291 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _293 = isnan(_281);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _281 + _315;
    float _319 = 1.0 / _305;
    bool _321 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _323 = 1.0 / _313;
    float _325 = 1.0 / _309;
    float _327 = _285 * _319;
    bool _329 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _331 = isnan(_281);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = -_301;
    float _343 = _341 + 1.0;
    float _345 = _339 * _343;
    float _347 = _289 * _323;
    bool _349 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _351 = isnan(_281);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = -_339;
    float _363 = _361 + 1.0;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = _317 * _325;
    bool _371 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _373 = isnan(_281);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _383;
    float _387 = _359 * _363;
    float _389 = -_359;
    float _391 = _389 + 1.0;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _393;
    float _397 = fma(_385, _327, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _399 = _381 * _391;
    float _401 = fma(_395, _327, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _403 = -_381;
    float _405 = _403 + 1.0;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _411 = _397 * _399;
    float _413 = _401 * _399;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _415;
    float _419 = fma(_367, _369, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _421 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[143].x, _411);
    float _423 = fma(_409, _369, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _425;
    float _429 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[143].y, _413);
    float _431 = fma(_417, _347, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _433 = fma(_419, _387, _421);
    float _435 = fma(_427, _347, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _437 = fma(_423, _387, _429);
    float _439 = fma(_431, _345, _433);
    float _441 = fma(_435, _345, _437);
    float _443 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].x, _439);
    float _445 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].y, _441);
    bool _447 = !_321;
    float _463;
    if (!_447)
    {
        float _449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _451 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _455 = _453 * _449;
        float _457 = floor(_455);
        float _459 = -_457;
        float _461 = _455 + _459;
        _463 = _461;
        _465 = true;
    }
    else
    {
        float _467 = float(_85);
        float _469 = 1.0 / _467;
        float _471 = _119 * _469;
        _463 = _471;
    }
    _465 = false;
    float _473 = _463;
    float _475 = in.m_49.z;
    float _477 = _141 * 2.0;
    float _479 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _481 = in.m_49.y;
    float _483 = floor(_477);
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _489 = _487 != 0;
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _493 = _491 != 0;
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _497 = _495 != 0;
    float _499 = -_485;
    float _501 = fma(_479, 2.0, _499);
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _505 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _507 = log2(_505);
    bool _509 = !_493;
    int _511 = _509 ? 0 : 1;
    int _513 = abs(_511);
    bool _515 = _483 > 0.0;
    float _517 = _475 * 2.0;
    bool _519 = _483 >= 0.0;
    bool _521 = isnan(_483);
    bool _523 = _519 || _521;
    bool _525 = isnan(0.0);
    bool _527 = _523 || _525;
    bool _529 = !_489;
    int _531 = _529 ? 0 : 1;
    float _533 = _481 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _535 = _141 + _481;
    float _537 = floor(_517);
    float _539 = fma(_533, -2.0, _503);
    float _541 = _535 + (-1.0);
    float _543 = _481 * 2.0;
    int _545 = _527 ? 0 : 1;
    float _547 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _539);
    float _549 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _551 = floor(_543);
    float _553 = _481 + _475;
    int _555 = ~_545;
    int _557 = _555 + 1;
    int _559 = _557 + 1;
    int _561 = _559;
    if (!_515)
    {
        int _563 = ~_545;
        int _565 = _563 + 1;
        _561 = _565;
    }
    int _567 = _561;
    float _569 = _553 + (-1.0);
    bool _571 = _537 > 0.0;
    float _573 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _575 = _537 >= 0.0;
    bool _577 = isnan(_537);
    bool _579 = _575 || _577;
    bool _581 = isnan(0.0);
    bool _583 = _579 || _581;
    float _585 = _507 * _119;
    int _587 = _583 ? 0 : 1;
    float _589 = exp2(_585);
    float _591 = float(_513);
    float _593 = float(_567);
    bool _595 = _551 > 0.0;
    bool _597 = _551 >= 0.0;
    bool _599 = isnan(_551);
    bool _601 = _597 || _599;
    bool _603 = isnan(0.0);
    bool _605 = _601 || _603;
    float _607 = _591 * _593;
    int _609 = ~_587;
    int _611 = _609 + 1;
    int _613 = _611 + 1;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _617 = _607 * (-2.0);
    int _619 = _613;
    if (!_571)
    {
        int _621 = ~_587;
        int _623 = _621 + 1;
        _619 = _623;
    }
    int _625 = _619;
    float _627 = in.m_53.x;
    float _629 = in.m_53.y;
    float _631 = in.m_53.z;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _635 = 1.0 + _633;
    float _637 = -_589;
    float _639 = _637 + 1.0;
    bool _641 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _643 = isnan(1.0);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _649 = _645 || _647;
    float _651 = 1.0 / _635;
    int _653 = abs(_531);
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _657 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _659 = isnan(0.0);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _665 = _661 || _663;
    float _667 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[78].w, _615);
    float _669 = -_119;
    float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[76].x, _501);
    float _673 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _655);
    float _675 = float(_625);
    float _677 = _665 ? _639 : 0.0;
    float _679 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _673);
    float _681 = float(_653);
    float _683 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _667);
    int _685 = _605 ? 0 : 1;
    if (_649)
    {
        float _687 = _677 * _651;
        _121 = _687;
    }
    float _689 = _121;
    float _691 = _481 + (-0.5);
    float _693 = _681 * _675;
    float _695 = fma(_617, _629, _629);
    bool _697 = !_497;
    int _699 = _697 ? 0 : 1;
    float _701 = fma(_573, _617, _573);
    int _703 = ~_685;
    int _705 = _703 + 1;
    int _707 = _705 + 1;
    float _709 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[196].y, _695);
    float _711 = _693 * (-2.0);
    int _713 = _707;
    if (!_595)
    {
        int _715 = ~_685;
        int _717 = _715 + 1;
        _713 = _717;
    }
    int _719 = _713;
    float _721 = as_type<float>(int(gl_VertexIndex));
    int _723 = abs(_699);
    float _725 = fma(_701, _689, _709);
    float _727 = _141 + (-0.5);
    float _729 = fma(_711, _627, _627);
    float _731 = float(_723);
    float _733 = _725 * 0.15915493667125701904296875;
    float _735 = float(_719);
    float _737 = fma(_549, _711, _549);
    float _739 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[196].x, _729);
    float _741 = _141 + _475;
    float _743 = in.m_58.x;
    float _745 = in.m_58.y;
    float _747 = _731 * _735;
    float _749 = fma(_737, _689, _739);
    float _751 = _741 + (-1.0);
    float _753 = _747 * (-2.0);
    float _755 = _749 * 0.15915493667125701904296875;
    float _757 = _733 * 6.283185482025146484375;
    float _759 = sin(_757);
    float _761 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _763 = fma(_753, _631, _631);
    float _765 = _475 + (-0.5);
    float _767 = fma(_761, _753, _761);
    int _769 = as_type<int>(_721) & 1;
    bool _771 = _769 != 0;
    int _773 = as_type<int>(_721) & 2;
    bool _775 = _773 != 0;
    float _777 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[196].z, _763);
    float _779 = _755 * 6.283185482025146484375;
    float _781 = sin(_779);
    float _783 = fma(_767, _689, _777);
    bool _785 = !_775;
    float _787 = _785 ? (-0.5) : 0.5;
    float _789 = _783 * 0.15915493667125701904296875;
    float _791 = _755 * 6.283185482025146484375;
    float _793 = cos(_791);
    float _795 = _443 * _743;
    float _797 = _445 * _745;
    float _799 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _787);
    float _801 = _253 * _795;
    float _803 = _253 * _797;
    bool _805 = !_771;
    float _807 = _805 ? (-0.5) : 0.5;
    float _809 = _789 * 6.283185482025146484375;
    float _811 = cos(_809);
    float _813 = _801 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _815 = _803 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _817 = in.m_42.x;
    float _819 = in.m_42.y;
    float _821 = in.m_42.z;
    float _823 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _807);
    float _825 = _815 * _799;
    float _827 = _733 * 6.283185482025146484375;
    float _829 = cos(_827);
    float _831 = _813 * _823;
    float _833 = _793 * _759;
    float _835 = _781 * _759;
    float _837 = _789 * 6.283185482025146484375;
    float _839 = sin(_837);
    float _841 = _759 * _811;
    float _843 = _811 * _825;
    float _845 = _793 * _843;
    float _847 = _793 * _829;
    float _849 = _781 * _829;
    float _851 = _829 * _811;
    float _853 = _781 * _843;
    float _855 = fma(_839, _847, _835);
    float _857 = -_833;
    float _859 = fma(_839, _849, _857);
    float _861 = -_849;
    float _863 = fma(_839, _833, _861);
    float _865 = -_825;
    float _867 = _839 * _865;
    float _869 = fma(_855, _831, _845);
    float _871 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _873 = fma(_839, _835, _847);
    float _875 = fma(_851, _831, _867);
    float _877 = fma(_859, _831, _853);
    float _879 = fma(_863, _871, _869);
    float _881 = _819 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _883 = fma(_841, _871, _875);
    float _885 = fma(_873, _871, _877);
    float _887 = _879 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _889 = _819 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _891 = fma(_817, (*spvDescriptorSet0.vp_c10)._m0[6].x, _881);
    float _893 = _879 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _895 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[26].x, _887);
    float _897 = fma(_817, (*spvDescriptorSet0.vp_c10)._m0[4].x, _889);
    float _899 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[6].z, _891);
    float _901 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[24].x, _893);
    float _903 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[26].z, _895);
    float _905 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[4].z, _897);
    float _907 = _899 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _909 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[24].z, _901);
    float _911 = _903 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _913 = _905 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _915 = _819 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _917 = _909 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _919 = _907 + _911;
    float _921 = _879 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _923 = fma(_817, (*spvDescriptorSet0.vp_c10)._m0[5].x, _915);
    float _925 = _913 + _917;
    float _927 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _929 = _919 + _927;
    float _931 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[25].x, _921);
    float _933 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[5].z, _923);
    float _935 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _937 = _925 + _935;
    float _939 = _929 * _929;
    float _941 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[25].z, _931);
    float _943 = _933 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _945 = fma(_937, _937, _939);
    float _947 = _941 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _949 = _943 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _951 = sqrt(_945);
    float _953 = _943 + _947;
    float _955 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[11].x, _949);
    float _957 = precise::min(_953, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _959 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[11].z, _955);
    bool _961 = _951 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _963 = _949;
    float _965 = _955;
    float _967 = _919;
    float _969 = _959;
    if (!_961)
    {
        _963 = _919;
    }
    float _971 = _963;
    float _973 = _971;
    if (!_961)
    {
        _965 = _925;
    }
    float _975 = _965;
    float _977 = _975;
    if (!_961)
    {
        _967 = _957;
    }
    float _979 = _967;
    bool _981 = !_961;
    float _983 = _979;
    if (!_981)
    {
        float _985 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _987 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _989 = _951 + _987;
        float _991 = rsqrt(_945);
        float _993 = _989 * _985;
        float _995 = _957 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _997 = _993 * 0.15915493667125701904296875;
        float _999 = _997 * 6.283185482025146484375;
        float _1001 = cos(_999);
        float _1003 = _997 * 6.283185482025146484375;
        float _1005 = sin(_1003);
        float _1007 = _1001 + (-1.0);
        float _1009 = _1007 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1011 = fma(_1005, _995, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1013 = fma(_957, _1001, _1009);
        float _1015 = _991 * _1011;
        float _1017 = fma(_937, _1015, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1019 = fma(_929, _1015, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _983 = _1013;
        _977 = _1017;
        _973 = _1019;
    }
    float _1021 = _983;
    float _1023 = _977;
    float _1025 = _973;
    float _1027 = -_943;
    float _1029 = _1027 + _1021;
    float _1031 = -_913;
    float _1033 = _1031 + _1023;
    float _1035 = -_907;
    float _1037 = _1035 + _1025;
    float _1039 = _959 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1041 = _1029 * _1029;
    float _1043 = _943 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1045 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1047 = isnan(0.5);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1053 = _1049 || _1051;
    float _1055 = 1.0 / _1039;
    float _1057 = fma(_1033, _1033, _1041);
    float _1059 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1043);
    float _1061 = fma(_1037, _1037, _1057);
    float _1063 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1059);
    float _1065 = sqrt(_1061);
    float _1067 = _1063 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1069 = _1057;
    float _1071 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1073 = _1025;
    float _1075 = _1043;
    float _1077 = _1021;
    float _1079 = _1029;
    if (_1053)
    {
        _1069 = 1.0;
    }
    float _1081 = _1069;
    float _1083 = _1067 + _1039;
    float _1085 = _1083 * _1055;
    float _1087 = _1085 * 0.5;
    bool _1089 = _1065 > 0.0;
    float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1093 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1091);
    float _1095 = 1.0 / _1093;
    float _1097 = _1087;
    float _1099 = _1081;
    if (!_1089)
    {
        _1071 = _1023;
    }
    float _1101 = _1071;
    float _1103 = _1101;
    if (!_1089)
    {
        _1097 = _1021;
    }
    float _1105 = _1097;
    bool _1107 = !_1089;
    float _1109 = _1105;
    float _1111 = _1105;
    if (!_1107)
    {
        float _1113 = _245 * _245;
        float _1115 = fma(_249, _249, _1113);
        float _1117 = fma(_209, _209, _1115);
        float _1119 = rsqrt(_1061);
        float _1121 = sqrt(_1117);
        float _1123 = _1033 * _1119;
        float _1125 = _1029 * _1119;
        float _1127 = _1037 * _1119;
        bool _1129 = _1121 > 0.0;
        float _1131 = _1121;
        _969 = _1117;
        if (!_1129)
        {
            _1131 = _1023;
        }
        float _1133 = _1131;
        _1103 = _1133;
        if (!_1129)
        {
            _1109 = _1021;
        }
        float _1135 = _1109;
        bool _1137 = !_1129;
        _1111 = _1135;
        if (!_1137)
        {
            float _1139 = rsqrt(_1117);
            float _1141 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1143 = _245 * _1139;
            float _1145 = _249 * _1139;
            float _1147 = _1125 * _1143;
            float _1149 = _209 * _1139;
            float _1151 = fma(_1123, _1145, _1147);
            float _1153 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1155 = fma(_1127, _1149, _1151);
            float _1157 = _1155 * _1153;
            float _1159 = fma(_249, _1157, _1023);
            float _1161 = fma(_245, _1157, _1021);
            float _1163 = fma(_209, _1157, _1025);
            _969 = _1139;
            _1111 = _1161;
            _1103 = _1159;
            _1073 = _1163;
            _1075 = _1153;
        }
    }
    float _1165 = _969;
    float _1167 = _1111;
    float _1169 = _1103;
    float _1171 = _1073;
    float _1173 = _1075;
    float _1175 = _1165;
    float _1177 = _1173;
    if (_1053)
    {
        _1077 = 1.0;
    }
    float _1179 = _1077;
    float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1183 = _1095 * _1181;
    float _1185 = _1179;
    if (!_1053)
    {
        float _1187 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1189 = _1187 * 0.15915493667125701904296875;
        float _1191 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1193 = _1189 * 6.283185482025146484375;
        float _1195 = cos(_1193);
        float _1197 = _1191 * 0.15915493667125701904296875;
        float _1199 = _1189 * 6.283185482025146484375;
        float _1201 = sin(_1199);
        float _1203 = 1.0 / _1195;
        float _1205 = _1197 * 6.283185482025146484375;
        float _1207 = cos(_1205);
        float _1209 = _1201 * _1203;
        float _1211 = _1197 * 6.283185482025146484375;
        float _1213 = sin(_1211);
        float _1215 = _1207 * _1209;
        float _1217 = 1.0 / _1215;
        float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1221 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1219;
        float _1223 = 1.0 / _1221;
        float _1225 = _1213 * _1217;
        float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1229 = fma(_1183, _1225, _1227);
        float _1231 = _1229 * _1223;
        float _1233 = precise::clamp(_1231, 0.0, 1.0);
        _1175 = _1197;
        _1177 = _1229;
        _1099 = _1233;
    }
    float _1235 = _1175;
    float _1237 = _1177;
    float _1239 = _1099;
    float _1241 = _1237;
    float _1243 = _1235;
    if (!_1053)
    {
        float _1245 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1247 = _1245 * 0.15915493667125701904296875;
        float _1249 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1251 = _1247 * 6.283185482025146484375;
        float _1253 = cos(_1251);
        float _1255 = _1249 * 0.15915493667125701904296875;
        float _1257 = _1247 * 6.283185482025146484375;
        float _1259 = sin(_1257);
        float _1261 = 1.0 / _1253;
        float _1263 = _1255 * 6.283185482025146484375;
        float _1265 = cos(_1263);
        float _1267 = _1259 * _1261;
        float _1269 = _1255 * 6.283185482025146484375;
        float _1271 = sin(_1269);
        float _1273 = _1265 * _1267;
        float _1275 = 1.0 / _1273;
        float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1279 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1277;
        float _1281 = 1.0 / _1279;
        float _1283 = _1271 * _1275;
        float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1287 = fma(_1183, _1283, _1285);
        float _1289 = _1287 * _1281;
        float _1291 = precise::clamp(_1289, 0.0, 1.0);
        float _1293 = -_1291;
        float _1295 = _1293 + 1.0;
        _1241 = _1273;
        _1243 = _1261;
        _1185 = _1295;
    }
    float _1297 = _1241;
    float _1299 = _1243;
    float _1301 = _1185;
    float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1305 = _1167 + _1303;
    float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1309 = _1169 + _1307;
    float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1313 = _1171 + _1311;
    float _1315 = _1305 * _1305;
    float _1317 = fma(_1309, _1309, _1315);
    float _1319 = fma(_1313, _1313, _1317);
    float _1321 = rsqrt(_1319);
    float _1323 = sqrt(_1319);
    float _1325 = _1321 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1327 = _1309 * _1325;
    float _1329 = _1313 * _1325;
    float _1331 = _1327 * _1327;
    float _1333 = _1329 * _1329;
    float _1335 = _1331 + _1333;
    float _1337 = sqrt(_1335);
    bool _1339 = _1337 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1341 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1343 = _1337 + _1341;
    float _1345 = _1313;
    float _1347 = _1315;
    float _1349 = _1343;
    float _1351 = _1297;
    float _1353 = _1325;
    if (_1339)
    {
        float _1355 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1345 = _1355;
    }
    float _1357 = _1345;
    if (_1339)
    {
        float _1359 = rsqrt(_1335);
        _1347 = _1359;
    }
    float _1361 = _1347;
    float _1363 = _1361;
    if (_1339)
    {
        float _1365 = _1343 * _1357;
        _1349 = _1365;
    }
    float _1367 = _1349;
    if (_1339)
    {
        float _1369 = _1367 * 0.15915493667125701904296875;
        _1351 = _1369;
    }
    float _1371 = _1351;
    float _1373 = _1321;
    float _1375 = _1371;
    if (_1339)
    {
        float _1377 = _1371 * 6.283185482025146484375;
        float _1379 = sin(_1377);
        _1373 = _1379;
    }
    float _1381 = _1373;
    float _1383 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1385 = precise::max(0.0, _1383);
    float _1387 = _1299;
    float _1389 = _1385;
    float _1391 = _1383;
    if (_1339)
    {
        float _1393 = _1371 * 6.283185482025146484375;
        float _1395 = cos(_1393);
        _1387 = _1395;
    }
    float _1397 = _1387;
    float _1399 = -_1325;
    float _1401 = -_1385;
    float _1403 = fma(_1305, _1399, _1401);
    if (_1339)
    {
        float _1405 = _1403 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1389 = _1405;
    }
    float _1407 = _1389;
    float _1409 = _1407;
    if (!_1339)
    {
        _1375 = _1331;
    }
    float _1411 = _1375;
    float _1413 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1415 = _1381;
    float _1417 = _1411;
    if (_1339)
    {
        float _1419 = fma(_1381, _1407, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1415 = _1419;
    }
    float _1421 = _1415;
    float _1423 = _1421;
    if (!_1339)
    {
        _1409 = _1329;
    }
    float _1425 = _1409;
    float _1427 = _1425;
    if (_1339)
    {
        float _1429 = _1397 + (-1.0);
        _1391 = _1429;
    }
    float _1431 = _1391;
    float _1433 = _1431;
    if (_1339)
    {
        float _1435 = _1361 * _1421;
        _1079 = _1435;
    }
    float _1437 = _1079;
    if (!_1339)
    {
        _1363 = _1327;
    }
    float _1439 = _1363;
    float _1441 = _1439;
    if (_1339)
    {
        float _1443 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1353 = _1443;
    }
    float _1445 = _1353;
    if (_1339)
    {
        float _1447 = _1327 * _1437;
        _1441 = _1447;
    }
    float _1449 = _1441;
    if (!_1339)
    {
        _1423 = _1403;
    }
    float _1451 = _1423;
    float _1453 = _1451;
    if (_1339)
    {
        float _1455 = _1329 * _1437;
        _1427 = _1455;
    }
    float _1457 = _1427;
    if (_1339)
    {
        float _1459 = fma(_1403, _1397, _1445);
        _1453 = _1459;
    }
    float _1461 = _1453;
    if (_1339)
    {
        float _1463 = _1449 * _1449;
        _1417 = _1463;
    }
    float _1465 = _1417;
    if (!_1339)
    {
        _1433 = _1333;
    }
    float _1467 = _1433;
    float _1469 = _1467;
    if (_1339)
    {
        float _1471 = _1457 * _1457;
        _1469 = _1471;
    }
    float _1473 = _1469;
    float _1475 = fma(_1461, _1461, _1465);
    float _1477 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1479 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1481 = _1475 + _1473;
    float _1483 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1477);
    float _1485 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1487 = fma(_1323, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1485);
    float _1489 = precise::clamp(_1487, 0.0, 1.0);
    float _1491 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1493 = rsqrt(_1481);
    float _1495 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1483);
    float _1497 = -_1489;
    float _1499 = _1497 + 1.0;
    float _1501 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1491);
    float _1503 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1479);
    float _1505 = _1495 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1507 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1509 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1501);
    float _1511 = abs(_1499);
    float _1513 = log2(_1511);
    float _1515 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1503);
    float _1517 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1507);
    float _1519 = _1509 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1521 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1523 = _1515 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1525 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1517);
    float _1527 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1529 = _1493 * _1449;
    float _1531 = _1493 * _1457;
    float _1533 = _1525 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1535 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1527);
    float _1537 = _1493 * _1461;
    float _1539 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1541 = -_1521;
    float _1543 = fma(_1541, _1413, 1.0);
    float _1545 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1535);
    float _1547 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1549 = -_1539;
    float _1551 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1549);
    float _1553 = _1537 + 1.0;
    float _1555 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1545);
    float _1557 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1559 = -_1531;
    float _1561 = fma(_1559, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1551);
    float _1563 = exp2(_1547);
    float _1565 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1567 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1557);
    float _1569 = fma(_1561, -0.5, 0.5);
    float _1571 = fma(_1561, 0.5, 0.5);
    float _1573 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1565);
    float _1575 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1567);
    float _1577 = log2(_1543);
    float _1579 = fma(_1571, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1581 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1573);
    float _1583 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1575);
    float _1585 = 1.0 / _1555;
    float _1587 = -_1537;
    float _1589 = fma(_1563, _1553, _1587);
    float _1591 = fma(_1571, _1579, -0.212114393711090087890625);
    float _1593 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1581);
    float _1595 = fma(_1589, 0.5, 0.5);
    float _1597 = fma(_1571, _1591, 1.570728778839111328125);
    float _1599 = sqrt(_1569);
    float _1601 = _1577 * 0.693147182464599609375;
    float _1603 = _1601 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1605 = _1583 * _1585;
    float _1607 = _1593 * _1585;
    float _1609 = fma(_1605, 0.5, 0.5);
    float _1611 = fma(_1607, -0.5, 0.5);
    float _1613 = _1599 * 0.636619746685028076171875;
    float3 _4365 = float3(_1609, _1611, _1603);
    float _1615 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4365, float3(0.0), isnan(_4365)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4365, float3(0.0), isnan(_4365)), level(0.0)).x;
    float3 _4376 = float3(_1609, _1611, _1603);
    float4 _1618 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4376, float3(0.0), isnan(_4376)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4376, float3(0.0), isnan(_4376)), level(0.0)).xyzw;
    float _1620 = _1618.x;
    float _1622 = _1618.y;
    float _1624 = _1618.z;
    float _1626 = _1618.w;
    float _1628 = -_1597;
    float _1630 = fma(_1613, _1628, 1.0);
    float2 _4398 = float2(_1630, _1595);
    float3 _1634 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4398, float2(0.0), isnan(_4398)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4398, float2(0.0), isnan(_4398)), level(0.0)).xyz;
    float _1636 = _1634.x;
    float _1638 = _1634.y;
    float _1640 = _1634.z;
    float _1642 = in.m_49.w;
    bool _1644 = _141 > 0.5;
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1648 = _473 + _1646;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1650;
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1658 = -_679;
    float _1660 = _1658 + 1.0;
    float _1662 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1664 = 1.0 / _1652;
    float _1666 = -_683;
    float _1668 = _1666 + 1.0;
    bool _1670 = _481 > 0.5;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1672;
    bool _1676 = _475 > 0.5;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1678;
    float _1682 = -_807;
    int _1684 = _1644 ? as_type<int>(_1682) : as_type<int>(_807);
    float _1686 = 1.0 / _1656;
    int _1688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1690 = _1688 != 0;
    float _1692 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1662);
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1696 = _1694 != 0;
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1700 = _1698 != 0;
    int _1702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1704 = _1702 != 0;
    float _1706 = _1648 * _1664;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1710 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1708;
    bool _1712 = _1642 > 0.5;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1716 = _473 + _1714;
    float _1718 = fma(_1680, _1706, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1720 = fma(_1710, _1706, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1722 = fma(_1674, _1706, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1724 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1726 = isnan(_473);
    bool _1728 = _1724 || _1726;
    bool _1730 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1732 = _1728 || _1730;
    float _1734 = float(_1732);
    float _1736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1738 = _1716 * _1686;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1742 = _1740 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    bool _1744 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1746 = isnan(_473);
    bool _1748 = _1744 || _1746;
    bool _1750 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1752 = _1748 || _1750;
    float _1754 = float(_1752);
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1758 = _1756 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    bool _1760 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1762 = isnan(_473);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1768 = _1764 || _1766;
    float _1770 = float(_1768);
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1774 = _1772 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1776 = -_787;
    int _1778 = _1670 ? as_type<int>(_1776) : as_type<int>(_787);
    float _1780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1782 = -_787;
    int _1784 = _1712 ? as_type<int>(_1782) : as_type<int>(_787);
    float _1786 = -_1754;
    float _1788 = _1786 + 1.0;
    bool _1790 = !_1690;
    float _1792 = _1790 ? _807 : as_type<float>(_1684);
    float _1794 = fma(_1742, _1738, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _1796 = !_1696;
    float _1798 = _1796 ? _787 : as_type<float>(_1778);
    float _1800 = _1734 * _1788;
    bool _1802 = !_1704;
    float _1804 = _1802 ? _787 : as_type<float>(_1784);
    float _1806 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1808 = _1792 + 0.5;
    float _1810 = -_807;
    int _1812 = _1676 ? as_type<int>(_1810) : as_type<int>(_807);
    float _1814 = -_1734;
    float _1816 = _1814 + 1.0;
    float _1818 = fma(_1774, _1738, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1820 = fma(_1806, _1808, _671);
    float _1822 = fma(_1758, _1738, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _1824 = !_1700;
    float _1826 = _1824 ? _807 : as_type<float>(_1812);
    float _1828 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1830 = -_1660;
    float _1832 = fma(_1792, _1830, _1820);
    float _1834 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1836 = _1770 * _1816;
    float _1838 = -_1770;
    float _1840 = _1838 + 1.0;
    float _1842 = _1826 + 0.5;
    float _1844 = -_1804;
    float _1846 = _1844 + 0.5;
    float _1848 = _1720 * _1836;
    float _1850 = exp2(_1834);
    float _1852 = _1718 * _1836;
    float _1854 = _1722 * _1836;
    float _1856 = _1780 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1858 = _1798 + (-0.5);
    float _1860 = fma(_1840, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1852);
    float _1862 = _1846 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1864 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1692);
    float _1866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1868 = -_1856;
    float _1870 = -_547;
    float _1872 = fma(_1868, _1858, _1870);
    float _1874 = fma(_1840, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1848);
    float _1876 = fma(_1840, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1854);
    float _1878 = _1842 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1880 = _1239 * _1301;
    float _1882 = fma(_1798, _1668, _1872);
    float _1884 = fma(_1794, _1800, _1874);
    float _1886 = -_1850;
    float _1888 = _1886 + 1.0;
    float _1890 = _1878 * _1828;
    float _1892 = fma(_1818, _1800, _1860);
    float _1894 = fma(_1822, _1800, _1876);
    float _1896 = _1888 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1898 = _1239 > 0.0;
    bool _1900 = isnan(_1239);
    bool _1902 = _1898 || _1900;
    bool _1904 = isnan(0.0);
    bool _1906 = _1902 || _1904;
    float _1908 = _1880 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1910 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1884);
    float _1912 = _1862 * _1866;
    float _1914 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1892);
    float _1916 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1894);
    float _1918 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1864);
    bool _1920 = _1301 <= 0.0;
    bool _1922 = !_1906;
    bool _1924 = _1920 || _1922;
    out.m_60.x = _1832;
    out.m_60.y = _1882;
    out.m_60.z = _1890;
    out.m_60.w = _1912;
    float _1926 = _1910 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1928 = _1914 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1930 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1934 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1936 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1938 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1940 = _1908 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1942 = _1918 + _1555;
    out.m_62.x = _1934;
    out.m_62.y = _1936;
    out.m_62.z = _1938;
    out.m_62.w = _1932;
    float _1944 = _1942 * 0.5;
    out.m_45.x = _1940;
    out.gl_Position.x = _1583;
    out.gl_Position.y = _1593;
    out.gl_Position.z = _1918;
    out.gl_Position.w = _1555;
    out.m_64.z = _1944;
    out.m_64.w = _1555;
    float _1946 = _1896 * _1615;
    float _1948 = -_1896;
    float _1950 = _1948 + 1.0;
    float _1952 = _1626 * _1946;
    float _1954 = _1626 * _1950;
    float _1956 = _1640 * _1946;
    float _1958 = fma(_1636, _1952, _1620);
    float _1960 = fma(_1638, _1952, _1622);
    float _1962 = fma(_1626, _1956, _1624);
    out.m_66.x = _1958;
    out.m_66.y = _1960;
    out.m_66.z = _1962;
    out.m_66.w = _1954;
    if (!_1924)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1964 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1964;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _465 = false;
    bool _273 = false;
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
        float _2021 = as_type<float>(_101);
        out.gl_Position.z = _2021;
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
        float _2091 = as_type<float>(_139);
        out.gl_Position.z = _2091;
    }
    if (_131)
    {
        return out;
    }
    float _141 = in.m_49.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = in.m_51.x;
    float _149 = in.m_51.y;
    float _151 = in.m_51.z;
    float _153 = _145 * _143;
    float _155 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    float _157 = floor(_155);
    int _159 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _161 = _159 != 0;
    float _163 = _155 * 6.283185482025146484375;
    float _165 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _167 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _171 = _169 != 0;
    int _173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _175 = _173 != 0;
    float _177 = _163 * 0.15915493667125701904296875;
    float _179 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _165);
    float _183 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _167);
    bool _185 = !_171;
    int _187 = _185 ? 0 : 1;
    float _189 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _191 = _177 * 6.283185482025146484375;
    float _193 = cos(_191);
    bool _195 = !_161;
    int _197 = _195 ? 0 : 1;
    int _199 = abs(_187);
    float _201 = -_157;
    float _203 = _155 + _201;
    bool _205 = !_175;
    int _207 = _205 ? 0 : 1;
    float _209 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _189);
    int _211 = abs(_197);
    float _213 = float(_199);
    float _215 = -_203;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _221 = abs(_207);
    float _223 = fma(_193, 0.5, 0.5);
    float _225 = abs(_217);
    float _227 = _213 * _225;
    bool _229 = _203 < 0.5;
    float _231 = float(_229);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_211);
    float _239 = -_231;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_221);
    float _245 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    float _247 = fma(_237, _235, _227);
    float _249 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    float _251 = abs(_241);
    float _253 = fma(_243, _251, _247);
    bool _255 = !_219;
    float _271;
    if (!_255)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _263 = _261 * _257;
        float _265 = floor(_263);
        float _267 = -_265;
        float _269 = _263 + _267;
        _271 = _269;
        _273 = true;
    }
    else
    {
        float _275 = float(_85);
        float _277 = 1.0 / _275;
        float _279 = _119 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = _281 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = _281 + _287;
    bool _291 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _293 = isnan(_281);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _281 + _315;
    float _319 = 1.0 / _305;
    bool _321 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _323 = 1.0 / _313;
    float _325 = 1.0 / _309;
    float _327 = _285 * _319;
    bool _329 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _331 = isnan(_281);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = -_301;
    float _343 = _341 + 1.0;
    float _345 = _339 * _343;
    float _347 = _289 * _323;
    bool _349 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _351 = isnan(_281);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = -_339;
    float _363 = _361 + 1.0;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = _317 * _325;
    bool _371 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _373 = isnan(_281);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _383;
    float _387 = _359 * _363;
    float _389 = -_359;
    float _391 = _389 + 1.0;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _393;
    float _397 = fma(_385, _327, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _399 = _381 * _391;
    float _401 = fma(_395, _327, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _403 = -_381;
    float _405 = _403 + 1.0;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _411 = _397 * _399;
    float _413 = _401 * _399;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _415;
    float _419 = fma(_367, _369, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _421 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[143].x, _411);
    float _423 = fma(_409, _369, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _425;
    float _429 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[143].y, _413);
    float _431 = fma(_417, _347, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _433 = fma(_419, _387, _421);
    float _435 = fma(_427, _347, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _437 = fma(_423, _387, _429);
    float _439 = fma(_431, _345, _433);
    float _441 = fma(_435, _345, _437);
    float _443 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].x, _439);
    float _445 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].y, _441);
    bool _447 = !_321;
    float _463;
    if (!_447)
    {
        float _449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _451 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _455 = _453 * _449;
        float _457 = floor(_455);
        float _459 = -_457;
        float _461 = _455 + _459;
        _463 = _461;
        _465 = true;
    }
    else
    {
        float _467 = float(_85);
        float _469 = 1.0 / _467;
        float _471 = _119 * _469;
        _463 = _471;
    }
    _465 = false;
    float _473 = _463;
    float _475 = in.m_49.z;
    float _477 = _141 * 2.0;
    float _479 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _481 = in.m_49.y;
    float _483 = floor(_477);
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _489 = _487 != 0;
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _493 = _491 != 0;
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _497 = _495 != 0;
    float _499 = -_485;
    float _501 = fma(_479, 2.0, _499);
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _505 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _507 = log2(_505);
    bool _509 = !_493;
    int _511 = _509 ? 0 : 1;
    int _513 = abs(_511);
    bool _515 = _483 > 0.0;
    float _517 = _475 * 2.0;
    bool _519 = _483 >= 0.0;
    bool _521 = isnan(_483);
    bool _523 = _519 || _521;
    bool _525 = isnan(0.0);
    bool _527 = _523 || _525;
    bool _529 = !_489;
    int _531 = _529 ? 0 : 1;
    float _533 = _481 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _535 = _141 + _481;
    float _537 = floor(_517);
    float _539 = fma(_533, -2.0, _503);
    float _541 = _535 + (-1.0);
    float _543 = _481 * 2.0;
    int _545 = _527 ? 0 : 1;
    float _547 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _539);
    float _549 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _551 = floor(_543);
    float _553 = _481 + _475;
    int _555 = ~_545;
    int _557 = _555 + 1;
    int _559 = _557 + 1;
    int _561 = _559;
    if (!_515)
    {
        int _563 = ~_545;
        int _565 = _563 + 1;
        _561 = _565;
    }
    int _567 = _561;
    float _569 = _553 + (-1.0);
    bool _571 = _537 > 0.0;
    float _573 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _575 = _537 >= 0.0;
    bool _577 = isnan(_537);
    bool _579 = _575 || _577;
    bool _581 = isnan(0.0);
    bool _583 = _579 || _581;
    float _585 = _507 * _119;
    int _587 = _583 ? 0 : 1;
    float _589 = exp2(_585);
    float _591 = float(_513);
    float _593 = float(_567);
    bool _595 = _551 > 0.0;
    bool _597 = _551 >= 0.0;
    bool _599 = isnan(_551);
    bool _601 = _597 || _599;
    bool _603 = isnan(0.0);
    bool _605 = _601 || _603;
    float _607 = _591 * _593;
    int _609 = ~_587;
    int _611 = _609 + 1;
    int _613 = _611 + 1;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _617 = _607 * (-2.0);
    int _619 = _613;
    if (!_571)
    {
        int _621 = ~_587;
        int _623 = _621 + 1;
        _619 = _623;
    }
    int _625 = _619;
    float _627 = in.m_53.x;
    float _629 = in.m_53.y;
    float _631 = in.m_53.z;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _635 = 1.0 + _633;
    float _637 = -_589;
    float _639 = _637 + 1.0;
    bool _641 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _643 = isnan(1.0);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _649 = _645 || _647;
    float _651 = 1.0 / _635;
    int _653 = abs(_531);
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _657 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _659 = isnan(0.0);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _665 = _661 || _663;
    float _667 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[78].w, _615);
    float _669 = -_119;
    float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[76].x, _501);
    float _673 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _655);
    float _675 = float(_625);
    float _677 = _665 ? _639 : 0.0;
    float _679 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _673);
    float _681 = float(_653);
    float _683 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _667);
    int _685 = _605 ? 0 : 1;
    if (_649)
    {
        float _687 = _677 * _651;
        _121 = _687;
    }
    float _689 = _121;
    float _691 = _481 + (-0.5);
    float _693 = _681 * _675;
    float _695 = fma(_617, _629, _629);
    bool _697 = !_497;
    int _699 = _697 ? 0 : 1;
    float _701 = fma(_573, _617, _573);
    int _703 = ~_685;
    int _705 = _703 + 1;
    int _707 = _705 + 1;
    float _709 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[196].y, _695);
    float _711 = _693 * (-2.0);
    int _713 = _707;
    if (!_595)
    {
        int _715 = ~_685;
        int _717 = _715 + 1;
        _713 = _717;
    }
    int _719 = _713;
    float _721 = as_type<float>(int(gl_VertexIndex));
    int _723 = abs(_699);
    float _725 = fma(_701, _689, _709);
    float _727 = _141 + (-0.5);
    float _729 = fma(_711, _627, _627);
    float _731 = float(_723);
    float _733 = _725 * 0.15915493667125701904296875;
    float _735 = float(_719);
    float _737 = fma(_549, _711, _549);
    float _739 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[196].x, _729);
    float _741 = _141 + _475;
    float _743 = in.m_58.x;
    float _745 = in.m_58.y;
    float _747 = _731 * _735;
    float _749 = fma(_737, _689, _739);
    float _751 = _741 + (-1.0);
    float _753 = _747 * (-2.0);
    float _755 = _749 * 0.15915493667125701904296875;
    float _757 = _733 * 6.283185482025146484375;
    float _759 = sin(_757);
    float _761 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _763 = fma(_753, _631, _631);
    float _765 = _475 + (-0.5);
    float _767 = fma(_761, _753, _761);
    int _769 = as_type<int>(_721) & 1;
    bool _771 = _769 != 0;
    int _773 = as_type<int>(_721) & 2;
    bool _775 = _773 != 0;
    float _777 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[196].z, _763);
    float _779 = _755 * 6.283185482025146484375;
    float _781 = sin(_779);
    float _783 = fma(_767, _689, _777);
    bool _785 = !_775;
    float _787 = _785 ? (-0.5) : 0.5;
    float _789 = _783 * 0.15915493667125701904296875;
    float _791 = _755 * 6.283185482025146484375;
    float _793 = cos(_791);
    float _795 = _443 * _743;
    float _797 = _445 * _745;
    float _799 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _787);
    float _801 = _253 * _795;
    float _803 = _253 * _797;
    bool _805 = !_771;
    float _807 = _805 ? (-0.5) : 0.5;
    float _809 = _789 * 6.283185482025146484375;
    float _811 = cos(_809);
    float _813 = _801 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _815 = _803 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _817 = in.m_42.x;
    float _819 = in.m_42.y;
    float _821 = in.m_42.z;
    float _823 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _807);
    float _825 = _815 * _799;
    float _827 = _733 * 6.283185482025146484375;
    float _829 = cos(_827);
    float _831 = _813 * _823;
    float _833 = _793 * _759;
    float _835 = _781 * _759;
    float _837 = _789 * 6.283185482025146484375;
    float _839 = sin(_837);
    float _841 = _759 * _811;
    float _843 = _811 * _825;
    float _845 = _793 * _843;
    float _847 = _793 * _829;
    float _849 = _781 * _829;
    float _851 = _829 * _811;
    float _853 = _781 * _843;
    float _855 = fma(_839, _847, _835);
    float _857 = -_833;
    float _859 = fma(_839, _849, _857);
    float _861 = -_849;
    float _863 = fma(_839, _833, _861);
    float _865 = -_825;
    float _867 = _839 * _865;
    float _869 = fma(_855, _831, _845);
    float _871 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _873 = fma(_839, _835, _847);
    float _875 = fma(_851, _831, _867);
    float _877 = fma(_859, _831, _853);
    float _879 = fma(_863, _871, _869);
    float _881 = _819 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _883 = fma(_841, _871, _875);
    float _885 = fma(_873, _871, _877);
    float _887 = _879 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _889 = _819 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _891 = fma(_817, (*spvDescriptorSet0.vp_c10)._m0[6].x, _881);
    float _893 = _879 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _895 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[26].x, _887);
    float _897 = fma(_817, (*spvDescriptorSet0.vp_c10)._m0[4].x, _889);
    float _899 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[6].z, _891);
    float _901 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[24].x, _893);
    float _903 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[26].z, _895);
    float _905 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[4].z, _897);
    float _907 = _899 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _909 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[24].z, _901);
    float _911 = _903 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _913 = _905 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _915 = _819 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _917 = _909 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _919 = _907 + _911;
    float _921 = _879 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _923 = fma(_817, (*spvDescriptorSet0.vp_c10)._m0[5].x, _915);
    float _925 = _913 + _917;
    float _927 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _929 = _919 + _927;
    float _931 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[25].x, _921);
    float _933 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[5].z, _923);
    float _935 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _937 = _925 + _935;
    float _939 = _929 * _929;
    float _941 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[25].z, _931);
    float _943 = _933 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _945 = fma(_937, _937, _939);
    float _947 = _941 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _949 = _943 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _951 = sqrt(_945);
    float _953 = _943 + _947;
    float _955 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[11].x, _949);
    float _957 = precise::min(_953, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _959 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[11].z, _955);
    bool _961 = _951 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _963 = _949;
    float _965 = _955;
    float _967 = _919;
    float _969 = _959;
    if (!_961)
    {
        _963 = _919;
    }
    float _971 = _963;
    float _973 = _971;
    if (!_961)
    {
        _965 = _925;
    }
    float _975 = _965;
    float _977 = _975;
    if (!_961)
    {
        _967 = _957;
    }
    float _979 = _967;
    bool _981 = !_961;
    float _983 = _979;
    if (!_981)
    {
        float _985 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _987 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _989 = _951 + _987;
        float _991 = rsqrt(_945);
        float _993 = _989 * _985;
        float _995 = _957 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _997 = _993 * 0.15915493667125701904296875;
        float _999 = _997 * 6.283185482025146484375;
        float _1001 = cos(_999);
        float _1003 = _997 * 6.283185482025146484375;
        float _1005 = sin(_1003);
        float _1007 = _1001 + (-1.0);
        float _1009 = _1007 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1011 = fma(_1005, _995, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1013 = fma(_957, _1001, _1009);
        float _1015 = _991 * _1011;
        float _1017 = fma(_937, _1015, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1019 = fma(_929, _1015, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _983 = _1013;
        _977 = _1017;
        _973 = _1019;
    }
    float _1021 = _983;
    float _1023 = _977;
    float _1025 = _973;
    float _1027 = -_943;
    float _1029 = _1027 + _1021;
    float _1031 = -_913;
    float _1033 = _1031 + _1023;
    float _1035 = -_907;
    float _1037 = _1035 + _1025;
    float _1039 = _959 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1041 = _1029 * _1029;
    float _1043 = _943 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1045 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1047 = isnan(0.5);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1053 = _1049 || _1051;
    float _1055 = 1.0 / _1039;
    float _1057 = fma(_1033, _1033, _1041);
    float _1059 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1043);
    float _1061 = fma(_1037, _1037, _1057);
    float _1063 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1059);
    float _1065 = sqrt(_1061);
    float _1067 = _1063 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1069 = _1057;
    float _1071 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1073 = _1025;
    float _1075 = _1043;
    float _1077 = _1021;
    float _1079 = _1029;
    if (_1053)
    {
        _1069 = 1.0;
    }
    float _1081 = _1069;
    float _1083 = _1067 + _1039;
    float _1085 = _1083 * _1055;
    float _1087 = _1085 * 0.5;
    bool _1089 = _1065 > 0.0;
    float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1093 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1091);
    float _1095 = 1.0 / _1093;
    float _1097 = _1087;
    float _1099 = _1081;
    if (!_1089)
    {
        _1071 = _1023;
    }
    float _1101 = _1071;
    float _1103 = _1101;
    if (!_1089)
    {
        _1097 = _1021;
    }
    float _1105 = _1097;
    bool _1107 = !_1089;
    float _1109 = _1105;
    float _1111 = _1105;
    if (!_1107)
    {
        float _1113 = _245 * _245;
        float _1115 = fma(_249, _249, _1113);
        float _1117 = fma(_209, _209, _1115);
        float _1119 = rsqrt(_1061);
        float _1121 = sqrt(_1117);
        float _1123 = _1033 * _1119;
        float _1125 = _1029 * _1119;
        float _1127 = _1037 * _1119;
        bool _1129 = _1121 > 0.0;
        float _1131 = _1121;
        _969 = _1117;
        if (!_1129)
        {
            _1131 = _1023;
        }
        float _1133 = _1131;
        _1103 = _1133;
        if (!_1129)
        {
            _1109 = _1021;
        }
        float _1135 = _1109;
        bool _1137 = !_1129;
        _1111 = _1135;
        if (!_1137)
        {
            float _1139 = rsqrt(_1117);
            float _1141 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1143 = _245 * _1139;
            float _1145 = _249 * _1139;
            float _1147 = _1125 * _1143;
            float _1149 = _209 * _1139;
            float _1151 = fma(_1123, _1145, _1147);
            float _1153 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1155 = fma(_1127, _1149, _1151);
            float _1157 = _1155 * _1153;
            float _1159 = fma(_249, _1157, _1023);
            float _1161 = fma(_245, _1157, _1021);
            float _1163 = fma(_209, _1157, _1025);
            _969 = _1139;
            _1111 = _1161;
            _1103 = _1159;
            _1073 = _1163;
            _1075 = _1153;
        }
    }
    float _1165 = _969;
    float _1167 = _1111;
    float _1169 = _1103;
    float _1171 = _1073;
    float _1173 = _1075;
    float _1175 = _1165;
    float _1177 = _1173;
    if (_1053)
    {
        _1077 = 1.0;
    }
    float _1179 = _1077;
    float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1183 = _1095 * _1181;
    float _1185 = _1179;
    if (!_1053)
    {
        float _1187 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1189 = _1187 * 0.15915493667125701904296875;
        float _1191 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1193 = _1189 * 6.283185482025146484375;
        float _1195 = cos(_1193);
        float _1197 = _1191 * 0.15915493667125701904296875;
        float _1199 = _1189 * 6.283185482025146484375;
        float _1201 = sin(_1199);
        float _1203 = 1.0 / _1195;
        float _1205 = _1197 * 6.283185482025146484375;
        float _1207 = cos(_1205);
        float _1209 = _1201 * _1203;
        float _1211 = _1197 * 6.283185482025146484375;
        float _1213 = sin(_1211);
        float _1215 = _1207 * _1209;
        float _1217 = 1.0 / _1215;
        float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1221 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1219;
        float _1223 = 1.0 / _1221;
        float _1225 = _1213 * _1217;
        float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1229 = fma(_1183, _1225, _1227);
        float _1231 = _1229 * _1223;
        float _1233 = precise::clamp(_1231, 0.0, 1.0);
        _1175 = _1197;
        _1177 = _1229;
        _1099 = _1233;
    }
    float _1235 = _1175;
    float _1237 = _1177;
    float _1239 = _1099;
    float _1241 = _1237;
    float _1243 = _1235;
    if (!_1053)
    {
        float _1245 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1247 = _1245 * 0.15915493667125701904296875;
        float _1249 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1251 = _1247 * 6.283185482025146484375;
        float _1253 = cos(_1251);
        float _1255 = _1249 * 0.15915493667125701904296875;
        float _1257 = _1247 * 6.283185482025146484375;
        float _1259 = sin(_1257);
        float _1261 = 1.0 / _1253;
        float _1263 = _1255 * 6.283185482025146484375;
        float _1265 = cos(_1263);
        float _1267 = _1259 * _1261;
        float _1269 = _1255 * 6.283185482025146484375;
        float _1271 = sin(_1269);
        float _1273 = _1265 * _1267;
        float _1275 = 1.0 / _1273;
        float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1279 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1277;
        float _1281 = 1.0 / _1279;
        float _1283 = _1271 * _1275;
        float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1287 = fma(_1183, _1283, _1285);
        float _1289 = _1287 * _1281;
        float _1291 = precise::clamp(_1289, 0.0, 1.0);
        float _1293 = -_1291;
        float _1295 = _1293 + 1.0;
        _1241 = _1273;
        _1243 = _1261;
        _1185 = _1295;
    }
    float _1297 = _1241;
    float _1299 = _1243;
    float _1301 = _1185;
    float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1305 = _1167 + _1303;
    float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1309 = _1169 + _1307;
    float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1313 = _1171 + _1311;
    float _1315 = _1305 * _1305;
    float _1317 = fma(_1309, _1309, _1315);
    float _1319 = fma(_1313, _1313, _1317);
    float _1321 = rsqrt(_1319);
    float _1323 = sqrt(_1319);
    float _1325 = _1321 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1327 = _1309 * _1325;
    float _1329 = _1313 * _1325;
    float _1331 = _1327 * _1327;
    float _1333 = _1329 * _1329;
    float _1335 = _1331 + _1333;
    float _1337 = sqrt(_1335);
    bool _1339 = _1337 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1341 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1343 = _1337 + _1341;
    float _1345 = _1313;
    float _1347 = _1315;
    float _1349 = _1343;
    float _1351 = _1297;
    float _1353 = _1325;
    if (_1339)
    {
        float _1355 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1345 = _1355;
    }
    float _1357 = _1345;
    if (_1339)
    {
        float _1359 = rsqrt(_1335);
        _1347 = _1359;
    }
    float _1361 = _1347;
    float _1363 = _1361;
    if (_1339)
    {
        float _1365 = _1343 * _1357;
        _1349 = _1365;
    }
    float _1367 = _1349;
    if (_1339)
    {
        float _1369 = _1367 * 0.15915493667125701904296875;
        _1351 = _1369;
    }
    float _1371 = _1351;
    float _1373 = _1321;
    float _1375 = _1371;
    if (_1339)
    {
        float _1377 = _1371 * 6.283185482025146484375;
        float _1379 = sin(_1377);
        _1373 = _1379;
    }
    float _1381 = _1373;
    float _1383 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1385 = precise::max(0.0, _1383);
    float _1387 = _1299;
    float _1389 = _1385;
    float _1391 = _1383;
    if (_1339)
    {
        float _1393 = _1371 * 6.283185482025146484375;
        float _1395 = cos(_1393);
        _1387 = _1395;
    }
    float _1397 = _1387;
    float _1399 = -_1325;
    float _1401 = -_1385;
    float _1403 = fma(_1305, _1399, _1401);
    if (_1339)
    {
        float _1405 = _1403 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1389 = _1405;
    }
    float _1407 = _1389;
    float _1409 = _1407;
    if (!_1339)
    {
        _1375 = _1331;
    }
    float _1411 = _1375;
    float _1413 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1415 = _1381;
    float _1417 = _1411;
    if (_1339)
    {
        float _1419 = fma(_1381, _1407, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1415 = _1419;
    }
    float _1421 = _1415;
    float _1423 = _1421;
    if (!_1339)
    {
        _1409 = _1329;
    }
    float _1425 = _1409;
    float _1427 = _1425;
    if (_1339)
    {
        float _1429 = _1397 + (-1.0);
        _1391 = _1429;
    }
    float _1431 = _1391;
    float _1433 = _1431;
    if (_1339)
    {
        float _1435 = _1361 * _1421;
        _1079 = _1435;
    }
    float _1437 = _1079;
    if (!_1339)
    {
        _1363 = _1327;
    }
    float _1439 = _1363;
    float _1441 = _1439;
    if (_1339)
    {
        float _1443 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1353 = _1443;
    }
    float _1445 = _1353;
    if (_1339)
    {
        float _1447 = _1327 * _1437;
        _1441 = _1447;
    }
    float _1449 = _1441;
    if (!_1339)
    {
        _1423 = _1403;
    }
    float _1451 = _1423;
    float _1453 = _1451;
    if (_1339)
    {
        float _1455 = _1329 * _1437;
        _1427 = _1455;
    }
    float _1457 = _1427;
    if (_1339)
    {
        float _1459 = fma(_1403, _1397, _1445);
        _1453 = _1459;
    }
    float _1461 = _1453;
    if (_1339)
    {
        float _1463 = _1449 * _1449;
        _1417 = _1463;
    }
    float _1465 = _1417;
    if (!_1339)
    {
        _1433 = _1333;
    }
    float _1467 = _1433;
    float _1469 = _1467;
    if (_1339)
    {
        float _1471 = _1457 * _1457;
        _1469 = _1471;
    }
    float _1473 = _1469;
    float _1475 = fma(_1461, _1461, _1465);
    float _1477 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1479 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1481 = _1475 + _1473;
    float _1483 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1477);
    float _1485 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1487 = fma(_1323, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1485);
    float _1489 = precise::clamp(_1487, 0.0, 1.0);
    float _1491 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1493 = rsqrt(_1481);
    float _1495 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1483);
    float _1497 = -_1489;
    float _1499 = _1497 + 1.0;
    float _1501 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1491);
    float _1503 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1479);
    float _1505 = _1495 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1507 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1509 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1501);
    float _1511 = abs(_1499);
    float _1513 = log2(_1511);
    float _1515 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1503);
    float _1517 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1507);
    float _1519 = _1509 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1521 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1523 = _1515 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1525 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1517);
    float _1527 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1529 = _1493 * _1449;
    float _1531 = _1493 * _1457;
    float _1533 = _1525 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1535 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1527);
    float _1537 = _1493 * _1461;
    float _1539 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1541 = -_1521;
    float _1543 = fma(_1541, _1413, 1.0);
    float _1545 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1535);
    float _1547 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1549 = -_1539;
    float _1551 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1549);
    float _1553 = _1537 + 1.0;
    float _1555 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1545);
    float _1557 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1559 = -_1531;
    float _1561 = fma(_1559, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1551);
    float _1563 = exp2(_1547);
    float _1565 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1567 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1557);
    float _1569 = fma(_1561, -0.5, 0.5);
    float _1571 = fma(_1561, 0.5, 0.5);
    float _1573 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1565);
    float _1575 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1567);
    float _1577 = log2(_1543);
    float _1579 = fma(_1571, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1581 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1573);
    float _1583 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1575);
    float _1585 = 1.0 / _1555;
    float _1587 = -_1537;
    float _1589 = fma(_1563, _1553, _1587);
    float _1591 = fma(_1571, _1579, -0.212114393711090087890625);
    float _1593 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1581);
    float _1595 = fma(_1589, 0.5, 0.5);
    float _1597 = fma(_1571, _1591, 1.570728778839111328125);
    float _1599 = sqrt(_1569);
    float _1601 = _1577 * 0.693147182464599609375;
    float _1603 = _1601 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1605 = _1583 * _1585;
    float _1607 = _1593 * _1585;
    float _1609 = fma(_1605, 0.5, 0.5);
    float _1611 = fma(_1607, -0.5, 0.5);
    float _1613 = _1599 * 0.636619746685028076171875;
    float3 _4365 = float3(_1609, _1611, _1603);
    float _1615 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4365, float3(0.0), isnan(_4365)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4365, float3(0.0), isnan(_4365)), level(0.0)).x;
    float3 _4376 = float3(_1609, _1611, _1603);
    float4 _1618 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4376, float3(0.0), isnan(_4376)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4376, float3(0.0), isnan(_4376)), level(0.0)).xyzw;
    float _1620 = _1618.x;
    float _1622 = _1618.y;
    float _1624 = _1618.z;
    float _1626 = _1618.w;
    float _1628 = -_1597;
    float _1630 = fma(_1613, _1628, 1.0);
    float2 _4398 = float2(_1630, _1595);
    float3 _1634 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4398, float2(0.0), isnan(_4398)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4398, float2(0.0), isnan(_4398)), level(0.0)).xyz;
    float _1636 = _1634.x;
    float _1638 = _1634.y;
    float _1640 = _1634.z;
    float _1642 = in.m_49.w;
    bool _1644 = _141 > 0.5;
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1648 = _473 + _1646;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1650;
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1658 = -_679;
    float _1660 = _1658 + 1.0;
    float _1662 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1664 = 1.0 / _1652;
    float _1666 = -_683;
    float _1668 = _1666 + 1.0;
    bool _1670 = _481 > 0.5;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1672;
    bool _1676 = _475 > 0.5;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1678;
    float _1682 = -_807;
    int _1684 = _1644 ? as_type<int>(_1682) : as_type<int>(_807);
    float _1686 = 1.0 / _1656;
    int _1688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1690 = _1688 != 0;
    float _1692 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1662);
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1696 = _1694 != 0;
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1700 = _1698 != 0;
    int _1702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1704 = _1702 != 0;
    float _1706 = _1648 * _1664;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1710 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1708;
    bool _1712 = _1642 > 0.5;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1716 = _473 + _1714;
    float _1718 = fma(_1680, _1706, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1720 = fma(_1710, _1706, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1722 = fma(_1674, _1706, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1724 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1726 = isnan(_473);
    bool _1728 = _1724 || _1726;
    bool _1730 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1732 = _1728 || _1730;
    float _1734 = float(_1732);
    float _1736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1738 = _1716 * _1686;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1742 = _1740 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    bool _1744 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1746 = isnan(_473);
    bool _1748 = _1744 || _1746;
    bool _1750 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1752 = _1748 || _1750;
    float _1754 = float(_1752);
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1758 = _1756 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    bool _1760 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1762 = isnan(_473);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1768 = _1764 || _1766;
    float _1770 = float(_1768);
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1774 = _1772 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1776 = -_787;
    int _1778 = _1670 ? as_type<int>(_1776) : as_type<int>(_787);
    float _1780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1782 = -_787;
    int _1784 = _1712 ? as_type<int>(_1782) : as_type<int>(_787);
    float _1786 = -_1754;
    float _1788 = _1786 + 1.0;
    bool _1790 = !_1690;
    float _1792 = _1790 ? _807 : as_type<float>(_1684);
    float _1794 = fma(_1742, _1738, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _1796 = !_1696;
    float _1798 = _1796 ? _787 : as_type<float>(_1778);
    float _1800 = _1734 * _1788;
    bool _1802 = !_1704;
    float _1804 = _1802 ? _787 : as_type<float>(_1784);
    float _1806 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1808 = _1792 + 0.5;
    float _1810 = -_807;
    int _1812 = _1676 ? as_type<int>(_1810) : as_type<int>(_807);
    float _1814 = -_1734;
    float _1816 = _1814 + 1.0;
    float _1818 = fma(_1774, _1738, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1820 = fma(_1806, _1808, _671);
    float _1822 = fma(_1758, _1738, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _1824 = !_1700;
    float _1826 = _1824 ? _807 : as_type<float>(_1812);
    float _1828 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1830 = -_1660;
    float _1832 = fma(_1792, _1830, _1820);
    float _1834 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1836 = _1770 * _1816;
    float _1838 = -_1770;
    float _1840 = _1838 + 1.0;
    float _1842 = _1826 + 0.5;
    float _1844 = -_1804;
    float _1846 = _1844 + 0.5;
    float _1848 = _1720 * _1836;
    float _1850 = exp2(_1834);
    float _1852 = _1718 * _1836;
    float _1854 = _1722 * _1836;
    float _1856 = _1780 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1858 = _1798 + (-0.5);
    float _1860 = fma(_1840, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1852);
    float _1862 = _1846 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1864 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1692);
    float _1866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1868 = -_1856;
    float _1870 = -_547;
    float _1872 = fma(_1868, _1858, _1870);
    float _1874 = fma(_1840, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1848);
    float _1876 = fma(_1840, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1854);
    float _1878 = _1842 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1880 = _1239 * _1301;
    float _1882 = fma(_1798, _1668, _1872);
    float _1884 = fma(_1794, _1800, _1874);
    float _1886 = -_1850;
    float _1888 = _1886 + 1.0;
    float _1890 = _1878 * _1828;
    float _1892 = fma(_1818, _1800, _1860);
    float _1894 = fma(_1822, _1800, _1876);
    float _1896 = _1888 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1898 = _1239 > 0.0;
    bool _1900 = isnan(_1239);
    bool _1902 = _1898 || _1900;
    bool _1904 = isnan(0.0);
    bool _1906 = _1902 || _1904;
    float _1908 = _1880 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1910 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1884);
    float _1912 = _1862 * _1866;
    float _1914 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1892);
    float _1916 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1894);
    float _1918 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1864);
    bool _1920 = _1301 <= 0.0;
    bool _1922 = !_1906;
    bool _1924 = _1920 || _1922;
    out.m_60.x = _1832;
    out.m_60.y = _1882;
    out.m_60.z = _1890;
    out.m_60.w = _1912;
    float _1926 = _1910 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1928 = _1914 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1930 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1934 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1936 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1938 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1940 = _1908 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1942 = _1918 + _1555;
    out.m_62.x = _1934;
    out.m_62.y = _1936;
    out.m_62.z = _1938;
    out.m_62.w = _1932;
    float _1944 = _1942 * 0.5;
    out.m_45.x = _1940;
    out.gl_Position.x = _1583;
    out.gl_Position.y = _1593;
    out.gl_Position.z = _1918;
    out.gl_Position.w = _1555;
    out.m_64.z = _1944;
    out.m_64.w = _1555;
    float _1946 = _1896 * _1615;
    float _1948 = -_1896;
    float _1950 = _1948 + 1.0;
    float _1952 = _1626 * _1946;
    float _1954 = _1626 * _1950;
    float _1956 = _1640 * _1946;
    float _1958 = fma(_1636, _1952, _1620);
    float _1960 = fma(_1638, _1952, _1622);
    float _1962 = fma(_1626, _1956, _1624);
    out.m_66.x = _1958;
    out.m_66.y = _1960;
    out.m_66.z = _1962;
    out.m_66.w = _1954;
    if (!_1924)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1964 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1964;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _465 = false;
    bool _273 = false;
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
        float _2021 = as_type<float>(_101);
        out.gl_Position.z = _2021;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2091 = as_type<float>(_139);
        out.gl_Position.z = _2091;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_49.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = in.m_51.x;
    float _149 = in.m_51.y;
    float _151 = in.m_51.z;
    float _153 = _145 * _143;
    float _155 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    float _157 = floor(_155);
    int _159 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _161 = _159 != 0;
    float _163 = _155 * 6.283185482025146484375;
    float _165 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _167 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _171 = _169 != 0;
    int _173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _175 = _173 != 0;
    float _177 = _163 * 0.15915493667125701904296875;
    float _179 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _165);
    float _183 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _167);
    bool _185 = !_171;
    int _187 = _185 ? 0 : 1;
    float _189 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _191 = _177 * 6.283185482025146484375;
    float _193 = cos(_191);
    bool _195 = !_161;
    int _197 = _195 ? 0 : 1;
    int _199 = abs(_187);
    float _201 = -_157;
    float _203 = _155 + _201;
    bool _205 = !_175;
    int _207 = _205 ? 0 : 1;
    float _209 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _189);
    int _211 = abs(_197);
    float _213 = float(_199);
    float _215 = -_203;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _221 = abs(_207);
    float _223 = fma(_193, 0.5, 0.5);
    float _225 = abs(_217);
    float _227 = _213 * _225;
    bool _229 = _203 < 0.5;
    float _231 = float(_229);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_211);
    float _239 = -_231;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_221);
    float _245 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    float _247 = fma(_237, _235, _227);
    float _249 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    float _251 = abs(_241);
    float _253 = fma(_243, _251, _247);
    bool _255 = !_219;
    float _271;
    if (!_255)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _263 = _261 * _257;
        float _265 = floor(_263);
        float _267 = -_265;
        float _269 = _263 + _267;
        _271 = _269;
        _273 = true;
    }
    else
    {
        float _275 = float(_85);
        float _277 = 1.0 / _275;
        float _279 = _119 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = _281 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = _281 + _287;
    bool _291 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _293 = isnan(_281);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _281 + _315;
    float _319 = 1.0 / _305;
    bool _321 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _323 = 1.0 / _313;
    float _325 = 1.0 / _309;
    float _327 = _285 * _319;
    bool _329 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _331 = isnan(_281);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = -_301;
    float _343 = _341 + 1.0;
    float _345 = _339 * _343;
    float _347 = _289 * _323;
    bool _349 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _351 = isnan(_281);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = -_339;
    float _363 = _361 + 1.0;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = _317 * _325;
    bool _371 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _373 = isnan(_281);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _383;
    float _387 = _359 * _363;
    float _389 = -_359;
    float _391 = _389 + 1.0;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _393;
    float _397 = fma(_385, _327, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _399 = _381 * _391;
    float _401 = fma(_395, _327, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _403 = -_381;
    float _405 = _403 + 1.0;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _411 = _397 * _399;
    float _413 = _401 * _399;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _415;
    float _419 = fma(_367, _369, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _421 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[143].x, _411);
    float _423 = fma(_409, _369, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _425;
    float _429 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[143].y, _413);
    float _431 = fma(_417, _347, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _433 = fma(_419, _387, _421);
    float _435 = fma(_427, _347, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _437 = fma(_423, _387, _429);
    float _439 = fma(_431, _345, _433);
    float _441 = fma(_435, _345, _437);
    float _443 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].x, _439);
    float _445 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].y, _441);
    bool _447 = !_321;
    float _463;
    if (!_447)
    {
        float _449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _451 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _455 = _453 * _449;
        float _457 = floor(_455);
        float _459 = -_457;
        float _461 = _455 + _459;
        _463 = _461;
        _465 = true;
    }
    else
    {
        float _467 = float(_85);
        float _469 = 1.0 / _467;
        float _471 = _119 * _469;
        _463 = _471;
    }
    _465 = false;
    float _473 = _463;
    float _475 = in.m_49.z;
    float _477 = _141 * 2.0;
    float _479 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _481 = in.m_49.y;
    float _483 = floor(_477);
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _489 = _487 != 0;
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _493 = _491 != 0;
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _497 = _495 != 0;
    float _499 = -_485;
    float _501 = fma(_479, 2.0, _499);
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _505 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _507 = log2(_505);
    bool _509 = !_493;
    int _511 = _509 ? 0 : 1;
    int _513 = abs(_511);
    bool _515 = _483 > 0.0;
    float _517 = _475 * 2.0;
    bool _519 = _483 >= 0.0;
    bool _521 = isnan(_483);
    bool _523 = _519 || _521;
    bool _525 = isnan(0.0);
    bool _527 = _523 || _525;
    bool _529 = !_489;
    int _531 = _529 ? 0 : 1;
    float _533 = _481 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _535 = _141 + _481;
    float _537 = floor(_517);
    float _539 = fma(_533, -2.0, _503);
    float _541 = _535 + (-1.0);
    float _543 = _481 * 2.0;
    int _545 = _527 ? 0 : 1;
    float _547 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _539);
    float _549 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _551 = floor(_543);
    float _553 = _481 + _475;
    int _555 = ~_545;
    int _557 = _555 + 1;
    int _559 = _557 + 1;
    int _561 = _559;
    if (!_515)
    {
        int _563 = ~_545;
        int _565 = _563 + 1;
        _561 = _565;
    }
    int _567 = _561;
    float _569 = _553 + (-1.0);
    bool _571 = _537 > 0.0;
    float _573 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _575 = _537 >= 0.0;
    bool _577 = isnan(_537);
    bool _579 = _575 || _577;
    bool _581 = isnan(0.0);
    bool _583 = _579 || _581;
    float _585 = _507 * _119;
    int _587 = _583 ? 0 : 1;
    float _589 = exp2(_585);
    float _591 = float(_513);
    float _593 = float(_567);
    bool _595 = _551 > 0.0;
    bool _597 = _551 >= 0.0;
    bool _599 = isnan(_551);
    bool _601 = _597 || _599;
    bool _603 = isnan(0.0);
    bool _605 = _601 || _603;
    float _607 = _591 * _593;
    int _609 = ~_587;
    int _611 = _609 + 1;
    int _613 = _611 + 1;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _617 = _607 * (-2.0);
    int _619 = _613;
    if (!_571)
    {
        int _621 = ~_587;
        int _623 = _621 + 1;
        _619 = _623;
    }
    int _625 = _619;
    float _627 = in.m_53.x;
    float _629 = in.m_53.y;
    float _631 = in.m_53.z;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _635 = 1.0 + _633;
    float _637 = -_589;
    float _639 = _637 + 1.0;
    bool _641 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _643 = isnan(1.0);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _649 = _645 || _647;
    float _651 = 1.0 / _635;
    int _653 = abs(_531);
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _657 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _659 = isnan(0.0);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _665 = _661 || _663;
    float _667 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[78].w, _615);
    float _669 = -_119;
    float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[76].x, _501);
    float _673 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _655);
    float _675 = float(_625);
    float _677 = _665 ? _639 : 0.0;
    float _679 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _673);
    float _681 = float(_653);
    float _683 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _667);
    int _685 = _605 ? 0 : 1;
    if (_649)
    {
        float _687 = _677 * _651;
        _121 = _687;
    }
    float _689 = _121;
    float _691 = _481 + (-0.5);
    float _693 = _681 * _675;
    float _695 = fma(_617, _629, _629);
    bool _697 = !_497;
    int _699 = _697 ? 0 : 1;
    float _701 = fma(_573, _617, _573);
    int _703 = ~_685;
    int _705 = _703 + 1;
    int _707 = _705 + 1;
    float _709 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[196].y, _695);
    float _711 = _693 * (-2.0);
    int _713 = _707;
    if (!_595)
    {
        int _715 = ~_685;
        int _717 = _715 + 1;
        _713 = _717;
    }
    int _719 = _713;
    float _721 = as_type<float>(int(gl_VertexIndex));
    int _723 = abs(_699);
    float _725 = fma(_701, _689, _709);
    float _727 = _141 + (-0.5);
    float _729 = fma(_711, _627, _627);
    float _731 = float(_723);
    float _733 = _725 * 0.15915493667125701904296875;
    float _735 = float(_719);
    float _737 = fma(_549, _711, _549);
    float _739 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[196].x, _729);
    float _741 = _141 + _475;
    float _743 = in.m_58.x;
    float _745 = in.m_58.y;
    float _747 = _731 * _735;
    float _749 = fma(_737, _689, _739);
    float _751 = _741 + (-1.0);
    float _753 = _747 * (-2.0);
    float _755 = _749 * 0.15915493667125701904296875;
    float _757 = _733 * 6.283185482025146484375;
    float _759 = sin(_757);
    float _761 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _763 = fma(_753, _631, _631);
    float _765 = _475 + (-0.5);
    float _767 = fma(_761, _753, _761);
    int _769 = as_type<int>(_721) & 1;
    bool _771 = _769 != 0;
    int _773 = as_type<int>(_721) & 2;
    bool _775 = _773 != 0;
    float _777 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[196].z, _763);
    float _779 = _755 * 6.283185482025146484375;
    float _781 = sin(_779);
    float _783 = fma(_767, _689, _777);
    bool _785 = !_775;
    float _787 = _785 ? (-0.5) : 0.5;
    float _789 = _783 * 0.15915493667125701904296875;
    float _791 = _755 * 6.283185482025146484375;
    float _793 = cos(_791);
    float _795 = _443 * _743;
    float _797 = _445 * _745;
    float _799 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _787);
    float _801 = _253 * _795;
    float _803 = _253 * _797;
    bool _805 = !_771;
    float _807 = _805 ? (-0.5) : 0.5;
    float _809 = _789 * 6.283185482025146484375;
    float _811 = cos(_809);
    float _813 = _801 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _815 = _803 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _817 = in.m_42.x;
    float _819 = in.m_42.y;
    float _821 = in.m_42.z;
    float _823 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _807);
    float _825 = _815 * _799;
    float _827 = _733 * 6.283185482025146484375;
    float _829 = cos(_827);
    float _831 = _813 * _823;
    float _833 = _793 * _759;
    float _835 = _781 * _759;
    float _837 = _789 * 6.283185482025146484375;
    float _839 = sin(_837);
    float _841 = _759 * _811;
    float _843 = _811 * _825;
    float _845 = _793 * _843;
    float _847 = _793 * _829;
    float _849 = _781 * _829;
    float _851 = _829 * _811;
    float _853 = _781 * _843;
    float _855 = fma(_839, _847, _835);
    float _857 = -_833;
    float _859 = fma(_839, _849, _857);
    float _861 = -_849;
    float _863 = fma(_839, _833, _861);
    float _865 = -_825;
    float _867 = _839 * _865;
    float _869 = fma(_855, _831, _845);
    float _871 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _873 = fma(_839, _835, _847);
    float _875 = fma(_851, _831, _867);
    float _877 = fma(_859, _831, _853);
    float _879 = fma(_863, _871, _869);
    float _881 = _819 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _883 = fma(_841, _871, _875);
    float _885 = fma(_873, _871, _877);
    float _887 = _879 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _889 = _819 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _891 = fma(_817, (*spvDescriptorSet0.vp_c10)._m0[6].x, _881);
    float _893 = _879 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _895 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[26].x, _887);
    float _897 = fma(_817, (*spvDescriptorSet0.vp_c10)._m0[4].x, _889);
    float _899 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[6].z, _891);
    float _901 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[24].x, _893);
    float _903 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[26].z, _895);
    float _905 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[4].z, _897);
    float _907 = _899 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _909 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[24].z, _901);
    float _911 = _903 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _913 = _905 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _915 = _819 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _917 = _909 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _919 = _907 + _911;
    float _921 = _879 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _923 = fma(_817, (*spvDescriptorSet0.vp_c10)._m0[5].x, _915);
    float _925 = _913 + _917;
    float _927 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _929 = _919 + _927;
    float _931 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[25].x, _921);
    float _933 = fma(_821, (*spvDescriptorSet0.vp_c10)._m0[5].z, _923);
    float _935 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _937 = _925 + _935;
    float _939 = _929 * _929;
    float _941 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[25].z, _931);
    float _943 = _933 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _945 = fma(_937, _937, _939);
    float _947 = _941 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _949 = _943 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _951 = sqrt(_945);
    float _953 = _943 + _947;
    float _955 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[11].x, _949);
    float _957 = precise::min(_953, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _959 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[11].z, _955);
    bool _961 = _951 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _963 = _949;
    float _965 = _955;
    float _967 = _919;
    float _969 = _959;
    if (!_961)
    {
        _963 = _919;
    }
    float _971 = _963;
    float _973 = _971;
    if (!_961)
    {
        _965 = _925;
    }
    float _975 = _965;
    float _977 = _975;
    if (!_961)
    {
        _967 = _957;
    }
    float _979 = _967;
    bool _981 = !_961;
    float _983 = _979;
    if (!_981)
    {
        float _985 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _987 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _989 = _951 + _987;
        float _991 = rsqrt(_945);
        float _993 = _989 * _985;
        float _995 = _957 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _997 = _993 * 0.15915493667125701904296875;
        float _999 = _997 * 6.283185482025146484375;
        float _1001 = cos(_999);
        float _1003 = _997 * 6.283185482025146484375;
        float _1005 = sin(_1003);
        float _1007 = _1001 + (-1.0);
        float _1009 = _1007 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1011 = fma(_1005, _995, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1013 = fma(_957, _1001, _1009);
        float _1015 = _991 * _1011;
        float _1017 = fma(_937, _1015, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1019 = fma(_929, _1015, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _983 = _1013;
        _977 = _1017;
        _973 = _1019;
    }
    float _1021 = _983;
    float _1023 = _977;
    float _1025 = _973;
    float _1027 = -_943;
    float _1029 = _1027 + _1021;
    float _1031 = -_913;
    float _1033 = _1031 + _1023;
    float _1035 = -_907;
    float _1037 = _1035 + _1025;
    float _1039 = _959 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1041 = _1029 * _1029;
    float _1043 = _943 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1045 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1047 = isnan(0.5);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1053 = _1049 || _1051;
    float _1055 = 1.0 / _1039;
    float _1057 = fma(_1033, _1033, _1041);
    float _1059 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1043);
    float _1061 = fma(_1037, _1037, _1057);
    float _1063 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1059);
    float _1065 = sqrt(_1061);
    float _1067 = _1063 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1069 = _1057;
    float _1071 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1073 = _1025;
    float _1075 = _1043;
    float _1077 = _1021;
    float _1079 = _1029;
    if (_1053)
    {
        _1069 = 1.0;
    }
    float _1081 = _1069;
    float _1083 = _1067 + _1039;
    float _1085 = _1083 * _1055;
    float _1087 = _1085 * 0.5;
    bool _1089 = _1065 > 0.0;
    float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1093 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1091);
    float _1095 = 1.0 / _1093;
    float _1097 = _1087;
    float _1099 = _1081;
    if (!_1089)
    {
        _1071 = _1023;
    }
    float _1101 = _1071;
    float _1103 = _1101;
    if (!_1089)
    {
        _1097 = _1021;
    }
    float _1105 = _1097;
    bool _1107 = !_1089;
    float _1109 = _1105;
    float _1111 = _1105;
    if (!_1107)
    {
        float _1113 = _245 * _245;
        float _1115 = fma(_249, _249, _1113);
        float _1117 = fma(_209, _209, _1115);
        float _1119 = rsqrt(_1061);
        float _1121 = sqrt(_1117);
        float _1123 = _1033 * _1119;
        float _1125 = _1029 * _1119;
        float _1127 = _1037 * _1119;
        bool _1129 = _1121 > 0.0;
        float _1131 = _1121;
        _969 = _1117;
        if (!_1129)
        {
            _1131 = _1023;
        }
        float _1133 = _1131;
        _1103 = _1133;
        if (!_1129)
        {
            _1109 = _1021;
        }
        float _1135 = _1109;
        bool _1137 = !_1129;
        _1111 = _1135;
        if (!_1137)
        {
            float _1139 = rsqrt(_1117);
            float _1141 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1143 = _245 * _1139;
            float _1145 = _249 * _1139;
            float _1147 = _1125 * _1143;
            float _1149 = _209 * _1139;
            float _1151 = fma(_1123, _1145, _1147);
            float _1153 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1155 = fma(_1127, _1149, _1151);
            float _1157 = _1155 * _1153;
            float _1159 = fma(_249, _1157, _1023);
            float _1161 = fma(_245, _1157, _1021);
            float _1163 = fma(_209, _1157, _1025);
            _969 = _1139;
            _1111 = _1161;
            _1103 = _1159;
            _1073 = _1163;
            _1075 = _1153;
        }
    }
    float _1165 = _969;
    float _1167 = _1111;
    float _1169 = _1103;
    float _1171 = _1073;
    float _1173 = _1075;
    float _1175 = _1165;
    float _1177 = _1173;
    if (_1053)
    {
        _1077 = 1.0;
    }
    float _1179 = _1077;
    float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1183 = _1095 * _1181;
    float _1185 = _1179;
    if (!_1053)
    {
        float _1187 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1189 = _1187 * 0.15915493667125701904296875;
        float _1191 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1193 = _1189 * 6.283185482025146484375;
        float _1195 = cos(_1193);
        float _1197 = _1191 * 0.15915493667125701904296875;
        float _1199 = _1189 * 6.283185482025146484375;
        float _1201 = sin(_1199);
        float _1203 = 1.0 / _1195;
        float _1205 = _1197 * 6.283185482025146484375;
        float _1207 = cos(_1205);
        float _1209 = _1201 * _1203;
        float _1211 = _1197 * 6.283185482025146484375;
        float _1213 = sin(_1211);
        float _1215 = _1207 * _1209;
        float _1217 = 1.0 / _1215;
        float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1221 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1219;
        float _1223 = 1.0 / _1221;
        float _1225 = _1213 * _1217;
        float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1229 = fma(_1183, _1225, _1227);
        float _1231 = _1229 * _1223;
        float _1233 = precise::clamp(_1231, 0.0, 1.0);
        _1175 = _1197;
        _1177 = _1229;
        _1099 = _1233;
    }
    float _1235 = _1175;
    float _1237 = _1177;
    float _1239 = _1099;
    float _1241 = _1237;
    float _1243 = _1235;
    if (!_1053)
    {
        float _1245 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1247 = _1245 * 0.15915493667125701904296875;
        float _1249 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1251 = _1247 * 6.283185482025146484375;
        float _1253 = cos(_1251);
        float _1255 = _1249 * 0.15915493667125701904296875;
        float _1257 = _1247 * 6.283185482025146484375;
        float _1259 = sin(_1257);
        float _1261 = 1.0 / _1253;
        float _1263 = _1255 * 6.283185482025146484375;
        float _1265 = cos(_1263);
        float _1267 = _1259 * _1261;
        float _1269 = _1255 * 6.283185482025146484375;
        float _1271 = sin(_1269);
        float _1273 = _1265 * _1267;
        float _1275 = 1.0 / _1273;
        float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1279 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1277;
        float _1281 = 1.0 / _1279;
        float _1283 = _1271 * _1275;
        float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1287 = fma(_1183, _1283, _1285);
        float _1289 = _1287 * _1281;
        float _1291 = precise::clamp(_1289, 0.0, 1.0);
        float _1293 = -_1291;
        float _1295 = _1293 + 1.0;
        _1241 = _1273;
        _1243 = _1261;
        _1185 = _1295;
    }
    float _1297 = _1241;
    float _1299 = _1243;
    float _1301 = _1185;
    float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1305 = _1167 + _1303;
    float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1309 = _1169 + _1307;
    float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1313 = _1171 + _1311;
    float _1315 = _1305 * _1305;
    float _1317 = fma(_1309, _1309, _1315);
    float _1319 = fma(_1313, _1313, _1317);
    float _1321 = rsqrt(_1319);
    float _1323 = sqrt(_1319);
    float _1325 = _1321 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1327 = _1309 * _1325;
    float _1329 = _1313 * _1325;
    float _1331 = _1327 * _1327;
    float _1333 = _1329 * _1329;
    float _1335 = _1331 + _1333;
    float _1337 = sqrt(_1335);
    bool _1339 = _1337 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1341 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1343 = _1337 + _1341;
    float _1345 = _1313;
    float _1347 = _1315;
    float _1349 = _1343;
    float _1351 = _1297;
    float _1353 = _1325;
    if (_1339)
    {
        float _1355 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1345 = _1355;
    }
    float _1357 = _1345;
    if (_1339)
    {
        float _1359 = rsqrt(_1335);
        _1347 = _1359;
    }
    float _1361 = _1347;
    float _1363 = _1361;
    if (_1339)
    {
        float _1365 = _1343 * _1357;
        _1349 = _1365;
    }
    float _1367 = _1349;
    if (_1339)
    {
        float _1369 = _1367 * 0.15915493667125701904296875;
        _1351 = _1369;
    }
    float _1371 = _1351;
    float _1373 = _1321;
    float _1375 = _1371;
    if (_1339)
    {
        float _1377 = _1371 * 6.283185482025146484375;
        float _1379 = sin(_1377);
        _1373 = _1379;
    }
    float _1381 = _1373;
    float _1383 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1385 = precise::max(0.0, _1383);
    float _1387 = _1299;
    float _1389 = _1385;
    float _1391 = _1383;
    if (_1339)
    {
        float _1393 = _1371 * 6.283185482025146484375;
        float _1395 = cos(_1393);
        _1387 = _1395;
    }
    float _1397 = _1387;
    float _1399 = -_1325;
    float _1401 = -_1385;
    float _1403 = fma(_1305, _1399, _1401);
    if (_1339)
    {
        float _1405 = _1403 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1389 = _1405;
    }
    float _1407 = _1389;
    float _1409 = _1407;
    if (!_1339)
    {
        _1375 = _1331;
    }
    float _1411 = _1375;
    float _1413 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1415 = _1381;
    float _1417 = _1411;
    if (_1339)
    {
        float _1419 = fma(_1381, _1407, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1415 = _1419;
    }
    float _1421 = _1415;
    float _1423 = _1421;
    if (!_1339)
    {
        _1409 = _1329;
    }
    float _1425 = _1409;
    float _1427 = _1425;
    if (_1339)
    {
        float _1429 = _1397 + (-1.0);
        _1391 = _1429;
    }
    float _1431 = _1391;
    float _1433 = _1431;
    if (_1339)
    {
        float _1435 = _1361 * _1421;
        _1079 = _1435;
    }
    float _1437 = _1079;
    if (!_1339)
    {
        _1363 = _1327;
    }
    float _1439 = _1363;
    float _1441 = _1439;
    if (_1339)
    {
        float _1443 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1353 = _1443;
    }
    float _1445 = _1353;
    if (_1339)
    {
        float _1447 = _1327 * _1437;
        _1441 = _1447;
    }
    float _1449 = _1441;
    if (!_1339)
    {
        _1423 = _1403;
    }
    float _1451 = _1423;
    float _1453 = _1451;
    if (_1339)
    {
        float _1455 = _1329 * _1437;
        _1427 = _1455;
    }
    float _1457 = _1427;
    if (_1339)
    {
        float _1459 = fma(_1403, _1397, _1445);
        _1453 = _1459;
    }
    float _1461 = _1453;
    if (_1339)
    {
        float _1463 = _1449 * _1449;
        _1417 = _1463;
    }
    float _1465 = _1417;
    if (!_1339)
    {
        _1433 = _1333;
    }
    float _1467 = _1433;
    float _1469 = _1467;
    if (_1339)
    {
        float _1471 = _1457 * _1457;
        _1469 = _1471;
    }
    float _1473 = _1469;
    float _1475 = fma(_1461, _1461, _1465);
    float _1477 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1479 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1481 = _1475 + _1473;
    float _1483 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1477);
    float _1485 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1487 = fma(_1323, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1485);
    float _1489 = precise::clamp(_1487, 0.0, 1.0);
    float _1491 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1493 = rsqrt(_1481);
    float _1495 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1483);
    float _1497 = -_1489;
    float _1499 = _1497 + 1.0;
    float _1501 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1491);
    float _1503 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1479);
    float _1505 = _1495 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1507 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1509 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1501);
    float _1511 = abs(_1499);
    float _1513 = log2(_1511);
    float _1515 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1503);
    float _1517 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1507);
    float _1519 = _1509 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1521 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1523 = _1515 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1525 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1517);
    float _1527 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1529 = _1493 * _1449;
    float _1531 = _1493 * _1457;
    float _1533 = _1525 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1535 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1527);
    float _1537 = _1493 * _1461;
    float _1539 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1541 = -_1521;
    float _1543 = fma(_1541, _1413, 1.0);
    float _1545 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1535);
    float _1547 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1549 = -_1539;
    float _1551 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1549);
    float _1553 = _1537 + 1.0;
    float _1555 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1545);
    float _1557 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1559 = -_1531;
    float _1561 = fma(_1559, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1551);
    float _1563 = exp2(_1547);
    float _1565 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1567 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1557);
    float _1569 = fma(_1561, -0.5, 0.5);
    float _1571 = fma(_1561, 0.5, 0.5);
    float _1573 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1565);
    float _1575 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1567);
    float _1577 = log2(_1543);
    float _1579 = fma(_1571, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1581 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1573);
    float _1583 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1575);
    float _1585 = 1.0 / _1555;
    float _1587 = -_1537;
    float _1589 = fma(_1563, _1553, _1587);
    float _1591 = fma(_1571, _1579, -0.212114393711090087890625);
    float _1593 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1581);
    float _1595 = fma(_1589, 0.5, 0.5);
    float _1597 = fma(_1571, _1591, 1.570728778839111328125);
    float _1599 = sqrt(_1569);
    float _1601 = _1577 * 0.693147182464599609375;
    float _1603 = _1601 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1605 = _1583 * _1585;
    float _1607 = _1593 * _1585;
    float _1609 = fma(_1605, 0.5, 0.5);
    float _1611 = fma(_1607, -0.5, 0.5);
    float _1613 = _1599 * 0.636619746685028076171875;
    float3 _4365 = float3(_1609, _1611, _1603);
    float _1615 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4365, float3(0.0), isnan(_4365)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4365, float3(0.0), isnan(_4365)), level(0.0)).x;
    float3 _4376 = float3(_1609, _1611, _1603);
    float4 _1618 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4376, float3(0.0), isnan(_4376)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4376, float3(0.0), isnan(_4376)), level(0.0)).xyzw;
    float _1620 = _1618.x;
    float _1622 = _1618.y;
    float _1624 = _1618.z;
    float _1626 = _1618.w;
    float _1628 = -_1597;
    float _1630 = fma(_1613, _1628, 1.0);
    float2 _4398 = float2(_1630, _1595);
    float3 _1634 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4398, float2(0.0), isnan(_4398)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4398, float2(0.0), isnan(_4398)), level(0.0)).xyz;
    float _1636 = _1634.x;
    float _1638 = _1634.y;
    float _1640 = _1634.z;
    float _1642 = in.m_49.w;
    bool _1644 = _141 > 0.5;
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1648 = _473 + _1646;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1650;
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1658 = -_679;
    float _1660 = _1658 + 1.0;
    float _1662 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1664 = 1.0 / _1652;
    float _1666 = -_683;
    float _1668 = _1666 + 1.0;
    bool _1670 = _481 > 0.5;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1672;
    bool _1676 = _475 > 0.5;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1678;
    float _1682 = -_807;
    int _1684 = _1644 ? as_type<int>(_1682) : as_type<int>(_807);
    float _1686 = 1.0 / _1656;
    int _1688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1690 = _1688 != 0;
    float _1692 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1662);
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1696 = _1694 != 0;
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1700 = _1698 != 0;
    int _1702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1704 = _1702 != 0;
    float _1706 = _1648 * _1664;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1710 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1708;
    bool _1712 = _1642 > 0.5;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1716 = _473 + _1714;
    float _1718 = fma(_1680, _1706, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1720 = fma(_1710, _1706, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1722 = fma(_1674, _1706, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1724 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1726 = isnan(_473);
    bool _1728 = _1724 || _1726;
    bool _1730 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1732 = _1728 || _1730;
    float _1734 = float(_1732);
    float _1736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1738 = _1716 * _1686;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1742 = _1740 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    bool _1744 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1746 = isnan(_473);
    bool _1748 = _1744 || _1746;
    bool _1750 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1752 = _1748 || _1750;
    float _1754 = float(_1752);
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1758 = _1756 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    bool _1760 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1762 = isnan(_473);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1768 = _1764 || _1766;
    float _1770 = float(_1768);
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1774 = _1772 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1776 = -_787;
    int _1778 = _1670 ? as_type<int>(_1776) : as_type<int>(_787);
    float _1780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1782 = -_787;
    int _1784 = _1712 ? as_type<int>(_1782) : as_type<int>(_787);
    float _1786 = -_1754;
    float _1788 = _1786 + 1.0;
    bool _1790 = !_1690;
    float _1792 = _1790 ? _807 : as_type<float>(_1684);
    float _1794 = fma(_1742, _1738, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _1796 = !_1696;
    float _1798 = _1796 ? _787 : as_type<float>(_1778);
    float _1800 = _1734 * _1788;
    bool _1802 = !_1704;
    float _1804 = _1802 ? _787 : as_type<float>(_1784);
    float _1806 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1808 = _1792 + 0.5;
    float _1810 = -_807;
    int _1812 = _1676 ? as_type<int>(_1810) : as_type<int>(_807);
    float _1814 = -_1734;
    float _1816 = _1814 + 1.0;
    float _1818 = fma(_1774, _1738, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1820 = fma(_1806, _1808, _671);
    float _1822 = fma(_1758, _1738, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _1824 = !_1700;
    float _1826 = _1824 ? _807 : as_type<float>(_1812);
    float _1828 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1830 = -_1660;
    float _1832 = fma(_1792, _1830, _1820);
    float _1834 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1836 = _1770 * _1816;
    float _1838 = -_1770;
    float _1840 = _1838 + 1.0;
    float _1842 = _1826 + 0.5;
    float _1844 = -_1804;
    float _1846 = _1844 + 0.5;
    float _1848 = _1720 * _1836;
    float _1850 = exp2(_1834);
    float _1852 = _1718 * _1836;
    float _1854 = _1722 * _1836;
    float _1856 = _1780 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1858 = _1798 + (-0.5);
    float _1860 = fma(_1840, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1852);
    float _1862 = _1846 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1864 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1692);
    float _1866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1868 = -_1856;
    float _1870 = -_547;
    float _1872 = fma(_1868, _1858, _1870);
    float _1874 = fma(_1840, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1848);
    float _1876 = fma(_1840, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1854);
    float _1878 = _1842 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1880 = _1239 * _1301;
    float _1882 = fma(_1798, _1668, _1872);
    float _1884 = fma(_1794, _1800, _1874);
    float _1886 = -_1850;
    float _1888 = _1886 + 1.0;
    float _1890 = _1878 * _1828;
    float _1892 = fma(_1818, _1800, _1860);
    float _1894 = fma(_1822, _1800, _1876);
    float _1896 = _1888 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1898 = _1239 > 0.0;
    bool _1900 = isnan(_1239);
    bool _1902 = _1898 || _1900;
    bool _1904 = isnan(0.0);
    bool _1906 = _1902 || _1904;
    float _1908 = _1880 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1910 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1884);
    float _1912 = _1862 * _1866;
    float _1914 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1892);
    float _1916 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1894);
    float _1918 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1864);
    bool _1920 = _1301 <= 0.0;
    bool _1922 = !_1906;
    bool _1924 = _1920 || _1922;
    out.m_60.x = _1832;
    out.m_60.y = _1882;
    out.m_60.z = _1890;
    out.m_60.w = _1912;
    float _1926 = _1910 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1928 = _1914 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1930 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1934 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1936 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1938 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1940 = _1908 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1942 = _1918 + _1555;
    out.m_62.x = _1934;
    out.m_62.y = _1936;
    out.m_62.z = _1938;
    out.m_62.w = _1932;
    float _1944 = _1942 * 0.5;
    out.m_45.x = _1940;
    out.gl_Position.x = _1583;
    out.gl_Position.y = _1593;
    out.gl_Position.z = _1918;
    out.gl_Position.w = _1555;
    out.m_64.z = _1944;
    out.m_64.w = _1555;
    float _1946 = _1896 * _1615;
    float _1948 = -_1896;
    float _1950 = _1948 + 1.0;
    float _1952 = _1626 * _1946;
    float _1954 = _1626 * _1950;
    float _1956 = _1640 * _1946;
    float _1958 = fma(_1636, _1952, _1620);
    float _1960 = fma(_1638, _1952, _1622);
    float _1962 = fma(_1626, _1956, _1624);
    out.m_66.x = _1958;
    out.m_66.y = _1960;
    out.m_66.z = _1962;
    out.m_66.w = _1954;
    if (!_1924)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1964 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1964;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

