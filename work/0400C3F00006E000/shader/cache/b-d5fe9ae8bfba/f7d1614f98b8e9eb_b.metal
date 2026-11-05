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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
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
    float4 m_56 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_68 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1233 = false;
    bool _953 = false;
    bool _849 = false;
    bool _573 = false;
    bool _325 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3210 = as_type<float>(_103);
        out.gl_Position.z = _3210;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = _121;
    if (_117)
    {
        float _127 = float(_87);
        _123 = _127;
    }
    float _129 = _123;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
    bool _135 = _131 || _133;
    if (_135)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _97;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3279 = as_type<float>(_141);
        out.gl_Position.z = _3279;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_52.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    float _165 = in.m_42.x;
    float _167 = in.m_42.y;
    float _169 = in.m_42.z;
    int _171 = as_type<int>(_143) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_143) & 2;
    bool _177 = _175 != 0;
    float _179 = _143;
    if (!_157)
    {
        float _181 = _145 * _145;
        float _183 = _181 * 0.5;
        _179 = _183;
    }
    float _185 = _179;
    bool _187 = !_173;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = _185;
    if (!_157)
    {
        float _193 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _193;
    }
    float _195 = _191;
    bool _197 = !_177;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_157;
    float _203 = _195;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _145 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _145);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _239 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _241 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _243 = _237 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _245 = _237 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _247 = _237 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _249 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[8].x, _243);
    float _251 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[8].y, _245);
    float _253 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[8].z, _247);
    float _255 = _245;
    if (!_157)
    {
        _255 = _145;
    }
    float _257 = _255;
    float _259 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].x, _249);
    bool _261 = !_157;
    float _263 = _257;
    if (!_261)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _145 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _263 = _283;
    }
    float _285 = _263;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _289 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].y, _251);
    float _291 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].z, _253);
    float _293 = fma(_285, _159, _259);
    float _295 = fma(_285, _161, _289);
    float _297 = fma(_285, _163, _291);
    float _299 = fma(_293, _147, _165);
    float _301 = fma(_295, _147, _167);
    float _303 = fma(_297, _147, _169);
    bool _305 = !_287;
    float _323;
    if (!_305)
    {
        float _307 = in.m_54.x;
        float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _311 = _307 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _315 = _313 * _309;
        float _317 = floor(_315);
        float _319 = -_317;
        float _321 = _315 + _319;
        _323 = _321;
        _325 = true;
    }
    else
    {
        float _327 = float(_87);
        float _329 = 1.0 / _327;
        float _331 = _121 * _329;
        _323 = _331;
    }
    _325 = false;
    float _333 = _323;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = _333 + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _333 + _339;
    bool _343 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _345 = isnan(_333);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _371 = 1.0 / _357;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _375 = 1.0 / _361;
    float _377 = 1.0 / _369;
    float _379 = _337 * _371;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _383 = _333 + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = _333 + _385;
    float _389 = 1.0 / _365;
    float _391 = _341 * _375;
    bool _393 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _395 = isnan(_333);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -_353;
    float _407 = _405 + 1.0;
    bool _409 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _411 = isnan(_333);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = _403 * _407;
    float _423 = _383 * _377;
    float _425 = -_403;
    float _427 = _425 + 1.0;
    bool _429 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _431 = isnan(_333);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _449 = _419 * _427;
    float _451 = -_419;
    float _453 = _451 + 1.0;
    bool _455 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _457 = isnan(_333);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = _387 * _389;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _469;
    float _473 = _439 * _453;
    float _475 = -_439;
    float _477 = _475 + 1.0;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _483 = fma(_471, _379, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _485 = fma(_443, _379, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _487 = _465 * _477;
    float _489 = fma(_481, _391, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _491 = fma(_447, _391, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _493 = in.m_52.x;
    float _495 = in.m_52.y;
    float _497 = -_465;
    float _499 = _497 + 1.0;
    float _501 = _483 * _487;
    float _503 = _485 * _487;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _509;
    float _513 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[143].x, _501);
    float _515 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[143].y, _503);
    float _517 = fma(_507, _467, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _519 = fma(_511, _467, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _529 = fma(_489, _473, _513);
    float _531 = fma(_491, _473, _515);
    float _533 = fma(_523, _423, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _535 = fma(_527, _423, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _537 = fma(_517, _449, _529);
    float _539 = fma(_519, _449, _531);
    float _541 = fma(_533, _421, _537);
    float _543 = fma(_535, _421, _539);
    float _545 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[147].x, _541);
    float _547 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[147].y, _543);
    float _549 = _545 * _493;
    float _551 = _547 * _495;
    bool _553 = !_373;
    float _571;
    if (!_553)
    {
        float _555 = in.m_54.x;
        float _557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _559 = _555 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _561 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _563 = _561 * _557;
        float _565 = floor(_563);
        float _567 = -_565;
        float _569 = _563 + _567;
        _571 = _569;
        _573 = true;
    }
    else
    {
        float _575 = float(_87);
        float _577 = 1.0 / _575;
        float _579 = _121 * _577;
        _571 = _579;
    }
    _573 = false;
    float _581 = _571;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _585 = _581 + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _589 = _581 + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _593 = _581 + _591;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _603;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _611 = 1.0 / _605;
    bool _613 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _615 = isnan(_581);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = 1.0 / _601;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _629 = _581 + _627;
    bool _631 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _633 = 1.0 / _609;
    float _635 = _585 * _611;
    bool _637 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _639 = isnan(_581);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = 1.0 / _597;
    float _651 = _629 * _625;
    bool _653 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _655 = isnan(_581);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    bool _665 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _667 = isnan(_581);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -_663;
    float _679 = _677 + 1.0;
    float _681 = _589 * _633;
    bool _683 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _685 = isnan(_581);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = -_675;
    float _697 = _695 + 1.0;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _699;
    float _703 = _647 * _679;
    float _705 = -_647;
    float _707 = _705 + 1.0;
    float _709 = _693 * _697;
    float _711 = fma(_701, _635, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _713 = _593 * _649;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _715;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _719;
    float _723 = -_693;
    float _725 = _723 + 1.0;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _731 = fma(_717, _635, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _733 = fma(_721, _635, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _735 = _675 * _707;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _745 = _623 * _725;
    float _747 = fma(_729, _681, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _749 = fma(_739, _681, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _751 = fma(_743, _681, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _753 = _711 * _745;
    float _755 = _731 * _745;
    float _757 = -_623;
    float _759 = _757 + 1.0;
    float _761 = _733 * _745;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _763;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _767;
    float _771 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[107].x, _753);
    float _773 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[107].y, _755);
    float _775 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[107].z, _761);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _777;
    float _781 = fma(_765, _713, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _783 = fma(_747, _709, _771);
    float _785 = fma(_749, _709, _773);
    float _787 = fma(_751, _709, _775);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _797 = fma(_769, _713, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _799 = fma(_779, _713, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _805 = fma(_781, _735, _783);
    float _807 = fma(_791, _651, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _809 = fma(_795, _651, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _811 = fma(_803, _651, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _813 = fma(_797, _735, _785);
    float _815 = fma(_799, _735, _787);
    float _817 = fma(_807, _703, _805);
    float _819 = fma(_809, _703, _813);
    float _821 = fma(_811, _703, _815);
    float _823 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[111].x, _817);
    float _825 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[111].y, _819);
    float _827 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[111].z, _821);
    bool _829 = !_631;
    float _847;
    if (!_829)
    {
        float _831 = in.m_54.x;
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _835 = _831 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _837 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _839 = _837 * _833;
        float _841 = floor(_839);
        float _843 = -_841;
        float _845 = _839 + _843;
        _847 = _845;
        _849 = true;
    }
    else
    {
        float _851 = float(_87);
        float _853 = 1.0 / _851;
        float _855 = _121 * _853;
        _847 = _855;
    }
    _849 = false;
    float _857 = _847;
    bool _859 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _861 = isnan(_857);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _875 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _877 = isnan(_857);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _887;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _893 = _857 + _891;
    float _895 = -_869;
    float _897 = _895 + 1.0;
    bool _899 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _901 = 1.0 / _873;
    float _903 = _885 * _897;
    float _905 = -_885;
    float _907 = _905 + 1.0;
    float _909 = _889 * _901;
    float _911 = _827 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _913 = fma(_909, _893, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _915 = _825 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _917 = _911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _919 = _913 * _903;
    float _921 = _915 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _923 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[115].x, _919);
    float _925 = _823 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _927 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[116].x, _923);
    float _929 = _925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _931 = _927 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _929;
    out.m_56.y = _921;
    out.m_56.z = _917;
    out.m_56.w = _931;
    bool _933 = !_899;
    float _951;
    if (!_933)
    {
        float _935 = in.m_54.x;
        float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _939 = _935 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _943 = _941 * _937;
        float _945 = floor(_943);
        float _947 = -_945;
        float _949 = _943 + _947;
        _951 = _949;
        _953 = true;
    }
    else
    {
        float _955 = float(_87);
        float _957 = 1.0 / _955;
        float _959 = _121 * _957;
        _951 = _959;
    }
    _953 = false;
    float _961 = _951;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _965 = _961 + _963;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _969 = _961 + _967;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _973 = _961 + _971;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _975;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _981 = _979 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _983;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _991 = 1.0 / _977;
    bool _993 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _995 = isnan(_961);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1001 = _997 || _999;
    float _1003 = float(_1001);
    bool _1005 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1007 = isnan(_961);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1013 = _1009 || _1011;
    float _1015 = float(_1013);
    float _1017 = 1.0 / _985;
    bool _1019 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1021 = 1.0 / _989;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1025 = _961 + _1023;
    float _1027 = _965 * _991;
    bool _1029 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1031 = isnan(_961);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1041;
    float _1045 = 1.0 / _981;
    float _1047 = _969 * _1017;
    float _1049 = -_1039;
    float _1051 = _1049 + 1.0;
    float _1053 = fma(_1043, _1047, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1055 = _973 * _1021;
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1057;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1061;
    float _1065 = fma(_1059, _1047, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1067 = fma(_1063, _1047, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1069 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1071 = isnan(_961);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1077 = _1073 || _1075;
    float _1079 = float(_1077);
    float _1081 = _1025 * _1045;
    bool _1083 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1085 = isnan(_961);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = -_1003;
    float _1097 = _1095 + 1.0;
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1101 = _1099 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1103 = _1015 * _1051;
    float _1105 = -_1015;
    float _1107 = _1105 + 1.0;
    float _1109 = _1093 * _1097;
    float _1111 = -_1093;
    float _1113 = _1111 + 1.0;
    float _1115 = fma(_1101, _1055, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1117 = _1079 * _1107;
    float _1119 = -_1079;
    float _1121 = _1119 + 1.0;
    float _1123 = _1039 * _1113;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1131 = _1129 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1133 = _1065 * _1117;
    float _1135 = fma(_1127, _1055, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1137 = fma(_1131, _1055, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1139 = _1067 * _1117;
    float _1141 = _1053 * _1117;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1143;
    float _1147 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1133);
    float _1149 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1139);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1151;
    float _1155 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1141);
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1157;
    float _1161 = fma(_1145, _1027, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1163 = fma(_1115, _1103, _1147);
    float _1165 = fma(_1135, _1103, _1149);
    float _1167 = fma(_1153, _1027, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1169 = fma(_1137, _1103, _1155);
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1173 = _1171 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1177 = _1175 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1179 = fma(_1159, _1027, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1183 = _1181 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1185 = fma(_1161, _1123, _1163);
    float _1187 = fma(_1173, _1081, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1189 = fma(_1177, _1081, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1191 = fma(_1167, _1123, _1165);
    float _1193 = fma(_1183, _1081, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1195 = fma(_1179, _1123, _1169);
    float _1197 = fma(_1187, _1109, _1185);
    float _1199 = fma(_1189, _1109, _1191);
    float _1201 = fma(_1193, _1109, _1195);
    float _1203 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1197);
    float _1205 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1199);
    float _1207 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1201);
    bool _1209 = !_1019;
    float _1229;
    float _1231;
    if (!_1209)
    {
        float _1211 = in.m_54.x;
        float _1213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1215 = float(_87);
        float _1217 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1219 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _1221 = _1219 * _1213;
        float _1223 = floor(_1221);
        float _1225 = -_1223;
        float _1227 = _1221 + _1225;
        _1229 = _1215;
        _1231 = _1227;
        _1233 = true;
    }
    else
    {
        float _1235 = float(_87);
        float _1237 = 1.0 / _1235;
        float _1239 = _121 * _1237;
        _1229 = _1235;
        _1231 = _1239;
    }
    _1233 = false;
    float _1241 = _1229;
    float _1243 = _1231;
    float _1245 = in.m_54.x;
    float _1247 = in.m_54.y;
    float _1249 = in.m_54.z;
    float _1251 = in.m_54.w;
    float _1253 = _551 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1257 = _1255 != 0;
    int _1259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1261 = _1259 != 0;
    int _1263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1265 = _1263 != 0;
    float _1267 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1275 = _1245 * 2.0;
    float _1277 = _1247 * 2.0;
    float _1279 = _1249 * 2.0;
    float _1281 = _1247 + _1245;
    float _1283 = floor(_1275);
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1289 = _1281 + (-1.0);
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1293 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1295 = floor(_1279);
    float _1297 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1299 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1291);
    bool _1301 = !_1265;
    int _1303 = _1301 ? 0 : 1;
    float _1305 = -_1271;
    float _1307 = fma(_1297, 2.0, _1305);
    bool _1309 = _1283 > 0.0;
    float _1311 = floor(_1277);
    bool _1313 = _1283 >= 0.0;
    bool _1315 = isnan(_1283);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan(0.0);
    bool _1321 = _1317 || _1319;
    float _1323 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1325 = !_1257;
    int _1327 = _1325 ? 0 : 1;
    float _1329 = -_121;
    float _1331 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1307);
    int _1333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1335 = _1333 != 0;
    float _1337 = fma(_1323, -2.0, _1267);
    bool _1339 = _1295 >= 0.0;
    bool _1341 = isnan(_1295);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan(0.0);
    bool _1347 = _1343 || _1345;
    float _1349 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1351 = int(_1349);
    int _1353 = _1321 ? 0 : 1;
    float _1355 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1337);
    int _1357 = _1347 ? 0 : 1;
    bool _1359 = _1295 > 0.0;
    int _1361 = ~_1357;
    int _1363 = _1361 + 1;
    int _1365 = _1363 + 1;
    float _1367 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1369 = int(_1367);
    bool _1371 = _1311 > 0.0;
    float _1373 = _1289;
    float _1375 = _1297;
    int _1377 = _1365;
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (!_1335)
    {
        _1373 = _1247;
    }
    float _1381 = _1373;
    float _1383 = _1381;
    if (_1335)
    {
        _1383 = _1245;
    }
    float _1385 = _1383;
    bool _1387 = _1311 >= 0.0;
    bool _1389 = isnan(_1311);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan(0.0);
    bool _1395 = _1391 || _1393;
    if (!_1335)
    {
        _1375 = _1249;
    }
    float _1397 = _1375;
    float _1399 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1401 = fma(_1385, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1269);
    float _1403 = _1397;
    if (_1335)
    {
        _1403 = _1247;
    }
    float _1405 = _1403;
    float _1407 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1409 = log2(_1407);
    float _1411 = -_1285;
    float _1413 = fma(_1399, 2.0, _1411);
    float _1415 = _1405;
    if (!_1359)
    {
        int _1417 = ~_1357;
        int _1419 = _1417 + 1;
        _1377 = _1419;
    }
    int _1421 = _1377;
    float _1423 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1273);
    if (!_1335)
    {
        _1415 = _1249;
    }
    float _1425 = _1415;
    float _1427 = -_121;
    float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1413);
    float _1431 = _1425;
    if (_1335)
    {
        _1431 = _1247;
    }
    float _1433 = _1431;
    float _1435 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1423);
    float _1437 = float(_1351);
    int _1439 = _1395 ? 0 : 1;
    float _1441 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1443 = abs(_1327);
    float _1445 = 1.0 / _1437;
    int _1447 = ~_1439;
    int _1449 = _1447 + 1;
    int _1451 = _1449 + 1;
    float _1453 = _1409 * _121;
    float _1455 = fma(_1441, -2.0, _1287);
    int _1457 = _1451;
    if (!_1371)
    {
        int _1459 = ~_1439;
        int _1461 = _1459 + 1;
        _1457 = _1461;
    }
    int _1463 = _1457;
    float _1465 = in.m_58.x;
    float _1467 = in.m_58.y;
    float _1469 = in.m_58.z;
    float _1471 = float(_1443);
    float _1473 = exp2(_1453);
    float _1475 = float(_1421);
    bool _1477 = !_1261;
    int _1479 = _1477 ? 0 : 1;
    float _1481 = _1471 * _1475;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1485 = ~_1353;
    int _1487 = _1485 + 1;
    int _1489 = _1487 + 1;
    float _1491 = _1445 * _121;
    int _1493 = abs(_1479);
    float _1495 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1497 = 1.0 + _1495;
    int _1499 = _1489;
    if (!_1309)
    {
        int _1501 = ~_1353;
        int _1503 = _1501 + 1;
        _1499 = _1503;
    }
    int _1505 = _1499;
    float _1507 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1483);
    bool _1509 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1511 = isnan(0.0);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1517 = _1513 || _1515;
    float _1519 = -_1473;
    float _1521 = _1519 + 1.0;
    float _1523 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1299);
    float _1525 = 1.0 / _1497;
    float _1527 = _1481 * (-2.0);
    float _1529 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1455);
    float _1531 = float(_1505);
    float _1533 = _1245 + (-0.5);
    float _1535 = fma(_1527, _1465, _1465);
    float _1537 = fma(_1293, _1527, _1293);
    int _1539 = abs(_1303);
    float _1541 = _1247 + _1249;
    float _1543 = _1517 ? _1521 : 0.0;
    float _1545 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1401);
    float _1547 = float(_1493);
    float _1549 = _1541 + (-1.0);
    bool _1551 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1553 = isnan(1.0);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1559 = _1555 || _1557;
    float _1561 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1535);
    float _1563 = float(_1539);
    float _1565 = _1547 * _1531;
    float _1567 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1507);
    float _1569 = float(_1463);
    float _1571 = _1565 * (-2.0);
    float _1573 = float(_1369);
    float _1575 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1577 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1579 = isnan(0.5);
    bool _1581 = _1577 || _1579;
    bool _1583 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1585 = _1581 || _1583;
    float _1587 = _1563 * _1569;
    float _1589 = _1247 + (-0.5);
    float _1591 = fma(_1571, _1467, _1467);
    float _1593 = _1249 + _1245;
    float _1595 = _1573 * _121;
    float _1597 = fma(_1575, _1571, _1575);
    if (_1559)
    {
        float _1599 = _1543 * _1525;
        _125 = _1599;
    }
    float _1601 = _125;
    float _1603 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1591);
    float _1605 = _1587 * (-2.0);
    float _1607 = _1593 + (-1.0);
    float _1609 = fma(_1597, _1601, _1603);
    float _1611 = fma(_1537, _1601, _1561);
    float _1613 = fma(_1605, _1469, _1469);
    float _1615 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1617 = _1249 + (-0.5);
    float _1619 = _1611 * 0.15915493667125701904296875;
    float _1621 = _1609 * 0.15915493667125701904296875;
    float _1623 = fma(_1615, _1605, _1615);
    float _1625 = fma(_1617, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1613);
    float _1627 = _1619 * 6.283185482025146484375;
    float _1629 = sin(_1627);
    float _1631 = _549 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1633 = _301 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1635 = fma(_1623, _1601, _1625);
    float _1637 = _301 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1639 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1641 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1633);
    float _1643 = _1635 * 0.15915493667125701904296875;
    float _1645 = _1619 * 6.283185482025146484375;
    float _1647 = cos(_1645);
    float _1649 = _301 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1651 = _1631 * _1639;
    float _1653 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1637);
    float _1655 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1641);
    float _1657 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1649);
    float _1659 = _1643 * 6.283185482025146484375;
    float _1661 = cos(_1659);
    float _1663 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1665 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1657);
    float _1667 = _1253 * _1663;
    float _1669 = _1665 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1671 = _1621 * 6.283185482025146484375;
    float _1673 = sin(_1671);
    float _1675 = _1621 * 6.283185482025146484375;
    float _1677 = cos(_1675);
    float _1679 = _1661 * _1667;
    float _1681 = _1647 * _1679;
    float _1683 = _1629 * _1679;
    float _1685 = _1643 * 6.283185482025146484375;
    float _1687 = sin(_1685);
    float _1689 = _1629 * _1673;
    float _1691 = _1647 * _1673;
    float _1693 = _1673 * _1661;
    float _1695 = _1655 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1697 = _1647 * _1677;
    float _1699 = _1629 * _1677;
    float _1701 = _1677 * _1661;
    float _1703 = fma(_1687, _1697, _1689);
    float _1705 = -_1691;
    float _1707 = fma(_1687, _1699, _1705);
    float _1709 = -_1699;
    float _1711 = fma(_1687, _1691, _1709);
    float _1713 = -_1667;
    float _1715 = _1687 * _1713;
    float _1717 = fma(_1703, _1651, _1681);
    float _1719 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1721 = fma(_1687, _1689, _1697);
    float _1723 = fma(_1701, _1651, _1715);
    float _1725 = fma(_1707, _1651, _1683);
    float _1727 = fma(_1711, _1719, _1717);
    float _1729 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1653);
    float _1731 = fma(_1693, _1719, _1723);
    float _1733 = fma(_1721, _1719, _1725);
    float _1735 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1737 = _1729 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1739 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1741 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1743 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1735);
    float _1745 = _1737 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1747 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1739);
    float _1749 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1741);
    float _1751 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1743);
    float _1753 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1745);
    float _1755 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1747);
    float _1757 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1759 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1753);
    float _1761 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1763 = _1737 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1765 = _1695 + _1757;
    float _1767 = _1759 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1769 = _1669 + _1761;
    float _1771 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1763);
    float _1773 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1775 = _1765 + _1773;
    float _1777 = 1.0 / _1767;
    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1781 = _1769 + _1779;
    float _1783 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1771);
    float _1785 = _1775 * _1775;
    float _1787 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1749);
    float _1789 = _1783 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1791 = fma(_1781, _1781, _1785);
    float _1793 = _1787 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1795 = _1789 + _1767;
    float _1797 = sqrt(_1791);
    float _1799 = _1737 + _1793;
    float _1801 = _1767;
    float _1803 = _1733;
    float _1805 = _1793;
    float _1807 = _1669;
    float _1809 = _1651;
    if (_1585)
    {
        _1801 = 1.0;
    }
    float _1811 = _1801;
    float _1813 = _1795 * _1777;
    float _1815 = _1813 * 0.5;
    float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1819 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1817);
    float _1821 = 1.0 / _1819;
    bool _1823 = _1797 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1827 = _1825 != 0;
    int _1829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1831 = _1829 != 0;
    int _1833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1835 = _1833 != 0;
    int _1837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1839 = _1837 != 0;
    bool _1841 = !_1831;
    int _1843 = _1841 ? 0 : 1;
    bool _1845 = !_1827;
    int _1847 = _1845 ? 0 : 1;
    bool _1849 = !_1835;
    int _1851 = _1849 ? 0 : 1;
    bool _1853 = !_1839;
    int _1855 = _1853 ? 0 : 1;
    float _1857 = _1797;
    float _1859 = _1819;
    float _1861 = _1811;
    float _1863 = _1777;
    if (!_1823)
    {
        _1803 = _1769;
    }
    float _1865 = _1803;
    float _1867 = _1865;
    if (!_1823)
    {
        _1805 = _1765;
    }
    float _1869 = _1805;
    float _1871 = _1869;
    if (!_1823)
    {
        _1379 = _1799;
    }
    float _1873 = _1379;
    bool _1875 = !_1823;
    float _1877 = _1873;
    if (!_1875)
    {
        float _1879 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1883 = _1797 + _1881;
        float _1885 = _1799 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1887 = rsqrt(_1791);
        float _1889 = _1883 * _1879;
        float _1891 = _1889 * 0.15915493667125701904296875;
        float _1893 = _1891 * 6.283185482025146484375;
        float _1895 = cos(_1893);
        float _1897 = _1891 * 6.283185482025146484375;
        float _1899 = sin(_1897);
        float _1901 = _1895 + (-1.0);
        float _1903 = _1901 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1905 = fma(_1899, _1885, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1907 = fma(_1799, _1895, _1903);
        float _1909 = _1887 * _1905;
        float _1911 = fma(_1781, _1909, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1913 = fma(_1775, _1909, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1857 = _1883;
        _1877 = _1907;
        _1867 = _1911;
        _1871 = _1913;
    }
    float _1915 = _1857;
    float _1917 = _1877;
    float _1919 = _1867;
    float _1921 = _1871;
    float _1923 = _1915;
    if (_1585)
    {
        _1859 = 1.0;
    }
    float _1925 = _1859;
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1929 = _1821 * _1927;
    float _1931 = _1925;
    if (!_1585)
    {
        float _1933 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1935 = _1933 * 0.15915493667125701904296875;
        float _1937 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1939 = _1935 * 6.283185482025146484375;
        float _1941 = cos(_1939);
        float _1943 = _1937 * 0.15915493667125701904296875;
        float _1945 = _1935 * 6.283185482025146484375;
        float _1947 = sin(_1945);
        float _1949 = 1.0 / _1941;
        float _1951 = _1943 * 6.283185482025146484375;
        float _1953 = cos(_1951);
        float _1955 = _1947 * _1949;
        float _1957 = _1943 * 6.283185482025146484375;
        float _1959 = sin(_1957);
        float _1961 = _1953 * _1955;
        float _1963 = 1.0 / _1961;
        float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1967 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1965;
        float _1969 = 1.0 / _1967;
        float _1971 = _1959 * _1963;
        float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1975 = fma(_1929, _1971, _1973);
        float _1977 = _1975 * _1969;
        float _1979 = precise::clamp(_1977, 0.0, 1.0);
        _1923 = _1935;
        _1861 = _1979;
    }
    float _1981 = _1923;
    float _1983 = _1861;
    float _1985 = _1981;
    if (!_1585)
    {
        float _1987 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1989 = _1987 * 0.15915493667125701904296875;
        float _1991 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1993 = _1989 * 6.283185482025146484375;
        float _1995 = cos(_1993);
        float _1997 = _1991 * 0.15915493667125701904296875;
        float _1999 = _1989 * 6.283185482025146484375;
        float _2001 = sin(_1999);
        float _2003 = 1.0 / _1995;
        float _2005 = _1997 * 6.283185482025146484375;
        float _2007 = cos(_2005);
        float _2009 = _2001 * _2003;
        float _2011 = _1997 * 6.283185482025146484375;
        float _2013 = sin(_2011);
        float _2015 = _2007 * _2009;
        float _2017 = 1.0 / _2015;
        float _2019 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2021 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2019;
        float _2023 = 1.0 / _2021;
        float _2025 = _2013 * _2017;
        float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2029 = fma(_1929, _2025, _2027);
        float _2031 = _2029 * _2023;
        float _2033 = precise::clamp(_2031, 0.0, 1.0);
        float _2035 = -_2033;
        float _2037 = _2035 + 1.0;
        _1985 = _2003;
        _1863 = _2017;
        _1931 = _2037;
    }
    float _2039 = _1985;
    float _2041 = _1863;
    float _2043 = _1931;
    float _2045 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2047 = _1917 + _2045;
    float _2049 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2051 = _1919 + _2049;
    float _2053 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2055 = _1921 + _2053;
    float _2057 = _2047 * _2047;
    float _2059 = fma(_2051, _2051, _2057);
    float _2061 = fma(_2055, _2055, _2059);
    float _2063 = rsqrt(_2061);
    float _2065 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2067 = _2051 * _2065;
    float _2069 = _2055 * _2065;
    float _2071 = _2067 * _2067;
    float _2073 = _2069 * _2069;
    float _2075 = _2071 + _2073;
    float _2077 = sqrt(_2075);
    bool _2079 = _2077 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2083 = _2077 + _2081;
    float _2085 = _2039;
    float _2087 = _2075;
    float _2089 = _2083;
    float _2091 = _2047;
    float _2093 = _2067;
    float _2095 = _2069;
    float _2097 = _2071;
    float _2099 = _2073;
    if (_2079)
    {
        float _2101 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2085 = _2101;
    }
    float _2103 = _2085;
    if (_2079)
    {
        float _2105 = rsqrt(_2075);
        _2087 = _2105;
    }
    float _2107 = _2087;
    if (_2079)
    {
        float _2109 = _2083 * _2103;
        _2089 = _2109;
    }
    float _2111 = _2089;
    if (_2079)
    {
        float _2113 = _2111 * 0.15915493667125701904296875;
        _1807 = _2113;
    }
    float _2115 = _1807;
    float _2117 = _2041;
    if (_2079)
    {
        float _2119 = _2115 * 6.283185482025146484375;
        float _2121 = sin(_2119);
        _2117 = _2121;
    }
    float _2123 = _2117;
    float _2125 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2127 = precise::max(0.0, _2125);
    float _2129 = _2103;
    float _2131 = _2127;
    if (_2079)
    {
        float _2133 = _2115 * 6.283185482025146484375;
        float _2135 = cos(_2133);
        _2129 = _2135;
    }
    float _2137 = _2129;
    float _2139 = -_2065;
    float _2141 = -_2127;
    float _2143 = fma(_2047, _2139, _2141);
    if (_2079)
    {
        float _2145 = _2143 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2131 = _2145;
    }
    float _2147 = _2131;
    float _2149 = _2147;
    if (_2079)
    {
        float _2151 = fma(_2123, _2147, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2091 = _2151;
    }
    float _2153 = _2091;
    float _2155 = sqrt(_2061);
    float _2157 = _2153;
    if (_2079)
    {
        float _2159 = _2137 + (-1.0);
        _2149 = _2159;
    }
    float _2161 = _2149;
    float _2163 = _2161;
    if (_2079)
    {
        float _2165 = _2107 * _2153;
        _1809 = _2165;
    }
    float _2167 = _1809;
    if (!_2079)
    {
        _2157 = _2143;
    }
    float _2169 = _2157;
    float _2171 = _2169;
    if (_2079)
    {
        float _2173 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2163 = _2173;
    }
    float _2175 = _2163;
    if (_2079)
    {
        float _2177 = _2067 * _2167;
        _2093 = _2177;
    }
    float _2179 = _2093;
    if (_2079)
    {
        float _2181 = _2069 * _2167;
        _2095 = _2181;
    }
    float _2183 = _2095;
    if (_2079)
    {
        float _2185 = fma(_2143, _2137, _2175);
        _2171 = _2185;
    }
    float _2187 = _2171;
    if (_2079)
    {
        float _2189 = _2179 * _2179;
        _2097 = _2189;
    }
    float _2191 = _2097;
    if (_2079)
    {
        float _2193 = _2183 * _2183;
        _2099 = _2193;
    }
    float _2195 = _2099;
    float _2197 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2199 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2201 = fma(_2187, _2187, _2191);
    float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2205 = fma(_2155, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2203);
    float _2207 = precise::clamp(_2205, 0.0, 1.0);
    float _2209 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2211 = _2201 + _2195;
    float _2213 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2197);
    float _2215 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2217 = -_2207;
    float _2219 = _2217 + 1.0;
    float _2221 = rsqrt(_2211);
    float _2223 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2213);
    float _2225 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2215);
    float _2227 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2229 = _2223 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2231 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2209);
    float _2233 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2225);
    float _2235 = abs(_2219);
    float _2237 = log2(_2235);
    float _2239 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2227);
    float _2241 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2231);
    float _2243 = _2233 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2245 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2247 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2239);
    float _2249 = _2241 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2251 = _2243 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2253 = _2221 * _2179;
    float _2255 = _2221 * _2187;
    float _2257 = _2221 * _2183;
    float _2259 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2251);
    float _2261 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2263 = _2247 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2265 = -_2245;
    float _2267 = fma(_2265, _2199, 1.0);
    float _2269 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2259);
    float _2271 = -_2261;
    float _2273 = fma(_2255, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2271);
    float _2275 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2277 = log2(_2267);
    float _2279 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2269);
    float _2281 = -_2257;
    float _2283 = fma(_2281, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2273);
    float _2285 = _2243 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2287 = _2243 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2289 = fma(_2283, -0.5, 0.5);
    float _2291 = _2255 + 1.0;
    float _2293 = exp2(_2275);
    float _2295 = fma(_2283, 0.5, 0.5);
    float _2297 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2285);
    float _2299 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2287);
    float _2301 = fma(_2295, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2303 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2297);
    float _2305 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2299);
    float _2307 = 1.0 / _2279;
    float _2309 = fma(_2295, _2301, -0.212114393711090087890625);
    float _2311 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2303);
    float _2313 = _2277 * 0.693147182464599609375;
    float _2315 = fma(_2295, _2309, 1.570728778839111328125);
    float _2317 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2319 = sqrt(_2289);
    float _2321 = -_2255;
    float _2323 = fma(_2293, _2291, _2321);
    float _2325 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2305);
    float _2327 = fma(_2323, 0.5, 0.5);
    float _2329 = _2311 * _2307;
    float _2331 = _2325 * _2307;
    float _2333 = fma(_2329, 0.5, 0.5);
    float _2335 = fma(_2331, -0.5, 0.5);
    float _2337 = _2319 * 0.636619746685028076171875;
    float _2339 = -_2315;
    float _2341 = fma(_2337, _2339, 1.0);
    float3 _6772 = float3(_2333, _2335, _2317);
    float _2343 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6772, float3(0.0), isnan(_6772)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6772, float3(0.0), isnan(_6772)), level(0.0)).x;
    float3 _6783 = float3(_2333, _2335, _2317);
    float4 _2346 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6783, float3(0.0), isnan(_6783)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6783, float3(0.0), isnan(_6783)), level(0.0)).xyzw;
    float _2348 = _2346.x;
    float _2350 = _2346.y;
    float _2352 = _2346.z;
    float _2354 = _2346.w;
    float2 _6800 = float2(_2341, _2327);
    float3 _2358 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6800, float2(0.0), isnan(_6800)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6800, float2(0.0), isnan(_6800)), level(0.0)).xyz;
    float _2360 = _2358.x;
    float _2362 = _2358.y;
    float _2364 = _2358.z;
    float _2366 = float(uint(_1369));
    float _2368 = trunc(_1491);
    int _2370 = int(_2368);
    int _2372 = ~_1369;
    int _2374 = _2372 + 1;
    float _2376 = -_1545;
    float _2378 = _2376 + 1.0;
    int _2380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2382 = _2380 != 0;
    float _2384 = -_1435;
    float _2386 = _2384 + 1.0;
    int _2388 = abs(_1843);
    float _2390 = -_1567;
    float _2392 = _2390 + 1.0;
    int _2394 = abs(_1847);
    float _2396 = 1.0 / _2366;
    int _2398 = abs(_1851);
    float _2400 = _2243 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2402 = _1251 > 0.5;
    float _2404 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2406 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2400);
    float _2408 = float(uint(_2370));
    float _2410 = 1.0 / _1241;
    float _2412 = float(_2370);
    int _2414 = as_type<int>(_2396) + (-2);
    float _2416 = exp2(_2404);
    float _2418 = as_type<float>(_2414) * _2408;
    float _2420 = trunc(_2418);
    float _2422 = precise::max(_2420, 0.0);
    uint _2425 = uint(_2422);
    float _2427 = _1595 * _2410;
    float _2429 = -_2416;
    float _2431 = _2429 + 1.0;
    int _2433 = ~_1369;
    int _2435 = _2433 + 1;
    float _2437 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2439 = _2374 * int(_2425);
    int _2441 = _2439 + _2370;
    float _2443 = float(uint(_2441));
    bool _2445 = !_2382;
    float _2447 = _2445 ? _1247 : _1245;
    float _2449 = as_type<float>(_2414) * _2443;
    bool _2451 = !_2382;
    float _2453 = _2451 ? 1.2345600128173828125 : 1.0;
    float _2455 = trunc(_2449);
    float _2457 = precise::max(_2455, 0.0);
    uint _2459 = uint(_2457);
    float _2461 = _2447 * _2453;
    bool _2463 = _2412 >= _1573;
    bool _2465 = isnan(_2412);
    bool _2467 = _2463 || _2465;
    bool _2469 = isnan(_1573);
    bool _2471 = _2467 || _2469;
    float _2473 = float(_2471);
    int _2475 = _1369 + (-1);
    float _2477 = floor(_2461);
    int _2479 = int(_2425) + int(_2459);
    float _2481 = trunc(_2473);
    int _2483 = int(_2481);
    int _2485 = _2435 * _2479;
    int _2487 = _2485 + _2370;
    float _2489 = -_2477;
    float _2491 = _2461 + _2489;
    bool _2493 = uint(_2487) >= uint(_1369);
    bool _2495 = !_2493;
    int _2497 = _2495 ? 0 : (-1);
    bool _2499 = _1369 == 0;
    int _2501 = ~_2479;
    int _2503 = _2501 + _2497;
    int _2505 = _2503 + 1;
    float _2507 = _2491 * _1573;
    float _2509 = trunc(_2427);
    int _2511 = int(_2509);
    int _2513 = ~_2483;
    int _2515 = _2513 + 1;
    int _2517 = _2515 + 1;
    int _2519 = _1369 * _2505;
    int _2521 = _2519 + _2370;
    int _2523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2525 = _2523 != 0;
    int _2527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2529 = _2527 != 0;
    bool _2531 = !_2499;
    int _2533 = _2531 ? _2521 : (-1);
    float _2535 = trunc(_2507);
    int _2537 = int(_2535);
    bool _2539 = !_2525;
    int _2541 = _2539 ? 0 : 1;
    int _2543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2545 = _2543 != 0;
    int _2547 = _2533 * _2517;
    int _2549 = abs(_2541);
    int _2551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2553 = _2551 != 0;
    int _2555 = _2483 * _2475;
    int _2557 = _2555 + _2547;
    int _2559 = _2557 * _2388;
    int _2561 = abs(_1855);
    int _2563 = _2537 * _2549;
    int _2565 = _2563 + _2370;
    int _2567 = _2511 * _2394;
    int _2569 = _2567 + _2559;
    int _2571 = ~_1369;
    int _2573 = _2571 + 1;
    int _2575 = _2565 * _2398;
    int _2577 = _2575 + _2569;
    float _2579 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2581 = _2579 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2583 = -_199;
    int _2585 = _2402 ? as_type<int>(_2583) : as_type<int>(_199);
    int _2587 = _2537 * _2561;
    int _2589 = _2587 + _2577;
    int _2591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2593 = _2591 != 0;
    int _2595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2597 = _2595 != 0;
    float _2599 = float(uint(_2589));
    float _2601 = float(uint(_2565));
    float _2603 = as_type<float>(_2414) * _2599;
    int _2605 = ~_1369;
    int _2607 = _2605 + 1;
    int _2609 = ~_1369;
    int _2611 = _2609 + 1;
    bool _2613 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2615 = isnan(_1243);
    bool _2617 = _2613 || _2615;
    bool _2619 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2621 = _2617 || _2619;
    float _2623 = float(_2621);
    float _2625 = trunc(_2603);
    float _2627 = precise::max(_2625, 0.0);
    uint _2629 = uint(_2627);
    int _2631 = _2607 * int(_2629);
    int _2633 = _2631 + _2589;
    float _2635 = float(uint(_2633));
    float _2637 = as_type<float>(_2414) * _2635;
    float _2639 = trunc(_2637);
    float _2641 = precise::max(_2639, 0.0);
    uint _2643 = uint(_2641);
    float _2645 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2647 = _2645 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2649 = 1.0 / _2647;
    int _2651 = int(_2629) + int(_2643);
    float _2653 = 1.0 / _2581;
    float _2655 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2657 = _2655 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2659 = _2573 * _2651;
    int _2661 = _2659 + _2589;
    float _2663 = 1.0 / _2657;
    bool _2665 = uint(_2661) >= uint(_1369);
    bool _2667 = !_2529;
    float _2669 = _2667 ? _199 : as_type<float>(_2585);
    bool _2671 = _1247 > 0.5;
    float _2673 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2675 = _2673 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2677 = !_2665;
    int _2679 = _2677 ? 0 : (-1);
    bool _2681 = _1245 > 0.5;
    float _2683 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2683;
    float _2687 = -_199;
    int _2689 = _2671 ? as_type<int>(_2687) : as_type<int>(_199);
    float _2691 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2693 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2691;
    int _2695 = ~_2651;
    int _2697 = _2695 + _2679;
    int _2699 = _2697 + 1;
    float _2701 = _2685 * _2649;
    float _2703 = _2675 * _2653;
    bool _2705 = !_2593;
    float _2707 = _2705 ? _199 : as_type<float>(_2689);
    float _2709 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2711 = _1243 + _2709;
    float _2713 = as_type<float>(_2414) * _2601;
    bool _2715 = _1249 > 0.5;
    float _2717 = _2693 * _2663;
    float _2719 = fma(_2701, _2711, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2721 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2723 = isnan(_1243);
    bool _2725 = _2721 || _2723;
    bool _2727 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2729 = _2725 || _2727;
    float _2731 = float(_2729);
    int _2733 = _1369 * _2699;
    int _2735 = _2733 + _2589;
    float _2737 = trunc(_2713);
    float _2739 = precise::max(_2737, 0.0);
    uint _2741 = uint(_2739);
    float _2743 = -_189;
    int _2745 = _2681 ? as_type<int>(_2743) : as_type<int>(_189);
    float _2747 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2749 = _1243 + _2747;
    float _2751 = -_189;
    int _2753 = _2715 ? as_type<int>(_2751) : as_type<int>(_189);
    float _2755 = -_2731;
    float _2757 = _2755 + 1.0;
    bool _2759 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2761 = isnan(_1243);
    bool _2763 = _2759 || _2761;
    bool _2765 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2767 = _2763 || _2765;
    float _2769 = float(_2767);
    float _2771 = fma(_2703, _2749, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2773 = !_2553;
    float _2775 = _2773 ? _189 : as_type<float>(_2745);
    float _2777 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2779 = _1243 + _2777;
    bool _2781 = !_2597;
    float _2783 = _2781 ? _189 : as_type<float>(_2753);
    float _2785 = _2769 * _2757;
    float _2787 = -_2769;
    float _2789 = _2787 + 1.0;
    bool _2791 = !_2499;
    int _2793 = _2791 ? _2735 : (-1);
    float _2795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2797 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2799 = isnan(_1243);
    bool _2801 = _2797 || _2799;
    bool _2803 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2805 = _2801 || _2803;
    float _2807 = float(_2805);
    int _2809 = _2793 >> 31;
    int _2811 = _2611 * int(_2741);
    int _2813 = _2811 + _2565;
    int _2815 = _2793 & 3;
    bool _2817 = _2815 != 0;
    float _2819 = _2807 * _2789;
    float _2821 = -_2807;
    float _2823 = _2821 + 1.0;
    int _2825 = _2809 & 3;
    float _2827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2829 = float(uint(_2813));
    float _2831 = _2623 * _2823;
    int _2833 = _2793 + _2825;
    float _2835 = fma(_2717, _2779, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2837 = -_2623;
    float _2839 = _2837 + 1.0;
    float _2841 = as_type<float>(_2414) * _2829;
    int _2843 = _2833 >> 2;
    float _2845 = _2719 * _2831;
    float _2847 = _2783 + 0.5;
    float _2849 = _2795 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2851 = _2843 << 4;
    int _2853 = _2851 + 512;
    float _2855 = fma(_2839, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2845);
    float _2857 = _2707 + (-0.5);
    int _2859 = _2793 & 3;
    bool _2861 = _2859 != 0;
    uint _2863 = uint(int(uint(_2853) >> uint(2)));
    uint _2865 = uint(int(uint(int(_2863)) >> uint(2)));
    int _2867 = int(_2863) & 3;
    float _2869 = (*spvDescriptorSet0.vp_c9)._m0[int(_2865)][_2867];
    int _2871 = int(_2863) + 1;
    uint _2873 = uint(int(uint(_2871) >> uint(2)));
    int _2875 = _2871 & 3;
    float _2877 = (*spvDescriptorSet0.vp_c9)._m0[int(_2873)][_2875];
    float _2879 = fma(_2771, _2819, _2855);
    float _2881 = fma(_2847, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1429);
    float _2883 = -_2849;
    float _2885 = -_1355;
    float _2887 = fma(_2883, _2857, _2885);
    float _2889 = -_1523;
    float _2891 = _2889 + 1.0;
    float _2893 = _2827 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2895 = _2775 + 0.5;
    float _2897 = trunc(_2841);
    float _2899 = precise::max(_2897, 0.0);
    uint _2901 = uint(_2899);
    int _2903 = _2853 + 8;
    uint _2905 = uint(int(uint(_2903) >> uint(2)));
    uint _2907 = uint(int(uint(int(_2905)) >> uint(2)));
    int _2909 = int(_2905) & 3;
    float _2911 = (*spvDescriptorSet0.vp_c9)._m0[int(_2907)][_2909];
    int _2913 = int(_2905) + 1;
    uint _2915 = uint(int(uint(_2913) >> uint(2)));
    int _2917 = _2913 & 3;
    float _2919 = (*spvDescriptorSet0.vp_c9)._m0[int(_2915)][_2917];
    bool _2921 = uint(_2859) > 1u;
    float _2923 = fma(_2893, _2895, _1331);
    float _2925 = _2669 + (-0.5);
    bool _2927 = _2859 != 3;
    float _2929 = -_2378;
    float _2931 = fma(_2783, _2929, _2881);
    float _2933 = -_2891;
    float _2935 = fma(_2775, _2933, _2923);
    float _2937 = -_2925;
    float _2939 = -_1529;
    float _2941 = fma(_2937, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2939);
    int _2943 = ~_1369;
    int _2945 = _2943 + 1;
    float _2947 = fma(_2707, _2392, _2887);
    int _2949 = _2817 ? 0 : 1;
    float _2951 = fma(_2669, _2386, _2941);
    bool _2953 = uint(_2859) >= 2u;
    float _2955 = fma(_2835, _2785, _2879);
    int _2957 = ~_2949;
    int _2959 = _2957 + 1;
    int _2961 = _2959 + 1;
    int _2963 = int(_2741) + int(_2901);
    out.m_60.x = _2935;
    out.m_60.y = _2947;
    out.m_60.z = _2931;
    out.m_60.w = _2951;
    int _2965 = _2961;
    if (!_2921)
    {
        int _2967 = ~_2949;
        int _2969 = _2967 + 1;
        _2965 = _2969;
    }
    int _2971 = _2965;
    float _2973 = _2437 * _2343;
    int _2975 = _2953 ? 0 : 1;
    int _2977 = _2945 * _2963;
    int _2979 = _2977 + _2565;
    bool _2981 = !_2861;
    int _2983 = _2981 ? 0 : 1;
    float _2985 = -_2437;
    float _2987 = _2985 + 1.0;
    int _2989 = abs(_2971);
    bool _2991 = uint(_2979) >= uint(_1369);
    int _2993 = ~_2975;
    int _2995 = _2993 + 1;
    int _2997 = _2995 + 1;
    bool _2999 = _2859 != 3;
    float _3001 = fma(_2731, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2955);
    int _3003 = _2997;
    if (_2927)
    {
        int _3005 = ~_2975;
        int _3007 = _3005 + 1;
        _3003 = _3007;
    }
    int _3009 = _3003;
    int _3011 = abs(_2983);
    float _3013 = _3001 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _3015 = !_2999;
    int _3017 = _3015 ? 0 : (-1);
    int _3019 = abs(_3009);
    int _3021 = ~_2989;
    int _3023 = _3021 + 1;
    int _3025 = _3023 + 1;
    int _3027 = abs(_3017);
    int _3029 = ~_3011;
    int _3031 = _3029 + 1;
    int _3033 = _3031 + 1;
    int _3035 = _3025 * as_type<int>(_2877);
    bool _3037 = !_2991;
    int _3039 = _3037 ? 0 : (-1);
    int _3041 = _3033 * as_type<int>(_2869);
    int _3043 = _3041 + _3035;
    int _3045 = ~_3019;
    int _3047 = _3045 + 1;
    int _3049 = _3047 + 1;
    float _3051 = _1207 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3053 = ~_2963;
    int _3055 = _3053 + _3039;
    int _3057 = _3055 + 1;
    float _3059 = _1983 * _2043;
    int _3061 = ~_3027;
    int _3063 = _3061 + 1;
    int _3065 = _3063 + 1;
    int _3067 = _3049 * as_type<int>(_2911);
    int _3069 = _3067 + _3043;
    bool _3071 = !_2545;
    int _3073 = _3071 ? 0 : 1;
    int _3075 = _1369 * _3057;
    int _3077 = _3075 + _2565;
    float _3079 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2406);
    int _3081 = _3065 * as_type<int>(_2919);
    int _3083 = _3081 + _3069;
    int _3085 = abs(_3073);
    float _3087 = _1205 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _3089 = !_2499;
    int _3091 = _3089 ? _3077 : (-1);
    float _3093 = _1203 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3095 = _3087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3097 = _1983 > 0.0;
    bool _3099 = isnan(_1983);
    bool _3101 = _3097 || _3099;
    bool _3103 = isnan(0.0);
    bool _3105 = _3101 || _3103;
    float _3107 = _3093 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3109 = ~_3085;
    int _3111 = _3109 + 1;
    int _3113 = _3111 + 1;
    float _3115 = _3051 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3117 = _3059 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3119 = _2043 <= 0.0;
    bool _3121 = !_3105;
    bool _3123 = _3119 || _3121;
    int _3125 = _3083 * _3113;
    float _3127 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3079);
    out.m_62.x = _3107;
    out.m_62.y = _3095;
    out.m_62.z = _3115;
    out.m_62.w = _3013;
    int _3129 = _3091 * _3085;
    int _3131 = _3129 + _3125;
    float _3133 = _3127 + _2279;
    float _3135 = _3117 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3137 = _2364 * _2973;
    out.gl_Position.x = _2311;
    out.gl_Position.y = _2325;
    out.gl_Position.z = _3127;
    out.gl_Position.w = _2279;
    float _3139 = _3133 * 0.5;
    float _3141 = float(_3131);
    out.m_45.x = _3135;
    float _3143 = _2354 * _2973;
    out.m_64.y = _3141;
    float _3145 = fma(_2360, _3143, _2348);
    float _3147 = fma(_2362, _3143, _2350);
    float _3149 = _2354 * _2987;
    out.m_66.z = _3139;
    out.m_66.w = _2279;
    float _3151 = fma(_2354, _3137, _2352);
    out.m_68.x = _3145;
    out.m_68.y = _3147;
    out.m_68.z = _3151;
    out.m_68.w = _3149;
    if (!_3123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3153 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3153;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1233 = false;
    bool _953 = false;
    bool _849 = false;
    bool _573 = false;
    bool _325 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3210 = as_type<float>(_103);
        out.gl_Position.z = _3210;
    }
    if (!_91)
    {
        return out;
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = _121;
    if (_117)
    {
        float _127 = float(_87);
        _123 = _127;
    }
    float _129 = _123;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
    bool _135 = _131 || _133;
    if (_135)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _97;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3279 = as_type<float>(_141);
        out.gl_Position.z = _3279;
    }
    if (_135)
    {
        return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_52.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    float _165 = in.m_42.x;
    float _167 = in.m_42.y;
    float _169 = in.m_42.z;
    int _171 = as_type<int>(_143) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_143) & 2;
    bool _177 = _175 != 0;
    float _179 = _143;
    if (!_157)
    {
        float _181 = _145 * _145;
        float _183 = _181 * 0.5;
        _179 = _183;
    }
    float _185 = _179;
    bool _187 = !_173;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = _185;
    if (!_157)
    {
        float _193 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _193;
    }
    float _195 = _191;
    bool _197 = !_177;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_157;
    float _203 = _195;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _145 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _145);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _239 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _241 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _243 = _237 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _245 = _237 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _247 = _237 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _249 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[8].x, _243);
    float _251 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[8].y, _245);
    float _253 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[8].z, _247);
    float _255 = _245;
    if (!_157)
    {
        _255 = _145;
    }
    float _257 = _255;
    float _259 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].x, _249);
    bool _261 = !_157;
    float _263 = _257;
    if (!_261)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _145 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _263 = _283;
    }
    float _285 = _263;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _289 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].y, _251);
    float _291 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].z, _253);
    float _293 = fma(_285, _159, _259);
    float _295 = fma(_285, _161, _289);
    float _297 = fma(_285, _163, _291);
    float _299 = fma(_293, _147, _165);
    float _301 = fma(_295, _147, _167);
    float _303 = fma(_297, _147, _169);
    bool _305 = !_287;
    float _323;
    if (!_305)
    {
        float _307 = in.m_54.x;
        float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _311 = _307 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _315 = _313 * _309;
        float _317 = floor(_315);
        float _319 = -_317;
        float _321 = _315 + _319;
        _323 = _321;
        _325 = true;
    }
    else
    {
        float _327 = float(_87);
        float _329 = 1.0 / _327;
        float _331 = _121 * _329;
        _323 = _331;
    }
    _325 = false;
    float _333 = _323;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = _333 + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _333 + _339;
    bool _343 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _345 = isnan(_333);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _371 = 1.0 / _357;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _375 = 1.0 / _361;
    float _377 = 1.0 / _369;
    float _379 = _337 * _371;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _383 = _333 + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = _333 + _385;
    float _389 = 1.0 / _365;
    float _391 = _341 * _375;
    bool _393 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _395 = isnan(_333);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -_353;
    float _407 = _405 + 1.0;
    bool _409 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _411 = isnan(_333);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = _403 * _407;
    float _423 = _383 * _377;
    float _425 = -_403;
    float _427 = _425 + 1.0;
    bool _429 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _431 = isnan(_333);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _449 = _419 * _427;
    float _451 = -_419;
    float _453 = _451 + 1.0;
    bool _455 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _457 = isnan(_333);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = _387 * _389;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _469;
    float _473 = _439 * _453;
    float _475 = -_439;
    float _477 = _475 + 1.0;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _483 = fma(_471, _379, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _485 = fma(_443, _379, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _487 = _465 * _477;
    float _489 = fma(_481, _391, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _491 = fma(_447, _391, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _493 = in.m_52.x;
    float _495 = in.m_52.y;
    float _497 = -_465;
    float _499 = _497 + 1.0;
    float _501 = _483 * _487;
    float _503 = _485 * _487;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _509;
    float _513 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[143].x, _501);
    float _515 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[143].y, _503);
    float _517 = fma(_507, _467, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _519 = fma(_511, _467, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _529 = fma(_489, _473, _513);
    float _531 = fma(_491, _473, _515);
    float _533 = fma(_523, _423, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _535 = fma(_527, _423, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _537 = fma(_517, _449, _529);
    float _539 = fma(_519, _449, _531);
    float _541 = fma(_533, _421, _537);
    float _543 = fma(_535, _421, _539);
    float _545 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[147].x, _541);
    float _547 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[147].y, _543);
    float _549 = _545 * _493;
    float _551 = _547 * _495;
    bool _553 = !_373;
    float _571;
    if (!_553)
    {
        float _555 = in.m_54.x;
        float _557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _559 = _555 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _561 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _563 = _561 * _557;
        float _565 = floor(_563);
        float _567 = -_565;
        float _569 = _563 + _567;
        _571 = _569;
        _573 = true;
    }
    else
    {
        float _575 = float(_87);
        float _577 = 1.0 / _575;
        float _579 = _121 * _577;
        _571 = _579;
    }
    _573 = false;
    float _581 = _571;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _585 = _581 + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _589 = _581 + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _593 = _581 + _591;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _603;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _611 = 1.0 / _605;
    bool _613 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _615 = isnan(_581);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = 1.0 / _601;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _629 = _581 + _627;
    bool _631 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _633 = 1.0 / _609;
    float _635 = _585 * _611;
    bool _637 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _639 = isnan(_581);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = 1.0 / _597;
    float _651 = _629 * _625;
    bool _653 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _655 = isnan(_581);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    bool _665 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _667 = isnan(_581);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -_663;
    float _679 = _677 + 1.0;
    float _681 = _589 * _633;
    bool _683 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _685 = isnan(_581);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = -_675;
    float _697 = _695 + 1.0;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _699;
    float _703 = _647 * _679;
    float _705 = -_647;
    float _707 = _705 + 1.0;
    float _709 = _693 * _697;
    float _711 = fma(_701, _635, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _713 = _593 * _649;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _715;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _719;
    float _723 = -_693;
    float _725 = _723 + 1.0;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _731 = fma(_717, _635, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _733 = fma(_721, _635, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _735 = _675 * _707;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _745 = _623 * _725;
    float _747 = fma(_729, _681, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _749 = fma(_739, _681, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _751 = fma(_743, _681, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _753 = _711 * _745;
    float _755 = _731 * _745;
    float _757 = -_623;
    float _759 = _757 + 1.0;
    float _761 = _733 * _745;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _763;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _767;
    float _771 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[107].x, _753);
    float _773 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[107].y, _755);
    float _775 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[107].z, _761);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _777;
    float _781 = fma(_765, _713, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _783 = fma(_747, _709, _771);
    float _785 = fma(_749, _709, _773);
    float _787 = fma(_751, _709, _775);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _797 = fma(_769, _713, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _799 = fma(_779, _713, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _805 = fma(_781, _735, _783);
    float _807 = fma(_791, _651, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _809 = fma(_795, _651, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _811 = fma(_803, _651, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _813 = fma(_797, _735, _785);
    float _815 = fma(_799, _735, _787);
    float _817 = fma(_807, _703, _805);
    float _819 = fma(_809, _703, _813);
    float _821 = fma(_811, _703, _815);
    float _823 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[111].x, _817);
    float _825 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[111].y, _819);
    float _827 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[111].z, _821);
    bool _829 = !_631;
    float _847;
    if (!_829)
    {
        float _831 = in.m_54.x;
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _835 = _831 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _837 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _839 = _837 * _833;
        float _841 = floor(_839);
        float _843 = -_841;
        float _845 = _839 + _843;
        _847 = _845;
        _849 = true;
    }
    else
    {
        float _851 = float(_87);
        float _853 = 1.0 / _851;
        float _855 = _121 * _853;
        _847 = _855;
    }
    _849 = false;
    float _857 = _847;
    bool _859 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _861 = isnan(_857);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _875 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _877 = isnan(_857);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _887;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _893 = _857 + _891;
    float _895 = -_869;
    float _897 = _895 + 1.0;
    bool _899 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _901 = 1.0 / _873;
    float _903 = _885 * _897;
    float _905 = -_885;
    float _907 = _905 + 1.0;
    float _909 = _889 * _901;
    float _911 = _827 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _913 = fma(_909, _893, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _915 = _825 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _917 = _911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _919 = _913 * _903;
    float _921 = _915 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _923 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[115].x, _919);
    float _925 = _823 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _927 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[116].x, _923);
    float _929 = _925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _931 = _927 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _929;
    out.m_56.y = _921;
    out.m_56.z = _917;
    out.m_56.w = _931;
    bool _933 = !_899;
    float _951;
    if (!_933)
    {
        float _935 = in.m_54.x;
        float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _939 = _935 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _943 = _941 * _937;
        float _945 = floor(_943);
        float _947 = -_945;
        float _949 = _943 + _947;
        _951 = _949;
        _953 = true;
    }
    else
    {
        float _955 = float(_87);
        float _957 = 1.0 / _955;
        float _959 = _121 * _957;
        _951 = _959;
    }
    _953 = false;
    float _961 = _951;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _965 = _961 + _963;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _969 = _961 + _967;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _973 = _961 + _971;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _975;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _981 = _979 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _983;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _991 = 1.0 / _977;
    bool _993 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _995 = isnan(_961);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1001 = _997 || _999;
    float _1003 = float(_1001);
    bool _1005 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1007 = isnan(_961);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1013 = _1009 || _1011;
    float _1015 = float(_1013);
    float _1017 = 1.0 / _985;
    bool _1019 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1021 = 1.0 / _989;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1025 = _961 + _1023;
    float _1027 = _965 * _991;
    bool _1029 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1031 = isnan(_961);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1041;
    float _1045 = 1.0 / _981;
    float _1047 = _969 * _1017;
    float _1049 = -_1039;
    float _1051 = _1049 + 1.0;
    float _1053 = fma(_1043, _1047, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1055 = _973 * _1021;
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1057;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1061;
    float _1065 = fma(_1059, _1047, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1067 = fma(_1063, _1047, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1069 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1071 = isnan(_961);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1077 = _1073 || _1075;
    float _1079 = float(_1077);
    float _1081 = _1025 * _1045;
    bool _1083 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1085 = isnan(_961);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = -_1003;
    float _1097 = _1095 + 1.0;
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1101 = _1099 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1103 = _1015 * _1051;
    float _1105 = -_1015;
    float _1107 = _1105 + 1.0;
    float _1109 = _1093 * _1097;
    float _1111 = -_1093;
    float _1113 = _1111 + 1.0;
    float _1115 = fma(_1101, _1055, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1117 = _1079 * _1107;
    float _1119 = -_1079;
    float _1121 = _1119 + 1.0;
    float _1123 = _1039 * _1113;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1131 = _1129 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1133 = _1065 * _1117;
    float _1135 = fma(_1127, _1055, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1137 = fma(_1131, _1055, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1139 = _1067 * _1117;
    float _1141 = _1053 * _1117;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1143;
    float _1147 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1133);
    float _1149 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1139);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1151;
    float _1155 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1141);
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1157;
    float _1161 = fma(_1145, _1027, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1163 = fma(_1115, _1103, _1147);
    float _1165 = fma(_1135, _1103, _1149);
    float _1167 = fma(_1153, _1027, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1169 = fma(_1137, _1103, _1155);
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1173 = _1171 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1177 = _1175 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1179 = fma(_1159, _1027, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1183 = _1181 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1185 = fma(_1161, _1123, _1163);
    float _1187 = fma(_1173, _1081, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1189 = fma(_1177, _1081, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1191 = fma(_1167, _1123, _1165);
    float _1193 = fma(_1183, _1081, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1195 = fma(_1179, _1123, _1169);
    float _1197 = fma(_1187, _1109, _1185);
    float _1199 = fma(_1189, _1109, _1191);
    float _1201 = fma(_1193, _1109, _1195);
    float _1203 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1197);
    float _1205 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1199);
    float _1207 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1201);
    bool _1209 = !_1019;
    float _1229;
    float _1231;
    if (!_1209)
    {
        float _1211 = in.m_54.x;
        float _1213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1215 = float(_87);
        float _1217 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1219 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _1221 = _1219 * _1213;
        float _1223 = floor(_1221);
        float _1225 = -_1223;
        float _1227 = _1221 + _1225;
        _1229 = _1215;
        _1231 = _1227;
        _1233 = true;
    }
    else
    {
        float _1235 = float(_87);
        float _1237 = 1.0 / _1235;
        float _1239 = _121 * _1237;
        _1229 = _1235;
        _1231 = _1239;
    }
    _1233 = false;
    float _1241 = _1229;
    float _1243 = _1231;
    float _1245 = in.m_54.x;
    float _1247 = in.m_54.y;
    float _1249 = in.m_54.z;
    float _1251 = in.m_54.w;
    float _1253 = _551 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1257 = _1255 != 0;
    int _1259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1261 = _1259 != 0;
    int _1263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1265 = _1263 != 0;
    float _1267 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1275 = _1245 * 2.0;
    float _1277 = _1247 * 2.0;
    float _1279 = _1249 * 2.0;
    float _1281 = _1247 + _1245;
    float _1283 = floor(_1275);
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1289 = _1281 + (-1.0);
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1293 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1295 = floor(_1279);
    float _1297 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1299 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1291);
    bool _1301 = !_1265;
    int _1303 = _1301 ? 0 : 1;
    float _1305 = -_1271;
    float _1307 = fma(_1297, 2.0, _1305);
    bool _1309 = _1283 > 0.0;
    float _1311 = floor(_1277);
    bool _1313 = _1283 >= 0.0;
    bool _1315 = isnan(_1283);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan(0.0);
    bool _1321 = _1317 || _1319;
    float _1323 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1325 = !_1257;
    int _1327 = _1325 ? 0 : 1;
    float _1329 = -_121;
    float _1331 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1307);
    int _1333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1335 = _1333 != 0;
    float _1337 = fma(_1323, -2.0, _1267);
    bool _1339 = _1295 >= 0.0;
    bool _1341 = isnan(_1295);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan(0.0);
    bool _1347 = _1343 || _1345;
    float _1349 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1351 = int(_1349);
    int _1353 = _1321 ? 0 : 1;
    float _1355 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1337);
    int _1357 = _1347 ? 0 : 1;
    bool _1359 = _1295 > 0.0;
    int _1361 = ~_1357;
    int _1363 = _1361 + 1;
    int _1365 = _1363 + 1;
    float _1367 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1369 = int(_1367);
    bool _1371 = _1311 > 0.0;
    float _1373 = _1289;
    float _1375 = _1297;
    int _1377 = _1365;
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (!_1335)
    {
        _1373 = _1247;
    }
    float _1381 = _1373;
    float _1383 = _1381;
    if (_1335)
    {
        _1383 = _1245;
    }
    float _1385 = _1383;
    bool _1387 = _1311 >= 0.0;
    bool _1389 = isnan(_1311);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan(0.0);
    bool _1395 = _1391 || _1393;
    if (!_1335)
    {
        _1375 = _1249;
    }
    float _1397 = _1375;
    float _1399 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1401 = fma(_1385, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1269);
    float _1403 = _1397;
    if (_1335)
    {
        _1403 = _1247;
    }
    float _1405 = _1403;
    float _1407 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1409 = log2(_1407);
    float _1411 = -_1285;
    float _1413 = fma(_1399, 2.0, _1411);
    float _1415 = _1405;
    if (!_1359)
    {
        int _1417 = ~_1357;
        int _1419 = _1417 + 1;
        _1377 = _1419;
    }
    int _1421 = _1377;
    float _1423 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1273);
    if (!_1335)
    {
        _1415 = _1249;
    }
    float _1425 = _1415;
    float _1427 = -_121;
    float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1413);
    float _1431 = _1425;
    if (_1335)
    {
        _1431 = _1247;
    }
    float _1433 = _1431;
    float _1435 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1423);
    float _1437 = float(_1351);
    int _1439 = _1395 ? 0 : 1;
    float _1441 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1443 = abs(_1327);
    float _1445 = 1.0 / _1437;
    int _1447 = ~_1439;
    int _1449 = _1447 + 1;
    int _1451 = _1449 + 1;
    float _1453 = _1409 * _121;
    float _1455 = fma(_1441, -2.0, _1287);
    int _1457 = _1451;
    if (!_1371)
    {
        int _1459 = ~_1439;
        int _1461 = _1459 + 1;
        _1457 = _1461;
    }
    int _1463 = _1457;
    float _1465 = in.m_58.x;
    float _1467 = in.m_58.y;
    float _1469 = in.m_58.z;
    float _1471 = float(_1443);
    float _1473 = exp2(_1453);
    float _1475 = float(_1421);
    bool _1477 = !_1261;
    int _1479 = _1477 ? 0 : 1;
    float _1481 = _1471 * _1475;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1485 = ~_1353;
    int _1487 = _1485 + 1;
    int _1489 = _1487 + 1;
    float _1491 = _1445 * _121;
    int _1493 = abs(_1479);
    float _1495 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1497 = 1.0 + _1495;
    int _1499 = _1489;
    if (!_1309)
    {
        int _1501 = ~_1353;
        int _1503 = _1501 + 1;
        _1499 = _1503;
    }
    int _1505 = _1499;
    float _1507 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1483);
    bool _1509 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1511 = isnan(0.0);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1517 = _1513 || _1515;
    float _1519 = -_1473;
    float _1521 = _1519 + 1.0;
    float _1523 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1299);
    float _1525 = 1.0 / _1497;
    float _1527 = _1481 * (-2.0);
    float _1529 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1455);
    float _1531 = float(_1505);
    float _1533 = _1245 + (-0.5);
    float _1535 = fma(_1527, _1465, _1465);
    float _1537 = fma(_1293, _1527, _1293);
    int _1539 = abs(_1303);
    float _1541 = _1247 + _1249;
    float _1543 = _1517 ? _1521 : 0.0;
    float _1545 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1401);
    float _1547 = float(_1493);
    float _1549 = _1541 + (-1.0);
    bool _1551 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1553 = isnan(1.0);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1559 = _1555 || _1557;
    float _1561 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1535);
    float _1563 = float(_1539);
    float _1565 = _1547 * _1531;
    float _1567 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1507);
    float _1569 = float(_1463);
    float _1571 = _1565 * (-2.0);
    float _1573 = float(_1369);
    float _1575 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1577 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1579 = isnan(0.5);
    bool _1581 = _1577 || _1579;
    bool _1583 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1585 = _1581 || _1583;
    float _1587 = _1563 * _1569;
    float _1589 = _1247 + (-0.5);
    float _1591 = fma(_1571, _1467, _1467);
    float _1593 = _1249 + _1245;
    float _1595 = _1573 * _121;
    float _1597 = fma(_1575, _1571, _1575);
    if (_1559)
    {
        float _1599 = _1543 * _1525;
        _125 = _1599;
    }
    float _1601 = _125;
    float _1603 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1591);
    float _1605 = _1587 * (-2.0);
    float _1607 = _1593 + (-1.0);
    float _1609 = fma(_1597, _1601, _1603);
    float _1611 = fma(_1537, _1601, _1561);
    float _1613 = fma(_1605, _1469, _1469);
    float _1615 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1617 = _1249 + (-0.5);
    float _1619 = _1611 * 0.15915493667125701904296875;
    float _1621 = _1609 * 0.15915493667125701904296875;
    float _1623 = fma(_1615, _1605, _1615);
    float _1625 = fma(_1617, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1613);
    float _1627 = _1619 * 6.283185482025146484375;
    float _1629 = sin(_1627);
    float _1631 = _549 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1633 = _301 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1635 = fma(_1623, _1601, _1625);
    float _1637 = _301 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1639 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1641 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1633);
    float _1643 = _1635 * 0.15915493667125701904296875;
    float _1645 = _1619 * 6.283185482025146484375;
    float _1647 = cos(_1645);
    float _1649 = _301 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1651 = _1631 * _1639;
    float _1653 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1637);
    float _1655 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1641);
    float _1657 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1649);
    float _1659 = _1643 * 6.283185482025146484375;
    float _1661 = cos(_1659);
    float _1663 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1665 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1657);
    float _1667 = _1253 * _1663;
    float _1669 = _1665 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1671 = _1621 * 6.283185482025146484375;
    float _1673 = sin(_1671);
    float _1675 = _1621 * 6.283185482025146484375;
    float _1677 = cos(_1675);
    float _1679 = _1661 * _1667;
    float _1681 = _1647 * _1679;
    float _1683 = _1629 * _1679;
    float _1685 = _1643 * 6.283185482025146484375;
    float _1687 = sin(_1685);
    float _1689 = _1629 * _1673;
    float _1691 = _1647 * _1673;
    float _1693 = _1673 * _1661;
    float _1695 = _1655 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1697 = _1647 * _1677;
    float _1699 = _1629 * _1677;
    float _1701 = _1677 * _1661;
    float _1703 = fma(_1687, _1697, _1689);
    float _1705 = -_1691;
    float _1707 = fma(_1687, _1699, _1705);
    float _1709 = -_1699;
    float _1711 = fma(_1687, _1691, _1709);
    float _1713 = -_1667;
    float _1715 = _1687 * _1713;
    float _1717 = fma(_1703, _1651, _1681);
    float _1719 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1721 = fma(_1687, _1689, _1697);
    float _1723 = fma(_1701, _1651, _1715);
    float _1725 = fma(_1707, _1651, _1683);
    float _1727 = fma(_1711, _1719, _1717);
    float _1729 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1653);
    float _1731 = fma(_1693, _1719, _1723);
    float _1733 = fma(_1721, _1719, _1725);
    float _1735 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1737 = _1729 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1739 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1741 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1743 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1735);
    float _1745 = _1737 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1747 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1739);
    float _1749 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1741);
    float _1751 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1743);
    float _1753 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1745);
    float _1755 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1747);
    float _1757 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1759 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1753);
    float _1761 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1763 = _1737 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1765 = _1695 + _1757;
    float _1767 = _1759 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1769 = _1669 + _1761;
    float _1771 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1763);
    float _1773 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1775 = _1765 + _1773;
    float _1777 = 1.0 / _1767;
    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1781 = _1769 + _1779;
    float _1783 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1771);
    float _1785 = _1775 * _1775;
    float _1787 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1749);
    float _1789 = _1783 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1791 = fma(_1781, _1781, _1785);
    float _1793 = _1787 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1795 = _1789 + _1767;
    float _1797 = sqrt(_1791);
    float _1799 = _1737 + _1793;
    float _1801 = _1767;
    float _1803 = _1733;
    float _1805 = _1793;
    float _1807 = _1669;
    float _1809 = _1651;
    if (_1585)
    {
        _1801 = 1.0;
    }
    float _1811 = _1801;
    float _1813 = _1795 * _1777;
    float _1815 = _1813 * 0.5;
    float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1819 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1817);
    float _1821 = 1.0 / _1819;
    bool _1823 = _1797 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1827 = _1825 != 0;
    int _1829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1831 = _1829 != 0;
    int _1833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1835 = _1833 != 0;
    int _1837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1839 = _1837 != 0;
    bool _1841 = !_1831;
    int _1843 = _1841 ? 0 : 1;
    bool _1845 = !_1827;
    int _1847 = _1845 ? 0 : 1;
    bool _1849 = !_1835;
    int _1851 = _1849 ? 0 : 1;
    bool _1853 = !_1839;
    int _1855 = _1853 ? 0 : 1;
    float _1857 = _1797;
    float _1859 = _1819;
    float _1861 = _1811;
    float _1863 = _1777;
    if (!_1823)
    {
        _1803 = _1769;
    }
    float _1865 = _1803;
    float _1867 = _1865;
    if (!_1823)
    {
        _1805 = _1765;
    }
    float _1869 = _1805;
    float _1871 = _1869;
    if (!_1823)
    {
        _1379 = _1799;
    }
    float _1873 = _1379;
    bool _1875 = !_1823;
    float _1877 = _1873;
    if (!_1875)
    {
        float _1879 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1883 = _1797 + _1881;
        float _1885 = _1799 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1887 = rsqrt(_1791);
        float _1889 = _1883 * _1879;
        float _1891 = _1889 * 0.15915493667125701904296875;
        float _1893 = _1891 * 6.283185482025146484375;
        float _1895 = cos(_1893);
        float _1897 = _1891 * 6.283185482025146484375;
        float _1899 = sin(_1897);
        float _1901 = _1895 + (-1.0);
        float _1903 = _1901 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1905 = fma(_1899, _1885, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1907 = fma(_1799, _1895, _1903);
        float _1909 = _1887 * _1905;
        float _1911 = fma(_1781, _1909, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1913 = fma(_1775, _1909, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1857 = _1883;
        _1877 = _1907;
        _1867 = _1911;
        _1871 = _1913;
    }
    float _1915 = _1857;
    float _1917 = _1877;
    float _1919 = _1867;
    float _1921 = _1871;
    float _1923 = _1915;
    if (_1585)
    {
        _1859 = 1.0;
    }
    float _1925 = _1859;
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1929 = _1821 * _1927;
    float _1931 = _1925;
    if (!_1585)
    {
        float _1933 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1935 = _1933 * 0.15915493667125701904296875;
        float _1937 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1939 = _1935 * 6.283185482025146484375;
        float _1941 = cos(_1939);
        float _1943 = _1937 * 0.15915493667125701904296875;
        float _1945 = _1935 * 6.283185482025146484375;
        float _1947 = sin(_1945);
        float _1949 = 1.0 / _1941;
        float _1951 = _1943 * 6.283185482025146484375;
        float _1953 = cos(_1951);
        float _1955 = _1947 * _1949;
        float _1957 = _1943 * 6.283185482025146484375;
        float _1959 = sin(_1957);
        float _1961 = _1953 * _1955;
        float _1963 = 1.0 / _1961;
        float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1967 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1965;
        float _1969 = 1.0 / _1967;
        float _1971 = _1959 * _1963;
        float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1975 = fma(_1929, _1971, _1973);
        float _1977 = _1975 * _1969;
        float _1979 = precise::clamp(_1977, 0.0, 1.0);
        _1923 = _1935;
        _1861 = _1979;
    }
    float _1981 = _1923;
    float _1983 = _1861;
    float _1985 = _1981;
    if (!_1585)
    {
        float _1987 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1989 = _1987 * 0.15915493667125701904296875;
        float _1991 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1993 = _1989 * 6.283185482025146484375;
        float _1995 = cos(_1993);
        float _1997 = _1991 * 0.15915493667125701904296875;
        float _1999 = _1989 * 6.283185482025146484375;
        float _2001 = sin(_1999);
        float _2003 = 1.0 / _1995;
        float _2005 = _1997 * 6.283185482025146484375;
        float _2007 = cos(_2005);
        float _2009 = _2001 * _2003;
        float _2011 = _1997 * 6.283185482025146484375;
        float _2013 = sin(_2011);
        float _2015 = _2007 * _2009;
        float _2017 = 1.0 / _2015;
        float _2019 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2021 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2019;
        float _2023 = 1.0 / _2021;
        float _2025 = _2013 * _2017;
        float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2029 = fma(_1929, _2025, _2027);
        float _2031 = _2029 * _2023;
        float _2033 = precise::clamp(_2031, 0.0, 1.0);
        float _2035 = -_2033;
        float _2037 = _2035 + 1.0;
        _1985 = _2003;
        _1863 = _2017;
        _1931 = _2037;
    }
    float _2039 = _1985;
    float _2041 = _1863;
    float _2043 = _1931;
    float _2045 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2047 = _1917 + _2045;
    float _2049 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2051 = _1919 + _2049;
    float _2053 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2055 = _1921 + _2053;
    float _2057 = _2047 * _2047;
    float _2059 = fma(_2051, _2051, _2057);
    float _2061 = fma(_2055, _2055, _2059);
    float _2063 = rsqrt(_2061);
    float _2065 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2067 = _2051 * _2065;
    float _2069 = _2055 * _2065;
    float _2071 = _2067 * _2067;
    float _2073 = _2069 * _2069;
    float _2075 = _2071 + _2073;
    float _2077 = sqrt(_2075);
    bool _2079 = _2077 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2083 = _2077 + _2081;
    float _2085 = _2039;
    float _2087 = _2075;
    float _2089 = _2083;
    float _2091 = _2047;
    float _2093 = _2067;
    float _2095 = _2069;
    float _2097 = _2071;
    float _2099 = _2073;
    if (_2079)
    {
        float _2101 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2085 = _2101;
    }
    float _2103 = _2085;
    if (_2079)
    {
        float _2105 = rsqrt(_2075);
        _2087 = _2105;
    }
    float _2107 = _2087;
    if (_2079)
    {
        float _2109 = _2083 * _2103;
        _2089 = _2109;
    }
    float _2111 = _2089;
    if (_2079)
    {
        float _2113 = _2111 * 0.15915493667125701904296875;
        _1807 = _2113;
    }
    float _2115 = _1807;
    float _2117 = _2041;
    if (_2079)
    {
        float _2119 = _2115 * 6.283185482025146484375;
        float _2121 = sin(_2119);
        _2117 = _2121;
    }
    float _2123 = _2117;
    float _2125 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2127 = precise::max(0.0, _2125);
    float _2129 = _2103;
    float _2131 = _2127;
    if (_2079)
    {
        float _2133 = _2115 * 6.283185482025146484375;
        float _2135 = cos(_2133);
        _2129 = _2135;
    }
    float _2137 = _2129;
    float _2139 = -_2065;
    float _2141 = -_2127;
    float _2143 = fma(_2047, _2139, _2141);
    if (_2079)
    {
        float _2145 = _2143 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2131 = _2145;
    }
    float _2147 = _2131;
    float _2149 = _2147;
    if (_2079)
    {
        float _2151 = fma(_2123, _2147, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2091 = _2151;
    }
    float _2153 = _2091;
    float _2155 = sqrt(_2061);
    float _2157 = _2153;
    if (_2079)
    {
        float _2159 = _2137 + (-1.0);
        _2149 = _2159;
    }
    float _2161 = _2149;
    float _2163 = _2161;
    if (_2079)
    {
        float _2165 = _2107 * _2153;
        _1809 = _2165;
    }
    float _2167 = _1809;
    if (!_2079)
    {
        _2157 = _2143;
    }
    float _2169 = _2157;
    float _2171 = _2169;
    if (_2079)
    {
        float _2173 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2163 = _2173;
    }
    float _2175 = _2163;
    if (_2079)
    {
        float _2177 = _2067 * _2167;
        _2093 = _2177;
    }
    float _2179 = _2093;
    if (_2079)
    {
        float _2181 = _2069 * _2167;
        _2095 = _2181;
    }
    float _2183 = _2095;
    if (_2079)
    {
        float _2185 = fma(_2143, _2137, _2175);
        _2171 = _2185;
    }
    float _2187 = _2171;
    if (_2079)
    {
        float _2189 = _2179 * _2179;
        _2097 = _2189;
    }
    float _2191 = _2097;
    if (_2079)
    {
        float _2193 = _2183 * _2183;
        _2099 = _2193;
    }
    float _2195 = _2099;
    float _2197 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2199 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2201 = fma(_2187, _2187, _2191);
    float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2205 = fma(_2155, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2203);
    float _2207 = precise::clamp(_2205, 0.0, 1.0);
    float _2209 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2211 = _2201 + _2195;
    float _2213 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2197);
    float _2215 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2217 = -_2207;
    float _2219 = _2217 + 1.0;
    float _2221 = rsqrt(_2211);
    float _2223 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2213);
    float _2225 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2215);
    float _2227 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2229 = _2223 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2231 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2209);
    float _2233 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2225);
    float _2235 = abs(_2219);
    float _2237 = log2(_2235);
    float _2239 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2227);
    float _2241 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2231);
    float _2243 = _2233 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2245 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2247 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2239);
    float _2249 = _2241 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2251 = _2243 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2253 = _2221 * _2179;
    float _2255 = _2221 * _2187;
    float _2257 = _2221 * _2183;
    float _2259 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2251);
    float _2261 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2263 = _2247 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2265 = -_2245;
    float _2267 = fma(_2265, _2199, 1.0);
    float _2269 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2259);
    float _2271 = -_2261;
    float _2273 = fma(_2255, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2271);
    float _2275 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2277 = log2(_2267);
    float _2279 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2269);
    float _2281 = -_2257;
    float _2283 = fma(_2281, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2273);
    float _2285 = _2243 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2287 = _2243 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2289 = fma(_2283, -0.5, 0.5);
    float _2291 = _2255 + 1.0;
    float _2293 = exp2(_2275);
    float _2295 = fma(_2283, 0.5, 0.5);
    float _2297 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2285);
    float _2299 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2287);
    float _2301 = fma(_2295, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2303 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2297);
    float _2305 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2299);
    float _2307 = 1.0 / _2279;
    float _2309 = fma(_2295, _2301, -0.212114393711090087890625);
    float _2311 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2303);
    float _2313 = _2277 * 0.693147182464599609375;
    float _2315 = fma(_2295, _2309, 1.570728778839111328125);
    float _2317 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2319 = sqrt(_2289);
    float _2321 = -_2255;
    float _2323 = fma(_2293, _2291, _2321);
    float _2325 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2305);
    float _2327 = fma(_2323, 0.5, 0.5);
    float _2329 = _2311 * _2307;
    float _2331 = _2325 * _2307;
    float _2333 = fma(_2329, 0.5, 0.5);
    float _2335 = fma(_2331, -0.5, 0.5);
    float _2337 = _2319 * 0.636619746685028076171875;
    float _2339 = -_2315;
    float _2341 = fma(_2337, _2339, 1.0);
    float3 _6772 = float3(_2333, _2335, _2317);
    float _2343 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6772, float3(0.0), isnan(_6772)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6772, float3(0.0), isnan(_6772)), level(0.0)).x;
    float3 _6783 = float3(_2333, _2335, _2317);
    float4 _2346 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6783, float3(0.0), isnan(_6783)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6783, float3(0.0), isnan(_6783)), level(0.0)).xyzw;
    float _2348 = _2346.x;
    float _2350 = _2346.y;
    float _2352 = _2346.z;
    float _2354 = _2346.w;
    float2 _6800 = float2(_2341, _2327);
    float3 _2358 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6800, float2(0.0), isnan(_6800)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6800, float2(0.0), isnan(_6800)), level(0.0)).xyz;
    float _2360 = _2358.x;
    float _2362 = _2358.y;
    float _2364 = _2358.z;
    float _2366 = float(uint(_1369));
    float _2368 = trunc(_1491);
    int _2370 = int(_2368);
    int _2372 = ~_1369;
    int _2374 = _2372 + 1;
    float _2376 = -_1545;
    float _2378 = _2376 + 1.0;
    int _2380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2382 = _2380 != 0;
    float _2384 = -_1435;
    float _2386 = _2384 + 1.0;
    int _2388 = abs(_1843);
    float _2390 = -_1567;
    float _2392 = _2390 + 1.0;
    int _2394 = abs(_1847);
    float _2396 = 1.0 / _2366;
    int _2398 = abs(_1851);
    float _2400 = _2243 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2402 = _1251 > 0.5;
    float _2404 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2406 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2400);
    float _2408 = float(uint(_2370));
    float _2410 = 1.0 / _1241;
    float _2412 = float(_2370);
    int _2414 = as_type<int>(_2396) + (-2);
    float _2416 = exp2(_2404);
    float _2418 = as_type<float>(_2414) * _2408;
    float _2420 = trunc(_2418);
    float _2422 = precise::max(_2420, 0.0);
    uint _2425 = uint(_2422);
    float _2427 = _1595 * _2410;
    float _2429 = -_2416;
    float _2431 = _2429 + 1.0;
    int _2433 = ~_1369;
    int _2435 = _2433 + 1;
    float _2437 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2439 = _2374 * int(_2425);
    int _2441 = _2439 + _2370;
    float _2443 = float(uint(_2441));
    bool _2445 = !_2382;
    float _2447 = _2445 ? _1247 : _1245;
    float _2449 = as_type<float>(_2414) * _2443;
    bool _2451 = !_2382;
    float _2453 = _2451 ? 1.2345600128173828125 : 1.0;
    float _2455 = trunc(_2449);
    float _2457 = precise::max(_2455, 0.0);
    uint _2459 = uint(_2457);
    float _2461 = _2447 * _2453;
    bool _2463 = _2412 >= _1573;
    bool _2465 = isnan(_2412);
    bool _2467 = _2463 || _2465;
    bool _2469 = isnan(_1573);
    bool _2471 = _2467 || _2469;
    float _2473 = float(_2471);
    int _2475 = _1369 + (-1);
    float _2477 = floor(_2461);
    int _2479 = int(_2425) + int(_2459);
    float _2481 = trunc(_2473);
    int _2483 = int(_2481);
    int _2485 = _2435 * _2479;
    int _2487 = _2485 + _2370;
    float _2489 = -_2477;
    float _2491 = _2461 + _2489;
    bool _2493 = uint(_2487) >= uint(_1369);
    bool _2495 = !_2493;
    int _2497 = _2495 ? 0 : (-1);
    bool _2499 = _1369 == 0;
    int _2501 = ~_2479;
    int _2503 = _2501 + _2497;
    int _2505 = _2503 + 1;
    float _2507 = _2491 * _1573;
    float _2509 = trunc(_2427);
    int _2511 = int(_2509);
    int _2513 = ~_2483;
    int _2515 = _2513 + 1;
    int _2517 = _2515 + 1;
    int _2519 = _1369 * _2505;
    int _2521 = _2519 + _2370;
    int _2523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2525 = _2523 != 0;
    int _2527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2529 = _2527 != 0;
    bool _2531 = !_2499;
    int _2533 = _2531 ? _2521 : (-1);
    float _2535 = trunc(_2507);
    int _2537 = int(_2535);
    bool _2539 = !_2525;
    int _2541 = _2539 ? 0 : 1;
    int _2543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2545 = _2543 != 0;
    int _2547 = _2533 * _2517;
    int _2549 = abs(_2541);
    int _2551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2553 = _2551 != 0;
    int _2555 = _2483 * _2475;
    int _2557 = _2555 + _2547;
    int _2559 = _2557 * _2388;
    int _2561 = abs(_1855);
    int _2563 = _2537 * _2549;
    int _2565 = _2563 + _2370;
    int _2567 = _2511 * _2394;
    int _2569 = _2567 + _2559;
    int _2571 = ~_1369;
    int _2573 = _2571 + 1;
    int _2575 = _2565 * _2398;
    int _2577 = _2575 + _2569;
    float _2579 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2581 = _2579 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2583 = -_199;
    int _2585 = _2402 ? as_type<int>(_2583) : as_type<int>(_199);
    int _2587 = _2537 * _2561;
    int _2589 = _2587 + _2577;
    int _2591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2593 = _2591 != 0;
    int _2595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2597 = _2595 != 0;
    float _2599 = float(uint(_2589));
    float _2601 = float(uint(_2565));
    float _2603 = as_type<float>(_2414) * _2599;
    int _2605 = ~_1369;
    int _2607 = _2605 + 1;
    int _2609 = ~_1369;
    int _2611 = _2609 + 1;
    bool _2613 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2615 = isnan(_1243);
    bool _2617 = _2613 || _2615;
    bool _2619 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2621 = _2617 || _2619;
    float _2623 = float(_2621);
    float _2625 = trunc(_2603);
    float _2627 = precise::max(_2625, 0.0);
    uint _2629 = uint(_2627);
    int _2631 = _2607 * int(_2629);
    int _2633 = _2631 + _2589;
    float _2635 = float(uint(_2633));
    float _2637 = as_type<float>(_2414) * _2635;
    float _2639 = trunc(_2637);
    float _2641 = precise::max(_2639, 0.0);
    uint _2643 = uint(_2641);
    float _2645 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2647 = _2645 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2649 = 1.0 / _2647;
    int _2651 = int(_2629) + int(_2643);
    float _2653 = 1.0 / _2581;
    float _2655 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2657 = _2655 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2659 = _2573 * _2651;
    int _2661 = _2659 + _2589;
    float _2663 = 1.0 / _2657;
    bool _2665 = uint(_2661) >= uint(_1369);
    bool _2667 = !_2529;
    float _2669 = _2667 ? _199 : as_type<float>(_2585);
    bool _2671 = _1247 > 0.5;
    float _2673 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2675 = _2673 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2677 = !_2665;
    int _2679 = _2677 ? 0 : (-1);
    bool _2681 = _1245 > 0.5;
    float _2683 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2683;
    float _2687 = -_199;
    int _2689 = _2671 ? as_type<int>(_2687) : as_type<int>(_199);
    float _2691 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2693 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2691;
    int _2695 = ~_2651;
    int _2697 = _2695 + _2679;
    int _2699 = _2697 + 1;
    float _2701 = _2685 * _2649;
    float _2703 = _2675 * _2653;
    bool _2705 = !_2593;
    float _2707 = _2705 ? _199 : as_type<float>(_2689);
    float _2709 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2711 = _1243 + _2709;
    float _2713 = as_type<float>(_2414) * _2601;
    bool _2715 = _1249 > 0.5;
    float _2717 = _2693 * _2663;
    float _2719 = fma(_2701, _2711, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2721 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2723 = isnan(_1243);
    bool _2725 = _2721 || _2723;
    bool _2727 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2729 = _2725 || _2727;
    float _2731 = float(_2729);
    int _2733 = _1369 * _2699;
    int _2735 = _2733 + _2589;
    float _2737 = trunc(_2713);
    float _2739 = precise::max(_2737, 0.0);
    uint _2741 = uint(_2739);
    float _2743 = -_189;
    int _2745 = _2681 ? as_type<int>(_2743) : as_type<int>(_189);
    float _2747 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2749 = _1243 + _2747;
    float _2751 = -_189;
    int _2753 = _2715 ? as_type<int>(_2751) : as_type<int>(_189);
    float _2755 = -_2731;
    float _2757 = _2755 + 1.0;
    bool _2759 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2761 = isnan(_1243);
    bool _2763 = _2759 || _2761;
    bool _2765 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2767 = _2763 || _2765;
    float _2769 = float(_2767);
    float _2771 = fma(_2703, _2749, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2773 = !_2553;
    float _2775 = _2773 ? _189 : as_type<float>(_2745);
    float _2777 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2779 = _1243 + _2777;
    bool _2781 = !_2597;
    float _2783 = _2781 ? _189 : as_type<float>(_2753);
    float _2785 = _2769 * _2757;
    float _2787 = -_2769;
    float _2789 = _2787 + 1.0;
    bool _2791 = !_2499;
    int _2793 = _2791 ? _2735 : (-1);
    float _2795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2797 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2799 = isnan(_1243);
    bool _2801 = _2797 || _2799;
    bool _2803 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2805 = _2801 || _2803;
    float _2807 = float(_2805);
    int _2809 = _2793 >> 31;
    int _2811 = _2611 * int(_2741);
    int _2813 = _2811 + _2565;
    int _2815 = _2793 & 3;
    bool _2817 = _2815 != 0;
    float _2819 = _2807 * _2789;
    float _2821 = -_2807;
    float _2823 = _2821 + 1.0;
    int _2825 = _2809 & 3;
    float _2827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2829 = float(uint(_2813));
    float _2831 = _2623 * _2823;
    int _2833 = _2793 + _2825;
    float _2835 = fma(_2717, _2779, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2837 = -_2623;
    float _2839 = _2837 + 1.0;
    float _2841 = as_type<float>(_2414) * _2829;
    int _2843 = _2833 >> 2;
    float _2845 = _2719 * _2831;
    float _2847 = _2783 + 0.5;
    float _2849 = _2795 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2851 = _2843 << 4;
    int _2853 = _2851 + 512;
    float _2855 = fma(_2839, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2845);
    float _2857 = _2707 + (-0.5);
    int _2859 = _2793 & 3;
    bool _2861 = _2859 != 0;
    uint _2863 = uint(int(uint(_2853) >> uint(2)));
    uint _2865 = uint(int(uint(int(_2863)) >> uint(2)));
    int _2867 = int(_2863) & 3;
    float _2869 = (*spvDescriptorSet0.vp_c9)._m0[int(_2865)][_2867];
    int _2871 = int(_2863) + 1;
    uint _2873 = uint(int(uint(_2871) >> uint(2)));
    int _2875 = _2871 & 3;
    float _2877 = (*spvDescriptorSet0.vp_c9)._m0[int(_2873)][_2875];
    float _2879 = fma(_2771, _2819, _2855);
    float _2881 = fma(_2847, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1429);
    float _2883 = -_2849;
    float _2885 = -_1355;
    float _2887 = fma(_2883, _2857, _2885);
    float _2889 = -_1523;
    float _2891 = _2889 + 1.0;
    float _2893 = _2827 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2895 = _2775 + 0.5;
    float _2897 = trunc(_2841);
    float _2899 = precise::max(_2897, 0.0);
    uint _2901 = uint(_2899);
    int _2903 = _2853 + 8;
    uint _2905 = uint(int(uint(_2903) >> uint(2)));
    uint _2907 = uint(int(uint(int(_2905)) >> uint(2)));
    int _2909 = int(_2905) & 3;
    float _2911 = (*spvDescriptorSet0.vp_c9)._m0[int(_2907)][_2909];
    int _2913 = int(_2905) + 1;
    uint _2915 = uint(int(uint(_2913) >> uint(2)));
    int _2917 = _2913 & 3;
    float _2919 = (*spvDescriptorSet0.vp_c9)._m0[int(_2915)][_2917];
    bool _2921 = uint(_2859) > 1u;
    float _2923 = fma(_2893, _2895, _1331);
    float _2925 = _2669 + (-0.5);
    bool _2927 = _2859 != 3;
    float _2929 = -_2378;
    float _2931 = fma(_2783, _2929, _2881);
    float _2933 = -_2891;
    float _2935 = fma(_2775, _2933, _2923);
    float _2937 = -_2925;
    float _2939 = -_1529;
    float _2941 = fma(_2937, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2939);
    int _2943 = ~_1369;
    int _2945 = _2943 + 1;
    float _2947 = fma(_2707, _2392, _2887);
    int _2949 = _2817 ? 0 : 1;
    float _2951 = fma(_2669, _2386, _2941);
    bool _2953 = uint(_2859) >= 2u;
    float _2955 = fma(_2835, _2785, _2879);
    int _2957 = ~_2949;
    int _2959 = _2957 + 1;
    int _2961 = _2959 + 1;
    int _2963 = int(_2741) + int(_2901);
    out.m_60.x = _2935;
    out.m_60.y = _2947;
    out.m_60.z = _2931;
    out.m_60.w = _2951;
    int _2965 = _2961;
    if (!_2921)
    {
        int _2967 = ~_2949;
        int _2969 = _2967 + 1;
        _2965 = _2969;
    }
    int _2971 = _2965;
    float _2973 = _2437 * _2343;
    int _2975 = _2953 ? 0 : 1;
    int _2977 = _2945 * _2963;
    int _2979 = _2977 + _2565;
    bool _2981 = !_2861;
    int _2983 = _2981 ? 0 : 1;
    float _2985 = -_2437;
    float _2987 = _2985 + 1.0;
    int _2989 = abs(_2971);
    bool _2991 = uint(_2979) >= uint(_1369);
    int _2993 = ~_2975;
    int _2995 = _2993 + 1;
    int _2997 = _2995 + 1;
    bool _2999 = _2859 != 3;
    float _3001 = fma(_2731, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2955);
    int _3003 = _2997;
    if (_2927)
    {
        int _3005 = ~_2975;
        int _3007 = _3005 + 1;
        _3003 = _3007;
    }
    int _3009 = _3003;
    int _3011 = abs(_2983);
    float _3013 = _3001 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _3015 = !_2999;
    int _3017 = _3015 ? 0 : (-1);
    int _3019 = abs(_3009);
    int _3021 = ~_2989;
    int _3023 = _3021 + 1;
    int _3025 = _3023 + 1;
    int _3027 = abs(_3017);
    int _3029 = ~_3011;
    int _3031 = _3029 + 1;
    int _3033 = _3031 + 1;
    int _3035 = _3025 * as_type<int>(_2877);
    bool _3037 = !_2991;
    int _3039 = _3037 ? 0 : (-1);
    int _3041 = _3033 * as_type<int>(_2869);
    int _3043 = _3041 + _3035;
    int _3045 = ~_3019;
    int _3047 = _3045 + 1;
    int _3049 = _3047 + 1;
    float _3051 = _1207 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3053 = ~_2963;
    int _3055 = _3053 + _3039;
    int _3057 = _3055 + 1;
    float _3059 = _1983 * _2043;
    int _3061 = ~_3027;
    int _3063 = _3061 + 1;
    int _3065 = _3063 + 1;
    int _3067 = _3049 * as_type<int>(_2911);
    int _3069 = _3067 + _3043;
    bool _3071 = !_2545;
    int _3073 = _3071 ? 0 : 1;
    int _3075 = _1369 * _3057;
    int _3077 = _3075 + _2565;
    float _3079 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2406);
    int _3081 = _3065 * as_type<int>(_2919);
    int _3083 = _3081 + _3069;
    int _3085 = abs(_3073);
    float _3087 = _1205 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _3089 = !_2499;
    int _3091 = _3089 ? _3077 : (-1);
    float _3093 = _1203 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3095 = _3087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3097 = _1983 > 0.0;
    bool _3099 = isnan(_1983);
    bool _3101 = _3097 || _3099;
    bool _3103 = isnan(0.0);
    bool _3105 = _3101 || _3103;
    float _3107 = _3093 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3109 = ~_3085;
    int _3111 = _3109 + 1;
    int _3113 = _3111 + 1;
    float _3115 = _3051 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3117 = _3059 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3119 = _2043 <= 0.0;
    bool _3121 = !_3105;
    bool _3123 = _3119 || _3121;
    int _3125 = _3083 * _3113;
    float _3127 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3079);
    out.m_62.x = _3107;
    out.m_62.y = _3095;
    out.m_62.z = _3115;
    out.m_62.w = _3013;
    int _3129 = _3091 * _3085;
    int _3131 = _3129 + _3125;
    float _3133 = _3127 + _2279;
    float _3135 = _3117 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3137 = _2364 * _2973;
    out.gl_Position.x = _2311;
    out.gl_Position.y = _2325;
    out.gl_Position.z = _3127;
    out.gl_Position.w = _2279;
    float _3139 = _3133 * 0.5;
    float _3141 = float(_3131);
    out.m_45.x = _3135;
    float _3143 = _2354 * _2973;
    out.m_64.y = _3141;
    float _3145 = fma(_2360, _3143, _2348);
    float _3147 = fma(_2362, _3143, _2350);
    float _3149 = _2354 * _2987;
    out.m_66.z = _3139;
    out.m_66.w = _2279;
    float _3151 = fma(_2354, _3137, _2352);
    out.m_68.x = _3145;
    out.m_68.y = _3147;
    out.m_68.z = _3151;
    out.m_68.w = _3149;
    if (!_3123)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3153 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3153;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1233 = false;
    bool _953 = false;
    bool _849 = false;
    bool _573 = false;
    bool _325 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3210 = as_type<float>(_103);
        out.gl_Position.z = _3210;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = _121;
    if (_117)
    {
        float _127 = float(_87);
        _123 = _127;
    }
    float _129 = _123;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
    bool _135 = _131 || _133;
    if (_135)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _97;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3279 = as_type<float>(_141);
        out.gl_Position.z = _3279;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_52.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    float _165 = in.m_42.x;
    float _167 = in.m_42.y;
    float _169 = in.m_42.z;
    int _171 = as_type<int>(_143) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_143) & 2;
    bool _177 = _175 != 0;
    float _179 = _143;
    if (!_157)
    {
        float _181 = _145 * _145;
        float _183 = _181 * 0.5;
        _179 = _183;
    }
    float _185 = _179;
    bool _187 = !_173;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = _185;
    if (!_157)
    {
        float _193 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _193;
    }
    float _195 = _191;
    bool _197 = !_177;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_157;
    float _203 = _195;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _145 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _145);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _239 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _241 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _243 = _237 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _245 = _237 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _247 = _237 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _249 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[8].x, _243);
    float _251 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[8].y, _245);
    float _253 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[8].z, _247);
    float _255 = _245;
    if (!_157)
    {
        _255 = _145;
    }
    float _257 = _255;
    float _259 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].x, _249);
    bool _261 = !_157;
    float _263 = _257;
    if (!_261)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _145 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _263 = _283;
    }
    float _285 = _263;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _289 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].y, _251);
    float _291 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].z, _253);
    float _293 = fma(_285, _159, _259);
    float _295 = fma(_285, _161, _289);
    float _297 = fma(_285, _163, _291);
    float _299 = fma(_293, _147, _165);
    float _301 = fma(_295, _147, _167);
    float _303 = fma(_297, _147, _169);
    bool _305 = !_287;
    float _323;
    if (!_305)
    {
        float _307 = in.m_54.x;
        float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _311 = _307 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _315 = _313 * _309;
        float _317 = floor(_315);
        float _319 = -_317;
        float _321 = _315 + _319;
        _323 = _321;
        _325 = true;
    }
    else
    {
        float _327 = float(_87);
        float _329 = 1.0 / _327;
        float _331 = _121 * _329;
        _323 = _331;
    }
    _325 = false;
    float _333 = _323;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = _333 + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _333 + _339;
    bool _343 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _345 = isnan(_333);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _371 = 1.0 / _357;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _375 = 1.0 / _361;
    float _377 = 1.0 / _369;
    float _379 = _337 * _371;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _383 = _333 + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = _333 + _385;
    float _389 = 1.0 / _365;
    float _391 = _341 * _375;
    bool _393 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _395 = isnan(_333);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -_353;
    float _407 = _405 + 1.0;
    bool _409 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _411 = isnan(_333);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = _403 * _407;
    float _423 = _383 * _377;
    float _425 = -_403;
    float _427 = _425 + 1.0;
    bool _429 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _431 = isnan(_333);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _449 = _419 * _427;
    float _451 = -_419;
    float _453 = _451 + 1.0;
    bool _455 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _457 = isnan(_333);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = _387 * _389;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _469;
    float _473 = _439 * _453;
    float _475 = -_439;
    float _477 = _475 + 1.0;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _483 = fma(_471, _379, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _485 = fma(_443, _379, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _487 = _465 * _477;
    float _489 = fma(_481, _391, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _491 = fma(_447, _391, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _493 = in.m_52.x;
    float _495 = in.m_52.y;
    float _497 = -_465;
    float _499 = _497 + 1.0;
    float _501 = _483 * _487;
    float _503 = _485 * _487;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _509;
    float _513 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[143].x, _501);
    float _515 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[143].y, _503);
    float _517 = fma(_507, _467, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _519 = fma(_511, _467, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _529 = fma(_489, _473, _513);
    float _531 = fma(_491, _473, _515);
    float _533 = fma(_523, _423, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _535 = fma(_527, _423, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _537 = fma(_517, _449, _529);
    float _539 = fma(_519, _449, _531);
    float _541 = fma(_533, _421, _537);
    float _543 = fma(_535, _421, _539);
    float _545 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[147].x, _541);
    float _547 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[147].y, _543);
    float _549 = _545 * _493;
    float _551 = _547 * _495;
    bool _553 = !_373;
    float _571;
    if (!_553)
    {
        float _555 = in.m_54.x;
        float _557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _559 = _555 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _561 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _563 = _561 * _557;
        float _565 = floor(_563);
        float _567 = -_565;
        float _569 = _563 + _567;
        _571 = _569;
        _573 = true;
    }
    else
    {
        float _575 = float(_87);
        float _577 = 1.0 / _575;
        float _579 = _121 * _577;
        _571 = _579;
    }
    _573 = false;
    float _581 = _571;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _585 = _581 + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _589 = _581 + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _593 = _581 + _591;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _603;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _611 = 1.0 / _605;
    bool _613 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _615 = isnan(_581);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = 1.0 / _601;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _629 = _581 + _627;
    bool _631 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _633 = 1.0 / _609;
    float _635 = _585 * _611;
    bool _637 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _639 = isnan(_581);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = 1.0 / _597;
    float _651 = _629 * _625;
    bool _653 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _655 = isnan(_581);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    bool _665 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _667 = isnan(_581);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -_663;
    float _679 = _677 + 1.0;
    float _681 = _589 * _633;
    bool _683 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _685 = isnan(_581);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = -_675;
    float _697 = _695 + 1.0;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _699;
    float _703 = _647 * _679;
    float _705 = -_647;
    float _707 = _705 + 1.0;
    float _709 = _693 * _697;
    float _711 = fma(_701, _635, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _713 = _593 * _649;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _715;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _719;
    float _723 = -_693;
    float _725 = _723 + 1.0;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _731 = fma(_717, _635, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _733 = fma(_721, _635, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _735 = _675 * _707;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _745 = _623 * _725;
    float _747 = fma(_729, _681, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _749 = fma(_739, _681, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _751 = fma(_743, _681, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _753 = _711 * _745;
    float _755 = _731 * _745;
    float _757 = -_623;
    float _759 = _757 + 1.0;
    float _761 = _733 * _745;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _763;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _767;
    float _771 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[107].x, _753);
    float _773 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[107].y, _755);
    float _775 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[107].z, _761);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _777;
    float _781 = fma(_765, _713, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _783 = fma(_747, _709, _771);
    float _785 = fma(_749, _709, _773);
    float _787 = fma(_751, _709, _775);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _797 = fma(_769, _713, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _799 = fma(_779, _713, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _805 = fma(_781, _735, _783);
    float _807 = fma(_791, _651, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _809 = fma(_795, _651, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _811 = fma(_803, _651, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _813 = fma(_797, _735, _785);
    float _815 = fma(_799, _735, _787);
    float _817 = fma(_807, _703, _805);
    float _819 = fma(_809, _703, _813);
    float _821 = fma(_811, _703, _815);
    float _823 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[111].x, _817);
    float _825 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[111].y, _819);
    float _827 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[111].z, _821);
    bool _829 = !_631;
    float _847;
    if (!_829)
    {
        float _831 = in.m_54.x;
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _835 = _831 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _837 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _839 = _837 * _833;
        float _841 = floor(_839);
        float _843 = -_841;
        float _845 = _839 + _843;
        _847 = _845;
        _849 = true;
    }
    else
    {
        float _851 = float(_87);
        float _853 = 1.0 / _851;
        float _855 = _121 * _853;
        _847 = _855;
    }
    _849 = false;
    float _857 = _847;
    bool _859 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _861 = isnan(_857);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _875 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _877 = isnan(_857);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _887;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _893 = _857 + _891;
    float _895 = -_869;
    float _897 = _895 + 1.0;
    bool _899 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _901 = 1.0 / _873;
    float _903 = _885 * _897;
    float _905 = -_885;
    float _907 = _905 + 1.0;
    float _909 = _889 * _901;
    float _911 = _827 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _913 = fma(_909, _893, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _915 = _825 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _917 = _911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _919 = _913 * _903;
    float _921 = _915 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _923 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[115].x, _919);
    float _925 = _823 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _927 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[116].x, _923);
    float _929 = _925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _931 = _927 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _929;
    out.m_56.y = _921;
    out.m_56.z = _917;
    out.m_56.w = _931;
    bool _933 = !_899;
    float _951;
    if (!_933)
    {
        float _935 = in.m_54.x;
        float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _939 = _935 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _943 = _941 * _937;
        float _945 = floor(_943);
        float _947 = -_945;
        float _949 = _943 + _947;
        _951 = _949;
        _953 = true;
    }
    else
    {
        float _955 = float(_87);
        float _957 = 1.0 / _955;
        float _959 = _121 * _957;
        _951 = _959;
    }
    _953 = false;
    float _961 = _951;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _965 = _961 + _963;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _969 = _961 + _967;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _973 = _961 + _971;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _975;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _981 = _979 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _983;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _991 = 1.0 / _977;
    bool _993 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _995 = isnan(_961);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1001 = _997 || _999;
    float _1003 = float(_1001);
    bool _1005 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1007 = isnan(_961);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1013 = _1009 || _1011;
    float _1015 = float(_1013);
    float _1017 = 1.0 / _985;
    bool _1019 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1021 = 1.0 / _989;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1025 = _961 + _1023;
    float _1027 = _965 * _991;
    bool _1029 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1031 = isnan(_961);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1041;
    float _1045 = 1.0 / _981;
    float _1047 = _969 * _1017;
    float _1049 = -_1039;
    float _1051 = _1049 + 1.0;
    float _1053 = fma(_1043, _1047, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1055 = _973 * _1021;
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1057;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1061;
    float _1065 = fma(_1059, _1047, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1067 = fma(_1063, _1047, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1069 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1071 = isnan(_961);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1077 = _1073 || _1075;
    float _1079 = float(_1077);
    float _1081 = _1025 * _1045;
    bool _1083 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1085 = isnan(_961);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = -_1003;
    float _1097 = _1095 + 1.0;
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1101 = _1099 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1103 = _1015 * _1051;
    float _1105 = -_1015;
    float _1107 = _1105 + 1.0;
    float _1109 = _1093 * _1097;
    float _1111 = -_1093;
    float _1113 = _1111 + 1.0;
    float _1115 = fma(_1101, _1055, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1117 = _1079 * _1107;
    float _1119 = -_1079;
    float _1121 = _1119 + 1.0;
    float _1123 = _1039 * _1113;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1131 = _1129 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1133 = _1065 * _1117;
    float _1135 = fma(_1127, _1055, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1137 = fma(_1131, _1055, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1139 = _1067 * _1117;
    float _1141 = _1053 * _1117;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1143;
    float _1147 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1133);
    float _1149 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1139);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1151;
    float _1155 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1141);
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1157;
    float _1161 = fma(_1145, _1027, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1163 = fma(_1115, _1103, _1147);
    float _1165 = fma(_1135, _1103, _1149);
    float _1167 = fma(_1153, _1027, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1169 = fma(_1137, _1103, _1155);
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1173 = _1171 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1177 = _1175 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1179 = fma(_1159, _1027, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1183 = _1181 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1185 = fma(_1161, _1123, _1163);
    float _1187 = fma(_1173, _1081, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1189 = fma(_1177, _1081, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1191 = fma(_1167, _1123, _1165);
    float _1193 = fma(_1183, _1081, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1195 = fma(_1179, _1123, _1169);
    float _1197 = fma(_1187, _1109, _1185);
    float _1199 = fma(_1189, _1109, _1191);
    float _1201 = fma(_1193, _1109, _1195);
    float _1203 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1197);
    float _1205 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1199);
    float _1207 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1201);
    bool _1209 = !_1019;
    float _1229;
    float _1231;
    if (!_1209)
    {
        float _1211 = in.m_54.x;
        float _1213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1215 = float(_87);
        float _1217 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1219 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _1221 = _1219 * _1213;
        float _1223 = floor(_1221);
        float _1225 = -_1223;
        float _1227 = _1221 + _1225;
        _1229 = _1215;
        _1231 = _1227;
        _1233 = true;
    }
    else
    {
        float _1235 = float(_87);
        float _1237 = 1.0 / _1235;
        float _1239 = _121 * _1237;
        _1229 = _1235;
        _1231 = _1239;
    }
    _1233 = false;
    float _1241 = _1229;
    float _1243 = _1231;
    float _1245 = in.m_54.x;
    float _1247 = in.m_54.y;
    float _1249 = in.m_54.z;
    float _1251 = in.m_54.w;
    float _1253 = _551 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1257 = _1255 != 0;
    int _1259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1261 = _1259 != 0;
    int _1263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1265 = _1263 != 0;
    float _1267 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1275 = _1245 * 2.0;
    float _1277 = _1247 * 2.0;
    float _1279 = _1249 * 2.0;
    float _1281 = _1247 + _1245;
    float _1283 = floor(_1275);
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1289 = _1281 + (-1.0);
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1293 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1295 = floor(_1279);
    float _1297 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1299 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1291);
    bool _1301 = !_1265;
    int _1303 = _1301 ? 0 : 1;
    float _1305 = -_1271;
    float _1307 = fma(_1297, 2.0, _1305);
    bool _1309 = _1283 > 0.0;
    float _1311 = floor(_1277);
    bool _1313 = _1283 >= 0.0;
    bool _1315 = isnan(_1283);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan(0.0);
    bool _1321 = _1317 || _1319;
    float _1323 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1325 = !_1257;
    int _1327 = _1325 ? 0 : 1;
    float _1329 = -_121;
    float _1331 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1307);
    int _1333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1335 = _1333 != 0;
    float _1337 = fma(_1323, -2.0, _1267);
    bool _1339 = _1295 >= 0.0;
    bool _1341 = isnan(_1295);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan(0.0);
    bool _1347 = _1343 || _1345;
    float _1349 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1351 = int(_1349);
    int _1353 = _1321 ? 0 : 1;
    float _1355 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1337);
    int _1357 = _1347 ? 0 : 1;
    bool _1359 = _1295 > 0.0;
    int _1361 = ~_1357;
    int _1363 = _1361 + 1;
    int _1365 = _1363 + 1;
    float _1367 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1369 = int(_1367);
    bool _1371 = _1311 > 0.0;
    float _1373 = _1289;
    float _1375 = _1297;
    int _1377 = _1365;
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (!_1335)
    {
        _1373 = _1247;
    }
    float _1381 = _1373;
    float _1383 = _1381;
    if (_1335)
    {
        _1383 = _1245;
    }
    float _1385 = _1383;
    bool _1387 = _1311 >= 0.0;
    bool _1389 = isnan(_1311);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan(0.0);
    bool _1395 = _1391 || _1393;
    if (!_1335)
    {
        _1375 = _1249;
    }
    float _1397 = _1375;
    float _1399 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1401 = fma(_1385, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1269);
    float _1403 = _1397;
    if (_1335)
    {
        _1403 = _1247;
    }
    float _1405 = _1403;
    float _1407 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1409 = log2(_1407);
    float _1411 = -_1285;
    float _1413 = fma(_1399, 2.0, _1411);
    float _1415 = _1405;
    if (!_1359)
    {
        int _1417 = ~_1357;
        int _1419 = _1417 + 1;
        _1377 = _1419;
    }
    int _1421 = _1377;
    float _1423 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1273);
    if (!_1335)
    {
        _1415 = _1249;
    }
    float _1425 = _1415;
    float _1427 = -_121;
    float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1413);
    float _1431 = _1425;
    if (_1335)
    {
        _1431 = _1247;
    }
    float _1433 = _1431;
    float _1435 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1423);
    float _1437 = float(_1351);
    int _1439 = _1395 ? 0 : 1;
    float _1441 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1443 = abs(_1327);
    float _1445 = 1.0 / _1437;
    int _1447 = ~_1439;
    int _1449 = _1447 + 1;
    int _1451 = _1449 + 1;
    float _1453 = _1409 * _121;
    float _1455 = fma(_1441, -2.0, _1287);
    int _1457 = _1451;
    if (!_1371)
    {
        int _1459 = ~_1439;
        int _1461 = _1459 + 1;
        _1457 = _1461;
    }
    int _1463 = _1457;
    float _1465 = in.m_58.x;
    float _1467 = in.m_58.y;
    float _1469 = in.m_58.z;
    float _1471 = float(_1443);
    float _1473 = exp2(_1453);
    float _1475 = float(_1421);
    bool _1477 = !_1261;
    int _1479 = _1477 ? 0 : 1;
    float _1481 = _1471 * _1475;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1485 = ~_1353;
    int _1487 = _1485 + 1;
    int _1489 = _1487 + 1;
    float _1491 = _1445 * _121;
    int _1493 = abs(_1479);
    float _1495 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1497 = 1.0 + _1495;
    int _1499 = _1489;
    if (!_1309)
    {
        int _1501 = ~_1353;
        int _1503 = _1501 + 1;
        _1499 = _1503;
    }
    int _1505 = _1499;
    float _1507 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1483);
    bool _1509 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1511 = isnan(0.0);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1517 = _1513 || _1515;
    float _1519 = -_1473;
    float _1521 = _1519 + 1.0;
    float _1523 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1299);
    float _1525 = 1.0 / _1497;
    float _1527 = _1481 * (-2.0);
    float _1529 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1455);
    float _1531 = float(_1505);
    float _1533 = _1245 + (-0.5);
    float _1535 = fma(_1527, _1465, _1465);
    float _1537 = fma(_1293, _1527, _1293);
    int _1539 = abs(_1303);
    float _1541 = _1247 + _1249;
    float _1543 = _1517 ? _1521 : 0.0;
    float _1545 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1401);
    float _1547 = float(_1493);
    float _1549 = _1541 + (-1.0);
    bool _1551 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1553 = isnan(1.0);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1559 = _1555 || _1557;
    float _1561 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1535);
    float _1563 = float(_1539);
    float _1565 = _1547 * _1531;
    float _1567 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1507);
    float _1569 = float(_1463);
    float _1571 = _1565 * (-2.0);
    float _1573 = float(_1369);
    float _1575 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1577 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1579 = isnan(0.5);
    bool _1581 = _1577 || _1579;
    bool _1583 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1585 = _1581 || _1583;
    float _1587 = _1563 * _1569;
    float _1589 = _1247 + (-0.5);
    float _1591 = fma(_1571, _1467, _1467);
    float _1593 = _1249 + _1245;
    float _1595 = _1573 * _121;
    float _1597 = fma(_1575, _1571, _1575);
    if (_1559)
    {
        float _1599 = _1543 * _1525;
        _125 = _1599;
    }
    float _1601 = _125;
    float _1603 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1591);
    float _1605 = _1587 * (-2.0);
    float _1607 = _1593 + (-1.0);
    float _1609 = fma(_1597, _1601, _1603);
    float _1611 = fma(_1537, _1601, _1561);
    float _1613 = fma(_1605, _1469, _1469);
    float _1615 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1617 = _1249 + (-0.5);
    float _1619 = _1611 * 0.15915493667125701904296875;
    float _1621 = _1609 * 0.15915493667125701904296875;
    float _1623 = fma(_1615, _1605, _1615);
    float _1625 = fma(_1617, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1613);
    float _1627 = _1619 * 6.283185482025146484375;
    float _1629 = sin(_1627);
    float _1631 = _549 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1633 = _301 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1635 = fma(_1623, _1601, _1625);
    float _1637 = _301 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1639 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1641 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1633);
    float _1643 = _1635 * 0.15915493667125701904296875;
    float _1645 = _1619 * 6.283185482025146484375;
    float _1647 = cos(_1645);
    float _1649 = _301 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1651 = _1631 * _1639;
    float _1653 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1637);
    float _1655 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1641);
    float _1657 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1649);
    float _1659 = _1643 * 6.283185482025146484375;
    float _1661 = cos(_1659);
    float _1663 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1665 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1657);
    float _1667 = _1253 * _1663;
    float _1669 = _1665 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1671 = _1621 * 6.283185482025146484375;
    float _1673 = sin(_1671);
    float _1675 = _1621 * 6.283185482025146484375;
    float _1677 = cos(_1675);
    float _1679 = _1661 * _1667;
    float _1681 = _1647 * _1679;
    float _1683 = _1629 * _1679;
    float _1685 = _1643 * 6.283185482025146484375;
    float _1687 = sin(_1685);
    float _1689 = _1629 * _1673;
    float _1691 = _1647 * _1673;
    float _1693 = _1673 * _1661;
    float _1695 = _1655 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1697 = _1647 * _1677;
    float _1699 = _1629 * _1677;
    float _1701 = _1677 * _1661;
    float _1703 = fma(_1687, _1697, _1689);
    float _1705 = -_1691;
    float _1707 = fma(_1687, _1699, _1705);
    float _1709 = -_1699;
    float _1711 = fma(_1687, _1691, _1709);
    float _1713 = -_1667;
    float _1715 = _1687 * _1713;
    float _1717 = fma(_1703, _1651, _1681);
    float _1719 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1721 = fma(_1687, _1689, _1697);
    float _1723 = fma(_1701, _1651, _1715);
    float _1725 = fma(_1707, _1651, _1683);
    float _1727 = fma(_1711, _1719, _1717);
    float _1729 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1653);
    float _1731 = fma(_1693, _1719, _1723);
    float _1733 = fma(_1721, _1719, _1725);
    float _1735 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1737 = _1729 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1739 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1741 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1743 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1735);
    float _1745 = _1737 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1747 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1739);
    float _1749 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1741);
    float _1751 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1743);
    float _1753 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1745);
    float _1755 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1747);
    float _1757 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1759 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1753);
    float _1761 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1763 = _1737 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1765 = _1695 + _1757;
    float _1767 = _1759 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1769 = _1669 + _1761;
    float _1771 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1763);
    float _1773 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1775 = _1765 + _1773;
    float _1777 = 1.0 / _1767;
    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1781 = _1769 + _1779;
    float _1783 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1771);
    float _1785 = _1775 * _1775;
    float _1787 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1749);
    float _1789 = _1783 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1791 = fma(_1781, _1781, _1785);
    float _1793 = _1787 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1795 = _1789 + _1767;
    float _1797 = sqrt(_1791);
    float _1799 = _1737 + _1793;
    float _1801 = _1767;
    float _1803 = _1733;
    float _1805 = _1793;
    float _1807 = _1669;
    float _1809 = _1651;
    if (_1585)
    {
        _1801 = 1.0;
    }
    float _1811 = _1801;
    float _1813 = _1795 * _1777;
    float _1815 = _1813 * 0.5;
    float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1819 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1817);
    float _1821 = 1.0 / _1819;
    bool _1823 = _1797 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1827 = _1825 != 0;
    int _1829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1831 = _1829 != 0;
    int _1833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1835 = _1833 != 0;
    int _1837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1839 = _1837 != 0;
    bool _1841 = !_1831;
    int _1843 = _1841 ? 0 : 1;
    bool _1845 = !_1827;
    int _1847 = _1845 ? 0 : 1;
    bool _1849 = !_1835;
    int _1851 = _1849 ? 0 : 1;
    bool _1853 = !_1839;
    int _1855 = _1853 ? 0 : 1;
    float _1857 = _1797;
    float _1859 = _1819;
    float _1861 = _1811;
    float _1863 = _1777;
    if (!_1823)
    {
        _1803 = _1769;
    }
    float _1865 = _1803;
    float _1867 = _1865;
    if (!_1823)
    {
        _1805 = _1765;
    }
    float _1869 = _1805;
    float _1871 = _1869;
    if (!_1823)
    {
        _1379 = _1799;
    }
    float _1873 = _1379;
    bool _1875 = !_1823;
    float _1877 = _1873;
    if (!_1875)
    {
        float _1879 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1883 = _1797 + _1881;
        float _1885 = _1799 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1887 = rsqrt(_1791);
        float _1889 = _1883 * _1879;
        float _1891 = _1889 * 0.15915493667125701904296875;
        float _1893 = _1891 * 6.283185482025146484375;
        float _1895 = cos(_1893);
        float _1897 = _1891 * 6.283185482025146484375;
        float _1899 = sin(_1897);
        float _1901 = _1895 + (-1.0);
        float _1903 = _1901 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1905 = fma(_1899, _1885, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1907 = fma(_1799, _1895, _1903);
        float _1909 = _1887 * _1905;
        float _1911 = fma(_1781, _1909, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1913 = fma(_1775, _1909, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1857 = _1883;
        _1877 = _1907;
        _1867 = _1911;
        _1871 = _1913;
    }
    float _1915 = _1857;
    float _1917 = _1877;
    float _1919 = _1867;
    float _1921 = _1871;
    float _1923 = _1915;
    if (_1585)
    {
        _1859 = 1.0;
    }
    float _1925 = _1859;
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1929 = _1821 * _1927;
    float _1931 = _1925;
    if (!_1585)
    {
        float _1933 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1935 = _1933 * 0.15915493667125701904296875;
        float _1937 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1939 = _1935 * 6.283185482025146484375;
        float _1941 = cos(_1939);
        float _1943 = _1937 * 0.15915493667125701904296875;
        float _1945 = _1935 * 6.283185482025146484375;
        float _1947 = sin(_1945);
        float _1949 = 1.0 / _1941;
        float _1951 = _1943 * 6.283185482025146484375;
        float _1953 = cos(_1951);
        float _1955 = _1947 * _1949;
        float _1957 = _1943 * 6.283185482025146484375;
        float _1959 = sin(_1957);
        float _1961 = _1953 * _1955;
        float _1963 = 1.0 / _1961;
        float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1967 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1965;
        float _1969 = 1.0 / _1967;
        float _1971 = _1959 * _1963;
        float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1975 = fma(_1929, _1971, _1973);
        float _1977 = _1975 * _1969;
        float _1979 = precise::clamp(_1977, 0.0, 1.0);
        _1923 = _1935;
        _1861 = _1979;
    }
    float _1981 = _1923;
    float _1983 = _1861;
    float _1985 = _1981;
    if (!_1585)
    {
        float _1987 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1989 = _1987 * 0.15915493667125701904296875;
        float _1991 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1993 = _1989 * 6.283185482025146484375;
        float _1995 = cos(_1993);
        float _1997 = _1991 * 0.15915493667125701904296875;
        float _1999 = _1989 * 6.283185482025146484375;
        float _2001 = sin(_1999);
        float _2003 = 1.0 / _1995;
        float _2005 = _1997 * 6.283185482025146484375;
        float _2007 = cos(_2005);
        float _2009 = _2001 * _2003;
        float _2011 = _1997 * 6.283185482025146484375;
        float _2013 = sin(_2011);
        float _2015 = _2007 * _2009;
        float _2017 = 1.0 / _2015;
        float _2019 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2021 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2019;
        float _2023 = 1.0 / _2021;
        float _2025 = _2013 * _2017;
        float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2029 = fma(_1929, _2025, _2027);
        float _2031 = _2029 * _2023;
        float _2033 = precise::clamp(_2031, 0.0, 1.0);
        float _2035 = -_2033;
        float _2037 = _2035 + 1.0;
        _1985 = _2003;
        _1863 = _2017;
        _1931 = _2037;
    }
    float _2039 = _1985;
    float _2041 = _1863;
    float _2043 = _1931;
    float _2045 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2047 = _1917 + _2045;
    float _2049 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2051 = _1919 + _2049;
    float _2053 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2055 = _1921 + _2053;
    float _2057 = _2047 * _2047;
    float _2059 = fma(_2051, _2051, _2057);
    float _2061 = fma(_2055, _2055, _2059);
    float _2063 = rsqrt(_2061);
    float _2065 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2067 = _2051 * _2065;
    float _2069 = _2055 * _2065;
    float _2071 = _2067 * _2067;
    float _2073 = _2069 * _2069;
    float _2075 = _2071 + _2073;
    float _2077 = sqrt(_2075);
    bool _2079 = _2077 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2083 = _2077 + _2081;
    float _2085 = _2039;
    float _2087 = _2075;
    float _2089 = _2083;
    float _2091 = _2047;
    float _2093 = _2067;
    float _2095 = _2069;
    float _2097 = _2071;
    float _2099 = _2073;
    if (_2079)
    {
        float _2101 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2085 = _2101;
    }
    float _2103 = _2085;
    if (_2079)
    {
        float _2105 = rsqrt(_2075);
        _2087 = _2105;
    }
    float _2107 = _2087;
    if (_2079)
    {
        float _2109 = _2083 * _2103;
        _2089 = _2109;
    }
    float _2111 = _2089;
    if (_2079)
    {
        float _2113 = _2111 * 0.15915493667125701904296875;
        _1807 = _2113;
    }
    float _2115 = _1807;
    float _2117 = _2041;
    if (_2079)
    {
        float _2119 = _2115 * 6.283185482025146484375;
        float _2121 = sin(_2119);
        _2117 = _2121;
    }
    float _2123 = _2117;
    float _2125 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2127 = precise::max(0.0, _2125);
    float _2129 = _2103;
    float _2131 = _2127;
    if (_2079)
    {
        float _2133 = _2115 * 6.283185482025146484375;
        float _2135 = cos(_2133);
        _2129 = _2135;
    }
    float _2137 = _2129;
    float _2139 = -_2065;
    float _2141 = -_2127;
    float _2143 = fma(_2047, _2139, _2141);
    if (_2079)
    {
        float _2145 = _2143 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2131 = _2145;
    }
    float _2147 = _2131;
    float _2149 = _2147;
    if (_2079)
    {
        float _2151 = fma(_2123, _2147, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2091 = _2151;
    }
    float _2153 = _2091;
    float _2155 = sqrt(_2061);
    float _2157 = _2153;
    if (_2079)
    {
        float _2159 = _2137 + (-1.0);
        _2149 = _2159;
    }
    float _2161 = _2149;
    float _2163 = _2161;
    if (_2079)
    {
        float _2165 = _2107 * _2153;
        _1809 = _2165;
    }
    float _2167 = _1809;
    if (!_2079)
    {
        _2157 = _2143;
    }
    float _2169 = _2157;
    float _2171 = _2169;
    if (_2079)
    {
        float _2173 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2163 = _2173;
    }
    float _2175 = _2163;
    if (_2079)
    {
        float _2177 = _2067 * _2167;
        _2093 = _2177;
    }
    float _2179 = _2093;
    if (_2079)
    {
        float _2181 = _2069 * _2167;
        _2095 = _2181;
    }
    float _2183 = _2095;
    if (_2079)
    {
        float _2185 = fma(_2143, _2137, _2175);
        _2171 = _2185;
    }
    float _2187 = _2171;
    if (_2079)
    {
        float _2189 = _2179 * _2179;
        _2097 = _2189;
    }
    float _2191 = _2097;
    if (_2079)
    {
        float _2193 = _2183 * _2183;
        _2099 = _2193;
    }
    float _2195 = _2099;
    float _2197 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2199 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2201 = fma(_2187, _2187, _2191);
    float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2205 = fma(_2155, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2203);
    float _2207 = precise::clamp(_2205, 0.0, 1.0);
    float _2209 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2211 = _2201 + _2195;
    float _2213 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2197);
    float _2215 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2217 = -_2207;
    float _2219 = _2217 + 1.0;
    float _2221 = rsqrt(_2211);
    float _2223 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2213);
    float _2225 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2215);
    float _2227 = _1917 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2229 = _2223 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2231 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2209);
    float _2233 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2225);
    float _2235 = abs(_2219);
    float _2237 = log2(_2235);
    float _2239 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2227);
    float _2241 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2231);
    float _2243 = _2233 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2245 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2247 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2239);
    float _2249 = _2241 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2251 = _2243 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2253 = _2221 * _2179;
    float _2255 = _2221 * _2187;
    float _2257 = _2221 * _2183;
    float _2259 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2251);
    float _2261 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2263 = _2247 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2265 = -_2245;
    float _2267 = fma(_2265, _2199, 1.0);
    float _2269 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2259);
    float _2271 = -_2261;
    float _2273 = fma(_2255, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2271);
    float _2275 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2277 = log2(_2267);
    float _2279 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2269);
    float _2281 = -_2257;
    float _2283 = fma(_2281, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2273);
    float _2285 = _2243 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2287 = _2243 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2289 = fma(_2283, -0.5, 0.5);
    float _2291 = _2255 + 1.0;
    float _2293 = exp2(_2275);
    float _2295 = fma(_2283, 0.5, 0.5);
    float _2297 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2285);
    float _2299 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2287);
    float _2301 = fma(_2295, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2303 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2297);
    float _2305 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2299);
    float _2307 = 1.0 / _2279;
    float _2309 = fma(_2295, _2301, -0.212114393711090087890625);
    float _2311 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2303);
    float _2313 = _2277 * 0.693147182464599609375;
    float _2315 = fma(_2295, _2309, 1.570728778839111328125);
    float _2317 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2319 = sqrt(_2289);
    float _2321 = -_2255;
    float _2323 = fma(_2293, _2291, _2321);
    float _2325 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2305);
    float _2327 = fma(_2323, 0.5, 0.5);
    float _2329 = _2311 * _2307;
    float _2331 = _2325 * _2307;
    float _2333 = fma(_2329, 0.5, 0.5);
    float _2335 = fma(_2331, -0.5, 0.5);
    float _2337 = _2319 * 0.636619746685028076171875;
    float _2339 = -_2315;
    float _2341 = fma(_2337, _2339, 1.0);
    float3 _6772 = float3(_2333, _2335, _2317);
    float _2343 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6772, float3(0.0), isnan(_6772)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6772, float3(0.0), isnan(_6772)), level(0.0)).x;
    float3 _6783 = float3(_2333, _2335, _2317);
    float4 _2346 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6783, float3(0.0), isnan(_6783)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6783, float3(0.0), isnan(_6783)), level(0.0)).xyzw;
    float _2348 = _2346.x;
    float _2350 = _2346.y;
    float _2352 = _2346.z;
    float _2354 = _2346.w;
    float2 _6800 = float2(_2341, _2327);
    float3 _2358 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6800, float2(0.0), isnan(_6800)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6800, float2(0.0), isnan(_6800)), level(0.0)).xyz;
    float _2360 = _2358.x;
    float _2362 = _2358.y;
    float _2364 = _2358.z;
    float _2366 = float(uint(_1369));
    float _2368 = trunc(_1491);
    int _2370 = int(_2368);
    int _2372 = ~_1369;
    int _2374 = _2372 + 1;
    float _2376 = -_1545;
    float _2378 = _2376 + 1.0;
    int _2380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2382 = _2380 != 0;
    float _2384 = -_1435;
    float _2386 = _2384 + 1.0;
    int _2388 = abs(_1843);
    float _2390 = -_1567;
    float _2392 = _2390 + 1.0;
    int _2394 = abs(_1847);
    float _2396 = 1.0 / _2366;
    int _2398 = abs(_1851);
    float _2400 = _2243 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2402 = _1251 > 0.5;
    float _2404 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2406 = fma(_2249, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2400);
    float _2408 = float(uint(_2370));
    float _2410 = 1.0 / _1241;
    float _2412 = float(_2370);
    int _2414 = as_type<int>(_2396) + (-2);
    float _2416 = exp2(_2404);
    float _2418 = as_type<float>(_2414) * _2408;
    float _2420 = trunc(_2418);
    float _2422 = precise::max(_2420, 0.0);
    uint _2425 = uint(_2422);
    float _2427 = _1595 * _2410;
    float _2429 = -_2416;
    float _2431 = _2429 + 1.0;
    int _2433 = ~_1369;
    int _2435 = _2433 + 1;
    float _2437 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2439 = _2374 * int(_2425);
    int _2441 = _2439 + _2370;
    float _2443 = float(uint(_2441));
    bool _2445 = !_2382;
    float _2447 = _2445 ? _1247 : _1245;
    float _2449 = as_type<float>(_2414) * _2443;
    bool _2451 = !_2382;
    float _2453 = _2451 ? 1.2345600128173828125 : 1.0;
    float _2455 = trunc(_2449);
    float _2457 = precise::max(_2455, 0.0);
    uint _2459 = uint(_2457);
    float _2461 = _2447 * _2453;
    bool _2463 = _2412 >= _1573;
    bool _2465 = isnan(_2412);
    bool _2467 = _2463 || _2465;
    bool _2469 = isnan(_1573);
    bool _2471 = _2467 || _2469;
    float _2473 = float(_2471);
    int _2475 = _1369 + (-1);
    float _2477 = floor(_2461);
    int _2479 = int(_2425) + int(_2459);
    float _2481 = trunc(_2473);
    int _2483 = int(_2481);
    int _2485 = _2435 * _2479;
    int _2487 = _2485 + _2370;
    float _2489 = -_2477;
    float _2491 = _2461 + _2489;
    bool _2493 = uint(_2487) >= uint(_1369);
    bool _2495 = !_2493;
    int _2497 = _2495 ? 0 : (-1);
    bool _2499 = _1369 == 0;
    int _2501 = ~_2479;
    int _2503 = _2501 + _2497;
    int _2505 = _2503 + 1;
    float _2507 = _2491 * _1573;
    float _2509 = trunc(_2427);
    int _2511 = int(_2509);
    int _2513 = ~_2483;
    int _2515 = _2513 + 1;
    int _2517 = _2515 + 1;
    int _2519 = _1369 * _2505;
    int _2521 = _2519 + _2370;
    int _2523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2525 = _2523 != 0;
    int _2527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2529 = _2527 != 0;
    bool _2531 = !_2499;
    int _2533 = _2531 ? _2521 : (-1);
    float _2535 = trunc(_2507);
    int _2537 = int(_2535);
    bool _2539 = !_2525;
    int _2541 = _2539 ? 0 : 1;
    int _2543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2545 = _2543 != 0;
    int _2547 = _2533 * _2517;
    int _2549 = abs(_2541);
    int _2551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2553 = _2551 != 0;
    int _2555 = _2483 * _2475;
    int _2557 = _2555 + _2547;
    int _2559 = _2557 * _2388;
    int _2561 = abs(_1855);
    int _2563 = _2537 * _2549;
    int _2565 = _2563 + _2370;
    int _2567 = _2511 * _2394;
    int _2569 = _2567 + _2559;
    int _2571 = ~_1369;
    int _2573 = _2571 + 1;
    int _2575 = _2565 * _2398;
    int _2577 = _2575 + _2569;
    float _2579 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2581 = _2579 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2583 = -_199;
    int _2585 = _2402 ? as_type<int>(_2583) : as_type<int>(_199);
    int _2587 = _2537 * _2561;
    int _2589 = _2587 + _2577;
    int _2591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2593 = _2591 != 0;
    int _2595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2597 = _2595 != 0;
    float _2599 = float(uint(_2589));
    float _2601 = float(uint(_2565));
    float _2603 = as_type<float>(_2414) * _2599;
    int _2605 = ~_1369;
    int _2607 = _2605 + 1;
    int _2609 = ~_1369;
    int _2611 = _2609 + 1;
    bool _2613 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2615 = isnan(_1243);
    bool _2617 = _2613 || _2615;
    bool _2619 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2621 = _2617 || _2619;
    float _2623 = float(_2621);
    float _2625 = trunc(_2603);
    float _2627 = precise::max(_2625, 0.0);
    uint _2629 = uint(_2627);
    int _2631 = _2607 * int(_2629);
    int _2633 = _2631 + _2589;
    float _2635 = float(uint(_2633));
    float _2637 = as_type<float>(_2414) * _2635;
    float _2639 = trunc(_2637);
    float _2641 = precise::max(_2639, 0.0);
    uint _2643 = uint(_2641);
    float _2645 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2647 = _2645 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2649 = 1.0 / _2647;
    int _2651 = int(_2629) + int(_2643);
    float _2653 = 1.0 / _2581;
    float _2655 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2657 = _2655 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2659 = _2573 * _2651;
    int _2661 = _2659 + _2589;
    float _2663 = 1.0 / _2657;
    bool _2665 = uint(_2661) >= uint(_1369);
    bool _2667 = !_2529;
    float _2669 = _2667 ? _199 : as_type<float>(_2585);
    bool _2671 = _1247 > 0.5;
    float _2673 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2675 = _2673 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2677 = !_2665;
    int _2679 = _2677 ? 0 : (-1);
    bool _2681 = _1245 > 0.5;
    float _2683 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2685 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2683;
    float _2687 = -_199;
    int _2689 = _2671 ? as_type<int>(_2687) : as_type<int>(_199);
    float _2691 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2693 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2691;
    int _2695 = ~_2651;
    int _2697 = _2695 + _2679;
    int _2699 = _2697 + 1;
    float _2701 = _2685 * _2649;
    float _2703 = _2675 * _2653;
    bool _2705 = !_2593;
    float _2707 = _2705 ? _199 : as_type<float>(_2689);
    float _2709 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2711 = _1243 + _2709;
    float _2713 = as_type<float>(_2414) * _2601;
    bool _2715 = _1249 > 0.5;
    float _2717 = _2693 * _2663;
    float _2719 = fma(_2701, _2711, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2721 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2723 = isnan(_1243);
    bool _2725 = _2721 || _2723;
    bool _2727 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2729 = _2725 || _2727;
    float _2731 = float(_2729);
    int _2733 = _1369 * _2699;
    int _2735 = _2733 + _2589;
    float _2737 = trunc(_2713);
    float _2739 = precise::max(_2737, 0.0);
    uint _2741 = uint(_2739);
    float _2743 = -_189;
    int _2745 = _2681 ? as_type<int>(_2743) : as_type<int>(_189);
    float _2747 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2749 = _1243 + _2747;
    float _2751 = -_189;
    int _2753 = _2715 ? as_type<int>(_2751) : as_type<int>(_189);
    float _2755 = -_2731;
    float _2757 = _2755 + 1.0;
    bool _2759 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2761 = isnan(_1243);
    bool _2763 = _2759 || _2761;
    bool _2765 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2767 = _2763 || _2765;
    float _2769 = float(_2767);
    float _2771 = fma(_2703, _2749, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2773 = !_2553;
    float _2775 = _2773 ? _189 : as_type<float>(_2745);
    float _2777 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2779 = _1243 + _2777;
    bool _2781 = !_2597;
    float _2783 = _2781 ? _189 : as_type<float>(_2753);
    float _2785 = _2769 * _2757;
    float _2787 = -_2769;
    float _2789 = _2787 + 1.0;
    bool _2791 = !_2499;
    int _2793 = _2791 ? _2735 : (-1);
    float _2795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2797 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2799 = isnan(_1243);
    bool _2801 = _2797 || _2799;
    bool _2803 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2805 = _2801 || _2803;
    float _2807 = float(_2805);
    int _2809 = _2793 >> 31;
    int _2811 = _2611 * int(_2741);
    int _2813 = _2811 + _2565;
    int _2815 = _2793 & 3;
    bool _2817 = _2815 != 0;
    float _2819 = _2807 * _2789;
    float _2821 = -_2807;
    float _2823 = _2821 + 1.0;
    int _2825 = _2809 & 3;
    float _2827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2829 = float(uint(_2813));
    float _2831 = _2623 * _2823;
    int _2833 = _2793 + _2825;
    float _2835 = fma(_2717, _2779, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2837 = -_2623;
    float _2839 = _2837 + 1.0;
    float _2841 = as_type<float>(_2414) * _2829;
    int _2843 = _2833 >> 2;
    float _2845 = _2719 * _2831;
    float _2847 = _2783 + 0.5;
    float _2849 = _2795 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2851 = _2843 << 4;
    int _2853 = _2851 + 512;
    float _2855 = fma(_2839, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2845);
    float _2857 = _2707 + (-0.5);
    int _2859 = _2793 & 3;
    bool _2861 = _2859 != 0;
    uint _2863 = uint(int(uint(_2853) >> uint(2)));
    uint _2865 = uint(int(uint(int(_2863)) >> uint(2)));
    int _2867 = int(_2863) & 3;
    float _2869 = (*spvDescriptorSet0.vp_c9)._m0[int(_2865)][_2867];
    int _2871 = int(_2863) + 1;
    uint _2873 = uint(int(uint(_2871) >> uint(2)));
    int _2875 = _2871 & 3;
    float _2877 = (*spvDescriptorSet0.vp_c9)._m0[int(_2873)][_2875];
    float _2879 = fma(_2771, _2819, _2855);
    float _2881 = fma(_2847, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1429);
    float _2883 = -_2849;
    float _2885 = -_1355;
    float _2887 = fma(_2883, _2857, _2885);
    float _2889 = -_1523;
    float _2891 = _2889 + 1.0;
    float _2893 = _2827 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2895 = _2775 + 0.5;
    float _2897 = trunc(_2841);
    float _2899 = precise::max(_2897, 0.0);
    uint _2901 = uint(_2899);
    int _2903 = _2853 + 8;
    uint _2905 = uint(int(uint(_2903) >> uint(2)));
    uint _2907 = uint(int(uint(int(_2905)) >> uint(2)));
    int _2909 = int(_2905) & 3;
    float _2911 = (*spvDescriptorSet0.vp_c9)._m0[int(_2907)][_2909];
    int _2913 = int(_2905) + 1;
    uint _2915 = uint(int(uint(_2913) >> uint(2)));
    int _2917 = _2913 & 3;
    float _2919 = (*spvDescriptorSet0.vp_c9)._m0[int(_2915)][_2917];
    bool _2921 = uint(_2859) > 1u;
    float _2923 = fma(_2893, _2895, _1331);
    float _2925 = _2669 + (-0.5);
    bool _2927 = _2859 != 3;
    float _2929 = -_2378;
    float _2931 = fma(_2783, _2929, _2881);
    float _2933 = -_2891;
    float _2935 = fma(_2775, _2933, _2923);
    float _2937 = -_2925;
    float _2939 = -_1529;
    float _2941 = fma(_2937, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2939);
    int _2943 = ~_1369;
    int _2945 = _2943 + 1;
    float _2947 = fma(_2707, _2392, _2887);
    int _2949 = _2817 ? 0 : 1;
    float _2951 = fma(_2669, _2386, _2941);
    bool _2953 = uint(_2859) >= 2u;
    float _2955 = fma(_2835, _2785, _2879);
    int _2957 = ~_2949;
    int _2959 = _2957 + 1;
    int _2961 = _2959 + 1;
    int _2963 = int(_2741) + int(_2901);
    out.m_60.x = _2935;
    out.m_60.y = _2947;
    out.m_60.z = _2931;
    out.m_60.w = _2951;
    int _2965 = _2961;
    if (!_2921)
    {
        int _2967 = ~_2949;
        int _2969 = _2967 + 1;
        _2965 = _2969;
    }
    int _2971 = _2965;
    float _2973 = _2437 * _2343;
    int _2975 = _2953 ? 0 : 1;
    int _2977 = _2945 * _2963;
    int _2979 = _2977 + _2565;
    bool _2981 = !_2861;
    int _2983 = _2981 ? 0 : 1;
    float _2985 = -_2437;
    float _2987 = _2985 + 1.0;
    int _2989 = abs(_2971);
    bool _2991 = uint(_2979) >= uint(_1369);
    int _2993 = ~_2975;
    int _2995 = _2993 + 1;
    int _2997 = _2995 + 1;
    bool _2999 = _2859 != 3;
    float _3001 = fma(_2731, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2955);
    int _3003 = _2997;
    if (_2927)
    {
        int _3005 = ~_2975;
        int _3007 = _3005 + 1;
        _3003 = _3007;
    }
    int _3009 = _3003;
    int _3011 = abs(_2983);
    float _3013 = _3001 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _3015 = !_2999;
    int _3017 = _3015 ? 0 : (-1);
    int _3019 = abs(_3009);
    int _3021 = ~_2989;
    int _3023 = _3021 + 1;
    int _3025 = _3023 + 1;
    int _3027 = abs(_3017);
    int _3029 = ~_3011;
    int _3031 = _3029 + 1;
    int _3033 = _3031 + 1;
    int _3035 = _3025 * as_type<int>(_2877);
    bool _3037 = !_2991;
    int _3039 = _3037 ? 0 : (-1);
    int _3041 = _3033 * as_type<int>(_2869);
    int _3043 = _3041 + _3035;
    int _3045 = ~_3019;
    int _3047 = _3045 + 1;
    int _3049 = _3047 + 1;
    float _3051 = _1207 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3053 = ~_2963;
    int _3055 = _3053 + _3039;
    int _3057 = _3055 + 1;
    float _3059 = _1983 * _2043;
    int _3061 = ~_3027;
    int _3063 = _3061 + 1;
    int _3065 = _3063 + 1;
    int _3067 = _3049 * as_type<int>(_2911);
    int _3069 = _3067 + _3043;
    bool _3071 = !_2545;
    int _3073 = _3071 ? 0 : 1;
    int _3075 = _1369 * _3057;
    int _3077 = _3075 + _2565;
    float _3079 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2406);
    int _3081 = _3065 * as_type<int>(_2919);
    int _3083 = _3081 + _3069;
    int _3085 = abs(_3073);
    float _3087 = _1205 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _3089 = !_2499;
    int _3091 = _3089 ? _3077 : (-1);
    float _3093 = _1203 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3095 = _3087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3097 = _1983 > 0.0;
    bool _3099 = isnan(_1983);
    bool _3101 = _3097 || _3099;
    bool _3103 = isnan(0.0);
    bool _3105 = _3101 || _3103;
    float _3107 = _3093 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3109 = ~_3085;
    int _3111 = _3109 + 1;
    int _3113 = _3111 + 1;
    float _3115 = _3051 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3117 = _3059 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3119 = _2043 <= 0.0;
    bool _3121 = !_3105;
    bool _3123 = _3119 || _3121;
    int _3125 = _3083 * _3113;
    float _3127 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3079);
    out.m_62.x = _3107;
    out.m_62.y = _3095;
    out.m_62.z = _3115;
    out.m_62.w = _3013;
    int _3129 = _3091 * _3085;
    int _3131 = _3129 + _3125;
    float _3133 = _3127 + _2279;
    float _3135 = _3117 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3137 = _2364 * _2973;
    out.gl_Position.x = _2311;
    out.gl_Position.y = _2325;
    out.gl_Position.z = _3127;
    out.gl_Position.w = _2279;
    float _3139 = _3133 * 0.5;
    float _3141 = float(_3131);
    out.m_45.x = _3135;
    float _3143 = _2354 * _2973;
    out.m_64.y = _3141;
    float _3145 = fma(_2360, _3143, _2348);
    float _3147 = fma(_2362, _3143, _2350);
    float _3149 = _2354 * _2987;
    out.m_66.z = _3139;
    out.m_66.w = _2279;
    float _3151 = fma(_2354, _3137, _2352);
    out.m_68.x = _3145;
    out.m_68.y = _3147;
    out.m_68.z = _3151;
    out.m_68.w = _3149;
    if (!_3123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3153 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3153;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

