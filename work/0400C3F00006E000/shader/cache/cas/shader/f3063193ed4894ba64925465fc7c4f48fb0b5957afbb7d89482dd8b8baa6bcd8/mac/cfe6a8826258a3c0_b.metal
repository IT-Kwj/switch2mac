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
    constant _16* vp_c16 [[id(4)]];
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
    float4 m_60 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_64 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1085 = false;
    bool _545 = false;
    bool _297 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_44.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_47.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1841 = as_type<float>(_99);
        out.gl_Position.z = _1841;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_49.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_47.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1910 = as_type<float>(_135);
        out.gl_Position.z = _1910;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = in.m_54.w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_49.x;
    float _155 = in.m_49.y;
    float _157 = in.m_49.z;
    float _159 = in.m_44.x;
    float _161 = in.m_44.y;
    float _163 = in.m_44.z;
    float _165 = 0.0;
    float _167 = _139;
    if (!_151)
    {
        float _169 = _139 * _139;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    float _175 = _173;
    if (!_151)
    {
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    int _181 = as_type<int>(_137) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_137) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_151;
    float _199 = _179;
    if (!_197)
    {
        float _201 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = log2(_201);
        float _205 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _207 = _205 + 1.0;
        float _209 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = _139 * _203;
        float _213 = 1.0 / _207;
        float _215 = _209 * 0.693147182464599609375;
        float _217 = exp2(_211);
        float _219 = 1.0 / _215;
        float _221 = _217 + (-1.0);
        float _223 = -_221;
        float _225 = fma(_223, _219, _139);
        float _227 = _225 * _213;
        float _229 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _229;
    }
    float _231 = _199;
    bool _233 = !_151;
    if (!_233)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _139 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _167 = _253;
    }
    float _255 = _167;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _259 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _261 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _263 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _265 = fma(_255, _153, _259);
    float _267 = fma(_255, _155, _261);
    float _269 = fma(_255, _157, _263);
    float _271 = fma(_265, _141, _159);
    float _273 = fma(_267, _141, _161);
    float _275 = fma(_269, _141, _163);
    bool _277 = !_257;
    float _295;
    if (!_277)
    {
        float _279 = in.m_56.x;
        float _281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _283 = _279 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _287 = _285 * _281;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _295 = _293;
        _297 = true;
    }
    else
    {
        float _299 = float(_83);
        float _301 = 1.0 / _299;
        float _303 = _117 * _301;
        _295 = _303;
    }
    _297 = false;
    float _305 = _295;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = _305 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _305 + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _331 = 1.0 / _317;
    bool _333 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _335 = 1.0 / _325;
    float _337 = 1.0 / _321;
    float _339 = _309 * _331;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = _305 + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _347 = _305 + _345;
    bool _349 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _351 = isnan(_305);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = 1.0 / _329;
    float _363 = _343 * _335;
    bool _365 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _367 = isnan(_305);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    float _381 = _313 * _337;
    bool _383 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _385 = isnan(_305);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = fma(_379, _339, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _401 = -_393;
    float _403 = _401 + 1.0;
    float _405 = _347 * _361;
    float _407 = -_375;
    float _409 = _407 + 1.0;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _411;
    float _415 = _359 * _403;
    bool _417 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _419 = isnan(_305);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = _393 * _409;
    bool _431 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _433 = isnan(_305);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _447 = -_359;
    float _449 = _447 + 1.0;
    float _451 = fma(_413, _339, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _453 = fma(_399, _381, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _455 = fma(_445, _381, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _457 = _441 * _449;
    float _459 = -_441;
    float _461 = _459 + 1.0;
    float _463 = -_427;
    float _465 = _463 + 1.0;
    float _467 = in.m_54.x;
    float _469 = in.m_54.y;
    float _471 = _427 * _461;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _477;
    float _481 = _395 * _471;
    float _483 = _451 * _471;
    float _485 = fma(_475, _363, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _487 = fma(_479, _363, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _489 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].x, _481);
    float _491 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].y, _483);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _501 = fma(_453, _457, _489);
    float _503 = fma(_455, _457, _491);
    float _505 = fma(_495, _405, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _507 = fma(_499, _405, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _509 = fma(_485, _415, _501);
    float _511 = fma(_487, _415, _503);
    float _513 = fma(_505, _429, _509);
    float _515 = fma(_507, _429, _511);
    float _517 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[147].x, _513);
    float _519 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[147].y, _515);
    float _521 = _517 * _467;
    float _523 = _519 * _469;
    bool _525 = !_333;
    float _543;
    if (!_525)
    {
        float _527 = in.m_56.x;
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _531 = _527 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _535 = _533 * _529;
        float _537 = floor(_535);
        float _539 = -_537;
        float _541 = _535 + _539;
        _543 = _541;
        _545 = true;
    }
    else
    {
        float _547 = float(_83);
        float _549 = 1.0 / _547;
        float _551 = _117 * _549;
        _543 = _551;
    }
    _545 = false;
    float _553 = _543;
    float _555 = in.m_56.z;
    float _557 = in.m_56.w;
    float _559 = _273 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _569 = _567 != 0;
    float _571 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].x, _559);
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _575 = _573 != 0;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _577;
    bool _581 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _583 = isnan(_553);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = 1.0 / _565;
    float _595 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[4].z, _571);
    bool _597 = _557 > 0.5;
    float _599 = _273 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _601 = _273 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _603 = _555 > 0.5;
    float _605 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].x, _599);
    float _607 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].x, _601);
    float _609 = _579 * _593;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _613 = _553 + _611;
    float _615 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[5].z, _605);
    bool _617 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _619 = isnan(_553);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[6].z, _607);
    float _631 = fma(_609, _613, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _633 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _635 = isnan(_553);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _649 = -_627;
    float _651 = _649 + 1.0;
    bool _653 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _655 = isnan(_553);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _643 * _651;
    float _667 = -_643;
    float _669 = _667 + 1.0;
    float _671 = 1.0 / _647;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _677 = _663 * _669;
    float _679 = -_663;
    float _681 = _679 + 1.0;
    float _683 = _615 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _689 = 1.0 / _675;
    float _691 = _595 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _693 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _695 = _683 + _693;
    float _697 = _591 * _681;
    float _699 = _629 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _703 = _691 + _701;
    float _705 = _695 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _707 = _631 * _697;
    float _709 = _687 * _671;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _713 = _699 + _711;
    float _715 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[28].x, _705);
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _717;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _723 = _553 + _721;
    float _725 = -_591;
    float _727 = _725 + 1.0;
    float _729 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[28].z, _715);
    float _731 = -_195;
    int _733 = _597 ? as_type<int>(_731) : as_type<int>(_195);
    float _735 = _719 * _689;
    float _737 = _695 * _695;
    float _739 = fma(_709, _723, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _741 = _729 >= 0.0;
    float _743 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[115].x, _707);
    float _745 = -_191;
    int _747 = _603 ? as_type<int>(_745) : as_type<int>(_191);
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _751 = _553 + _749;
    float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _755 = fma(_703, _703, _737);
    bool _757 = !_569;
    float _759 = _757 ? _191 : as_type<float>(_747);
    float _761 = fma(_739, _677, _743);
    bool _763 = !_575;
    float _765 = _763 ? _195 : as_type<float>(_733);
    float _767 = fma(_735, _751, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _769 = fma(_713, _713, _755);
    float _771 = _759 + 0.5;
    float _773 = -_765;
    float _775 = _773 + 0.5;
    float _777 = fma(_767, _665, _761);
    float _779 = rsqrt(_769);
    float _781 = _735;
    if (_741)
    {
        _781 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _783 = _781;
    float _785 = _771 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _787 = _775 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _789 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[118].x, _777);
    int _791 = as_type<int>(_783);
    if (_741)
    {
        out.m_47.x = 0.0;
    }
    float _793 = _785 * _561;
    float _795 = _787 * _753;
    if (_741)
    {
        float _797 = _783 * 5.0;
        _791 = as_type<int>(_797);
    }
    int _799 = _791;
    float _801 = _789 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.z = _793;
    out.m_58.w = _795;
    if (_741)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2981 = as_type<float>(_799);
        out.gl_Position.z = _2981;
    }
    float _803 = _695 * _779;
    float _805 = _703 * _779;
    out.m_60.w = _801;
    if (_741)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _807 = -_803;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[18].w, _683);
    float _811 = _713 * _779;
    float _813 = -_805;
    float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[18].w, _691);
    float _817 = -_803;
    float _819 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[18].w, _695);
    float _821 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _823 = _809 + _821;
    float _825 = -_811;
    float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[18].w, _699);
    float _829 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _831 = _815 + _829;
    float _833 = -_805;
    float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[18].w, _703);
    float _837 = _823 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _839 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _841 = _827 + _839;
    float _843 = -_811;
    float _845 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[18].w, _713);
    float _847 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[28].x, _837);
    float _849 = _819 * _819;
    float _851 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[28].z, _847);
    float _853 = fma(_835, _835, _849);
    bool _855 = _851 >= 0.0;
    float _857 = fma(_845, _845, _853);
    float _859 = sqrt(_857);
    float _861 = _851;
    float _863 = _823;
    if (_855)
    {
        _861 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _865 = _861;
    int _867 = as_type<int>(_865);
    if (_855)
    {
        out.m_47.x = 0.0;
    }
    if (_855)
    {
        float _869 = _865 * 5.0;
        _867 = as_type<int>(_869);
    }
    int _871 = _867;
    if (_855)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3115 = as_type<float>(_871);
        out.gl_Position.z = _3115;
    }
    float _873 = _779 * _859;
    if (_855)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _875 = _523 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _877 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _879 = _521 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _881 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _883 = _873 * _875;
    float _885 = _873 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _887 = _885 * 0.5;
    float _889 = _873 * _879;
    float _891 = _877 * _883;
    float _893 = _881 * _889;
    float _895 = _891 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _897 = _891 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _899 = _891 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _901 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[24].x, _895);
    float _903 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[26].x, _897);
    float _905 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[25].x, _899);
    float _907 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[24].z, _901);
    float _909 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[26].z, _903);
    float _911 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[25].z, _905);
    float _913 = _907 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _915 = _909 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _917 = _911 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _919 = _691 + _913;
    float _921 = _699 + _915;
    float _923 = _683 + _917;
    float _925 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _927 = _919 + _925;
    float _929 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _931 = _921 + _929;
    float _933 = _927 * _927;
    float _935 = _931 * _931;
    float _937 = _933 + _935;
    float _939 = sqrt(_937);
    bool _941 = _939 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _943 = _887;
    float _945 = _933;
    float _947 = _917;
    float _949 = _919;
    float _951 = _935;
    if (!_941)
    {
        _943 = _933;
    }
    float _953 = _943;
    float _955 = _953;
    if (!_941)
    {
        _945 = _919;
    }
    float _957 = _945;
    float _959 = _957;
    if (!_941)
    {
        _947 = _921;
    }
    float _961 = _947;
    float _963 = _961;
    if (!_941)
    {
        _949 = _923;
    }
    float _965 = _949;
    bool _967 = !_941;
    float _969 = _965;
    if (!_967)
    {
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _975 = _939 + _973;
        float _977 = _923 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _979 = rsqrt(_937);
        float _981 = _975 * _971;
        float _983 = _981 * 0.15915493667125701904296875;
        float _985 = _983 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = _983 * 6.283185482025146484375;
        float _991 = cos(_989);
        float _993 = fma(_987, _977, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _995 = _979 * _993;
        float _997 = _991 + (-1.0);
        float _999 = fma(_927, _995, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1001 = fma(_931, _995, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1003 = _997 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1005 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1007 = _999 + _1005;
        float _1009 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1011 = _1001 + _1009;
        float _1013 = fma(_923, _991, _1003);
        float _1015 = _1007 * _1007;
        float _1017 = _1011 * _1011;
        _969 = _1013;
        _955 = _1015;
        _951 = _1017;
        _959 = _999;
        _963 = _1001;
    }
    float _1019 = _969;
    float _1021 = _955;
    float _1023 = _951;
    float _1025 = _959;
    float _1027 = _963;
    float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1031 = _1019 + _1029;
    float _1033 = fma(_1031, _1031, _1021);
    float _1035 = _1033 + _1023;
    float _1037 = sqrt(_1035);
    bool _1039 = _1037 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1041 = isnan(_1037);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1047 = _1043 || _1045;
    float _1049 = _1021;
    if (!_1047)
    {
        _1049 = 1.0;
    }
    float _1051 = _1049;
    bool _1053 = !_1047;
    float _1055 = _1051;
    if (!_1053)
    {
        bool _1057 = _1037 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1059 = isnan(_1037);
        bool _1061 = _1057 || _1059;
        bool _1063 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1065 = _1061 || _1063;
        if (!_1065)
        {
            float _1067 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1069 = _1037 + _1067;
            float _1071 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1073 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1071;
            float _1075 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1077 = _1075 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1079 = 1.0 / _1073;
            float _1081 = _1069 * _1079;
            float _1083 = fma(_1081, _1077, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1055 = _1083;
            _1085 = true;
        }
        else
        {
            bool _1087 = _1037 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1089 = isnan(_1037);
            bool _1091 = _1087 || _1089;
            bool _1093 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1095 = _1091 || _1093;
            if (!_1095)
            {
                float _1097 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1099 = _1037 + _1097;
                float _1101 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1103 = _1101 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1105 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1107 = _1105 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1109 = 1.0 / _1103;
                float _1111 = _1099 * _1109;
                float _1113 = fma(_1111, _1107, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1055 = _1113;
                _1085 = true;
            }
            else
            {
                _1055 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1085 = false;
    float _1115 = _1055;
    float _1117 = _809 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1119 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1121 = _1025 + _1119;
    float _1123 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1125 = _1019 + _1123;
    float _1127 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1117);
    bool _1129 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1131 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan(0.5);
    bool _1137 = _1133 || _1135;
    float _1139 = _809 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1141 = fma(_1121, _1115, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1143 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1127);
    float _1145 = fma(_1125, _1115, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1147 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1139);
    float _1149 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1151 = _1027 + _1149;
    float _1153 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1155 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1147);
    float _1157 = -_805;
    float _1159 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1141);
    float _1161 = 1.0 / _1153;
    float _1163 = fma(_1151, _1115, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1165 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1167 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1169 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1171 = _1167 || _1169;
    bool _1173 = isnan(0.5);
    bool _1175 = _1171 || _1173;
    float _1177 = -_803;
    float _1179 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1145);
    float _1181 = -_811;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1163);
    float _1185 = _1165 + _1153;
    float _1187 = _1165;
    float _1189 = _1141;
    float _1191 = _1179;
    float _1193 = _1183;
    float _1195 = _1115;
    if (_1137)
    {
        _1187 = _1159;
    }
    float _1197 = _1187;
    float _1199 = _1197;
    if (!_1137)
    {
        float _1201 = _823 * _823;
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1205 = -_691;
        float _1207 = _1205 + _1141;
        float _1209 = -_683;
        float _1211 = _1209 + _1145;
        float _1213 = fma(_831, _831, _1201);
        float _1215 = -_699;
        float _1217 = _1215 + _1163;
        float _1219 = fma(_841, _841, _1213);
        float _1221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1223 = sqrt(_1219);
        float _1225 = 1.0 / _873;
        bool _1227 = _1223 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1229 = isnan(_1223);
        bool _1231 = _1227 || _1229;
        bool _1233 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1235 = _1231 || _1233;
        float _1237 = precise::min(_1223, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1239 = _1237 * _1221;
        float _1241 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1243 = _1207 * _1225;
        float _1245 = _1211 * _1225;
        float _1247 = _1217 * _1225;
        float _1249 = _1241 * _1239;
        float _1251 = _841;
        float _1253 = _1203;
        float _1255 = _1239;
        float _1257 = _1241;
        _1189 = _1243;
        if (_1235)
        {
            float _1259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1251 = _1259;
        }
        float _1261 = _1251;
        if (_1235)
        {
            float _1263 = precise::max(_1223, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1253 = _1263;
        }
        float _1265 = _1253;
        float _1267 = fma(_1247, _1249, _827);
        float _1269 = fma(_1245, _1249, _809);
        float _1271 = _1269;
        if (_1235)
        {
            float _1273 = _1265 * _1261;
            _1255 = _1273;
        }
        float _1275 = _1255;
        float _1277 = fma(_1243, _1249, _815);
        float _1279 = _1275;
        float _1281 = _1277;
        if (_1235)
        {
            float _1283 = _1241 * _1275;
            _1257 = _1283;
        }
        float _1285 = _1257;
        _1195 = _1285;
        if (!_1235)
        {
            _1279 = _1267;
        }
        float _1287 = _1279;
        _1193 = _1287;
        if (_1235)
        {
            float _1289 = fma(_1243, _1285, _815);
            _1281 = _1289;
        }
        float _1291 = _1281;
        _1199 = _1291;
        if (_1235)
        {
            float _1293 = fma(_1245, _1285, _809);
            _1271 = _1293;
        }
        float _1295 = _1271;
        _1191 = _1295;
        if (_1235)
        {
            float _1297 = fma(_1247, _1285, _827);
            _1193 = _1297;
        }
    }
    float _1299 = _1189;
    float _1301 = _1191;
    float _1303 = _1199;
    float _1305 = _1193;
    float _1307 = _1195;
    float _1309 = _1307;
    float _1311 = _1299;
    if (_1175)
    {
        _1309 = 1.0;
    }
    float _1313 = _1309;
    float _1315 = _1185 * _1161;
    float _1317 = _1315 * 0.5;
    float _1319 = _1313;
    if (!_1175)
    {
        float _1321 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1325 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1323);
        float _1327 = _1321 * 0.15915493667125701904296875;
        float _1329 = _1327 * 6.283185482025146484375;
        float _1331 = cos(_1329);
        float _1333 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1335 = _1333 * 0.15915493667125701904296875;
        float _1337 = _1327 * 6.283185482025146484375;
        float _1339 = sin(_1337);
        float _1341 = 1.0 / _1331;
        float _1343 = _1335 * 6.283185482025146484375;
        float _1345 = cos(_1343);
        float _1347 = _1339 * _1341;
        float _1349 = 1.0 / _1325;
        float _1351 = _1345 * _1347;
        float _1353 = _1335 * 6.283185482025146484375;
        float _1355 = sin(_1353);
        float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1359 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1357;
        float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1363 = _1349 * _1361;
        float _1365 = 1.0 / _1351;
        float _1367 = 1.0 / _1359;
        float _1369 = _1355 * _1365;
        float _1371 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1373 = fma(_1369, _1363, _1371);
        float _1375 = _1373 * _1367;
        float _1377 = precise::clamp(_1375, 0.0, 1.0);
        _1311 = _1341;
        _1319 = _1377;
    }
    float _1379 = _1311;
    float _1381 = _1319;
    float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1385 = _1301 + _1383;
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1389 = _1303 + _1387;
    float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1393 = _1305 + _1391;
    float _1395 = _1385 * _1385;
    float _1397 = fma(_1389, _1389, _1395);
    float _1399 = fma(_1393, _1393, _1397);
    float _1401 = rsqrt(_1399);
    float _1403 = sqrt(_1399);
    float _1405 = _1401 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1407 = _1389 * _1405;
    float _1409 = _1393 * _1405;
    float _1411 = _1407 * _1407;
    float _1413 = _1409 * _1409;
    float _1415 = _1411 + _1413;
    float _1417 = sqrt(_1415);
    bool _1419 = _1417 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1421 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1423 = _1417 + _1421;
    float _1425 = _1393;
    float _1427 = _1415;
    float _1429 = _1423;
    float _1431 = _1379;
    float _1433 = _1385;
    if (_1419)
    {
        float _1435 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1425 = _1435;
    }
    float _1437 = _1425;
    if (_1419)
    {
        float _1439 = rsqrt(_1415);
        _1427 = _1439;
    }
    float _1441 = _1427;
    float _1443 = _1441;
    if (_1419)
    {
        float _1445 = _1423 * _1437;
        _1429 = _1445;
    }
    float _1447 = _1429;
    if (_1419)
    {
        float _1449 = _1447 * 0.15915493667125701904296875;
        _1431 = _1449;
    }
    float _1451 = _1431;
    float _1453 = _1437;
    float _1455 = _1451;
    if (_1419)
    {
        float _1457 = _1451 * 6.283185482025146484375;
        float _1459 = sin(_1457);
        _1453 = _1459;
    }
    float _1461 = _1453;
    float _1463 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1465 = precise::max(0.0, _1463);
    float _1467 = _1395;
    float _1469 = _1465;
    if (_1419)
    {
        float _1471 = _1451 * 6.283185482025146484375;
        float _1473 = cos(_1471);
        _1467 = _1473;
    }
    float _1475 = _1467;
    float _1477 = -_1405;
    float _1479 = -_1465;
    float _1481 = fma(_1385, _1477, _1479);
    if (_1419)
    {
        float _1483 = _1481 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1469 = _1483;
    }
    float _1485 = _1469;
    float _1487 = _1461;
    float _1489 = _1485;
    if (_1419)
    {
        float _1491 = fma(_1461, _1485, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1433 = _1491;
    }
    float _1493 = _1433;
    float _1495 = _1493;
    if (!_1419)
    {
        _1487 = _1407;
    }
    float _1497 = _1487;
    float _1499 = _1497;
    float _1501 = _1475;
    if (_1419)
    {
        float _1503 = _1475 + (-1.0);
        _1489 = _1503;
    }
    float _1505 = _1489;
    float _1507 = _1505;
    if (_1419)
    {
        float _1509 = _1441 * _1493;
        _863 = _1509;
    }
    float _1511 = _863;
    if (!_1419)
    {
        _1495 = _1481;
    }
    float _1513 = _1495;
    float _1515 = _1513;
    if (_1419)
    {
        float _1517 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1455 = _1517;
    }
    float _1519 = _1455;
    if (_1419)
    {
        float _1521 = _1407 * _1511;
        _1499 = _1521;
    }
    float _1523 = _1499;
    if (!_1419)
    {
        _1507 = _1409;
    }
    float _1525 = _1507;
    float _1527 = _1525;
    if (_1419)
    {
        float _1529 = _1409 * _1511;
        _1527 = _1529;
    }
    float _1531 = _1527;
    if (!_1419)
    {
        _1443 = _1411;
    }
    float _1533 = _1443;
    float _1535 = _1533;
    if (_1419)
    {
        float _1537 = fma(_1481, _1475, _1519);
        _1515 = _1537;
    }
    float _1539 = _1515;
    if (_1419)
    {
        float _1541 = _1523 * _1523;
        _1535 = _1541;
    }
    float _1543 = _1535;
    if (!_1419)
    {
        _1501 = _1413;
    }
    float _1545 = _1501;
    float _1547 = _1545;
    if (_1419)
    {
        float _1549 = _1531 * _1531;
        _1547 = _1549;
    }
    float _1551 = _1547;
    float _1553 = fma(_1539, _1539, _1543);
    float _1555 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1557 = _1553 + _1551;
    float _1559 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1561 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1563 = fma(_1403, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1561);
    float _1565 = precise::clamp(_1563, 0.0, 1.0);
    float _1567 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1569 = rsqrt(_1557);
    float _1571 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1559);
    float _1573 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1575 = -_1565;
    float _1577 = _1575 + 1.0;
    float _1579 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1581 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1571);
    float _1583 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1573);
    float _1585 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1579);
    float _1587 = abs(_1577);
    float _1589 = log2(_1587);
    float _1591 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1583);
    float _1593 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1555);
    float _1595 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1585);
    float _1597 = _1581 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1599 = _1591 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1601 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1593);
    float _1603 = _1569 * _1523;
    float _1605 = _1595 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1607 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1609 = _1569 * _1539;
    float _1611 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1613 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1615 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1607);
    float _1617 = _1569 * _1531;
    float _1619 = -_1611;
    float _1621 = fma(_1609, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1619);
    float _1623 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1625 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1615);
    float _1627 = -_1613;
    float _1629 = fma(_1627, _1567, 1.0);
    float _1631 = -_1617;
    float _1633 = fma(_1631, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1621);
    float _1635 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1637 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1625);
    float _1639 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1641 = fma(_1633, -0.5, 0.5);
    float _1643 = log2(_1629);
    float _1645 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1647 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1639);
    float _1649 = _1609 + 1.0;
    float _1651 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1645);
    float _1653 = 1.0 / _1637;
    float _1655 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1651);
    float _1657 = exp2(_1635);
    float _1659 = _1643 * 0.693147182464599609375;
    float _1661 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1663 = sqrt(_1641);
    float _1665 = fma(_1633, 0.5, 0.5);
    float _1667 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1647);
    float _1669 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1655);
    float _1671 = fma(_1665, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1673 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1667);
    float _1675 = _1669 * _1653;
    float _1677 = -_1609;
    float _1679 = fma(_1657, _1649, _1677);
    float _1681 = fma(_1665, _1671, -0.212114393711090087890625);
    float _1683 = _1673 * _1653;
    float _1685 = fma(_1675, -0.5, 0.5);
    float _1687 = fma(_1665, _1681, 1.570728778839111328125);
    float _1689 = fma(_1683, 0.5, 0.5);
    float _1691 = fma(_1679, 0.5, 0.5);
    float _1693 = _1663 * 0.636619746685028076171875;
    float3 _4449 = float3(_1689, _1685, _1661);
    float _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4449, float3(0.0), isnan(_4449)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4449, float3(0.0), isnan(_4449)), level(0.0)).x;
    float _1697 = -_1687;
    float _1699 = fma(_1693, _1697, 1.0);
    float3 _4465 = float3(_1689, _1685, _1661);
    float4 _1702 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4465, float3(0.0), isnan(_4465)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4465, float3(0.0), isnan(_4465)), level(0.0)).xyzw;
    float _1704 = _1702.x;
    float _1706 = _1702.y;
    float _1708 = _1702.z;
    float _1710 = _1702.w;
    float2 _4482 = float2(_1699, _1691);
    float3 _1714 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4482, float2(0.0), isnan(_4482)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4482, float2(0.0), isnan(_4482)), level(0.0)).xyz;
    float _1716 = _1714.x;
    float _1718 = _1714.y;
    float _1720 = _1714.z;
    float _1722 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1724 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1726 = _1637 * 0.5;
    float _1728 = _1381 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1730 = _1381 > 0.0;
    bool _1732 = isnan(_1381);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan(0.0);
    bool _1738 = _1734 || _1736;
    float _1740 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1724);
    float _1742 = exp2(_1722);
    float _1744 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1740);
    float _1746 = _1673 + _1637;
    float _1748 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1744);
    float _1750 = _1746 * 0.5;
    float _1752 = _1748 + _1637;
    out.gl_Position.x = _1673;
    out.gl_Position.y = _1669;
    out.gl_Position.z = _1748;
    out.gl_Position.w = _1637;
    float _1754 = _1752 * 0.5;
    float _1756 = -_1742;
    float _1758 = _1756 + 1.0;
    float _1760 = fma(_1669, -0.5, _1726);
    float _1762 = _1728 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1764 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.x = _1750;
    out.m_62.y = _1760;
    out.m_62.z = _1754;
    out.m_62.w = _1637;
    float _1766 = -_1764;
    float _1768 = _1766 + 1.0;
    out.m_47.x = _1762;
    float _1770 = _1764 * _1695;
    float _1772 = _1710 * _1770;
    float _1774 = _1720 * _1770;
    float _1776 = fma(_1716, _1772, _1704);
    float _1778 = fma(_1718, _1772, _1706);
    float _1780 = _1710 * _1768;
    float _1782 = fma(_1710, _1774, _1708);
    out.m_64.x = _1776;
    out.m_64.y = _1778;
    out.m_64.z = _1782;
    out.m_64.w = _1780;
    if (_1738)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1784 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1784;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1085 = false;
    bool _545 = false;
    bool _297 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_44.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_47.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1841 = as_type<float>(_99);
        out.gl_Position.z = _1841;
    }
    if (!_87)
    {
        return out;
    }
    float _103 = in.m_49.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_47.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1910 = as_type<float>(_135);
        out.gl_Position.z = _1910;
    }
    if (_127)
    {
        return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = in.m_54.w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_49.x;
    float _155 = in.m_49.y;
    float _157 = in.m_49.z;
    float _159 = in.m_44.x;
    float _161 = in.m_44.y;
    float _163 = in.m_44.z;
    float _165 = 0.0;
    float _167 = _139;
    if (!_151)
    {
        float _169 = _139 * _139;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    float _175 = _173;
    if (!_151)
    {
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    int _181 = as_type<int>(_137) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_137) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_151;
    float _199 = _179;
    if (!_197)
    {
        float _201 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = log2(_201);
        float _205 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _207 = _205 + 1.0;
        float _209 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = _139 * _203;
        float _213 = 1.0 / _207;
        float _215 = _209 * 0.693147182464599609375;
        float _217 = exp2(_211);
        float _219 = 1.0 / _215;
        float _221 = _217 + (-1.0);
        float _223 = -_221;
        float _225 = fma(_223, _219, _139);
        float _227 = _225 * _213;
        float _229 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _229;
    }
    float _231 = _199;
    bool _233 = !_151;
    if (!_233)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _139 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _167 = _253;
    }
    float _255 = _167;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _259 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _261 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _263 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _265 = fma(_255, _153, _259);
    float _267 = fma(_255, _155, _261);
    float _269 = fma(_255, _157, _263);
    float _271 = fma(_265, _141, _159);
    float _273 = fma(_267, _141, _161);
    float _275 = fma(_269, _141, _163);
    bool _277 = !_257;
    float _295;
    if (!_277)
    {
        float _279 = in.m_56.x;
        float _281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _283 = _279 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _287 = _285 * _281;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _295 = _293;
        _297 = true;
    }
    else
    {
        float _299 = float(_83);
        float _301 = 1.0 / _299;
        float _303 = _117 * _301;
        _295 = _303;
    }
    _297 = false;
    float _305 = _295;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = _305 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _305 + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _331 = 1.0 / _317;
    bool _333 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _335 = 1.0 / _325;
    float _337 = 1.0 / _321;
    float _339 = _309 * _331;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = _305 + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _347 = _305 + _345;
    bool _349 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _351 = isnan(_305);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = 1.0 / _329;
    float _363 = _343 * _335;
    bool _365 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _367 = isnan(_305);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    float _381 = _313 * _337;
    bool _383 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _385 = isnan(_305);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = fma(_379, _339, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _401 = -_393;
    float _403 = _401 + 1.0;
    float _405 = _347 * _361;
    float _407 = -_375;
    float _409 = _407 + 1.0;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _411;
    float _415 = _359 * _403;
    bool _417 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _419 = isnan(_305);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = _393 * _409;
    bool _431 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _433 = isnan(_305);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _447 = -_359;
    float _449 = _447 + 1.0;
    float _451 = fma(_413, _339, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _453 = fma(_399, _381, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _455 = fma(_445, _381, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _457 = _441 * _449;
    float _459 = -_441;
    float _461 = _459 + 1.0;
    float _463 = -_427;
    float _465 = _463 + 1.0;
    float _467 = in.m_54.x;
    float _469 = in.m_54.y;
    float _471 = _427 * _461;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _477;
    float _481 = _395 * _471;
    float _483 = _451 * _471;
    float _485 = fma(_475, _363, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _487 = fma(_479, _363, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _489 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].x, _481);
    float _491 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].y, _483);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _501 = fma(_453, _457, _489);
    float _503 = fma(_455, _457, _491);
    float _505 = fma(_495, _405, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _507 = fma(_499, _405, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _509 = fma(_485, _415, _501);
    float _511 = fma(_487, _415, _503);
    float _513 = fma(_505, _429, _509);
    float _515 = fma(_507, _429, _511);
    float _517 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[147].x, _513);
    float _519 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[147].y, _515);
    float _521 = _517 * _467;
    float _523 = _519 * _469;
    bool _525 = !_333;
    float _543;
    if (!_525)
    {
        float _527 = in.m_56.x;
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _531 = _527 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _535 = _533 * _529;
        float _537 = floor(_535);
        float _539 = -_537;
        float _541 = _535 + _539;
        _543 = _541;
        _545 = true;
    }
    else
    {
        float _547 = float(_83);
        float _549 = 1.0 / _547;
        float _551 = _117 * _549;
        _543 = _551;
    }
    _545 = false;
    float _553 = _543;
    float _555 = in.m_56.z;
    float _557 = in.m_56.w;
    float _559 = _273 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _569 = _567 != 0;
    float _571 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].x, _559);
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _575 = _573 != 0;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _577;
    bool _581 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _583 = isnan(_553);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = 1.0 / _565;
    float _595 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[4].z, _571);
    bool _597 = _557 > 0.5;
    float _599 = _273 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _601 = _273 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _603 = _555 > 0.5;
    float _605 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].x, _599);
    float _607 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].x, _601);
    float _609 = _579 * _593;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _613 = _553 + _611;
    float _615 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[5].z, _605);
    bool _617 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _619 = isnan(_553);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[6].z, _607);
    float _631 = fma(_609, _613, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _633 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _635 = isnan(_553);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _649 = -_627;
    float _651 = _649 + 1.0;
    bool _653 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _655 = isnan(_553);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _643 * _651;
    float _667 = -_643;
    float _669 = _667 + 1.0;
    float _671 = 1.0 / _647;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _677 = _663 * _669;
    float _679 = -_663;
    float _681 = _679 + 1.0;
    float _683 = _615 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _689 = 1.0 / _675;
    float _691 = _595 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _693 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _695 = _683 + _693;
    float _697 = _591 * _681;
    float _699 = _629 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _703 = _691 + _701;
    float _705 = _695 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _707 = _631 * _697;
    float _709 = _687 * _671;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _713 = _699 + _711;
    float _715 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[28].x, _705);
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _717;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _723 = _553 + _721;
    float _725 = -_591;
    float _727 = _725 + 1.0;
    float _729 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[28].z, _715);
    float _731 = -_195;
    int _733 = _597 ? as_type<int>(_731) : as_type<int>(_195);
    float _735 = _719 * _689;
    float _737 = _695 * _695;
    float _739 = fma(_709, _723, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _741 = _729 >= 0.0;
    float _743 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[115].x, _707);
    float _745 = -_191;
    int _747 = _603 ? as_type<int>(_745) : as_type<int>(_191);
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _751 = _553 + _749;
    float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _755 = fma(_703, _703, _737);
    bool _757 = !_569;
    float _759 = _757 ? _191 : as_type<float>(_747);
    float _761 = fma(_739, _677, _743);
    bool _763 = !_575;
    float _765 = _763 ? _195 : as_type<float>(_733);
    float _767 = fma(_735, _751, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _769 = fma(_713, _713, _755);
    float _771 = _759 + 0.5;
    float _773 = -_765;
    float _775 = _773 + 0.5;
    float _777 = fma(_767, _665, _761);
    float _779 = rsqrt(_769);
    float _781 = _735;
    if (_741)
    {
        _781 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _783 = _781;
    float _785 = _771 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _787 = _775 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _789 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[118].x, _777);
    int _791 = as_type<int>(_783);
    if (_741)
    {
        out.m_47.x = 0.0;
    }
    float _793 = _785 * _561;
    float _795 = _787 * _753;
    if (_741)
    {
        float _797 = _783 * 5.0;
        _791 = as_type<int>(_797);
    }
    int _799 = _791;
    float _801 = _789 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.z = _793;
    out.m_58.w = _795;
    if (_741)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2981 = as_type<float>(_799);
        out.gl_Position.z = _2981;
    }
    float _803 = _695 * _779;
    float _805 = _703 * _779;
    out.m_60.w = _801;
    if (_741)
    {
        return out;
    }
    float _807 = -_803;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[18].w, _683);
    float _811 = _713 * _779;
    float _813 = -_805;
    float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[18].w, _691);
    float _817 = -_803;
    float _819 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[18].w, _695);
    float _821 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _823 = _809 + _821;
    float _825 = -_811;
    float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[18].w, _699);
    float _829 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _831 = _815 + _829;
    float _833 = -_805;
    float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[18].w, _703);
    float _837 = _823 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _839 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _841 = _827 + _839;
    float _843 = -_811;
    float _845 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[18].w, _713);
    float _847 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[28].x, _837);
    float _849 = _819 * _819;
    float _851 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[28].z, _847);
    float _853 = fma(_835, _835, _849);
    bool _855 = _851 >= 0.0;
    float _857 = fma(_845, _845, _853);
    float _859 = sqrt(_857);
    float _861 = _851;
    float _863 = _823;
    if (_855)
    {
        _861 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _865 = _861;
    int _867 = as_type<int>(_865);
    if (_855)
    {
        out.m_47.x = 0.0;
    }
    if (_855)
    {
        float _869 = _865 * 5.0;
        _867 = as_type<int>(_869);
    }
    int _871 = _867;
    if (_855)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3115 = as_type<float>(_871);
        out.gl_Position.z = _3115;
    }
    float _873 = _779 * _859;
    if (_855)
    {
        return out;
    }
    float _875 = _523 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _877 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _879 = _521 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _881 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _883 = _873 * _875;
    float _885 = _873 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _887 = _885 * 0.5;
    float _889 = _873 * _879;
    float _891 = _877 * _883;
    float _893 = _881 * _889;
    float _895 = _891 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _897 = _891 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _899 = _891 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _901 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[24].x, _895);
    float _903 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[26].x, _897);
    float _905 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[25].x, _899);
    float _907 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[24].z, _901);
    float _909 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[26].z, _903);
    float _911 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[25].z, _905);
    float _913 = _907 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _915 = _909 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _917 = _911 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _919 = _691 + _913;
    float _921 = _699 + _915;
    float _923 = _683 + _917;
    float _925 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _927 = _919 + _925;
    float _929 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _931 = _921 + _929;
    float _933 = _927 * _927;
    float _935 = _931 * _931;
    float _937 = _933 + _935;
    float _939 = sqrt(_937);
    bool _941 = _939 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _943 = _887;
    float _945 = _933;
    float _947 = _917;
    float _949 = _919;
    float _951 = _935;
    if (!_941)
    {
        _943 = _933;
    }
    float _953 = _943;
    float _955 = _953;
    if (!_941)
    {
        _945 = _919;
    }
    float _957 = _945;
    float _959 = _957;
    if (!_941)
    {
        _947 = _921;
    }
    float _961 = _947;
    float _963 = _961;
    if (!_941)
    {
        _949 = _923;
    }
    float _965 = _949;
    bool _967 = !_941;
    float _969 = _965;
    if (!_967)
    {
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _975 = _939 + _973;
        float _977 = _923 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _979 = rsqrt(_937);
        float _981 = _975 * _971;
        float _983 = _981 * 0.15915493667125701904296875;
        float _985 = _983 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = _983 * 6.283185482025146484375;
        float _991 = cos(_989);
        float _993 = fma(_987, _977, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _995 = _979 * _993;
        float _997 = _991 + (-1.0);
        float _999 = fma(_927, _995, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1001 = fma(_931, _995, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1003 = _997 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1005 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1007 = _999 + _1005;
        float _1009 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1011 = _1001 + _1009;
        float _1013 = fma(_923, _991, _1003);
        float _1015 = _1007 * _1007;
        float _1017 = _1011 * _1011;
        _969 = _1013;
        _955 = _1015;
        _951 = _1017;
        _959 = _999;
        _963 = _1001;
    }
    float _1019 = _969;
    float _1021 = _955;
    float _1023 = _951;
    float _1025 = _959;
    float _1027 = _963;
    float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1031 = _1019 + _1029;
    float _1033 = fma(_1031, _1031, _1021);
    float _1035 = _1033 + _1023;
    float _1037 = sqrt(_1035);
    bool _1039 = _1037 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1041 = isnan(_1037);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1047 = _1043 || _1045;
    float _1049 = _1021;
    if (!_1047)
    {
        _1049 = 1.0;
    }
    float _1051 = _1049;
    bool _1053 = !_1047;
    float _1055 = _1051;
    if (!_1053)
    {
        bool _1057 = _1037 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1059 = isnan(_1037);
        bool _1061 = _1057 || _1059;
        bool _1063 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1065 = _1061 || _1063;
        if (!_1065)
        {
            float _1067 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1069 = _1037 + _1067;
            float _1071 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1073 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1071;
            float _1075 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1077 = _1075 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1079 = 1.0 / _1073;
            float _1081 = _1069 * _1079;
            float _1083 = fma(_1081, _1077, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1055 = _1083;
            _1085 = true;
        }
        else
        {
            bool _1087 = _1037 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1089 = isnan(_1037);
            bool _1091 = _1087 || _1089;
            bool _1093 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1095 = _1091 || _1093;
            if (!_1095)
            {
                float _1097 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1099 = _1037 + _1097;
                float _1101 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1103 = _1101 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1105 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1107 = _1105 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1109 = 1.0 / _1103;
                float _1111 = _1099 * _1109;
                float _1113 = fma(_1111, _1107, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1055 = _1113;
                _1085 = true;
            }
            else
            {
                _1055 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1085 = false;
    float _1115 = _1055;
    float _1117 = _809 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1119 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1121 = _1025 + _1119;
    float _1123 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1125 = _1019 + _1123;
    float _1127 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1117);
    bool _1129 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1131 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan(0.5);
    bool _1137 = _1133 || _1135;
    float _1139 = _809 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1141 = fma(_1121, _1115, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1143 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1127);
    float _1145 = fma(_1125, _1115, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1147 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1139);
    float _1149 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1151 = _1027 + _1149;
    float _1153 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1155 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1147);
    float _1157 = -_805;
    float _1159 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1141);
    float _1161 = 1.0 / _1153;
    float _1163 = fma(_1151, _1115, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1165 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1167 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1169 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1171 = _1167 || _1169;
    bool _1173 = isnan(0.5);
    bool _1175 = _1171 || _1173;
    float _1177 = -_803;
    float _1179 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1145);
    float _1181 = -_811;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1163);
    float _1185 = _1165 + _1153;
    float _1187 = _1165;
    float _1189 = _1141;
    float _1191 = _1179;
    float _1193 = _1183;
    float _1195 = _1115;
    if (_1137)
    {
        _1187 = _1159;
    }
    float _1197 = _1187;
    float _1199 = _1197;
    if (!_1137)
    {
        float _1201 = _823 * _823;
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1205 = -_691;
        float _1207 = _1205 + _1141;
        float _1209 = -_683;
        float _1211 = _1209 + _1145;
        float _1213 = fma(_831, _831, _1201);
        float _1215 = -_699;
        float _1217 = _1215 + _1163;
        float _1219 = fma(_841, _841, _1213);
        float _1221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1223 = sqrt(_1219);
        float _1225 = 1.0 / _873;
        bool _1227 = _1223 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1229 = isnan(_1223);
        bool _1231 = _1227 || _1229;
        bool _1233 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1235 = _1231 || _1233;
        float _1237 = precise::min(_1223, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1239 = _1237 * _1221;
        float _1241 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1243 = _1207 * _1225;
        float _1245 = _1211 * _1225;
        float _1247 = _1217 * _1225;
        float _1249 = _1241 * _1239;
        float _1251 = _841;
        float _1253 = _1203;
        float _1255 = _1239;
        float _1257 = _1241;
        _1189 = _1243;
        if (_1235)
        {
            float _1259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1251 = _1259;
        }
        float _1261 = _1251;
        if (_1235)
        {
            float _1263 = precise::max(_1223, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1253 = _1263;
        }
        float _1265 = _1253;
        float _1267 = fma(_1247, _1249, _827);
        float _1269 = fma(_1245, _1249, _809);
        float _1271 = _1269;
        if (_1235)
        {
            float _1273 = _1265 * _1261;
            _1255 = _1273;
        }
        float _1275 = _1255;
        float _1277 = fma(_1243, _1249, _815);
        float _1279 = _1275;
        float _1281 = _1277;
        if (_1235)
        {
            float _1283 = _1241 * _1275;
            _1257 = _1283;
        }
        float _1285 = _1257;
        _1195 = _1285;
        if (!_1235)
        {
            _1279 = _1267;
        }
        float _1287 = _1279;
        _1193 = _1287;
        if (_1235)
        {
            float _1289 = fma(_1243, _1285, _815);
            _1281 = _1289;
        }
        float _1291 = _1281;
        _1199 = _1291;
        if (_1235)
        {
            float _1293 = fma(_1245, _1285, _809);
            _1271 = _1293;
        }
        float _1295 = _1271;
        _1191 = _1295;
        if (_1235)
        {
            float _1297 = fma(_1247, _1285, _827);
            _1193 = _1297;
        }
    }
    float _1299 = _1189;
    float _1301 = _1191;
    float _1303 = _1199;
    float _1305 = _1193;
    float _1307 = _1195;
    float _1309 = _1307;
    float _1311 = _1299;
    if (_1175)
    {
        _1309 = 1.0;
    }
    float _1313 = _1309;
    float _1315 = _1185 * _1161;
    float _1317 = _1315 * 0.5;
    float _1319 = _1313;
    if (!_1175)
    {
        float _1321 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1325 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1323);
        float _1327 = _1321 * 0.15915493667125701904296875;
        float _1329 = _1327 * 6.283185482025146484375;
        float _1331 = cos(_1329);
        float _1333 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1335 = _1333 * 0.15915493667125701904296875;
        float _1337 = _1327 * 6.283185482025146484375;
        float _1339 = sin(_1337);
        float _1341 = 1.0 / _1331;
        float _1343 = _1335 * 6.283185482025146484375;
        float _1345 = cos(_1343);
        float _1347 = _1339 * _1341;
        float _1349 = 1.0 / _1325;
        float _1351 = _1345 * _1347;
        float _1353 = _1335 * 6.283185482025146484375;
        float _1355 = sin(_1353);
        float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1359 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1357;
        float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1363 = _1349 * _1361;
        float _1365 = 1.0 / _1351;
        float _1367 = 1.0 / _1359;
        float _1369 = _1355 * _1365;
        float _1371 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1373 = fma(_1369, _1363, _1371);
        float _1375 = _1373 * _1367;
        float _1377 = precise::clamp(_1375, 0.0, 1.0);
        _1311 = _1341;
        _1319 = _1377;
    }
    float _1379 = _1311;
    float _1381 = _1319;
    float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1385 = _1301 + _1383;
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1389 = _1303 + _1387;
    float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1393 = _1305 + _1391;
    float _1395 = _1385 * _1385;
    float _1397 = fma(_1389, _1389, _1395);
    float _1399 = fma(_1393, _1393, _1397);
    float _1401 = rsqrt(_1399);
    float _1403 = sqrt(_1399);
    float _1405 = _1401 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1407 = _1389 * _1405;
    float _1409 = _1393 * _1405;
    float _1411 = _1407 * _1407;
    float _1413 = _1409 * _1409;
    float _1415 = _1411 + _1413;
    float _1417 = sqrt(_1415);
    bool _1419 = _1417 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1421 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1423 = _1417 + _1421;
    float _1425 = _1393;
    float _1427 = _1415;
    float _1429 = _1423;
    float _1431 = _1379;
    float _1433 = _1385;
    if (_1419)
    {
        float _1435 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1425 = _1435;
    }
    float _1437 = _1425;
    if (_1419)
    {
        float _1439 = rsqrt(_1415);
        _1427 = _1439;
    }
    float _1441 = _1427;
    float _1443 = _1441;
    if (_1419)
    {
        float _1445 = _1423 * _1437;
        _1429 = _1445;
    }
    float _1447 = _1429;
    if (_1419)
    {
        float _1449 = _1447 * 0.15915493667125701904296875;
        _1431 = _1449;
    }
    float _1451 = _1431;
    float _1453 = _1437;
    float _1455 = _1451;
    if (_1419)
    {
        float _1457 = _1451 * 6.283185482025146484375;
        float _1459 = sin(_1457);
        _1453 = _1459;
    }
    float _1461 = _1453;
    float _1463 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1465 = precise::max(0.0, _1463);
    float _1467 = _1395;
    float _1469 = _1465;
    if (_1419)
    {
        float _1471 = _1451 * 6.283185482025146484375;
        float _1473 = cos(_1471);
        _1467 = _1473;
    }
    float _1475 = _1467;
    float _1477 = -_1405;
    float _1479 = -_1465;
    float _1481 = fma(_1385, _1477, _1479);
    if (_1419)
    {
        float _1483 = _1481 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1469 = _1483;
    }
    float _1485 = _1469;
    float _1487 = _1461;
    float _1489 = _1485;
    if (_1419)
    {
        float _1491 = fma(_1461, _1485, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1433 = _1491;
    }
    float _1493 = _1433;
    float _1495 = _1493;
    if (!_1419)
    {
        _1487 = _1407;
    }
    float _1497 = _1487;
    float _1499 = _1497;
    float _1501 = _1475;
    if (_1419)
    {
        float _1503 = _1475 + (-1.0);
        _1489 = _1503;
    }
    float _1505 = _1489;
    float _1507 = _1505;
    if (_1419)
    {
        float _1509 = _1441 * _1493;
        _863 = _1509;
    }
    float _1511 = _863;
    if (!_1419)
    {
        _1495 = _1481;
    }
    float _1513 = _1495;
    float _1515 = _1513;
    if (_1419)
    {
        float _1517 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1455 = _1517;
    }
    float _1519 = _1455;
    if (_1419)
    {
        float _1521 = _1407 * _1511;
        _1499 = _1521;
    }
    float _1523 = _1499;
    if (!_1419)
    {
        _1507 = _1409;
    }
    float _1525 = _1507;
    float _1527 = _1525;
    if (_1419)
    {
        float _1529 = _1409 * _1511;
        _1527 = _1529;
    }
    float _1531 = _1527;
    if (!_1419)
    {
        _1443 = _1411;
    }
    float _1533 = _1443;
    float _1535 = _1533;
    if (_1419)
    {
        float _1537 = fma(_1481, _1475, _1519);
        _1515 = _1537;
    }
    float _1539 = _1515;
    if (_1419)
    {
        float _1541 = _1523 * _1523;
        _1535 = _1541;
    }
    float _1543 = _1535;
    if (!_1419)
    {
        _1501 = _1413;
    }
    float _1545 = _1501;
    float _1547 = _1545;
    if (_1419)
    {
        float _1549 = _1531 * _1531;
        _1547 = _1549;
    }
    float _1551 = _1547;
    float _1553 = fma(_1539, _1539, _1543);
    float _1555 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1557 = _1553 + _1551;
    float _1559 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1561 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1563 = fma(_1403, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1561);
    float _1565 = precise::clamp(_1563, 0.0, 1.0);
    float _1567 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1569 = rsqrt(_1557);
    float _1571 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1559);
    float _1573 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1575 = -_1565;
    float _1577 = _1575 + 1.0;
    float _1579 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1581 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1571);
    float _1583 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1573);
    float _1585 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1579);
    float _1587 = abs(_1577);
    float _1589 = log2(_1587);
    float _1591 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1583);
    float _1593 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1555);
    float _1595 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1585);
    float _1597 = _1581 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1599 = _1591 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1601 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1593);
    float _1603 = _1569 * _1523;
    float _1605 = _1595 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1607 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1609 = _1569 * _1539;
    float _1611 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1613 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1615 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1607);
    float _1617 = _1569 * _1531;
    float _1619 = -_1611;
    float _1621 = fma(_1609, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1619);
    float _1623 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1625 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1615);
    float _1627 = -_1613;
    float _1629 = fma(_1627, _1567, 1.0);
    float _1631 = -_1617;
    float _1633 = fma(_1631, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1621);
    float _1635 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1637 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1625);
    float _1639 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1641 = fma(_1633, -0.5, 0.5);
    float _1643 = log2(_1629);
    float _1645 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1647 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1639);
    float _1649 = _1609 + 1.0;
    float _1651 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1645);
    float _1653 = 1.0 / _1637;
    float _1655 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1651);
    float _1657 = exp2(_1635);
    float _1659 = _1643 * 0.693147182464599609375;
    float _1661 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1663 = sqrt(_1641);
    float _1665 = fma(_1633, 0.5, 0.5);
    float _1667 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1647);
    float _1669 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1655);
    float _1671 = fma(_1665, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1673 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1667);
    float _1675 = _1669 * _1653;
    float _1677 = -_1609;
    float _1679 = fma(_1657, _1649, _1677);
    float _1681 = fma(_1665, _1671, -0.212114393711090087890625);
    float _1683 = _1673 * _1653;
    float _1685 = fma(_1675, -0.5, 0.5);
    float _1687 = fma(_1665, _1681, 1.570728778839111328125);
    float _1689 = fma(_1683, 0.5, 0.5);
    float _1691 = fma(_1679, 0.5, 0.5);
    float _1693 = _1663 * 0.636619746685028076171875;
    float3 _4449 = float3(_1689, _1685, _1661);
    float _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4449, float3(0.0), isnan(_4449)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4449, float3(0.0), isnan(_4449)), level(0.0)).x;
    float _1697 = -_1687;
    float _1699 = fma(_1693, _1697, 1.0);
    float3 _4465 = float3(_1689, _1685, _1661);
    float4 _1702 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4465, float3(0.0), isnan(_4465)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4465, float3(0.0), isnan(_4465)), level(0.0)).xyzw;
    float _1704 = _1702.x;
    float _1706 = _1702.y;
    float _1708 = _1702.z;
    float _1710 = _1702.w;
    float2 _4482 = float2(_1699, _1691);
    float3 _1714 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4482, float2(0.0), isnan(_4482)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4482, float2(0.0), isnan(_4482)), level(0.0)).xyz;
    float _1716 = _1714.x;
    float _1718 = _1714.y;
    float _1720 = _1714.z;
    float _1722 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1724 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1726 = _1637 * 0.5;
    float _1728 = _1381 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1730 = _1381 > 0.0;
    bool _1732 = isnan(_1381);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan(0.0);
    bool _1738 = _1734 || _1736;
    float _1740 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1724);
    float _1742 = exp2(_1722);
    float _1744 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1740);
    float _1746 = _1673 + _1637;
    float _1748 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1744);
    float _1750 = _1746 * 0.5;
    float _1752 = _1748 + _1637;
    out.gl_Position.x = _1673;
    out.gl_Position.y = _1669;
    out.gl_Position.z = _1748;
    out.gl_Position.w = _1637;
    float _1754 = _1752 * 0.5;
    float _1756 = -_1742;
    float _1758 = _1756 + 1.0;
    float _1760 = fma(_1669, -0.5, _1726);
    float _1762 = _1728 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1764 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.x = _1750;
    out.m_62.y = _1760;
    out.m_62.z = _1754;
    out.m_62.w = _1637;
    float _1766 = -_1764;
    float _1768 = _1766 + 1.0;
    out.m_47.x = _1762;
    float _1770 = _1764 * _1695;
    float _1772 = _1710 * _1770;
    float _1774 = _1720 * _1770;
    float _1776 = fma(_1716, _1772, _1704);
    float _1778 = fma(_1718, _1772, _1706);
    float _1780 = _1710 * _1768;
    float _1782 = fma(_1710, _1774, _1708);
    out.m_64.x = _1776;
    out.m_64.y = _1778;
    out.m_64.z = _1782;
    out.m_64.w = _1780;
    if (_1738)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1784 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1784;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1085 = false;
    bool _545 = false;
    bool _297 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_44.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_47.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1841 = as_type<float>(_99);
        out.gl_Position.z = _1841;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_49.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_47.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1910 = as_type<float>(_135);
        out.gl_Position.z = _1910;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = in.m_54.w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_49.x;
    float _155 = in.m_49.y;
    float _157 = in.m_49.z;
    float _159 = in.m_44.x;
    float _161 = in.m_44.y;
    float _163 = in.m_44.z;
    float _165 = 0.0;
    float _167 = _139;
    if (!_151)
    {
        float _169 = _139 * _139;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    float _175 = _173;
    if (!_151)
    {
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    int _181 = as_type<int>(_137) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_137) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_151;
    float _199 = _179;
    if (!_197)
    {
        float _201 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = log2(_201);
        float _205 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _207 = _205 + 1.0;
        float _209 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = _139 * _203;
        float _213 = 1.0 / _207;
        float _215 = _209 * 0.693147182464599609375;
        float _217 = exp2(_211);
        float _219 = 1.0 / _215;
        float _221 = _217 + (-1.0);
        float _223 = -_221;
        float _225 = fma(_223, _219, _139);
        float _227 = _225 * _213;
        float _229 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _229;
    }
    float _231 = _199;
    bool _233 = !_151;
    if (!_233)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _139 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _167 = _253;
    }
    float _255 = _167;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _259 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _261 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _263 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _265 = fma(_255, _153, _259);
    float _267 = fma(_255, _155, _261);
    float _269 = fma(_255, _157, _263);
    float _271 = fma(_265, _141, _159);
    float _273 = fma(_267, _141, _161);
    float _275 = fma(_269, _141, _163);
    bool _277 = !_257;
    float _295;
    if (!_277)
    {
        float _279 = in.m_56.x;
        float _281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _283 = _279 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _287 = _285 * _281;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _295 = _293;
        _297 = true;
    }
    else
    {
        float _299 = float(_83);
        float _301 = 1.0 / _299;
        float _303 = _117 * _301;
        _295 = _303;
    }
    _297 = false;
    float _305 = _295;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = _305 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _305 + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _331 = 1.0 / _317;
    bool _333 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _335 = 1.0 / _325;
    float _337 = 1.0 / _321;
    float _339 = _309 * _331;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = _305 + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _347 = _305 + _345;
    bool _349 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _351 = isnan(_305);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = 1.0 / _329;
    float _363 = _343 * _335;
    bool _365 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _367 = isnan(_305);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    float _381 = _313 * _337;
    bool _383 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _385 = isnan(_305);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = fma(_379, _339, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _401 = -_393;
    float _403 = _401 + 1.0;
    float _405 = _347 * _361;
    float _407 = -_375;
    float _409 = _407 + 1.0;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _411;
    float _415 = _359 * _403;
    bool _417 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _419 = isnan(_305);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = _393 * _409;
    bool _431 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _433 = isnan(_305);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _447 = -_359;
    float _449 = _447 + 1.0;
    float _451 = fma(_413, _339, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _453 = fma(_399, _381, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _455 = fma(_445, _381, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _457 = _441 * _449;
    float _459 = -_441;
    float _461 = _459 + 1.0;
    float _463 = -_427;
    float _465 = _463 + 1.0;
    float _467 = in.m_54.x;
    float _469 = in.m_54.y;
    float _471 = _427 * _461;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _477;
    float _481 = _395 * _471;
    float _483 = _451 * _471;
    float _485 = fma(_475, _363, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _487 = fma(_479, _363, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _489 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].x, _481);
    float _491 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].y, _483);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _501 = fma(_453, _457, _489);
    float _503 = fma(_455, _457, _491);
    float _505 = fma(_495, _405, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _507 = fma(_499, _405, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _509 = fma(_485, _415, _501);
    float _511 = fma(_487, _415, _503);
    float _513 = fma(_505, _429, _509);
    float _515 = fma(_507, _429, _511);
    float _517 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[147].x, _513);
    float _519 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[147].y, _515);
    float _521 = _517 * _467;
    float _523 = _519 * _469;
    bool _525 = !_333;
    float _543;
    if (!_525)
    {
        float _527 = in.m_56.x;
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _531 = _527 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _535 = _533 * _529;
        float _537 = floor(_535);
        float _539 = -_537;
        float _541 = _535 + _539;
        _543 = _541;
        _545 = true;
    }
    else
    {
        float _547 = float(_83);
        float _549 = 1.0 / _547;
        float _551 = _117 * _549;
        _543 = _551;
    }
    _545 = false;
    float _553 = _543;
    float _555 = in.m_56.z;
    float _557 = in.m_56.w;
    float _559 = _273 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _569 = _567 != 0;
    float _571 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].x, _559);
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _575 = _573 != 0;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _577;
    bool _581 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _583 = isnan(_553);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = 1.0 / _565;
    float _595 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[4].z, _571);
    bool _597 = _557 > 0.5;
    float _599 = _273 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _601 = _273 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _603 = _555 > 0.5;
    float _605 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].x, _599);
    float _607 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].x, _601);
    float _609 = _579 * _593;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _613 = _553 + _611;
    float _615 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[5].z, _605);
    bool _617 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _619 = isnan(_553);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[6].z, _607);
    float _631 = fma(_609, _613, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _633 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _635 = isnan(_553);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _649 = -_627;
    float _651 = _649 + 1.0;
    bool _653 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _655 = isnan(_553);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _643 * _651;
    float _667 = -_643;
    float _669 = _667 + 1.0;
    float _671 = 1.0 / _647;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _677 = _663 * _669;
    float _679 = -_663;
    float _681 = _679 + 1.0;
    float _683 = _615 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _689 = 1.0 / _675;
    float _691 = _595 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _693 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _695 = _683 + _693;
    float _697 = _591 * _681;
    float _699 = _629 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _703 = _691 + _701;
    float _705 = _695 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _707 = _631 * _697;
    float _709 = _687 * _671;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _713 = _699 + _711;
    float _715 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[28].x, _705);
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _717;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _723 = _553 + _721;
    float _725 = -_591;
    float _727 = _725 + 1.0;
    float _729 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[28].z, _715);
    float _731 = -_195;
    int _733 = _597 ? as_type<int>(_731) : as_type<int>(_195);
    float _735 = _719 * _689;
    float _737 = _695 * _695;
    float _739 = fma(_709, _723, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _741 = _729 >= 0.0;
    float _743 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[115].x, _707);
    float _745 = -_191;
    int _747 = _603 ? as_type<int>(_745) : as_type<int>(_191);
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _751 = _553 + _749;
    float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _755 = fma(_703, _703, _737);
    bool _757 = !_569;
    float _759 = _757 ? _191 : as_type<float>(_747);
    float _761 = fma(_739, _677, _743);
    bool _763 = !_575;
    float _765 = _763 ? _195 : as_type<float>(_733);
    float _767 = fma(_735, _751, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _769 = fma(_713, _713, _755);
    float _771 = _759 + 0.5;
    float _773 = -_765;
    float _775 = _773 + 0.5;
    float _777 = fma(_767, _665, _761);
    float _779 = rsqrt(_769);
    float _781 = _735;
    if (_741)
    {
        _781 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _783 = _781;
    float _785 = _771 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _787 = _775 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _789 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[118].x, _777);
    int _791 = as_type<int>(_783);
    if (_741)
    {
        out.m_47.x = 0.0;
    }
    float _793 = _785 * _561;
    float _795 = _787 * _753;
    if (_741)
    {
        float _797 = _783 * 5.0;
        _791 = as_type<int>(_797);
    }
    int _799 = _791;
    float _801 = _789 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.z = _793;
    out.m_58.w = _795;
    if (_741)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2981 = as_type<float>(_799);
        out.gl_Position.z = _2981;
    }
    float _803 = _695 * _779;
    float _805 = _703 * _779;
    out.m_60.w = _801;
    if (_741)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _807 = -_803;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[18].w, _683);
    float _811 = _713 * _779;
    float _813 = -_805;
    float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[18].w, _691);
    float _817 = -_803;
    float _819 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[18].w, _695);
    float _821 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _823 = _809 + _821;
    float _825 = -_811;
    float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[18].w, _699);
    float _829 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _831 = _815 + _829;
    float _833 = -_805;
    float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[18].w, _703);
    float _837 = _823 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _839 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _841 = _827 + _839;
    float _843 = -_811;
    float _845 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[18].w, _713);
    float _847 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[28].x, _837);
    float _849 = _819 * _819;
    float _851 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[28].z, _847);
    float _853 = fma(_835, _835, _849);
    bool _855 = _851 >= 0.0;
    float _857 = fma(_845, _845, _853);
    float _859 = sqrt(_857);
    float _861 = _851;
    float _863 = _823;
    if (_855)
    {
        _861 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _865 = _861;
    int _867 = as_type<int>(_865);
    if (_855)
    {
        out.m_47.x = 0.0;
    }
    if (_855)
    {
        float _869 = _865 * 5.0;
        _867 = as_type<int>(_869);
    }
    int _871 = _867;
    if (_855)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3115 = as_type<float>(_871);
        out.gl_Position.z = _3115;
    }
    float _873 = _779 * _859;
    if (_855)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _875 = _523 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _877 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _879 = _521 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _881 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _883 = _873 * _875;
    float _885 = _873 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _887 = _885 * 0.5;
    float _889 = _873 * _879;
    float _891 = _877 * _883;
    float _893 = _881 * _889;
    float _895 = _891 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _897 = _891 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _899 = _891 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _901 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[24].x, _895);
    float _903 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[26].x, _897);
    float _905 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[25].x, _899);
    float _907 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[24].z, _901);
    float _909 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[26].z, _903);
    float _911 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[25].z, _905);
    float _913 = _907 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _915 = _909 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _917 = _911 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _919 = _691 + _913;
    float _921 = _699 + _915;
    float _923 = _683 + _917;
    float _925 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _927 = _919 + _925;
    float _929 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _931 = _921 + _929;
    float _933 = _927 * _927;
    float _935 = _931 * _931;
    float _937 = _933 + _935;
    float _939 = sqrt(_937);
    bool _941 = _939 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _943 = _887;
    float _945 = _933;
    float _947 = _917;
    float _949 = _919;
    float _951 = _935;
    if (!_941)
    {
        _943 = _933;
    }
    float _953 = _943;
    float _955 = _953;
    if (!_941)
    {
        _945 = _919;
    }
    float _957 = _945;
    float _959 = _957;
    if (!_941)
    {
        _947 = _921;
    }
    float _961 = _947;
    float _963 = _961;
    if (!_941)
    {
        _949 = _923;
    }
    float _965 = _949;
    bool _967 = !_941;
    float _969 = _965;
    if (!_967)
    {
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _975 = _939 + _973;
        float _977 = _923 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _979 = rsqrt(_937);
        float _981 = _975 * _971;
        float _983 = _981 * 0.15915493667125701904296875;
        float _985 = _983 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = _983 * 6.283185482025146484375;
        float _991 = cos(_989);
        float _993 = fma(_987, _977, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _995 = _979 * _993;
        float _997 = _991 + (-1.0);
        float _999 = fma(_927, _995, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1001 = fma(_931, _995, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1003 = _997 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1005 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1007 = _999 + _1005;
        float _1009 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1011 = _1001 + _1009;
        float _1013 = fma(_923, _991, _1003);
        float _1015 = _1007 * _1007;
        float _1017 = _1011 * _1011;
        _969 = _1013;
        _955 = _1015;
        _951 = _1017;
        _959 = _999;
        _963 = _1001;
    }
    float _1019 = _969;
    float _1021 = _955;
    float _1023 = _951;
    float _1025 = _959;
    float _1027 = _963;
    float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1031 = _1019 + _1029;
    float _1033 = fma(_1031, _1031, _1021);
    float _1035 = _1033 + _1023;
    float _1037 = sqrt(_1035);
    bool _1039 = _1037 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1041 = isnan(_1037);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1047 = _1043 || _1045;
    float _1049 = _1021;
    if (!_1047)
    {
        _1049 = 1.0;
    }
    float _1051 = _1049;
    bool _1053 = !_1047;
    float _1055 = _1051;
    if (!_1053)
    {
        bool _1057 = _1037 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1059 = isnan(_1037);
        bool _1061 = _1057 || _1059;
        bool _1063 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1065 = _1061 || _1063;
        if (!_1065)
        {
            float _1067 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1069 = _1037 + _1067;
            float _1071 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1073 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1071;
            float _1075 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1077 = _1075 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1079 = 1.0 / _1073;
            float _1081 = _1069 * _1079;
            float _1083 = fma(_1081, _1077, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1055 = _1083;
            _1085 = true;
        }
        else
        {
            bool _1087 = _1037 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1089 = isnan(_1037);
            bool _1091 = _1087 || _1089;
            bool _1093 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1095 = _1091 || _1093;
            if (!_1095)
            {
                float _1097 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1099 = _1037 + _1097;
                float _1101 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1103 = _1101 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1105 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1107 = _1105 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1109 = 1.0 / _1103;
                float _1111 = _1099 * _1109;
                float _1113 = fma(_1111, _1107, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1055 = _1113;
                _1085 = true;
            }
            else
            {
                _1055 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1085 = false;
    float _1115 = _1055;
    float _1117 = _809 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1119 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1121 = _1025 + _1119;
    float _1123 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1125 = _1019 + _1123;
    float _1127 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1117);
    bool _1129 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1131 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan(0.5);
    bool _1137 = _1133 || _1135;
    float _1139 = _809 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1141 = fma(_1121, _1115, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1143 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1127);
    float _1145 = fma(_1125, _1115, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1147 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1139);
    float _1149 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1151 = _1027 + _1149;
    float _1153 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1155 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1147);
    float _1157 = -_805;
    float _1159 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1141);
    float _1161 = 1.0 / _1153;
    float _1163 = fma(_1151, _1115, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1165 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1167 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1169 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1171 = _1167 || _1169;
    bool _1173 = isnan(0.5);
    bool _1175 = _1171 || _1173;
    float _1177 = -_803;
    float _1179 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1145);
    float _1181 = -_811;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1163);
    float _1185 = _1165 + _1153;
    float _1187 = _1165;
    float _1189 = _1141;
    float _1191 = _1179;
    float _1193 = _1183;
    float _1195 = _1115;
    if (_1137)
    {
        _1187 = _1159;
    }
    float _1197 = _1187;
    float _1199 = _1197;
    if (!_1137)
    {
        float _1201 = _823 * _823;
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1205 = -_691;
        float _1207 = _1205 + _1141;
        float _1209 = -_683;
        float _1211 = _1209 + _1145;
        float _1213 = fma(_831, _831, _1201);
        float _1215 = -_699;
        float _1217 = _1215 + _1163;
        float _1219 = fma(_841, _841, _1213);
        float _1221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1223 = sqrt(_1219);
        float _1225 = 1.0 / _873;
        bool _1227 = _1223 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1229 = isnan(_1223);
        bool _1231 = _1227 || _1229;
        bool _1233 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1235 = _1231 || _1233;
        float _1237 = precise::min(_1223, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1239 = _1237 * _1221;
        float _1241 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1243 = _1207 * _1225;
        float _1245 = _1211 * _1225;
        float _1247 = _1217 * _1225;
        float _1249 = _1241 * _1239;
        float _1251 = _841;
        float _1253 = _1203;
        float _1255 = _1239;
        float _1257 = _1241;
        _1189 = _1243;
        if (_1235)
        {
            float _1259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1251 = _1259;
        }
        float _1261 = _1251;
        if (_1235)
        {
            float _1263 = precise::max(_1223, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1253 = _1263;
        }
        float _1265 = _1253;
        float _1267 = fma(_1247, _1249, _827);
        float _1269 = fma(_1245, _1249, _809);
        float _1271 = _1269;
        if (_1235)
        {
            float _1273 = _1265 * _1261;
            _1255 = _1273;
        }
        float _1275 = _1255;
        float _1277 = fma(_1243, _1249, _815);
        float _1279 = _1275;
        float _1281 = _1277;
        if (_1235)
        {
            float _1283 = _1241 * _1275;
            _1257 = _1283;
        }
        float _1285 = _1257;
        _1195 = _1285;
        if (!_1235)
        {
            _1279 = _1267;
        }
        float _1287 = _1279;
        _1193 = _1287;
        if (_1235)
        {
            float _1289 = fma(_1243, _1285, _815);
            _1281 = _1289;
        }
        float _1291 = _1281;
        _1199 = _1291;
        if (_1235)
        {
            float _1293 = fma(_1245, _1285, _809);
            _1271 = _1293;
        }
        float _1295 = _1271;
        _1191 = _1295;
        if (_1235)
        {
            float _1297 = fma(_1247, _1285, _827);
            _1193 = _1297;
        }
    }
    float _1299 = _1189;
    float _1301 = _1191;
    float _1303 = _1199;
    float _1305 = _1193;
    float _1307 = _1195;
    float _1309 = _1307;
    float _1311 = _1299;
    if (_1175)
    {
        _1309 = 1.0;
    }
    float _1313 = _1309;
    float _1315 = _1185 * _1161;
    float _1317 = _1315 * 0.5;
    float _1319 = _1313;
    if (!_1175)
    {
        float _1321 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1325 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1323);
        float _1327 = _1321 * 0.15915493667125701904296875;
        float _1329 = _1327 * 6.283185482025146484375;
        float _1331 = cos(_1329);
        float _1333 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1335 = _1333 * 0.15915493667125701904296875;
        float _1337 = _1327 * 6.283185482025146484375;
        float _1339 = sin(_1337);
        float _1341 = 1.0 / _1331;
        float _1343 = _1335 * 6.283185482025146484375;
        float _1345 = cos(_1343);
        float _1347 = _1339 * _1341;
        float _1349 = 1.0 / _1325;
        float _1351 = _1345 * _1347;
        float _1353 = _1335 * 6.283185482025146484375;
        float _1355 = sin(_1353);
        float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1359 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1357;
        float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1363 = _1349 * _1361;
        float _1365 = 1.0 / _1351;
        float _1367 = 1.0 / _1359;
        float _1369 = _1355 * _1365;
        float _1371 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1373 = fma(_1369, _1363, _1371);
        float _1375 = _1373 * _1367;
        float _1377 = precise::clamp(_1375, 0.0, 1.0);
        _1311 = _1341;
        _1319 = _1377;
    }
    float _1379 = _1311;
    float _1381 = _1319;
    float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1385 = _1301 + _1383;
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1389 = _1303 + _1387;
    float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1393 = _1305 + _1391;
    float _1395 = _1385 * _1385;
    float _1397 = fma(_1389, _1389, _1395);
    float _1399 = fma(_1393, _1393, _1397);
    float _1401 = rsqrt(_1399);
    float _1403 = sqrt(_1399);
    float _1405 = _1401 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1407 = _1389 * _1405;
    float _1409 = _1393 * _1405;
    float _1411 = _1407 * _1407;
    float _1413 = _1409 * _1409;
    float _1415 = _1411 + _1413;
    float _1417 = sqrt(_1415);
    bool _1419 = _1417 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1421 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1423 = _1417 + _1421;
    float _1425 = _1393;
    float _1427 = _1415;
    float _1429 = _1423;
    float _1431 = _1379;
    float _1433 = _1385;
    if (_1419)
    {
        float _1435 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1425 = _1435;
    }
    float _1437 = _1425;
    if (_1419)
    {
        float _1439 = rsqrt(_1415);
        _1427 = _1439;
    }
    float _1441 = _1427;
    float _1443 = _1441;
    if (_1419)
    {
        float _1445 = _1423 * _1437;
        _1429 = _1445;
    }
    float _1447 = _1429;
    if (_1419)
    {
        float _1449 = _1447 * 0.15915493667125701904296875;
        _1431 = _1449;
    }
    float _1451 = _1431;
    float _1453 = _1437;
    float _1455 = _1451;
    if (_1419)
    {
        float _1457 = _1451 * 6.283185482025146484375;
        float _1459 = sin(_1457);
        _1453 = _1459;
    }
    float _1461 = _1453;
    float _1463 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1465 = precise::max(0.0, _1463);
    float _1467 = _1395;
    float _1469 = _1465;
    if (_1419)
    {
        float _1471 = _1451 * 6.283185482025146484375;
        float _1473 = cos(_1471);
        _1467 = _1473;
    }
    float _1475 = _1467;
    float _1477 = -_1405;
    float _1479 = -_1465;
    float _1481 = fma(_1385, _1477, _1479);
    if (_1419)
    {
        float _1483 = _1481 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1469 = _1483;
    }
    float _1485 = _1469;
    float _1487 = _1461;
    float _1489 = _1485;
    if (_1419)
    {
        float _1491 = fma(_1461, _1485, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1433 = _1491;
    }
    float _1493 = _1433;
    float _1495 = _1493;
    if (!_1419)
    {
        _1487 = _1407;
    }
    float _1497 = _1487;
    float _1499 = _1497;
    float _1501 = _1475;
    if (_1419)
    {
        float _1503 = _1475 + (-1.0);
        _1489 = _1503;
    }
    float _1505 = _1489;
    float _1507 = _1505;
    if (_1419)
    {
        float _1509 = _1441 * _1493;
        _863 = _1509;
    }
    float _1511 = _863;
    if (!_1419)
    {
        _1495 = _1481;
    }
    float _1513 = _1495;
    float _1515 = _1513;
    if (_1419)
    {
        float _1517 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1455 = _1517;
    }
    float _1519 = _1455;
    if (_1419)
    {
        float _1521 = _1407 * _1511;
        _1499 = _1521;
    }
    float _1523 = _1499;
    if (!_1419)
    {
        _1507 = _1409;
    }
    float _1525 = _1507;
    float _1527 = _1525;
    if (_1419)
    {
        float _1529 = _1409 * _1511;
        _1527 = _1529;
    }
    float _1531 = _1527;
    if (!_1419)
    {
        _1443 = _1411;
    }
    float _1533 = _1443;
    float _1535 = _1533;
    if (_1419)
    {
        float _1537 = fma(_1481, _1475, _1519);
        _1515 = _1537;
    }
    float _1539 = _1515;
    if (_1419)
    {
        float _1541 = _1523 * _1523;
        _1535 = _1541;
    }
    float _1543 = _1535;
    if (!_1419)
    {
        _1501 = _1413;
    }
    float _1545 = _1501;
    float _1547 = _1545;
    if (_1419)
    {
        float _1549 = _1531 * _1531;
        _1547 = _1549;
    }
    float _1551 = _1547;
    float _1553 = fma(_1539, _1539, _1543);
    float _1555 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1557 = _1553 + _1551;
    float _1559 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1561 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1563 = fma(_1403, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1561);
    float _1565 = precise::clamp(_1563, 0.0, 1.0);
    float _1567 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1569 = rsqrt(_1557);
    float _1571 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1559);
    float _1573 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1575 = -_1565;
    float _1577 = _1575 + 1.0;
    float _1579 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1581 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1571);
    float _1583 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1573);
    float _1585 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1579);
    float _1587 = abs(_1577);
    float _1589 = log2(_1587);
    float _1591 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1583);
    float _1593 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1555);
    float _1595 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1585);
    float _1597 = _1581 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1599 = _1591 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1601 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1593);
    float _1603 = _1569 * _1523;
    float _1605 = _1595 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1607 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1609 = _1569 * _1539;
    float _1611 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1613 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1615 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1607);
    float _1617 = _1569 * _1531;
    float _1619 = -_1611;
    float _1621 = fma(_1609, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1619);
    float _1623 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1625 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1615);
    float _1627 = -_1613;
    float _1629 = fma(_1627, _1567, 1.0);
    float _1631 = -_1617;
    float _1633 = fma(_1631, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1621);
    float _1635 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1637 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1625);
    float _1639 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1641 = fma(_1633, -0.5, 0.5);
    float _1643 = log2(_1629);
    float _1645 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1647 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1639);
    float _1649 = _1609 + 1.0;
    float _1651 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1645);
    float _1653 = 1.0 / _1637;
    float _1655 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1651);
    float _1657 = exp2(_1635);
    float _1659 = _1643 * 0.693147182464599609375;
    float _1661 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1663 = sqrt(_1641);
    float _1665 = fma(_1633, 0.5, 0.5);
    float _1667 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1647);
    float _1669 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1655);
    float _1671 = fma(_1665, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1673 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1667);
    float _1675 = _1669 * _1653;
    float _1677 = -_1609;
    float _1679 = fma(_1657, _1649, _1677);
    float _1681 = fma(_1665, _1671, -0.212114393711090087890625);
    float _1683 = _1673 * _1653;
    float _1685 = fma(_1675, -0.5, 0.5);
    float _1687 = fma(_1665, _1681, 1.570728778839111328125);
    float _1689 = fma(_1683, 0.5, 0.5);
    float _1691 = fma(_1679, 0.5, 0.5);
    float _1693 = _1663 * 0.636619746685028076171875;
    float3 _4449 = float3(_1689, _1685, _1661);
    float _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4449, float3(0.0), isnan(_4449)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4449, float3(0.0), isnan(_4449)), level(0.0)).x;
    float _1697 = -_1687;
    float _1699 = fma(_1693, _1697, 1.0);
    float3 _4465 = float3(_1689, _1685, _1661);
    float4 _1702 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4465, float3(0.0), isnan(_4465)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4465, float3(0.0), isnan(_4465)), level(0.0)).xyzw;
    float _1704 = _1702.x;
    float _1706 = _1702.y;
    float _1708 = _1702.z;
    float _1710 = _1702.w;
    float2 _4482 = float2(_1699, _1691);
    float3 _1714 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4482, float2(0.0), isnan(_4482)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4482, float2(0.0), isnan(_4482)), level(0.0)).xyz;
    float _1716 = _1714.x;
    float _1718 = _1714.y;
    float _1720 = _1714.z;
    float _1722 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1724 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1726 = _1637 * 0.5;
    float _1728 = _1381 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1730 = _1381 > 0.0;
    bool _1732 = isnan(_1381);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan(0.0);
    bool _1738 = _1734 || _1736;
    float _1740 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1724);
    float _1742 = exp2(_1722);
    float _1744 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1740);
    float _1746 = _1673 + _1637;
    float _1748 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1744);
    float _1750 = _1746 * 0.5;
    float _1752 = _1748 + _1637;
    out.gl_Position.x = _1673;
    out.gl_Position.y = _1669;
    out.gl_Position.z = _1748;
    out.gl_Position.w = _1637;
    float _1754 = _1752 * 0.5;
    float _1756 = -_1742;
    float _1758 = _1756 + 1.0;
    float _1760 = fma(_1669, -0.5, _1726);
    float _1762 = _1728 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1764 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.x = _1750;
    out.m_62.y = _1760;
    out.m_62.z = _1754;
    out.m_62.w = _1637;
    float _1766 = -_1764;
    float _1768 = _1766 + 1.0;
    out.m_47.x = _1762;
    float _1770 = _1764 * _1695;
    float _1772 = _1710 * _1770;
    float _1774 = _1720 * _1770;
    float _1776 = fma(_1716, _1772, _1704);
    float _1778 = fma(_1718, _1772, _1706);
    float _1780 = _1710 * _1768;
    float _1782 = fma(_1710, _1774, _1708);
    out.m_64.x = _1776;
    out.m_64.y = _1778;
    out.m_64.z = _1782;
    out.m_64.w = _1780;
    if (_1738)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1784 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1784;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

