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
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_68 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_66 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_74 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_82 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_56 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2364 = false;
    bool _571 = false;
    bool _323 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2653 = as_type<float>(_121);
        out.gl_Position.z = _2653;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_49.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_135)
    {
        float _141 = float(_105);
        _115 = _141;
    }
    float _143 = _115;
    bool _145 = _139 >= _143;
    bool _147 = !_135;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_47.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _123 = as_type<int>(_155);
    }
    int _157 = _123;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2722 = as_type<float>(_157);
        out.gl_Position.z = _2722;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _163 = in.m_54.w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_49.x;
    float _177 = in.m_49.y;
    float _179 = in.m_49.z;
    float _181 = in.m_44.x;
    float _183 = in.m_44.y;
    float _185 = in.m_44.z;
    float _187 = 0.0;
    float _189 = _161;
    if (!_173)
    {
        float _191 = _161 * _161;
        float _193 = _191 * 0.5;
        _187 = _193;
    }
    float _195 = _187;
    float _197 = _195;
    if (!_173)
    {
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    int _203 = as_type<int>(_159) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_159) & 2;
    bool _209 = _207 != 0;
    bool _211 = !_205;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_209;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_173;
    float _221 = _201;
    bool _223 = _173;
    bool _225 = false;
    if (!_219)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = _161 * _229;
        float _239 = 1.0 / _233;
        float _241 = _235 * 0.693147182464599609375;
        float _243 = exp2(_237);
        float _245 = 1.0 / _241;
        float _247 = _243 + (-1.0);
        float _249 = -_247;
        float _251 = fma(_249, _245, _161);
        float _253 = _251 * _239;
        float _255 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _255;
    }
    float _257 = _221;
    bool _259 = !_173;
    if (!_259)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _161 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _189 = _279;
    }
    float _281 = _189;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _285 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _287 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _289 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _291 = fma(_281, _175, _285);
    float _293 = fma(_281, _177, _287);
    float _295 = fma(_281, _179, _289);
    float _297 = fma(_291, _163, _181);
    float _299 = fma(_293, _163, _183);
    float _301 = fma(_295, _163, _185);
    bool _303 = !_283;
    float _321;
    if (!_303)
    {
        float _305 = in.m_56.x;
        float _307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _309 = _305 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _313 = _311 * _307;
        float _315 = floor(_313);
        float _317 = -_315;
        float _319 = _313 + _317;
        _321 = _319;
        _323 = true;
    }
    else
    {
        float _325 = float(_105);
        float _327 = 1.0 / _325;
        float _329 = _139 * _327;
        _321 = _329;
    }
    _323 = false;
    float _331 = _321;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = _331 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _331 + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _357 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _359 = isnan(_331);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = 1.0 / _347;
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _373 = 1.0 / _343;
    float _375 = 1.0 / _355;
    float _377 = _339 * _369;
    float _379 = -_367;
    float _381 = _379 + 1.0;
    float _383 = 1.0 / _351;
    float _385 = _335 * _373;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _389 = _331 + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _393 = _331 + _391;
    float _395 = _389 * _375;
    bool _397 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _399 = isnan(_331);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _409;
    float _413 = _407 * _381;
    bool _415 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _417 = isnan(_331);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = _393 * _383;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _429;
    bool _433 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _435 = isnan(_331);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = fma(_411, _385, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _447 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _449 = isnan(_331);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = fma(_431, _385, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = -_443;
    float _467 = _465 + 1.0;
    float _469 = -_407;
    float _471 = _469 + 1.0;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _477 = _425 * _467;
    float _479 = -_425;
    float _481 = _479 + 1.0;
    float _483 = _443 * _471;
    float _485 = fma(_463, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _487 = fma(_475, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _489 = _457 * _481;
    float _491 = -_457;
    float _493 = _491 + 1.0;
    float _495 = in.m_54.x;
    float _497 = in.m_54.y;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _499;
    float _503 = _459 * _489;
    float _505 = _445 * _489;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _507;
    float _511 = fma(_501, _427, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _513 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[143].x, _503);
    float _515 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[143].y, _505);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _521 = fma(_509, _427, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _523 = fma(_485, _477, _513);
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _529 = fma(_487, _477, _515);
    float _531 = fma(_519, _395, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _533 = fma(_511, _483, _523);
    float _535 = fma(_527, _395, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _537 = fma(_521, _483, _529);
    float _539 = fma(_531, _413, _533);
    float _541 = fma(_535, _413, _537);
    float _543 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[147].x, _539);
    float _545 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[147].y, _541);
    float _547 = _543 * _495;
    float _549 = _545 * _497;
    bool _551 = !_371;
    float _569;
    if (!_551)
    {
        float _553 = in.m_56.x;
        float _555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _557 = _553 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _559 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _561 = _559 * _555;
        float _563 = floor(_561);
        float _565 = -_563;
        float _567 = _561 + _565;
        _569 = _567;
        _571 = true;
    }
    else
    {
        float _573 = float(_105);
        float _575 = 1.0 / _573;
        float _577 = _139 * _575;
        _569 = _577;
    }
    _571 = false;
    float _579 = _569;
    float _581 = in.m_58.x;
    float _583 = in.m_58.y;
    float _585 = in.m_58.z;
    float _587 = in.m_58.w;
    float _589 = in.m_60.x;
    float _591 = in.m_60.y;
    float _593 = in.m_60.z;
    float _595 = in.m_60.w;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _599 = _597 != 0;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _603 = _601 != 0;
    float _605 = in.m_56.w;
    float _607 = in.m_62.x;
    float _609 = in.m_62.y;
    float _611 = in.m_62.z;
    float _613 = in.m_62.w;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _617 = _615 != 0;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _623 = 0.0;
    float _625 = _579;
    if (_599)
    {
        float _627 = in.m_56.x;
        _623 = _627;
    }
    float _629 = _623;
    float _631 = 1.0 / _621;
    float _633 = 0.0;
    if (_603)
    {
        float _635 = in.m_56.w;
        _633 = _635;
    }
    float _637 = _633;
    float _639 = _299 * _583;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _645 = _299 * _591;
    float _647 = 1.0 / _643;
    float _649 = fma(_297, _581, _639);
    float _651 = fma(_297, _589, _645);
    bool _653 = _605 > 0.5;
    float _655 = fma(_301, _585, _649);
    bool _657 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _659 = isnan(_579);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = _299 * _609;
    float _671 = fma(_301, _593, _651);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _681 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _683 = isnan(_579);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = fma(_297, _607, _669);
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _701 = _675 * _631;
    float _703 = _679 * _647;
    float _705 = fma(_301, _611, _693);
    bool _707 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _709 = isnan(_579);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = _679;
    float _721 = _643;
    float _723 = _631;
    float _725 = _647;
    int _727 = as_type<int>(_595);
    float _729 = _613;
    float _731 = _703;
    if (_599)
    {
        float _733 = _629 * 3.1415927410125732421875;
        _719 = _733;
    }
    float _735 = _719;
    float _737 = -_691;
    float _739 = _737 + 1.0;
    float _741 = 1.0 / _697;
    if (_603)
    {
        float _743 = _637 * 3.1415927410125732421875;
        _721 = _743;
    }
    float _745 = _721;
    out.m_64.w = _699;
    if (_599)
    {
        float _747 = _735 * 0.15915493667125701904296875;
        _723 = _747;
    }
    float _749 = _723;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _753 = _579 + _751;
    if (_603)
    {
        float _755 = _745 * 0.15915493667125701904296875;
        _725 = _755;
    }
    float _757 = _725;
    float _759 = _655 + _587;
    bool _761 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _763 = isnan(_579);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = _717 * _739;
    float _775 = _757;
    if (_603)
    {
        float _777 = _757 * 6.283185482025146484375;
        float _779 = sin(_777);
        _775 = _779;
    }
    float _781 = _775;
    float _783 = _739;
    float _785 = _735;
    if (_617)
    {
        float _787 = in.m_56.x;
        float _789 = in.m_56.y;
        _783 = _787;
        _785 = _789;
    }
    float _791 = _783;
    float _793 = _785;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _795;
    float _799 = -_771;
    float _801 = _799 + 1.0;
    float _803 = -_717;
    float _805 = _803 + 1.0;
    float _807 = _797 * _741;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _811 = _579 + _809;
    float _813 = _749;
    float _815 = _811;
    if (_599)
    {
        float _817 = _749 * 6.283185482025146484375;
        float _819 = sin(_817);
        _813 = _819;
    }
    float _821 = _813;
    float _823 = _667 * _801;
    float _825 = _771 * _805;
    float _827 = fma(_701, _811, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _831 = _579 + _829;
    float _833 = -_667;
    float _835 = _833 + 1.0;
    float _837 = _705 + _613;
    float _839 = _827 * _823;
    float _841 = fma(_703, _831, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    if (_603)
    {
        bool _843 = _781 > 0.5;
        _223 = _843;
    }
    bool _845 = _223;
    float _847 = _671 + _595;
    float _849 = fma(_807, _753, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _851 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[115].x, _839);
    float _853 = _847;
    if (_617)
    {
        _727 = 0;
    }
    int _855 = _727;
    int _857 = _855;
    if (_599)
    {
        bool _859 = _821 > 0.5;
        _225 = _859;
    }
    bool _861 = _225;
    float _863 = _791;
    float _865 = _793;
    if (_617)
    {
        _625 = _791;
    }
    float _867 = _625;
    float _869 = _867;
    if (_617)
    {
        _729 = _793;
    }
    float _871 = _729;
    float _873 = _871;
    if (!_617)
    {
        float _875 = in.m_56.x;
        float _877 = in.m_56.y;
        float _879 = _875 * 3.1415927410125732421875;
        float _881 = _879 * 0.15915493667125701904296875;
        float _883 = _877 * 3.1415927410125732421875;
        float _885 = _883 * 0.15915493667125701904296875;
        float _887 = _881 * 6.283185482025146484375;
        float _889 = sin(_887);
        float _891 = _885 * 6.283185482025146484375;
        float _893 = sin(_891);
        _863 = _875;
        _865 = _877;
        _857 = 1;
        _869 = _889;
        _873 = _893;
    }
    float _895 = _863;
    float _897 = _865;
    int _899 = _857;
    float _901 = _869;
    float _903 = _873;
    float _905 = in.m_56.z;
    if (!_603)
    {
        _731 = _213;
    }
    float _907 = _731;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _911 = _907;
    if (_603)
    {
        float _913 = -_213;
        float _915 = _845 ? _913 : _213;
        _911 = _915;
    }
    float _917 = _911;
    float _919 = _895 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _921 = _895 > 0.5;
    float _923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _925 = _897 > 0.5;
    float _927 = -_909;
    float _929 = fma(_919, 2.0, _927);
    if (!_599)
    {
        _815 = _217;
    }
    float _931 = _815;
    float _933 = fma(_841, _825, _851);
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _937 = _935 != 0;
    float _939 = -_139;
    float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[76].x, _929);
    float _943 = _931;
    if (_599)
    {
        float _945 = -_217;
        float _947 = _861 ? _945 : _217;
        _943 = _947;
    }
    float _949 = _943;
    float _951 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _953 = -_213;
    int _955 = _921 ? as_type<int>(_953) : as_type<int>(_213);
    float _957 = fma(_849, _773, _933);
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _961 = _959 != 0;
    float _963 = -_217;
    int _965 = _925 ? as_type<int>(_963) : as_type<int>(_217);
    float _967 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[118].x, _957);
    float _969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _971 = _899 != 1;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _975 = _973 != 0;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _981 = _979 != 0;
    float _983 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[93].z, _977);
    bool _985 = !_937;
    float _987 = _985 ? _213 : as_type<float>(_955);
    float _989 = _897 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _991 = !_961;
    float _993 = _991 ? _217 : as_type<float>(_965);
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1001 = _999 != 0;
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1005 = _1003 != 0;
    float _1007 = _901 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1013 = _903 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1015 = -_995;
    float _1017 = fma(_1007, 2.0, _1015);
    float _1019 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1009);
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1023 = fma(_1013, -2.0, _1011);
    float _1025 = _923 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1027 = -_139;
    float _1029 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1017);
    float _1031 = _917 + 0.5;
    float _1033 = fma(_989, -2.0, _1021);
    float _1035 = _1007;
    float _1037 = _989;
    float _1039 = _923;
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_971)
    {
        _1035 = _905;
    }
    float _1043 = _1035;
    float _1045 = fma(_1025, _1031, _1029);
    float _1047 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1023);
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1051 = _1043;
    float _1053 = _1049;
    if (!_971)
    {
        _1037 = _1043;
    }
    float _1055 = _1037;
    float _1057 = _951 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1059 = _951;
    float _1061 = _1055;
    if (_971)
    {
        _1051 = _905;
    }
    float _1063 = _1051;
    float _1065 = _949 + (-0.5);
    float _1067 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1049);
    if (!_971)
    {
        _1039 = _897;
    }
    float _1069 = _1039;
    float _1071 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1033);
    float _1073 = _1069;
    if (!_971)
    {
        _1041 = _897;
    }
    float _1075 = _1041;
    float _1077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1079 = _1075;
    if (_971)
    {
        _1073 = _895;
    }
    float _1081 = _1073;
    if (_971)
    {
        _1079 = _895;
    }
    float _1083 = _1079;
    if (!_971)
    {
        _1053 = _895;
    }
    float _1085 = _1053;
    float _1087 = -_1057;
    float _1089 = -_1047;
    float _1091 = fma(_1087, _1065, _1089);
    float _1093 = _1085;
    if (_971)
    {
        _1093 = _1063;
    }
    float _1095 = _1093;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_971)
    {
        _1059 = _1055;
    }
    float _1101 = _1059;
    float _1103 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1097);
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1107 = _759 + _1105;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1111 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1099);
    float _1113 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1103);
    float _1115 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1117 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1109);
    float _1119 = _1101;
    if (_971)
    {
        _1119 = _897;
    }
    float _1121 = _1119;
    float _1123 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1125 = _837 + _1123;
    if (_971)
    {
        _1061 = _897;
    }
    float _1127 = _1061;
    float _1129 = _969 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1131 = _1113 * (-0.15915493667125701904296875);
    float _1133 = _987 + 0.5;
    float _1135 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1115);
    float _1137 = _1131 * 6.283185482025146484375;
    float _1139 = sin(_1137);
    float _1141 = fma(_1129, _1133, _941);
    float _1143 = _997 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1145 = _993 + (-0.5);
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1149 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1153 = _847 + _1151;
    float _1155 = -_1143;
    float _1157 = -_1071;
    float _1159 = fma(_1155, _1145, _1157);
    float _1161 = _1131 * 6.283185482025146484375;
    float _1163 = cos(_1161);
    float _1165 = -_217;
    int _1167 = _653 ? as_type<int>(_1165) : as_type<int>(_217);
    float _1169 = -_1147;
    float _1171 = fma(_1149, 2.0, _1169);
    bool _1173 = _1063 > 0.5;
    float _1175 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1135);
    float _1177 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1111);
    bool _1179 = !_981;
    float _1181 = _1179 ? _217 : as_type<float>(_1167);
    float _1183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1187 = -_213;
    int _1189 = _1173 ? as_type<int>(_1187) : as_type<int>(_213);
    float _1191 = _1181 * _1139;
    bool _1193 = _1175 >= 0.0;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1197 = !_975;
    float _1199 = _1197 ? _213 : as_type<float>(_1189);
    float _1201 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1203 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1185);
    float _1205 = _1181 * _1163;
    float _1207 = -_139;
    float _1209 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1171);
    float _1211 = fma(_1201, -2.0, _1195);
    float _1213 = -_1191;
    float _1215 = fma(_1199, _1163, _1213);
    float _1217 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1019);
    float _1219 = -_213;
    int _1221 = _925 ? as_type<int>(_1219) : as_type<int>(_213);
    float _1223 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1225 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1117);
    float _1227 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1067);
    float _1229 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].z, _983);
    float _1231 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1203);
    float _1233 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1211);
    float _1235 = _1215 + 0.5;
    float _1237 = fma(_1199, _1139, _1205);
    bool _1239 = !_1001;
    float _1241 = _1239 ? _213 : as_type<float>(_1221);
    float _1243 = -_1229;
    float _1245 = _1243 + 1.0;
    float _1247 = fma(_1223, _1235, _1209);
    float _1249 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1251 = _1237 + (-0.5);
    float _1253 = _1241 + 0.5;
    float _1255 = -_217;
    int _1257 = _1173 ? as_type<int>(_1255) : as_type<int>(_217);
    float _1259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1261 = -_1249;
    float _1263 = -_1233;
    float _1265 = fma(_1261, _1251, _1263);
    float _1267 = _1253 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1269 = _1107 * _1107;
    float _1271 = -_1245;
    float _1273 = fma(_1271, _917, _1045);
    float _1275 = -_1217;
    float _1277 = _1275 + 1.0;
    float _1279 = -_1225;
    float _1281 = _1279 + 1.0;
    float _1283 = fma(_1125, _1125, _1269);
    float _1285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1287 = fma(_1277, _949, _1091);
    bool _1289 = !_1005;
    float _1291 = _1289 ? _217 : as_type<float>(_1257);
    float _1293 = -_1227;
    float _1295 = _1293 + 1.0;
    float _1297 = fma(_1153, _1153, _1283);
    float _1299 = fma(_993, _1281, _1159);
    float _1301 = _1283;
    if (_1193)
    {
        _1301 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1303 = _1301;
    float _1305 = -_1291;
    float _1307 = _1305 + 0.5;
    float _1309 = rsqrt(_1297);
    float _1311 = -_1295;
    float _1313 = fma(_987, _1311, _1141);
    float _1315 = -_1177;
    float _1317 = _1315 + 1.0;
    float _1319 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1321 = -_1231;
    float _1323 = _1321 + 1.0;
    float _1325 = _967 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1327 = _1267 * _1259;
    float _1329 = _1319 * _1285;
    int _1331 = as_type<int>(_1303);
    if (_1193)
    {
        float _1333 = _1303 * 5.0;
        _1331 = as_type<int>(_1333);
    }
    int _1335 = _1331;
    float _1337 = -_1317;
    float _1339 = fma(_1215, _1337, _1247);
    float _1341 = fma(_1237, _1323, _1265);
    out.m_66.x = _1273;
    out.m_66.y = _1287;
    out.m_68.w = _1325;
    float _1343 = _1107 * _1309;
    float _1345 = _1125 * _1309;
    if (_1193)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4602 = as_type<float>(_1335);
        out.gl_Position.z = _4602;
    }
    out.m_70.x = _1327;
    out.m_70.y = _1329;
    out.m_72.x = _1313;
    out.m_72.y = _1299;
    out.m_72.z = _1339;
    out.m_72.w = _1341;
    if (_1193)
    {
        out.m_47.x = 0.0;
    }
    if (_1193)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1347 = -_1343;
    float _1349 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[18].w, _759);
    float _1351 = _1153 * _1309;
    float _1353 = -_1345;
    float _1355 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[18].w, _837);
    float _1357 = -_1343;
    float _1359 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1107);
    float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1363 = _1349 + _1361;
    float _1365 = -_1351;
    float _1367 = fma(_1365, (*spvDescriptorSet0.vp_c9)._m0[18].w, _847);
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1371 = _1355 + _1369;
    float _1373 = -_1345;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1125);
    float _1377 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1379 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1381 = _1367 + _1379;
    float _1383 = _1359 * _1359;
    float _1385 = -_1351;
    float _1387 = fma(_1385, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1153);
    float _1389 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1377);
    float _1391 = fma(_1375, _1375, _1383);
    float _1393 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1389);
    float _1395 = fma(_1387, _1387, _1391);
    bool _1397 = _1393 >= 0.0;
    float _1399 = sqrt(_1395);
    float _1401 = _1377;
    float _1403 = _1351;
    float _1405 = _1363;
    float _1407 = _1355;
    float _1409 = _1367;
    if (_1397)
    {
        _1401 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1411 = _1401;
    int _1413 = as_type<int>(_1411);
    if (_1397)
    {
        out.m_47.x = 0.0;
    }
    if (_1397)
    {
        float _1415 = _1411 * 5.0;
        _1413 = as_type<int>(_1415);
    }
    int _1417 = _1413;
    float _1419 = _1309 * _1399;
    if (_1397)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4750 = as_type<float>(_1417);
        out.gl_Position.z = _4750;
    }
    if (_1397)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1421 = _549 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1423 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _1427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _1429 = _1419 * _1421;
    float _1431 = _1419 * _1423;
    float _1433 = _1425 * _1429;
    float _1435 = _1427 * _1431;
    float _1437 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1439 = _1437 * 0.5;
    bool _1441 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1443 = isnan(0.5);
    bool _1445 = _1441 || _1443;
    bool _1447 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1449 = _1445 || _1447;
    float _1451 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1453 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1455 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1457 = isnan(0.5);
    bool _1459 = _1455 || _1457;
    bool _1461 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1463 = _1459 || _1461;
    float _1465 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1451);
    float _1467 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1453);
    float _1469 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1471 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1465);
    float _1473 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1467);
    float _1475 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1469);
    float _1477 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1479 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1481 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1475);
    float _1483 = _847 + _1477;
    float _1485 = _837 + _1479;
    float _1487 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1489 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1491 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1493 = _1483 + _1491;
    float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1497 = _1485 + _1495;
    float _1499 = 1.0 / _1487;
    float _1501 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1489);
    float _1503 = _1493 * _1493;
    float _1505 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1501);
    float _1507 = fma(_1497, _1497, _1503);
    float _1509 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1511 = sqrt(_1507);
    float _1513 = _1509 + _1487;
    float _1515 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1517 = _1513 * _1499;
    float _1519 = _1517 * 0.5;
    float _1521 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1515);
    float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1525 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1523);
    float _1527 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1521);
    bool _1529 = _1511 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1531 = 1.0 / _1525;
    float _1533 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1535 = _759 + _1533;
    float _1537 = _1487;
    float _1539 = _1439;
    float _1541 = _1519;
    float _1543 = _1533;
    float _1545 = _1485;
    if (!_1529)
    {
        _1537 = _1485;
    }
    float _1547 = _1537;
    float _1549 = _1547;
    if (!_1529)
    {
        _1539 = _1483;
    }
    float _1551 = _1539;
    float _1553 = _1551;
    if (!_1529)
    {
        _1541 = _1535;
    }
    float _1555 = _1541;
    bool _1557 = !_1529;
    float _1559 = _1555;
    if (!_1557)
    {
        float _1561 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1563 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1565 = _1511 + _1563;
        float _1567 = rsqrt(_1507);
        float _1569 = _1565 * _1561;
        float _1571 = _1535 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1573 = _1569 * 0.15915493667125701904296875;
        float _1575 = _1573 * 6.283185482025146484375;
        float _1577 = cos(_1575);
        float _1579 = _1573 * 6.283185482025146484375;
        float _1581 = sin(_1579);
        float _1583 = _1577 + (-1.0);
        float _1585 = fma(_1581, _1571, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1587 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1589 = _1567 * _1585;
        float _1591 = fma(_1535, _1577, _1587);
        float _1593 = fma(_1497, _1589, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1595 = fma(_1493, _1589, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1549 = _1593;
        _1553 = _1595;
        _1559 = _1591;
        _1543 = _1589;
    }
    float _1597 = _1549;
    float _1599 = _1553;
    float _1601 = _1559;
    float _1603 = _1543;
    float _1605 = -_1345;
    float _1607 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1597);
    float _1609 = -_1351;
    float _1611 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1599);
    float _1613 = -_1343;
    float _1615 = fma(_1613, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1601);
    float _1617 = _1603;
    float _1619 = _1615;
    float _1621 = _1611;
    if (_1463)
    {
        _1617 = 1.0;
    }
    float _1623 = _1617;
    float _1625 = _1623;
    if (_1449)
    {
        _1403 = _1607;
    }
    float _1627 = _1403;
    float _1629 = _1627;
    if (!_1449)
    {
        float _1631 = _1363 * _1363;
        float _1633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1635 = -_847;
        float _1637 = _1635 + _1599;
        float _1639 = -_837;
        float _1641 = _1639 + _1597;
        float _1643 = fma(_1371, _1371, _1631);
        float _1645 = -_759;
        float _1647 = _1645 + _1601;
        float _1649 = fma(_1381, _1381, _1643);
        float _1651 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1653 = sqrt(_1649);
        float _1655 = 1.0 / _1419;
        float _1657 = precise::min(_1653, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1659 = _1657 * _1633;
        float _1661 = _1651 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1663 = _1659 * _1655;
        float _1665 = _1661 * _1663;
        float _1667 = _1637 * _1663;
        float _1669 = fma(_1641, _1665, _1355);
        float _1671 = fma(_1647, _1665, _1349);
        float _1673 = fma(_1661, _1667, _1367);
        _1405 = _1661;
        _1619 = _1671;
        _1629 = _1669;
        _1621 = _1673;
        _853 = _1667;
    }
    float _1675 = _1405;
    float _1677 = _1619;
    float _1679 = _1629;
    float _1681 = _1621;
    float _1683 = _853;
    float _1685 = _1683;
    float _1687 = _1675;
    if (_1463)
    {
        _1685 = 1.0;
    }
    float _1689 = _1685;
    float _1691 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1693 = _1531 * _1691;
    float _1695 = _1689;
    if (!_1463)
    {
        float _1697 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1699 = _1697 * 0.15915493667125701904296875;
        float _1701 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1703 = _1699 * 6.283185482025146484375;
        float _1705 = cos(_1703);
        float _1707 = _1701 * 0.15915493667125701904296875;
        float _1709 = _1699 * 6.283185482025146484375;
        float _1711 = sin(_1709);
        float _1713 = 1.0 / _1705;
        float _1715 = _1707 * 6.283185482025146484375;
        float _1717 = cos(_1715);
        float _1719 = _1711 * _1713;
        float _1721 = _1707 * 6.283185482025146484375;
        float _1723 = sin(_1721);
        float _1725 = _1717 * _1719;
        float _1727 = 1.0 / _1725;
        float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1731 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1729;
        float _1733 = 1.0 / _1731;
        float _1735 = _1723 * _1727;
        float _1737 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1739 = fma(_1693, _1735, _1737);
        float _1741 = _1739 * _1733;
        float _1743 = precise::clamp(_1741, 0.0, 1.0);
        _1687 = _1699;
        _1407 = _1707;
        _1625 = _1743;
    }
    float _1745 = _1687;
    float _1747 = _1407;
    float _1749 = _1625;
    float _1751 = _1745;
    float _1753 = _1747;
    if (!_1463)
    {
        float _1755 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1757 = _1755 * 0.15915493667125701904296875;
        float _1759 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1761 = _1757 * 6.283185482025146484375;
        float _1763 = cos(_1761);
        float _1765 = _1759 * 0.15915493667125701904296875;
        float _1767 = _1757 * 6.283185482025146484375;
        float _1769 = sin(_1767);
        float _1771 = 1.0 / _1763;
        float _1773 = _1765 * 6.283185482025146484375;
        float _1775 = cos(_1773);
        float _1777 = _1769 * _1771;
        float _1779 = _1765 * 6.283185482025146484375;
        float _1781 = sin(_1779);
        float _1783 = _1775 * _1777;
        float _1785 = 1.0 / _1783;
        float _1787 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1789 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1787;
        float _1791 = 1.0 / _1789;
        float _1793 = _1781 * _1785;
        float _1795 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1797 = fma(_1693, _1793, _1795);
        float _1799 = _1797 * _1791;
        float _1801 = precise::clamp(_1799, 0.0, 1.0);
        float _1803 = -_1801;
        float _1805 = _1803 + 1.0;
        _1751 = _1771;
        _1753 = _1783;
        _1695 = _1805;
    }
    float _1807 = _1751;
    float _1809 = _1753;
    float _1811 = _1695;
    float _1813 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1815 = _1677 + _1813;
    float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1819 = _1679 + _1817;
    float _1821 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1823 = _1681 + _1821;
    float _1825 = _1815 * _1815;
    float _1827 = fma(_1819, _1819, _1825);
    float _1829 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1831 = fma(_1823, _1823, _1827);
    float _1833 = rsqrt(_1831);
    float _1835 = sqrt(_1831);
    float _1837 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1839 = _1819 * _1837;
    float _1841 = _1823 * _1837;
    float _1843 = _1839 * _1839;
    float _1845 = _1841 * _1841;
    float _1847 = _1843 + _1845;
    float _1849 = sqrt(_1847);
    bool _1851 = _1849 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1853 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1855 = _1849 + _1853;
    float _1857 = _1807;
    float _1859 = _1855;
    float _1861 = _1815;
    float _1863 = _1839;
    if (_1851)
    {
        float _1865 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1857 = _1865;
    }
    float _1867 = _1857;
    float _1869 = _1867;
    if (_1851)
    {
        float _1871 = _1855 * _1867;
        _1859 = _1871;
    }
    float _1873 = _1859;
    if (_1851)
    {
        float _1875 = rsqrt(_1847);
        _1869 = _1875;
    }
    float _1877 = _1869;
    float _1879 = _1877;
    if (_1851)
    {
        float _1881 = _1873 * 0.15915493667125701904296875;
        _1409 = _1881;
    }
    float _1883 = _1409;
    float _1885 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1887 = _1823;
    if (_1851)
    {
        float _1889 = _1883 * 6.283185482025146484375;
        float _1891 = sin(_1889);
        _1887 = _1891;
    }
    float _1893 = _1887;
    float _1895 = precise::max(0.0, _1885);
    float _1897 = _1809;
    float _1899 = _1895;
    if (_1851)
    {
        float _1901 = _1883 * 6.283185482025146484375;
        float _1903 = cos(_1901);
        _1897 = _1903;
    }
    float _1905 = _1897;
    float _1907 = -_1837;
    float _1909 = -_1895;
    float _1911 = fma(_1815, _1907, _1909);
    float _1913 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1851)
    {
        float _1915 = _1911 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1861 = _1915;
    }
    float _1917 = _1861;
    float _1919 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1913);
    float _1921 = _1893;
    float _1923 = _1917;
    if (_1851)
    {
        float _1925 = fma(_1893, _1917, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1921 = _1925;
    }
    float _1927 = _1921;
    float _1929 = _1927;
    if (!_1851)
    {
        _1923 = _1911;
    }
    float _1931 = _1923;
    float _1933 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1919);
    float _1935 = _1931;
    if (_1851)
    {
        float _1937 = _1877 * _1927;
        _1545 = _1937;
    }
    float _1939 = _1545;
    if (!_1851)
    {
        _1929 = _1843;
    }
    float _1941 = _1929;
    float _1943 = _1933 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1945 = _1941;
    float _1947 = _1905;
    if (_1851)
    {
        float _1949 = _1905 + (-1.0);
        _1899 = _1949;
    }
    float _1951 = _1899;
    float _1953 = _1951;
    if (_1851)
    {
        float _1955 = _1839 * _1939;
        _1863 = _1955;
    }
    float _1957 = _1863;
    if (_1851)
    {
        float _1959 = _1951 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1879 = _1959;
    }
    float _1961 = _1879;
    if (!_1851)
    {
        _1953 = _1841;
    }
    float _1963 = _1953;
    float _1965 = _1963;
    if (_1851)
    {
        float _1967 = _1841 * _1939;
        _1965 = _1967;
    }
    float _1969 = _1965;
    if (_1851)
    {
        float _1971 = _1957 * _1957;
        _1945 = _1971;
    }
    float _1973 = _1945;
    if (_1851)
    {
        float _1975 = fma(_1911, _1905, _1961);
        _1935 = _1975;
    }
    float _1977 = _1935;
    if (!_1851)
    {
        _1947 = _1845;
    }
    float _1979 = _1947;
    float _1981 = _1979;
    if (_1851)
    {
        float _1983 = _1969 * _1969;
        _1981 = _1983;
    }
    float _1985 = _1981;
    float _1987 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1989 = fma(_1977, _1977, _1973);
    float _1991 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1987);
    float _1993 = _1989 + _1985;
    float _1995 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1997 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1999 = fma(_1835, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1997);
    float _2001 = precise::clamp(_1999, 0.0, 1.0);
    float _2003 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1991);
    float _2005 = rsqrt(_1993);
    float _2007 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2009 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1995);
    float _2011 = -_2001;
    float _2013 = _2011 + 1.0;
    float _2015 = _2003 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2017 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2007);
    float _2019 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2009);
    float _2021 = abs(_2013);
    float _2023 = log2(_2021);
    float _2025 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2017);
    float _2027 = _2019 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2029 = _2015 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2031 = _2025 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2033 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2035 = -_2029;
    float _2037 = fma(_2035, _1829, 1.0);
    float _2039 = _2005 * _1957;
    float _2041 = _2005 * _1977;
    float _2043 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2033);
    float _2045 = _2005 * _1969;
    float _2047 = _2039 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2049 = log2(_2037);
    float _2051 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2043);
    float _2053 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2055 = -_2047;
    float _2057 = fma(_2041, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2055);
    float _2059 = _2023 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2061 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2051);
    float _2063 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2053);
    float _2065 = -_2045;
    float _2067 = fma(_2065, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2057);
    float _2069 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2071 = 1.0 / _2061;
    float _2073 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2063);
    float _2075 = fma(_2067, -0.5, 0.5);
    float _2077 = fma(_2067, 0.5, 0.5);
    float _2079 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2069);
    float _2081 = _2041 + 1.0;
    float _2083 = _2049 * 0.693147182464599609375;
    float _2085 = exp2(_2059);
    float _2087 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2079);
    float _2089 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2091 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2087);
    float _2093 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2073);
    float _2095 = sqrt(_2075);
    float _2097 = fma(_2077, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2099 = _2091 * _2071;
    float _2101 = fma(_2077, _2097, -0.212114393711090087890625);
    float _2103 = fma(_2099, 0.5, 0.5);
    float _2105 = -_2041;
    float _2107 = fma(_2085, _2081, _2105);
    float _2109 = fma(_2077, _2101, 1.570728778839111328125);
    float _2111 = _2093 * _2071;
    float _2113 = fma(_2107, 0.5, 0.5);
    float _2115 = fma(_2111, -0.5, 0.5);
    float _2117 = _2095 * 0.636619746685028076171875;
    float _2119 = -_2109;
    float _2121 = fma(_2117, _2119, 1.0);
    float3 _5858 = float3(_2103, _2115, _2089);
    float _2123 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5858, float3(0.0), isnan(_5858)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5858, float3(0.0), isnan(_5858)), level(0.0)).x;
    float3 _5869 = float3(_2103, _2115, _2089);
    float4 _2126 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5869, float3(0.0), isnan(_5869)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5869, float3(0.0), isnan(_5869)), level(0.0)).xyzw;
    float _2128 = _2126.x;
    float _2130 = _2126.y;
    float _2132 = _2126.z;
    float _2134 = _2126.w;
    float2 _5886 = float2(_2121, _2113);
    float3 _2138 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5886, float2(0.0), isnan(_5886)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5886, float2(0.0), isnan(_5886)), level(0.0)).xyz;
    float _2140 = _2138.x;
    float _2142 = _2138.y;
    float _2144 = _2138.z;
    float _2146 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2148 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2150 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2152 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2146);
    float _2154 = fma(_2148, _2148, 1.0);
    float _2156 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2152);
    float _2158 = _2023 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2160 = rsqrt(_2154);
    bool _2162 = _1835 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2164 = isnan(_1835);
    bool _2166 = _2162 || _2164;
    bool _2168 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2170 = _2166 || _2168;
    out.m_74.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_74.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_74.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _2172 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2156);
    float _2174 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2176 = exp2(_2158);
    out.gl_Position.x = _2091;
    out.gl_Position.y = _2093;
    out.gl_Position.z = _2172;
    out.gl_Position.w = _2061;
    float _2178 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2180 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2182 = _2148 * _2160;
    float _2184 = _2061 * 0.5;
    float _2186 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2178);
    float _2188 = _2091 + _2061;
    float _2190 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2192 = _2182 * _2190;
    float _2194 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2196 = _2182 * _2194;
    float _2198 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2200 = _2182 * _2198;
    float _2202 = fma(_2093, -0.5, _2184);
    float _2204 = -_2176;
    float _2206 = _2204 + 1.0;
    float _2208 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2192);
    float _2210 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2196);
    float _2212 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2200);
    float _2214 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2216 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2180);
    float _2218 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2174);
    float _2220 = _2172 + _2061;
    out.m_76.x = _2208;
    out.m_76.y = _2210;
    out.m_76.z = _2212;
    float _2222 = _2188 * 0.5;
    float _2224 = _2220 * 0.5;
    float _2226 = _2093;
    float _2228 = _2172;
    float _2230 = _2091;
    float _2232 = _2186;
    float _2234 = _2222;
    if (!_2170)
    {
        _2226 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2236 = _2226;
    float _2238 = _2236;
    float _2240 = _2236;
    if (!_2170)
    {
        _2228 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2242 = _2228;
    out.m_78.x = _2222;
    out.m_78.y = _2202;
    out.m_78.z = _2224;
    out.m_78.w = _2061;
    float _2244 = _2242;
    float _2246 = _2242;
    if (!_2170)
    {
        _2230 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2248 = _2230;
    float _2250 = _2186 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2252 = _2216 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2254 = _2218 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2256 = _1749 * _1811;
    float _2258 = _2256;
    float _2260 = _2248;
    float _2262 = _2248;
    if (!_2170)
    {
        _2232 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2264 = _2232;
    out.m_80.x = _2250;
    out.m_80.y = _2252;
    out.m_80.z = _2254;
    float _2266 = _2256 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2268 = _2264;
    float _2270 = _2264;
    if (!_2170)
    {
        _2234 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2272 = _2234;
    float _2274 = _2272;
    float _2276 = _2272;
    if (!_2170)
    {
        _2258 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2278 = _2258;
    float _2280 = _2214 * _2123;
    float _2282 = -_2214;
    float _2284 = _2282 + 1.0;
    float _2286 = _2134 * _2280;
    float _2288 = _2144 * _2280;
    float _2290 = _2134 * _2284;
    float _2292 = fma(_2140, _2286, _2128);
    float _2294 = fma(_2142, _2286, _2130);
    float _2296 = fma(_2134, _2288, _2132);
    out.m_82.x = _2292;
    out.m_82.y = _2294;
    out.m_82.z = _2296;
    out.m_82.w = _2290;
    bool _2298 = !_2170;
    float _2300 = _2278;
    float _2302 = _2278;
    if (!_2298)
    {
        bool _2304 = _1835 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2306 = isnan(_1835);
        bool _2308 = _2304 || _2306;
        bool _2310 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2312 = _2308 || _2310;
        if (!_2312)
        {
            float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2316 = _1835 + _2314;
            float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2320 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2318;
            float _2322 = 1.0 / _2320;
            float _2324 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2326 = _2324 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2330 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2334 = _2332 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2338 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2342 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2344 = _2316 * _2322;
            float _2346 = precise::clamp(_2344, 0.0, 1.0);
            float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2350 = _2348 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2352 = fma(_2346, _2326, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2354 = fma(_2346, _2350, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2356 = fma(_2346, _2330, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2358 = fma(_2346, _2334, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2360 = fma(_2346, _2338, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2362 = fma(_2346, _2342, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2276 = _2352;
            _2270 = _2360;
            _2240 = _2354;
            _2262 = _2358;
            _2246 = _2356;
            _2302 = _2362;
            _2364 = true;
        }
        else
        {
            bool _2366 = _1835 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2368 = isnan(_1835);
            bool _2370 = _2366 || _2368;
            bool _2372 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2374 = _2370 || _2372;
            if (!_2374)
            {
                _2238 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2376 = _2238;
            _2240 = _2376;
            if (!_2374)
            {
                _2274 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2378 = _2274;
            _2276 = _2378;
            if (!_2374)
            {
                _2244 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2380 = _2244;
            _2246 = _2380;
            if (!_2374)
            {
                _2260 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2382 = _2260;
            _2262 = _2382;
            if (!_2374)
            {
                _2268 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2384 = _2268;
            _2270 = _2384;
            if (!_2374)
            {
                _2300 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2386 = _2300;
            bool _2388 = !_2374;
            _2302 = _2386;
            if (!_2388)
            {
                bool _2390 = _1835 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2392 = isnan(_1835);
                bool _2394 = _2390 || _2392;
                bool _2396 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2398 = _2394 || _2396;
                if (!_2398)
                {
                    float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2402 = _1835 + _2400;
                    float _2404 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2406 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2404;
                    float _2408 = 1.0 / _2406;
                    float _2410 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2412 = _2410 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2422 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2430 = _2402 * _2408;
                    float _2432 = precise::clamp(_2430, 0.0, 1.0);
                    float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2438 = fma(_2432, _2412, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2440 = fma(_2432, _2436, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2442 = fma(_2432, _2416, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2444 = fma(_2432, _2420, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2446 = fma(_2432, _2424, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2448 = fma(_2432, _2428, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2276 = _2438;
                    _2270 = _2446;
                    _2240 = _2440;
                    _2262 = _2444;
                    _2246 = _2442;
                    _2302 = _2448;
                    _2364 = true;
                }
                else
                {
                    _2276 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2270 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2240 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2262 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2246 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2302 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2364 = false;
    float _2450 = _2276;
    float _2452 = _2270;
    float _2454 = _2240;
    float _2456 = _2262;
    float _2458 = _2246;
    float _2460 = _2302;
    float _2462 = _2266 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2464 = fma(_2252, -0.5, 0.5);
    float _2466 = precise::clamp(_2464, 0.0, 1.0);
    float _2468 = -_2450;
    float _2470 = _2468 + _2452;
    float _2472 = -_2454;
    float _2474 = _2472 + _2456;
    out.m_47.x = _2462;
    float _2476 = -_2458;
    float _2478 = _2476 + _2460;
    float _2480 = fma(_2466, _2470, _2450);
    float _2482 = fma(_2466, _2474, _2454);
    bool _2484 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2486 = _2480 * 0.586610972881317138671875;
    float _2488 = fma(_2466, _2478, _2458);
    out.m_84.x = 0.0;
    bool _2490 = _1749 > 0.0;
    bool _2492 = isnan(_1749);
    bool _2494 = _2490 || _2492;
    bool _2496 = isnan(0.0);
    bool _2498 = _2494 || _2496;
    float _2500 = fma(_2482, 0.298911988735198974609375, _2486);
    bool _2502 = _1811 <= 0.0;
    bool _2504 = !_2498;
    bool _2506 = _2502 || _2504;
    float _2508 = fma(_2488, 0.114477999508380889892578125, _2500);
    float _2510 = -_2508;
    float _2512 = _2482 + _2510;
    float _2514 = fma(_2512, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2508);
    bool _2516 = !_2484;
    if (!_2516)
    {
        float _2518 = -_1677;
        float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2522 = -_1679;
        float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2526 = -_1681;
        float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2530 = _2520 * _2520;
        float _2532 = fma(_2524, _2524, _2530);
        float _2534 = fma(_2528, _2528, _2532);
        float _2536 = sqrt(_2534);
        float _2538 = rsqrt(_2534);
        float _2540 = -_2536;
        float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2544 = _2542 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2546 = precise::clamp(_2544, 0.0, 1.0);
        float _2548 = _2524 * _2538;
        float _2550 = _2520 * _2538;
        float _2552 = abs(_2546);
        float _2554 = log2(_2552);
        float _2556 = _2528 * _2538;
        float _2558 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2560 = _2252 * _2550;
        float _2562 = -_2550;
        float _2564 = -_2558;
        float _2566 = fma(_2562, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2564);
        float _2568 = fma(_2250, _2548, _2560);
        float _2570 = -_2556;
        float _2572 = fma(_2570, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2566);
        float _2574 = fma(_2254, _2556, _2568);
        float _2576 = precise::clamp(_2574, 0.0, 1.0);
        float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2580 = _2572 + _2578;
        float _2582 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2584 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2586 = precise::clamp(_2584, 0.0, 1.0);
        float _2588 = exp2(_2582);
        float _2590 = _2588 * _2586;
        float _2592 = _2576 * _2590;
        float _2594 = _2592 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        out.m_84.x = _2594;
    }
    out.m_86.x = _2514;
    if (!_2506)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2596 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2596;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2364 = false;
    bool _571 = false;
    bool _323 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2653 = as_type<float>(_121);
        out.gl_Position.z = _2653;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_49.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_135)
    {
        float _141 = float(_105);
        _115 = _141;
    }
    float _143 = _115;
    bool _145 = _139 >= _143;
    bool _147 = !_135;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_47.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _123 = as_type<int>(_155);
    }
    int _157 = _123;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2722 = as_type<float>(_157);
        out.gl_Position.z = _2722;
    }
    if (_149)
    {
        return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _163 = in.m_54.w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_49.x;
    float _177 = in.m_49.y;
    float _179 = in.m_49.z;
    float _181 = in.m_44.x;
    float _183 = in.m_44.y;
    float _185 = in.m_44.z;
    float _187 = 0.0;
    float _189 = _161;
    if (!_173)
    {
        float _191 = _161 * _161;
        float _193 = _191 * 0.5;
        _187 = _193;
    }
    float _195 = _187;
    float _197 = _195;
    if (!_173)
    {
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    int _203 = as_type<int>(_159) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_159) & 2;
    bool _209 = _207 != 0;
    bool _211 = !_205;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_209;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_173;
    float _221 = _201;
    bool _223 = _173;
    bool _225 = false;
    if (!_219)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = _161 * _229;
        float _239 = 1.0 / _233;
        float _241 = _235 * 0.693147182464599609375;
        float _243 = exp2(_237);
        float _245 = 1.0 / _241;
        float _247 = _243 + (-1.0);
        float _249 = -_247;
        float _251 = fma(_249, _245, _161);
        float _253 = _251 * _239;
        float _255 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _255;
    }
    float _257 = _221;
    bool _259 = !_173;
    if (!_259)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _161 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _189 = _279;
    }
    float _281 = _189;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _285 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _287 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _289 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _291 = fma(_281, _175, _285);
    float _293 = fma(_281, _177, _287);
    float _295 = fma(_281, _179, _289);
    float _297 = fma(_291, _163, _181);
    float _299 = fma(_293, _163, _183);
    float _301 = fma(_295, _163, _185);
    bool _303 = !_283;
    float _321;
    if (!_303)
    {
        float _305 = in.m_56.x;
        float _307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _309 = _305 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _313 = _311 * _307;
        float _315 = floor(_313);
        float _317 = -_315;
        float _319 = _313 + _317;
        _321 = _319;
        _323 = true;
    }
    else
    {
        float _325 = float(_105);
        float _327 = 1.0 / _325;
        float _329 = _139 * _327;
        _321 = _329;
    }
    _323 = false;
    float _331 = _321;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = _331 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _331 + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _357 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _359 = isnan(_331);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = 1.0 / _347;
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _373 = 1.0 / _343;
    float _375 = 1.0 / _355;
    float _377 = _339 * _369;
    float _379 = -_367;
    float _381 = _379 + 1.0;
    float _383 = 1.0 / _351;
    float _385 = _335 * _373;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _389 = _331 + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _393 = _331 + _391;
    float _395 = _389 * _375;
    bool _397 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _399 = isnan(_331);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _409;
    float _413 = _407 * _381;
    bool _415 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _417 = isnan(_331);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = _393 * _383;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _429;
    bool _433 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _435 = isnan(_331);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = fma(_411, _385, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _447 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _449 = isnan(_331);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = fma(_431, _385, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = -_443;
    float _467 = _465 + 1.0;
    float _469 = -_407;
    float _471 = _469 + 1.0;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _477 = _425 * _467;
    float _479 = -_425;
    float _481 = _479 + 1.0;
    float _483 = _443 * _471;
    float _485 = fma(_463, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _487 = fma(_475, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _489 = _457 * _481;
    float _491 = -_457;
    float _493 = _491 + 1.0;
    float _495 = in.m_54.x;
    float _497 = in.m_54.y;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _499;
    float _503 = _459 * _489;
    float _505 = _445 * _489;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _507;
    float _511 = fma(_501, _427, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _513 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[143].x, _503);
    float _515 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[143].y, _505);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _521 = fma(_509, _427, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _523 = fma(_485, _477, _513);
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _529 = fma(_487, _477, _515);
    float _531 = fma(_519, _395, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _533 = fma(_511, _483, _523);
    float _535 = fma(_527, _395, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _537 = fma(_521, _483, _529);
    float _539 = fma(_531, _413, _533);
    float _541 = fma(_535, _413, _537);
    float _543 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[147].x, _539);
    float _545 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[147].y, _541);
    float _547 = _543 * _495;
    float _549 = _545 * _497;
    bool _551 = !_371;
    float _569;
    if (!_551)
    {
        float _553 = in.m_56.x;
        float _555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _557 = _553 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _559 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _561 = _559 * _555;
        float _563 = floor(_561);
        float _565 = -_563;
        float _567 = _561 + _565;
        _569 = _567;
        _571 = true;
    }
    else
    {
        float _573 = float(_105);
        float _575 = 1.0 / _573;
        float _577 = _139 * _575;
        _569 = _577;
    }
    _571 = false;
    float _579 = _569;
    float _581 = in.m_58.x;
    float _583 = in.m_58.y;
    float _585 = in.m_58.z;
    float _587 = in.m_58.w;
    float _589 = in.m_60.x;
    float _591 = in.m_60.y;
    float _593 = in.m_60.z;
    float _595 = in.m_60.w;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _599 = _597 != 0;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _603 = _601 != 0;
    float _605 = in.m_56.w;
    float _607 = in.m_62.x;
    float _609 = in.m_62.y;
    float _611 = in.m_62.z;
    float _613 = in.m_62.w;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _617 = _615 != 0;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _623 = 0.0;
    float _625 = _579;
    if (_599)
    {
        float _627 = in.m_56.x;
        _623 = _627;
    }
    float _629 = _623;
    float _631 = 1.0 / _621;
    float _633 = 0.0;
    if (_603)
    {
        float _635 = in.m_56.w;
        _633 = _635;
    }
    float _637 = _633;
    float _639 = _299 * _583;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _645 = _299 * _591;
    float _647 = 1.0 / _643;
    float _649 = fma(_297, _581, _639);
    float _651 = fma(_297, _589, _645);
    bool _653 = _605 > 0.5;
    float _655 = fma(_301, _585, _649);
    bool _657 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _659 = isnan(_579);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = _299 * _609;
    float _671 = fma(_301, _593, _651);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _681 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _683 = isnan(_579);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = fma(_297, _607, _669);
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _701 = _675 * _631;
    float _703 = _679 * _647;
    float _705 = fma(_301, _611, _693);
    bool _707 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _709 = isnan(_579);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = _679;
    float _721 = _643;
    float _723 = _631;
    float _725 = _647;
    int _727 = as_type<int>(_595);
    float _729 = _613;
    float _731 = _703;
    if (_599)
    {
        float _733 = _629 * 3.1415927410125732421875;
        _719 = _733;
    }
    float _735 = _719;
    float _737 = -_691;
    float _739 = _737 + 1.0;
    float _741 = 1.0 / _697;
    if (_603)
    {
        float _743 = _637 * 3.1415927410125732421875;
        _721 = _743;
    }
    float _745 = _721;
    out.m_64.w = _699;
    if (_599)
    {
        float _747 = _735 * 0.15915493667125701904296875;
        _723 = _747;
    }
    float _749 = _723;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _753 = _579 + _751;
    if (_603)
    {
        float _755 = _745 * 0.15915493667125701904296875;
        _725 = _755;
    }
    float _757 = _725;
    float _759 = _655 + _587;
    bool _761 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _763 = isnan(_579);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = _717 * _739;
    float _775 = _757;
    if (_603)
    {
        float _777 = _757 * 6.283185482025146484375;
        float _779 = sin(_777);
        _775 = _779;
    }
    float _781 = _775;
    float _783 = _739;
    float _785 = _735;
    if (_617)
    {
        float _787 = in.m_56.x;
        float _789 = in.m_56.y;
        _783 = _787;
        _785 = _789;
    }
    float _791 = _783;
    float _793 = _785;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _795;
    float _799 = -_771;
    float _801 = _799 + 1.0;
    float _803 = -_717;
    float _805 = _803 + 1.0;
    float _807 = _797 * _741;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _811 = _579 + _809;
    float _813 = _749;
    float _815 = _811;
    if (_599)
    {
        float _817 = _749 * 6.283185482025146484375;
        float _819 = sin(_817);
        _813 = _819;
    }
    float _821 = _813;
    float _823 = _667 * _801;
    float _825 = _771 * _805;
    float _827 = fma(_701, _811, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _831 = _579 + _829;
    float _833 = -_667;
    float _835 = _833 + 1.0;
    float _837 = _705 + _613;
    float _839 = _827 * _823;
    float _841 = fma(_703, _831, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    if (_603)
    {
        bool _843 = _781 > 0.5;
        _223 = _843;
    }
    bool _845 = _223;
    float _847 = _671 + _595;
    float _849 = fma(_807, _753, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _851 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[115].x, _839);
    float _853 = _847;
    if (_617)
    {
        _727 = 0;
    }
    int _855 = _727;
    int _857 = _855;
    if (_599)
    {
        bool _859 = _821 > 0.5;
        _225 = _859;
    }
    bool _861 = _225;
    float _863 = _791;
    float _865 = _793;
    if (_617)
    {
        _625 = _791;
    }
    float _867 = _625;
    float _869 = _867;
    if (_617)
    {
        _729 = _793;
    }
    float _871 = _729;
    float _873 = _871;
    if (!_617)
    {
        float _875 = in.m_56.x;
        float _877 = in.m_56.y;
        float _879 = _875 * 3.1415927410125732421875;
        float _881 = _879 * 0.15915493667125701904296875;
        float _883 = _877 * 3.1415927410125732421875;
        float _885 = _883 * 0.15915493667125701904296875;
        float _887 = _881 * 6.283185482025146484375;
        float _889 = sin(_887);
        float _891 = _885 * 6.283185482025146484375;
        float _893 = sin(_891);
        _863 = _875;
        _865 = _877;
        _857 = 1;
        _869 = _889;
        _873 = _893;
    }
    float _895 = _863;
    float _897 = _865;
    int _899 = _857;
    float _901 = _869;
    float _903 = _873;
    float _905 = in.m_56.z;
    if (!_603)
    {
        _731 = _213;
    }
    float _907 = _731;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _911 = _907;
    if (_603)
    {
        float _913 = -_213;
        float _915 = _845 ? _913 : _213;
        _911 = _915;
    }
    float _917 = _911;
    float _919 = _895 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _921 = _895 > 0.5;
    float _923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _925 = _897 > 0.5;
    float _927 = -_909;
    float _929 = fma(_919, 2.0, _927);
    if (!_599)
    {
        _815 = _217;
    }
    float _931 = _815;
    float _933 = fma(_841, _825, _851);
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _937 = _935 != 0;
    float _939 = -_139;
    float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[76].x, _929);
    float _943 = _931;
    if (_599)
    {
        float _945 = -_217;
        float _947 = _861 ? _945 : _217;
        _943 = _947;
    }
    float _949 = _943;
    float _951 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _953 = -_213;
    int _955 = _921 ? as_type<int>(_953) : as_type<int>(_213);
    float _957 = fma(_849, _773, _933);
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _961 = _959 != 0;
    float _963 = -_217;
    int _965 = _925 ? as_type<int>(_963) : as_type<int>(_217);
    float _967 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[118].x, _957);
    float _969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _971 = _899 != 1;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _975 = _973 != 0;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _981 = _979 != 0;
    float _983 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[93].z, _977);
    bool _985 = !_937;
    float _987 = _985 ? _213 : as_type<float>(_955);
    float _989 = _897 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _991 = !_961;
    float _993 = _991 ? _217 : as_type<float>(_965);
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1001 = _999 != 0;
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1005 = _1003 != 0;
    float _1007 = _901 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1013 = _903 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1015 = -_995;
    float _1017 = fma(_1007, 2.0, _1015);
    float _1019 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1009);
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1023 = fma(_1013, -2.0, _1011);
    float _1025 = _923 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1027 = -_139;
    float _1029 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1017);
    float _1031 = _917 + 0.5;
    float _1033 = fma(_989, -2.0, _1021);
    float _1035 = _1007;
    float _1037 = _989;
    float _1039 = _923;
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_971)
    {
        _1035 = _905;
    }
    float _1043 = _1035;
    float _1045 = fma(_1025, _1031, _1029);
    float _1047 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1023);
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1051 = _1043;
    float _1053 = _1049;
    if (!_971)
    {
        _1037 = _1043;
    }
    float _1055 = _1037;
    float _1057 = _951 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1059 = _951;
    float _1061 = _1055;
    if (_971)
    {
        _1051 = _905;
    }
    float _1063 = _1051;
    float _1065 = _949 + (-0.5);
    float _1067 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1049);
    if (!_971)
    {
        _1039 = _897;
    }
    float _1069 = _1039;
    float _1071 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1033);
    float _1073 = _1069;
    if (!_971)
    {
        _1041 = _897;
    }
    float _1075 = _1041;
    float _1077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1079 = _1075;
    if (_971)
    {
        _1073 = _895;
    }
    float _1081 = _1073;
    if (_971)
    {
        _1079 = _895;
    }
    float _1083 = _1079;
    if (!_971)
    {
        _1053 = _895;
    }
    float _1085 = _1053;
    float _1087 = -_1057;
    float _1089 = -_1047;
    float _1091 = fma(_1087, _1065, _1089);
    float _1093 = _1085;
    if (_971)
    {
        _1093 = _1063;
    }
    float _1095 = _1093;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_971)
    {
        _1059 = _1055;
    }
    float _1101 = _1059;
    float _1103 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1097);
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1107 = _759 + _1105;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1111 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1099);
    float _1113 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1103);
    float _1115 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1117 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1109);
    float _1119 = _1101;
    if (_971)
    {
        _1119 = _897;
    }
    float _1121 = _1119;
    float _1123 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1125 = _837 + _1123;
    if (_971)
    {
        _1061 = _897;
    }
    float _1127 = _1061;
    float _1129 = _969 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1131 = _1113 * (-0.15915493667125701904296875);
    float _1133 = _987 + 0.5;
    float _1135 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1115);
    float _1137 = _1131 * 6.283185482025146484375;
    float _1139 = sin(_1137);
    float _1141 = fma(_1129, _1133, _941);
    float _1143 = _997 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1145 = _993 + (-0.5);
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1149 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1153 = _847 + _1151;
    float _1155 = -_1143;
    float _1157 = -_1071;
    float _1159 = fma(_1155, _1145, _1157);
    float _1161 = _1131 * 6.283185482025146484375;
    float _1163 = cos(_1161);
    float _1165 = -_217;
    int _1167 = _653 ? as_type<int>(_1165) : as_type<int>(_217);
    float _1169 = -_1147;
    float _1171 = fma(_1149, 2.0, _1169);
    bool _1173 = _1063 > 0.5;
    float _1175 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1135);
    float _1177 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1111);
    bool _1179 = !_981;
    float _1181 = _1179 ? _217 : as_type<float>(_1167);
    float _1183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1187 = -_213;
    int _1189 = _1173 ? as_type<int>(_1187) : as_type<int>(_213);
    float _1191 = _1181 * _1139;
    bool _1193 = _1175 >= 0.0;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1197 = !_975;
    float _1199 = _1197 ? _213 : as_type<float>(_1189);
    float _1201 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1203 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1185);
    float _1205 = _1181 * _1163;
    float _1207 = -_139;
    float _1209 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1171);
    float _1211 = fma(_1201, -2.0, _1195);
    float _1213 = -_1191;
    float _1215 = fma(_1199, _1163, _1213);
    float _1217 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1019);
    float _1219 = -_213;
    int _1221 = _925 ? as_type<int>(_1219) : as_type<int>(_213);
    float _1223 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1225 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1117);
    float _1227 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1067);
    float _1229 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].z, _983);
    float _1231 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1203);
    float _1233 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1211);
    float _1235 = _1215 + 0.5;
    float _1237 = fma(_1199, _1139, _1205);
    bool _1239 = !_1001;
    float _1241 = _1239 ? _213 : as_type<float>(_1221);
    float _1243 = -_1229;
    float _1245 = _1243 + 1.0;
    float _1247 = fma(_1223, _1235, _1209);
    float _1249 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1251 = _1237 + (-0.5);
    float _1253 = _1241 + 0.5;
    float _1255 = -_217;
    int _1257 = _1173 ? as_type<int>(_1255) : as_type<int>(_217);
    float _1259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1261 = -_1249;
    float _1263 = -_1233;
    float _1265 = fma(_1261, _1251, _1263);
    float _1267 = _1253 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1269 = _1107 * _1107;
    float _1271 = -_1245;
    float _1273 = fma(_1271, _917, _1045);
    float _1275 = -_1217;
    float _1277 = _1275 + 1.0;
    float _1279 = -_1225;
    float _1281 = _1279 + 1.0;
    float _1283 = fma(_1125, _1125, _1269);
    float _1285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1287 = fma(_1277, _949, _1091);
    bool _1289 = !_1005;
    float _1291 = _1289 ? _217 : as_type<float>(_1257);
    float _1293 = -_1227;
    float _1295 = _1293 + 1.0;
    float _1297 = fma(_1153, _1153, _1283);
    float _1299 = fma(_993, _1281, _1159);
    float _1301 = _1283;
    if (_1193)
    {
        _1301 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1303 = _1301;
    float _1305 = -_1291;
    float _1307 = _1305 + 0.5;
    float _1309 = rsqrt(_1297);
    float _1311 = -_1295;
    float _1313 = fma(_987, _1311, _1141);
    float _1315 = -_1177;
    float _1317 = _1315 + 1.0;
    float _1319 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1321 = -_1231;
    float _1323 = _1321 + 1.0;
    float _1325 = _967 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1327 = _1267 * _1259;
    float _1329 = _1319 * _1285;
    int _1331 = as_type<int>(_1303);
    if (_1193)
    {
        float _1333 = _1303 * 5.0;
        _1331 = as_type<int>(_1333);
    }
    int _1335 = _1331;
    float _1337 = -_1317;
    float _1339 = fma(_1215, _1337, _1247);
    float _1341 = fma(_1237, _1323, _1265);
    out.m_66.x = _1273;
    out.m_66.y = _1287;
    out.m_68.w = _1325;
    float _1343 = _1107 * _1309;
    float _1345 = _1125 * _1309;
    if (_1193)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4602 = as_type<float>(_1335);
        out.gl_Position.z = _4602;
    }
    out.m_70.x = _1327;
    out.m_70.y = _1329;
    out.m_72.x = _1313;
    out.m_72.y = _1299;
    out.m_72.z = _1339;
    out.m_72.w = _1341;
    if (_1193)
    {
        out.m_47.x = 0.0;
    }
    if (_1193)
    {
        return out;
    }
    float _1347 = -_1343;
    float _1349 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[18].w, _759);
    float _1351 = _1153 * _1309;
    float _1353 = -_1345;
    float _1355 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[18].w, _837);
    float _1357 = -_1343;
    float _1359 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1107);
    float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1363 = _1349 + _1361;
    float _1365 = -_1351;
    float _1367 = fma(_1365, (*spvDescriptorSet0.vp_c9)._m0[18].w, _847);
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1371 = _1355 + _1369;
    float _1373 = -_1345;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1125);
    float _1377 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1379 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1381 = _1367 + _1379;
    float _1383 = _1359 * _1359;
    float _1385 = -_1351;
    float _1387 = fma(_1385, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1153);
    float _1389 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1377);
    float _1391 = fma(_1375, _1375, _1383);
    float _1393 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1389);
    float _1395 = fma(_1387, _1387, _1391);
    bool _1397 = _1393 >= 0.0;
    float _1399 = sqrt(_1395);
    float _1401 = _1377;
    float _1403 = _1351;
    float _1405 = _1363;
    float _1407 = _1355;
    float _1409 = _1367;
    if (_1397)
    {
        _1401 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1411 = _1401;
    int _1413 = as_type<int>(_1411);
    if (_1397)
    {
        out.m_47.x = 0.0;
    }
    if (_1397)
    {
        float _1415 = _1411 * 5.0;
        _1413 = as_type<int>(_1415);
    }
    int _1417 = _1413;
    float _1419 = _1309 * _1399;
    if (_1397)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4750 = as_type<float>(_1417);
        out.gl_Position.z = _4750;
    }
    if (_1397)
    {
        return out;
    }
    float _1421 = _549 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1423 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _1427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _1429 = _1419 * _1421;
    float _1431 = _1419 * _1423;
    float _1433 = _1425 * _1429;
    float _1435 = _1427 * _1431;
    float _1437 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1439 = _1437 * 0.5;
    bool _1441 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1443 = isnan(0.5);
    bool _1445 = _1441 || _1443;
    bool _1447 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1449 = _1445 || _1447;
    float _1451 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1453 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1455 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1457 = isnan(0.5);
    bool _1459 = _1455 || _1457;
    bool _1461 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1463 = _1459 || _1461;
    float _1465 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1451);
    float _1467 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1453);
    float _1469 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1471 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1465);
    float _1473 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1467);
    float _1475 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1469);
    float _1477 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1479 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1481 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1475);
    float _1483 = _847 + _1477;
    float _1485 = _837 + _1479;
    float _1487 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1489 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1491 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1493 = _1483 + _1491;
    float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1497 = _1485 + _1495;
    float _1499 = 1.0 / _1487;
    float _1501 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1489);
    float _1503 = _1493 * _1493;
    float _1505 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1501);
    float _1507 = fma(_1497, _1497, _1503);
    float _1509 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1511 = sqrt(_1507);
    float _1513 = _1509 + _1487;
    float _1515 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1517 = _1513 * _1499;
    float _1519 = _1517 * 0.5;
    float _1521 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1515);
    float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1525 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1523);
    float _1527 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1521);
    bool _1529 = _1511 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1531 = 1.0 / _1525;
    float _1533 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1535 = _759 + _1533;
    float _1537 = _1487;
    float _1539 = _1439;
    float _1541 = _1519;
    float _1543 = _1533;
    float _1545 = _1485;
    if (!_1529)
    {
        _1537 = _1485;
    }
    float _1547 = _1537;
    float _1549 = _1547;
    if (!_1529)
    {
        _1539 = _1483;
    }
    float _1551 = _1539;
    float _1553 = _1551;
    if (!_1529)
    {
        _1541 = _1535;
    }
    float _1555 = _1541;
    bool _1557 = !_1529;
    float _1559 = _1555;
    if (!_1557)
    {
        float _1561 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1563 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1565 = _1511 + _1563;
        float _1567 = rsqrt(_1507);
        float _1569 = _1565 * _1561;
        float _1571 = _1535 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1573 = _1569 * 0.15915493667125701904296875;
        float _1575 = _1573 * 6.283185482025146484375;
        float _1577 = cos(_1575);
        float _1579 = _1573 * 6.283185482025146484375;
        float _1581 = sin(_1579);
        float _1583 = _1577 + (-1.0);
        float _1585 = fma(_1581, _1571, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1587 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1589 = _1567 * _1585;
        float _1591 = fma(_1535, _1577, _1587);
        float _1593 = fma(_1497, _1589, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1595 = fma(_1493, _1589, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1549 = _1593;
        _1553 = _1595;
        _1559 = _1591;
        _1543 = _1589;
    }
    float _1597 = _1549;
    float _1599 = _1553;
    float _1601 = _1559;
    float _1603 = _1543;
    float _1605 = -_1345;
    float _1607 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1597);
    float _1609 = -_1351;
    float _1611 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1599);
    float _1613 = -_1343;
    float _1615 = fma(_1613, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1601);
    float _1617 = _1603;
    float _1619 = _1615;
    float _1621 = _1611;
    if (_1463)
    {
        _1617 = 1.0;
    }
    float _1623 = _1617;
    float _1625 = _1623;
    if (_1449)
    {
        _1403 = _1607;
    }
    float _1627 = _1403;
    float _1629 = _1627;
    if (!_1449)
    {
        float _1631 = _1363 * _1363;
        float _1633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1635 = -_847;
        float _1637 = _1635 + _1599;
        float _1639 = -_837;
        float _1641 = _1639 + _1597;
        float _1643 = fma(_1371, _1371, _1631);
        float _1645 = -_759;
        float _1647 = _1645 + _1601;
        float _1649 = fma(_1381, _1381, _1643);
        float _1651 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1653 = sqrt(_1649);
        float _1655 = 1.0 / _1419;
        float _1657 = precise::min(_1653, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1659 = _1657 * _1633;
        float _1661 = _1651 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1663 = _1659 * _1655;
        float _1665 = _1661 * _1663;
        float _1667 = _1637 * _1663;
        float _1669 = fma(_1641, _1665, _1355);
        float _1671 = fma(_1647, _1665, _1349);
        float _1673 = fma(_1661, _1667, _1367);
        _1405 = _1661;
        _1619 = _1671;
        _1629 = _1669;
        _1621 = _1673;
        _853 = _1667;
    }
    float _1675 = _1405;
    float _1677 = _1619;
    float _1679 = _1629;
    float _1681 = _1621;
    float _1683 = _853;
    float _1685 = _1683;
    float _1687 = _1675;
    if (_1463)
    {
        _1685 = 1.0;
    }
    float _1689 = _1685;
    float _1691 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1693 = _1531 * _1691;
    float _1695 = _1689;
    if (!_1463)
    {
        float _1697 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1699 = _1697 * 0.15915493667125701904296875;
        float _1701 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1703 = _1699 * 6.283185482025146484375;
        float _1705 = cos(_1703);
        float _1707 = _1701 * 0.15915493667125701904296875;
        float _1709 = _1699 * 6.283185482025146484375;
        float _1711 = sin(_1709);
        float _1713 = 1.0 / _1705;
        float _1715 = _1707 * 6.283185482025146484375;
        float _1717 = cos(_1715);
        float _1719 = _1711 * _1713;
        float _1721 = _1707 * 6.283185482025146484375;
        float _1723 = sin(_1721);
        float _1725 = _1717 * _1719;
        float _1727 = 1.0 / _1725;
        float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1731 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1729;
        float _1733 = 1.0 / _1731;
        float _1735 = _1723 * _1727;
        float _1737 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1739 = fma(_1693, _1735, _1737);
        float _1741 = _1739 * _1733;
        float _1743 = precise::clamp(_1741, 0.0, 1.0);
        _1687 = _1699;
        _1407 = _1707;
        _1625 = _1743;
    }
    float _1745 = _1687;
    float _1747 = _1407;
    float _1749 = _1625;
    float _1751 = _1745;
    float _1753 = _1747;
    if (!_1463)
    {
        float _1755 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1757 = _1755 * 0.15915493667125701904296875;
        float _1759 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1761 = _1757 * 6.283185482025146484375;
        float _1763 = cos(_1761);
        float _1765 = _1759 * 0.15915493667125701904296875;
        float _1767 = _1757 * 6.283185482025146484375;
        float _1769 = sin(_1767);
        float _1771 = 1.0 / _1763;
        float _1773 = _1765 * 6.283185482025146484375;
        float _1775 = cos(_1773);
        float _1777 = _1769 * _1771;
        float _1779 = _1765 * 6.283185482025146484375;
        float _1781 = sin(_1779);
        float _1783 = _1775 * _1777;
        float _1785 = 1.0 / _1783;
        float _1787 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1789 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1787;
        float _1791 = 1.0 / _1789;
        float _1793 = _1781 * _1785;
        float _1795 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1797 = fma(_1693, _1793, _1795);
        float _1799 = _1797 * _1791;
        float _1801 = precise::clamp(_1799, 0.0, 1.0);
        float _1803 = -_1801;
        float _1805 = _1803 + 1.0;
        _1751 = _1771;
        _1753 = _1783;
        _1695 = _1805;
    }
    float _1807 = _1751;
    float _1809 = _1753;
    float _1811 = _1695;
    float _1813 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1815 = _1677 + _1813;
    float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1819 = _1679 + _1817;
    float _1821 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1823 = _1681 + _1821;
    float _1825 = _1815 * _1815;
    float _1827 = fma(_1819, _1819, _1825);
    float _1829 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1831 = fma(_1823, _1823, _1827);
    float _1833 = rsqrt(_1831);
    float _1835 = sqrt(_1831);
    float _1837 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1839 = _1819 * _1837;
    float _1841 = _1823 * _1837;
    float _1843 = _1839 * _1839;
    float _1845 = _1841 * _1841;
    float _1847 = _1843 + _1845;
    float _1849 = sqrt(_1847);
    bool _1851 = _1849 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1853 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1855 = _1849 + _1853;
    float _1857 = _1807;
    float _1859 = _1855;
    float _1861 = _1815;
    float _1863 = _1839;
    if (_1851)
    {
        float _1865 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1857 = _1865;
    }
    float _1867 = _1857;
    float _1869 = _1867;
    if (_1851)
    {
        float _1871 = _1855 * _1867;
        _1859 = _1871;
    }
    float _1873 = _1859;
    if (_1851)
    {
        float _1875 = rsqrt(_1847);
        _1869 = _1875;
    }
    float _1877 = _1869;
    float _1879 = _1877;
    if (_1851)
    {
        float _1881 = _1873 * 0.15915493667125701904296875;
        _1409 = _1881;
    }
    float _1883 = _1409;
    float _1885 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1887 = _1823;
    if (_1851)
    {
        float _1889 = _1883 * 6.283185482025146484375;
        float _1891 = sin(_1889);
        _1887 = _1891;
    }
    float _1893 = _1887;
    float _1895 = precise::max(0.0, _1885);
    float _1897 = _1809;
    float _1899 = _1895;
    if (_1851)
    {
        float _1901 = _1883 * 6.283185482025146484375;
        float _1903 = cos(_1901);
        _1897 = _1903;
    }
    float _1905 = _1897;
    float _1907 = -_1837;
    float _1909 = -_1895;
    float _1911 = fma(_1815, _1907, _1909);
    float _1913 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1851)
    {
        float _1915 = _1911 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1861 = _1915;
    }
    float _1917 = _1861;
    float _1919 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1913);
    float _1921 = _1893;
    float _1923 = _1917;
    if (_1851)
    {
        float _1925 = fma(_1893, _1917, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1921 = _1925;
    }
    float _1927 = _1921;
    float _1929 = _1927;
    if (!_1851)
    {
        _1923 = _1911;
    }
    float _1931 = _1923;
    float _1933 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1919);
    float _1935 = _1931;
    if (_1851)
    {
        float _1937 = _1877 * _1927;
        _1545 = _1937;
    }
    float _1939 = _1545;
    if (!_1851)
    {
        _1929 = _1843;
    }
    float _1941 = _1929;
    float _1943 = _1933 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1945 = _1941;
    float _1947 = _1905;
    if (_1851)
    {
        float _1949 = _1905 + (-1.0);
        _1899 = _1949;
    }
    float _1951 = _1899;
    float _1953 = _1951;
    if (_1851)
    {
        float _1955 = _1839 * _1939;
        _1863 = _1955;
    }
    float _1957 = _1863;
    if (_1851)
    {
        float _1959 = _1951 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1879 = _1959;
    }
    float _1961 = _1879;
    if (!_1851)
    {
        _1953 = _1841;
    }
    float _1963 = _1953;
    float _1965 = _1963;
    if (_1851)
    {
        float _1967 = _1841 * _1939;
        _1965 = _1967;
    }
    float _1969 = _1965;
    if (_1851)
    {
        float _1971 = _1957 * _1957;
        _1945 = _1971;
    }
    float _1973 = _1945;
    if (_1851)
    {
        float _1975 = fma(_1911, _1905, _1961);
        _1935 = _1975;
    }
    float _1977 = _1935;
    if (!_1851)
    {
        _1947 = _1845;
    }
    float _1979 = _1947;
    float _1981 = _1979;
    if (_1851)
    {
        float _1983 = _1969 * _1969;
        _1981 = _1983;
    }
    float _1985 = _1981;
    float _1987 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1989 = fma(_1977, _1977, _1973);
    float _1991 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1987);
    float _1993 = _1989 + _1985;
    float _1995 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1997 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1999 = fma(_1835, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1997);
    float _2001 = precise::clamp(_1999, 0.0, 1.0);
    float _2003 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1991);
    float _2005 = rsqrt(_1993);
    float _2007 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2009 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1995);
    float _2011 = -_2001;
    float _2013 = _2011 + 1.0;
    float _2015 = _2003 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2017 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2007);
    float _2019 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2009);
    float _2021 = abs(_2013);
    float _2023 = log2(_2021);
    float _2025 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2017);
    float _2027 = _2019 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2029 = _2015 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2031 = _2025 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2033 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2035 = -_2029;
    float _2037 = fma(_2035, _1829, 1.0);
    float _2039 = _2005 * _1957;
    float _2041 = _2005 * _1977;
    float _2043 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2033);
    float _2045 = _2005 * _1969;
    float _2047 = _2039 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2049 = log2(_2037);
    float _2051 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2043);
    float _2053 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2055 = -_2047;
    float _2057 = fma(_2041, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2055);
    float _2059 = _2023 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2061 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2051);
    float _2063 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2053);
    float _2065 = -_2045;
    float _2067 = fma(_2065, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2057);
    float _2069 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2071 = 1.0 / _2061;
    float _2073 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2063);
    float _2075 = fma(_2067, -0.5, 0.5);
    float _2077 = fma(_2067, 0.5, 0.5);
    float _2079 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2069);
    float _2081 = _2041 + 1.0;
    float _2083 = _2049 * 0.693147182464599609375;
    float _2085 = exp2(_2059);
    float _2087 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2079);
    float _2089 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2091 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2087);
    float _2093 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2073);
    float _2095 = sqrt(_2075);
    float _2097 = fma(_2077, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2099 = _2091 * _2071;
    float _2101 = fma(_2077, _2097, -0.212114393711090087890625);
    float _2103 = fma(_2099, 0.5, 0.5);
    float _2105 = -_2041;
    float _2107 = fma(_2085, _2081, _2105);
    float _2109 = fma(_2077, _2101, 1.570728778839111328125);
    float _2111 = _2093 * _2071;
    float _2113 = fma(_2107, 0.5, 0.5);
    float _2115 = fma(_2111, -0.5, 0.5);
    float _2117 = _2095 * 0.636619746685028076171875;
    float _2119 = -_2109;
    float _2121 = fma(_2117, _2119, 1.0);
    float3 _5858 = float3(_2103, _2115, _2089);
    float _2123 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5858, float3(0.0), isnan(_5858)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5858, float3(0.0), isnan(_5858)), level(0.0)).x;
    float3 _5869 = float3(_2103, _2115, _2089);
    float4 _2126 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5869, float3(0.0), isnan(_5869)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5869, float3(0.0), isnan(_5869)), level(0.0)).xyzw;
    float _2128 = _2126.x;
    float _2130 = _2126.y;
    float _2132 = _2126.z;
    float _2134 = _2126.w;
    float2 _5886 = float2(_2121, _2113);
    float3 _2138 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5886, float2(0.0), isnan(_5886)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5886, float2(0.0), isnan(_5886)), level(0.0)).xyz;
    float _2140 = _2138.x;
    float _2142 = _2138.y;
    float _2144 = _2138.z;
    float _2146 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2148 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2150 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2152 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2146);
    float _2154 = fma(_2148, _2148, 1.0);
    float _2156 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2152);
    float _2158 = _2023 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2160 = rsqrt(_2154);
    bool _2162 = _1835 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2164 = isnan(_1835);
    bool _2166 = _2162 || _2164;
    bool _2168 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2170 = _2166 || _2168;
    out.m_74.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_74.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_74.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _2172 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2156);
    float _2174 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2176 = exp2(_2158);
    out.gl_Position.x = _2091;
    out.gl_Position.y = _2093;
    out.gl_Position.z = _2172;
    out.gl_Position.w = _2061;
    float _2178 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2180 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2182 = _2148 * _2160;
    float _2184 = _2061 * 0.5;
    float _2186 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2178);
    float _2188 = _2091 + _2061;
    float _2190 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2192 = _2182 * _2190;
    float _2194 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2196 = _2182 * _2194;
    float _2198 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2200 = _2182 * _2198;
    float _2202 = fma(_2093, -0.5, _2184);
    float _2204 = -_2176;
    float _2206 = _2204 + 1.0;
    float _2208 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2192);
    float _2210 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2196);
    float _2212 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2200);
    float _2214 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2216 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2180);
    float _2218 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2174);
    float _2220 = _2172 + _2061;
    out.m_76.x = _2208;
    out.m_76.y = _2210;
    out.m_76.z = _2212;
    float _2222 = _2188 * 0.5;
    float _2224 = _2220 * 0.5;
    float _2226 = _2093;
    float _2228 = _2172;
    float _2230 = _2091;
    float _2232 = _2186;
    float _2234 = _2222;
    if (!_2170)
    {
        _2226 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2236 = _2226;
    float _2238 = _2236;
    float _2240 = _2236;
    if (!_2170)
    {
        _2228 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2242 = _2228;
    out.m_78.x = _2222;
    out.m_78.y = _2202;
    out.m_78.z = _2224;
    out.m_78.w = _2061;
    float _2244 = _2242;
    float _2246 = _2242;
    if (!_2170)
    {
        _2230 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2248 = _2230;
    float _2250 = _2186 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2252 = _2216 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2254 = _2218 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2256 = _1749 * _1811;
    float _2258 = _2256;
    float _2260 = _2248;
    float _2262 = _2248;
    if (!_2170)
    {
        _2232 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2264 = _2232;
    out.m_80.x = _2250;
    out.m_80.y = _2252;
    out.m_80.z = _2254;
    float _2266 = _2256 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2268 = _2264;
    float _2270 = _2264;
    if (!_2170)
    {
        _2234 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2272 = _2234;
    float _2274 = _2272;
    float _2276 = _2272;
    if (!_2170)
    {
        _2258 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2278 = _2258;
    float _2280 = _2214 * _2123;
    float _2282 = -_2214;
    float _2284 = _2282 + 1.0;
    float _2286 = _2134 * _2280;
    float _2288 = _2144 * _2280;
    float _2290 = _2134 * _2284;
    float _2292 = fma(_2140, _2286, _2128);
    float _2294 = fma(_2142, _2286, _2130);
    float _2296 = fma(_2134, _2288, _2132);
    out.m_82.x = _2292;
    out.m_82.y = _2294;
    out.m_82.z = _2296;
    out.m_82.w = _2290;
    bool _2298 = !_2170;
    float _2300 = _2278;
    float _2302 = _2278;
    if (!_2298)
    {
        bool _2304 = _1835 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2306 = isnan(_1835);
        bool _2308 = _2304 || _2306;
        bool _2310 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2312 = _2308 || _2310;
        if (!_2312)
        {
            float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2316 = _1835 + _2314;
            float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2320 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2318;
            float _2322 = 1.0 / _2320;
            float _2324 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2326 = _2324 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2330 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2334 = _2332 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2338 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2342 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2344 = _2316 * _2322;
            float _2346 = precise::clamp(_2344, 0.0, 1.0);
            float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2350 = _2348 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2352 = fma(_2346, _2326, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2354 = fma(_2346, _2350, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2356 = fma(_2346, _2330, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2358 = fma(_2346, _2334, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2360 = fma(_2346, _2338, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2362 = fma(_2346, _2342, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2276 = _2352;
            _2270 = _2360;
            _2240 = _2354;
            _2262 = _2358;
            _2246 = _2356;
            _2302 = _2362;
            _2364 = true;
        }
        else
        {
            bool _2366 = _1835 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2368 = isnan(_1835);
            bool _2370 = _2366 || _2368;
            bool _2372 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2374 = _2370 || _2372;
            if (!_2374)
            {
                _2238 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2376 = _2238;
            _2240 = _2376;
            if (!_2374)
            {
                _2274 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2378 = _2274;
            _2276 = _2378;
            if (!_2374)
            {
                _2244 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2380 = _2244;
            _2246 = _2380;
            if (!_2374)
            {
                _2260 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2382 = _2260;
            _2262 = _2382;
            if (!_2374)
            {
                _2268 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2384 = _2268;
            _2270 = _2384;
            if (!_2374)
            {
                _2300 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2386 = _2300;
            bool _2388 = !_2374;
            _2302 = _2386;
            if (!_2388)
            {
                bool _2390 = _1835 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2392 = isnan(_1835);
                bool _2394 = _2390 || _2392;
                bool _2396 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2398 = _2394 || _2396;
                if (!_2398)
                {
                    float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2402 = _1835 + _2400;
                    float _2404 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2406 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2404;
                    float _2408 = 1.0 / _2406;
                    float _2410 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2412 = _2410 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2422 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2430 = _2402 * _2408;
                    float _2432 = precise::clamp(_2430, 0.0, 1.0);
                    float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2438 = fma(_2432, _2412, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2440 = fma(_2432, _2436, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2442 = fma(_2432, _2416, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2444 = fma(_2432, _2420, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2446 = fma(_2432, _2424, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2448 = fma(_2432, _2428, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2276 = _2438;
                    _2270 = _2446;
                    _2240 = _2440;
                    _2262 = _2444;
                    _2246 = _2442;
                    _2302 = _2448;
                    _2364 = true;
                }
                else
                {
                    _2276 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2270 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2240 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2262 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2246 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2302 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2364 = false;
    float _2450 = _2276;
    float _2452 = _2270;
    float _2454 = _2240;
    float _2456 = _2262;
    float _2458 = _2246;
    float _2460 = _2302;
    float _2462 = _2266 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2464 = fma(_2252, -0.5, 0.5);
    float _2466 = precise::clamp(_2464, 0.0, 1.0);
    float _2468 = -_2450;
    float _2470 = _2468 + _2452;
    float _2472 = -_2454;
    float _2474 = _2472 + _2456;
    out.m_47.x = _2462;
    float _2476 = -_2458;
    float _2478 = _2476 + _2460;
    float _2480 = fma(_2466, _2470, _2450);
    float _2482 = fma(_2466, _2474, _2454);
    bool _2484 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2486 = _2480 * 0.586610972881317138671875;
    float _2488 = fma(_2466, _2478, _2458);
    out.m_84.x = 0.0;
    bool _2490 = _1749 > 0.0;
    bool _2492 = isnan(_1749);
    bool _2494 = _2490 || _2492;
    bool _2496 = isnan(0.0);
    bool _2498 = _2494 || _2496;
    float _2500 = fma(_2482, 0.298911988735198974609375, _2486);
    bool _2502 = _1811 <= 0.0;
    bool _2504 = !_2498;
    bool _2506 = _2502 || _2504;
    float _2508 = fma(_2488, 0.114477999508380889892578125, _2500);
    float _2510 = -_2508;
    float _2512 = _2482 + _2510;
    float _2514 = fma(_2512, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2508);
    bool _2516 = !_2484;
    if (!_2516)
    {
        float _2518 = -_1677;
        float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2522 = -_1679;
        float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2526 = -_1681;
        float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2530 = _2520 * _2520;
        float _2532 = fma(_2524, _2524, _2530);
        float _2534 = fma(_2528, _2528, _2532);
        float _2536 = sqrt(_2534);
        float _2538 = rsqrt(_2534);
        float _2540 = -_2536;
        float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2544 = _2542 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2546 = precise::clamp(_2544, 0.0, 1.0);
        float _2548 = _2524 * _2538;
        float _2550 = _2520 * _2538;
        float _2552 = abs(_2546);
        float _2554 = log2(_2552);
        float _2556 = _2528 * _2538;
        float _2558 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2560 = _2252 * _2550;
        float _2562 = -_2550;
        float _2564 = -_2558;
        float _2566 = fma(_2562, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2564);
        float _2568 = fma(_2250, _2548, _2560);
        float _2570 = -_2556;
        float _2572 = fma(_2570, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2566);
        float _2574 = fma(_2254, _2556, _2568);
        float _2576 = precise::clamp(_2574, 0.0, 1.0);
        float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2580 = _2572 + _2578;
        float _2582 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2584 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2586 = precise::clamp(_2584, 0.0, 1.0);
        float _2588 = exp2(_2582);
        float _2590 = _2588 * _2586;
        float _2592 = _2576 * _2590;
        float _2594 = _2592 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        out.m_84.x = _2594;
    }
    out.m_86.x = _2514;
    if (!_2506)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2596 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2596;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2364 = false;
    bool _571 = false;
    bool _323 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2653 = as_type<float>(_121);
        out.gl_Position.z = _2653;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_49.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_135)
    {
        float _141 = float(_105);
        _115 = _141;
    }
    float _143 = _115;
    bool _145 = _139 >= _143;
    bool _147 = !_135;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_47.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _123 = as_type<int>(_155);
    }
    int _157 = _123;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2722 = as_type<float>(_157);
        out.gl_Position.z = _2722;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _163 = in.m_54.w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_49.x;
    float _177 = in.m_49.y;
    float _179 = in.m_49.z;
    float _181 = in.m_44.x;
    float _183 = in.m_44.y;
    float _185 = in.m_44.z;
    float _187 = 0.0;
    float _189 = _161;
    if (!_173)
    {
        float _191 = _161 * _161;
        float _193 = _191 * 0.5;
        _187 = _193;
    }
    float _195 = _187;
    float _197 = _195;
    if (!_173)
    {
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    int _203 = as_type<int>(_159) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_159) & 2;
    bool _209 = _207 != 0;
    bool _211 = !_205;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_209;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_173;
    float _221 = _201;
    bool _223 = _173;
    bool _225 = false;
    if (!_219)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = _161 * _229;
        float _239 = 1.0 / _233;
        float _241 = _235 * 0.693147182464599609375;
        float _243 = exp2(_237);
        float _245 = 1.0 / _241;
        float _247 = _243 + (-1.0);
        float _249 = -_247;
        float _251 = fma(_249, _245, _161);
        float _253 = _251 * _239;
        float _255 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _255;
    }
    float _257 = _221;
    bool _259 = !_173;
    if (!_259)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _161 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _189 = _279;
    }
    float _281 = _189;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _285 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _287 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _289 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _291 = fma(_281, _175, _285);
    float _293 = fma(_281, _177, _287);
    float _295 = fma(_281, _179, _289);
    float _297 = fma(_291, _163, _181);
    float _299 = fma(_293, _163, _183);
    float _301 = fma(_295, _163, _185);
    bool _303 = !_283;
    float _321;
    if (!_303)
    {
        float _305 = in.m_56.x;
        float _307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _309 = _305 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _313 = _311 * _307;
        float _315 = floor(_313);
        float _317 = -_315;
        float _319 = _313 + _317;
        _321 = _319;
        _323 = true;
    }
    else
    {
        float _325 = float(_105);
        float _327 = 1.0 / _325;
        float _329 = _139 * _327;
        _321 = _329;
    }
    _323 = false;
    float _331 = _321;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = _331 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _331 + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _357 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _359 = isnan(_331);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = 1.0 / _347;
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _373 = 1.0 / _343;
    float _375 = 1.0 / _355;
    float _377 = _339 * _369;
    float _379 = -_367;
    float _381 = _379 + 1.0;
    float _383 = 1.0 / _351;
    float _385 = _335 * _373;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _389 = _331 + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _393 = _331 + _391;
    float _395 = _389 * _375;
    bool _397 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _399 = isnan(_331);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _409;
    float _413 = _407 * _381;
    bool _415 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _417 = isnan(_331);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = _393 * _383;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _429;
    bool _433 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _435 = isnan(_331);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = fma(_411, _385, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _447 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _449 = isnan(_331);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = fma(_431, _385, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = -_443;
    float _467 = _465 + 1.0;
    float _469 = -_407;
    float _471 = _469 + 1.0;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _477 = _425 * _467;
    float _479 = -_425;
    float _481 = _479 + 1.0;
    float _483 = _443 * _471;
    float _485 = fma(_463, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _487 = fma(_475, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _489 = _457 * _481;
    float _491 = -_457;
    float _493 = _491 + 1.0;
    float _495 = in.m_54.x;
    float _497 = in.m_54.y;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _499;
    float _503 = _459 * _489;
    float _505 = _445 * _489;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _507;
    float _511 = fma(_501, _427, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _513 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[143].x, _503);
    float _515 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[143].y, _505);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _521 = fma(_509, _427, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _523 = fma(_485, _477, _513);
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _529 = fma(_487, _477, _515);
    float _531 = fma(_519, _395, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _533 = fma(_511, _483, _523);
    float _535 = fma(_527, _395, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _537 = fma(_521, _483, _529);
    float _539 = fma(_531, _413, _533);
    float _541 = fma(_535, _413, _537);
    float _543 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[147].x, _539);
    float _545 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[147].y, _541);
    float _547 = _543 * _495;
    float _549 = _545 * _497;
    bool _551 = !_371;
    float _569;
    if (!_551)
    {
        float _553 = in.m_56.x;
        float _555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _557 = _553 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _559 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _561 = _559 * _555;
        float _563 = floor(_561);
        float _565 = -_563;
        float _567 = _561 + _565;
        _569 = _567;
        _571 = true;
    }
    else
    {
        float _573 = float(_105);
        float _575 = 1.0 / _573;
        float _577 = _139 * _575;
        _569 = _577;
    }
    _571 = false;
    float _579 = _569;
    float _581 = in.m_58.x;
    float _583 = in.m_58.y;
    float _585 = in.m_58.z;
    float _587 = in.m_58.w;
    float _589 = in.m_60.x;
    float _591 = in.m_60.y;
    float _593 = in.m_60.z;
    float _595 = in.m_60.w;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _599 = _597 != 0;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _603 = _601 != 0;
    float _605 = in.m_56.w;
    float _607 = in.m_62.x;
    float _609 = in.m_62.y;
    float _611 = in.m_62.z;
    float _613 = in.m_62.w;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _617 = _615 != 0;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _623 = 0.0;
    float _625 = _579;
    if (_599)
    {
        float _627 = in.m_56.x;
        _623 = _627;
    }
    float _629 = _623;
    float _631 = 1.0 / _621;
    float _633 = 0.0;
    if (_603)
    {
        float _635 = in.m_56.w;
        _633 = _635;
    }
    float _637 = _633;
    float _639 = _299 * _583;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _645 = _299 * _591;
    float _647 = 1.0 / _643;
    float _649 = fma(_297, _581, _639);
    float _651 = fma(_297, _589, _645);
    bool _653 = _605 > 0.5;
    float _655 = fma(_301, _585, _649);
    bool _657 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _659 = isnan(_579);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = _299 * _609;
    float _671 = fma(_301, _593, _651);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _681 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _683 = isnan(_579);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = fma(_297, _607, _669);
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _701 = _675 * _631;
    float _703 = _679 * _647;
    float _705 = fma(_301, _611, _693);
    bool _707 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _709 = isnan(_579);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = _679;
    float _721 = _643;
    float _723 = _631;
    float _725 = _647;
    int _727 = as_type<int>(_595);
    float _729 = _613;
    float _731 = _703;
    if (_599)
    {
        float _733 = _629 * 3.1415927410125732421875;
        _719 = _733;
    }
    float _735 = _719;
    float _737 = -_691;
    float _739 = _737 + 1.0;
    float _741 = 1.0 / _697;
    if (_603)
    {
        float _743 = _637 * 3.1415927410125732421875;
        _721 = _743;
    }
    float _745 = _721;
    out.m_64.w = _699;
    if (_599)
    {
        float _747 = _735 * 0.15915493667125701904296875;
        _723 = _747;
    }
    float _749 = _723;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _753 = _579 + _751;
    if (_603)
    {
        float _755 = _745 * 0.15915493667125701904296875;
        _725 = _755;
    }
    float _757 = _725;
    float _759 = _655 + _587;
    bool _761 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _763 = isnan(_579);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = _717 * _739;
    float _775 = _757;
    if (_603)
    {
        float _777 = _757 * 6.283185482025146484375;
        float _779 = sin(_777);
        _775 = _779;
    }
    float _781 = _775;
    float _783 = _739;
    float _785 = _735;
    if (_617)
    {
        float _787 = in.m_56.x;
        float _789 = in.m_56.y;
        _783 = _787;
        _785 = _789;
    }
    float _791 = _783;
    float _793 = _785;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _795;
    float _799 = -_771;
    float _801 = _799 + 1.0;
    float _803 = -_717;
    float _805 = _803 + 1.0;
    float _807 = _797 * _741;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _811 = _579 + _809;
    float _813 = _749;
    float _815 = _811;
    if (_599)
    {
        float _817 = _749 * 6.283185482025146484375;
        float _819 = sin(_817);
        _813 = _819;
    }
    float _821 = _813;
    float _823 = _667 * _801;
    float _825 = _771 * _805;
    float _827 = fma(_701, _811, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _831 = _579 + _829;
    float _833 = -_667;
    float _835 = _833 + 1.0;
    float _837 = _705 + _613;
    float _839 = _827 * _823;
    float _841 = fma(_703, _831, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    if (_603)
    {
        bool _843 = _781 > 0.5;
        _223 = _843;
    }
    bool _845 = _223;
    float _847 = _671 + _595;
    float _849 = fma(_807, _753, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _851 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[115].x, _839);
    float _853 = _847;
    if (_617)
    {
        _727 = 0;
    }
    int _855 = _727;
    int _857 = _855;
    if (_599)
    {
        bool _859 = _821 > 0.5;
        _225 = _859;
    }
    bool _861 = _225;
    float _863 = _791;
    float _865 = _793;
    if (_617)
    {
        _625 = _791;
    }
    float _867 = _625;
    float _869 = _867;
    if (_617)
    {
        _729 = _793;
    }
    float _871 = _729;
    float _873 = _871;
    if (!_617)
    {
        float _875 = in.m_56.x;
        float _877 = in.m_56.y;
        float _879 = _875 * 3.1415927410125732421875;
        float _881 = _879 * 0.15915493667125701904296875;
        float _883 = _877 * 3.1415927410125732421875;
        float _885 = _883 * 0.15915493667125701904296875;
        float _887 = _881 * 6.283185482025146484375;
        float _889 = sin(_887);
        float _891 = _885 * 6.283185482025146484375;
        float _893 = sin(_891);
        _863 = _875;
        _865 = _877;
        _857 = 1;
        _869 = _889;
        _873 = _893;
    }
    float _895 = _863;
    float _897 = _865;
    int _899 = _857;
    float _901 = _869;
    float _903 = _873;
    float _905 = in.m_56.z;
    if (!_603)
    {
        _731 = _213;
    }
    float _907 = _731;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _911 = _907;
    if (_603)
    {
        float _913 = -_213;
        float _915 = _845 ? _913 : _213;
        _911 = _915;
    }
    float _917 = _911;
    float _919 = _895 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _921 = _895 > 0.5;
    float _923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _925 = _897 > 0.5;
    float _927 = -_909;
    float _929 = fma(_919, 2.0, _927);
    if (!_599)
    {
        _815 = _217;
    }
    float _931 = _815;
    float _933 = fma(_841, _825, _851);
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _937 = _935 != 0;
    float _939 = -_139;
    float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[76].x, _929);
    float _943 = _931;
    if (_599)
    {
        float _945 = -_217;
        float _947 = _861 ? _945 : _217;
        _943 = _947;
    }
    float _949 = _943;
    float _951 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _953 = -_213;
    int _955 = _921 ? as_type<int>(_953) : as_type<int>(_213);
    float _957 = fma(_849, _773, _933);
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _961 = _959 != 0;
    float _963 = -_217;
    int _965 = _925 ? as_type<int>(_963) : as_type<int>(_217);
    float _967 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[118].x, _957);
    float _969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _971 = _899 != 1;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _975 = _973 != 0;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _981 = _979 != 0;
    float _983 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[93].z, _977);
    bool _985 = !_937;
    float _987 = _985 ? _213 : as_type<float>(_955);
    float _989 = _897 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _991 = !_961;
    float _993 = _991 ? _217 : as_type<float>(_965);
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1001 = _999 != 0;
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1005 = _1003 != 0;
    float _1007 = _901 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1013 = _903 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1015 = -_995;
    float _1017 = fma(_1007, 2.0, _1015);
    float _1019 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1009);
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1023 = fma(_1013, -2.0, _1011);
    float _1025 = _923 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1027 = -_139;
    float _1029 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1017);
    float _1031 = _917 + 0.5;
    float _1033 = fma(_989, -2.0, _1021);
    float _1035 = _1007;
    float _1037 = _989;
    float _1039 = _923;
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_971)
    {
        _1035 = _905;
    }
    float _1043 = _1035;
    float _1045 = fma(_1025, _1031, _1029);
    float _1047 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1023);
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1051 = _1043;
    float _1053 = _1049;
    if (!_971)
    {
        _1037 = _1043;
    }
    float _1055 = _1037;
    float _1057 = _951 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1059 = _951;
    float _1061 = _1055;
    if (_971)
    {
        _1051 = _905;
    }
    float _1063 = _1051;
    float _1065 = _949 + (-0.5);
    float _1067 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1049);
    if (!_971)
    {
        _1039 = _897;
    }
    float _1069 = _1039;
    float _1071 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1033);
    float _1073 = _1069;
    if (!_971)
    {
        _1041 = _897;
    }
    float _1075 = _1041;
    float _1077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1079 = _1075;
    if (_971)
    {
        _1073 = _895;
    }
    float _1081 = _1073;
    if (_971)
    {
        _1079 = _895;
    }
    float _1083 = _1079;
    if (!_971)
    {
        _1053 = _895;
    }
    float _1085 = _1053;
    float _1087 = -_1057;
    float _1089 = -_1047;
    float _1091 = fma(_1087, _1065, _1089);
    float _1093 = _1085;
    if (_971)
    {
        _1093 = _1063;
    }
    float _1095 = _1093;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_971)
    {
        _1059 = _1055;
    }
    float _1101 = _1059;
    float _1103 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1097);
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1107 = _759 + _1105;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1111 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1099);
    float _1113 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1103);
    float _1115 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1117 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1109);
    float _1119 = _1101;
    if (_971)
    {
        _1119 = _897;
    }
    float _1121 = _1119;
    float _1123 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1125 = _837 + _1123;
    if (_971)
    {
        _1061 = _897;
    }
    float _1127 = _1061;
    float _1129 = _969 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1131 = _1113 * (-0.15915493667125701904296875);
    float _1133 = _987 + 0.5;
    float _1135 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1115);
    float _1137 = _1131 * 6.283185482025146484375;
    float _1139 = sin(_1137);
    float _1141 = fma(_1129, _1133, _941);
    float _1143 = _997 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1145 = _993 + (-0.5);
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1149 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1153 = _847 + _1151;
    float _1155 = -_1143;
    float _1157 = -_1071;
    float _1159 = fma(_1155, _1145, _1157);
    float _1161 = _1131 * 6.283185482025146484375;
    float _1163 = cos(_1161);
    float _1165 = -_217;
    int _1167 = _653 ? as_type<int>(_1165) : as_type<int>(_217);
    float _1169 = -_1147;
    float _1171 = fma(_1149, 2.0, _1169);
    bool _1173 = _1063 > 0.5;
    float _1175 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1135);
    float _1177 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1111);
    bool _1179 = !_981;
    float _1181 = _1179 ? _217 : as_type<float>(_1167);
    float _1183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1187 = -_213;
    int _1189 = _1173 ? as_type<int>(_1187) : as_type<int>(_213);
    float _1191 = _1181 * _1139;
    bool _1193 = _1175 >= 0.0;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1197 = !_975;
    float _1199 = _1197 ? _213 : as_type<float>(_1189);
    float _1201 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1203 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1185);
    float _1205 = _1181 * _1163;
    float _1207 = -_139;
    float _1209 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1171);
    float _1211 = fma(_1201, -2.0, _1195);
    float _1213 = -_1191;
    float _1215 = fma(_1199, _1163, _1213);
    float _1217 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1019);
    float _1219 = -_213;
    int _1221 = _925 ? as_type<int>(_1219) : as_type<int>(_213);
    float _1223 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1225 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1117);
    float _1227 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1067);
    float _1229 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].z, _983);
    float _1231 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1203);
    float _1233 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1211);
    float _1235 = _1215 + 0.5;
    float _1237 = fma(_1199, _1139, _1205);
    bool _1239 = !_1001;
    float _1241 = _1239 ? _213 : as_type<float>(_1221);
    float _1243 = -_1229;
    float _1245 = _1243 + 1.0;
    float _1247 = fma(_1223, _1235, _1209);
    float _1249 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1251 = _1237 + (-0.5);
    float _1253 = _1241 + 0.5;
    float _1255 = -_217;
    int _1257 = _1173 ? as_type<int>(_1255) : as_type<int>(_217);
    float _1259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1261 = -_1249;
    float _1263 = -_1233;
    float _1265 = fma(_1261, _1251, _1263);
    float _1267 = _1253 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1269 = _1107 * _1107;
    float _1271 = -_1245;
    float _1273 = fma(_1271, _917, _1045);
    float _1275 = -_1217;
    float _1277 = _1275 + 1.0;
    float _1279 = -_1225;
    float _1281 = _1279 + 1.0;
    float _1283 = fma(_1125, _1125, _1269);
    float _1285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1287 = fma(_1277, _949, _1091);
    bool _1289 = !_1005;
    float _1291 = _1289 ? _217 : as_type<float>(_1257);
    float _1293 = -_1227;
    float _1295 = _1293 + 1.0;
    float _1297 = fma(_1153, _1153, _1283);
    float _1299 = fma(_993, _1281, _1159);
    float _1301 = _1283;
    if (_1193)
    {
        _1301 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1303 = _1301;
    float _1305 = -_1291;
    float _1307 = _1305 + 0.5;
    float _1309 = rsqrt(_1297);
    float _1311 = -_1295;
    float _1313 = fma(_987, _1311, _1141);
    float _1315 = -_1177;
    float _1317 = _1315 + 1.0;
    float _1319 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1321 = -_1231;
    float _1323 = _1321 + 1.0;
    float _1325 = _967 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1327 = _1267 * _1259;
    float _1329 = _1319 * _1285;
    int _1331 = as_type<int>(_1303);
    if (_1193)
    {
        float _1333 = _1303 * 5.0;
        _1331 = as_type<int>(_1333);
    }
    int _1335 = _1331;
    float _1337 = -_1317;
    float _1339 = fma(_1215, _1337, _1247);
    float _1341 = fma(_1237, _1323, _1265);
    out.m_66.x = _1273;
    out.m_66.y = _1287;
    out.m_68.w = _1325;
    float _1343 = _1107 * _1309;
    float _1345 = _1125 * _1309;
    if (_1193)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4602 = as_type<float>(_1335);
        out.gl_Position.z = _4602;
    }
    out.m_70.x = _1327;
    out.m_70.y = _1329;
    out.m_72.x = _1313;
    out.m_72.y = _1299;
    out.m_72.z = _1339;
    out.m_72.w = _1341;
    if (_1193)
    {
        out.m_47.x = 0.0;
    }
    if (_1193)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1347 = -_1343;
    float _1349 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[18].w, _759);
    float _1351 = _1153 * _1309;
    float _1353 = -_1345;
    float _1355 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[18].w, _837);
    float _1357 = -_1343;
    float _1359 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1107);
    float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1363 = _1349 + _1361;
    float _1365 = -_1351;
    float _1367 = fma(_1365, (*spvDescriptorSet0.vp_c9)._m0[18].w, _847);
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1371 = _1355 + _1369;
    float _1373 = -_1345;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1125);
    float _1377 = _1363 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1379 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1381 = _1367 + _1379;
    float _1383 = _1359 * _1359;
    float _1385 = -_1351;
    float _1387 = fma(_1385, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1153);
    float _1389 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1377);
    float _1391 = fma(_1375, _1375, _1383);
    float _1393 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1389);
    float _1395 = fma(_1387, _1387, _1391);
    bool _1397 = _1393 >= 0.0;
    float _1399 = sqrt(_1395);
    float _1401 = _1377;
    float _1403 = _1351;
    float _1405 = _1363;
    float _1407 = _1355;
    float _1409 = _1367;
    if (_1397)
    {
        _1401 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1411 = _1401;
    int _1413 = as_type<int>(_1411);
    if (_1397)
    {
        out.m_47.x = 0.0;
    }
    if (_1397)
    {
        float _1415 = _1411 * 5.0;
        _1413 = as_type<int>(_1415);
    }
    int _1417 = _1413;
    float _1419 = _1309 * _1399;
    if (_1397)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4750 = as_type<float>(_1417);
        out.gl_Position.z = _4750;
    }
    if (_1397)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1421 = _549 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1423 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _1427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _1429 = _1419 * _1421;
    float _1431 = _1419 * _1423;
    float _1433 = _1425 * _1429;
    float _1435 = _1427 * _1431;
    float _1437 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1439 = _1437 * 0.5;
    bool _1441 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1443 = isnan(0.5);
    bool _1445 = _1441 || _1443;
    bool _1447 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1449 = _1445 || _1447;
    float _1451 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1453 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1455 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1457 = isnan(0.5);
    bool _1459 = _1455 || _1457;
    bool _1461 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1463 = _1459 || _1461;
    float _1465 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1451);
    float _1467 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1453);
    float _1469 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1471 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1465);
    float _1473 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1467);
    float _1475 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1469);
    float _1477 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1479 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1481 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1475);
    float _1483 = _847 + _1477;
    float _1485 = _837 + _1479;
    float _1487 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1489 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1491 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1493 = _1483 + _1491;
    float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1497 = _1485 + _1495;
    float _1499 = 1.0 / _1487;
    float _1501 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1489);
    float _1503 = _1493 * _1493;
    float _1505 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1501);
    float _1507 = fma(_1497, _1497, _1503);
    float _1509 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1511 = sqrt(_1507);
    float _1513 = _1509 + _1487;
    float _1515 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1517 = _1513 * _1499;
    float _1519 = _1517 * 0.5;
    float _1521 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1515);
    float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1525 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1523);
    float _1527 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1521);
    bool _1529 = _1511 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1531 = 1.0 / _1525;
    float _1533 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1535 = _759 + _1533;
    float _1537 = _1487;
    float _1539 = _1439;
    float _1541 = _1519;
    float _1543 = _1533;
    float _1545 = _1485;
    if (!_1529)
    {
        _1537 = _1485;
    }
    float _1547 = _1537;
    float _1549 = _1547;
    if (!_1529)
    {
        _1539 = _1483;
    }
    float _1551 = _1539;
    float _1553 = _1551;
    if (!_1529)
    {
        _1541 = _1535;
    }
    float _1555 = _1541;
    bool _1557 = !_1529;
    float _1559 = _1555;
    if (!_1557)
    {
        float _1561 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1563 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1565 = _1511 + _1563;
        float _1567 = rsqrt(_1507);
        float _1569 = _1565 * _1561;
        float _1571 = _1535 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1573 = _1569 * 0.15915493667125701904296875;
        float _1575 = _1573 * 6.283185482025146484375;
        float _1577 = cos(_1575);
        float _1579 = _1573 * 6.283185482025146484375;
        float _1581 = sin(_1579);
        float _1583 = _1577 + (-1.0);
        float _1585 = fma(_1581, _1571, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1587 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1589 = _1567 * _1585;
        float _1591 = fma(_1535, _1577, _1587);
        float _1593 = fma(_1497, _1589, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1595 = fma(_1493, _1589, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1549 = _1593;
        _1553 = _1595;
        _1559 = _1591;
        _1543 = _1589;
    }
    float _1597 = _1549;
    float _1599 = _1553;
    float _1601 = _1559;
    float _1603 = _1543;
    float _1605 = -_1345;
    float _1607 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1597);
    float _1609 = -_1351;
    float _1611 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1599);
    float _1613 = -_1343;
    float _1615 = fma(_1613, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1601);
    float _1617 = _1603;
    float _1619 = _1615;
    float _1621 = _1611;
    if (_1463)
    {
        _1617 = 1.0;
    }
    float _1623 = _1617;
    float _1625 = _1623;
    if (_1449)
    {
        _1403 = _1607;
    }
    float _1627 = _1403;
    float _1629 = _1627;
    if (!_1449)
    {
        float _1631 = _1363 * _1363;
        float _1633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1635 = -_847;
        float _1637 = _1635 + _1599;
        float _1639 = -_837;
        float _1641 = _1639 + _1597;
        float _1643 = fma(_1371, _1371, _1631);
        float _1645 = -_759;
        float _1647 = _1645 + _1601;
        float _1649 = fma(_1381, _1381, _1643);
        float _1651 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1653 = sqrt(_1649);
        float _1655 = 1.0 / _1419;
        float _1657 = precise::min(_1653, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1659 = _1657 * _1633;
        float _1661 = _1651 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1663 = _1659 * _1655;
        float _1665 = _1661 * _1663;
        float _1667 = _1637 * _1663;
        float _1669 = fma(_1641, _1665, _1355);
        float _1671 = fma(_1647, _1665, _1349);
        float _1673 = fma(_1661, _1667, _1367);
        _1405 = _1661;
        _1619 = _1671;
        _1629 = _1669;
        _1621 = _1673;
        _853 = _1667;
    }
    float _1675 = _1405;
    float _1677 = _1619;
    float _1679 = _1629;
    float _1681 = _1621;
    float _1683 = _853;
    float _1685 = _1683;
    float _1687 = _1675;
    if (_1463)
    {
        _1685 = 1.0;
    }
    float _1689 = _1685;
    float _1691 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1693 = _1531 * _1691;
    float _1695 = _1689;
    if (!_1463)
    {
        float _1697 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1699 = _1697 * 0.15915493667125701904296875;
        float _1701 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1703 = _1699 * 6.283185482025146484375;
        float _1705 = cos(_1703);
        float _1707 = _1701 * 0.15915493667125701904296875;
        float _1709 = _1699 * 6.283185482025146484375;
        float _1711 = sin(_1709);
        float _1713 = 1.0 / _1705;
        float _1715 = _1707 * 6.283185482025146484375;
        float _1717 = cos(_1715);
        float _1719 = _1711 * _1713;
        float _1721 = _1707 * 6.283185482025146484375;
        float _1723 = sin(_1721);
        float _1725 = _1717 * _1719;
        float _1727 = 1.0 / _1725;
        float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1731 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1729;
        float _1733 = 1.0 / _1731;
        float _1735 = _1723 * _1727;
        float _1737 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1739 = fma(_1693, _1735, _1737);
        float _1741 = _1739 * _1733;
        float _1743 = precise::clamp(_1741, 0.0, 1.0);
        _1687 = _1699;
        _1407 = _1707;
        _1625 = _1743;
    }
    float _1745 = _1687;
    float _1747 = _1407;
    float _1749 = _1625;
    float _1751 = _1745;
    float _1753 = _1747;
    if (!_1463)
    {
        float _1755 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1757 = _1755 * 0.15915493667125701904296875;
        float _1759 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1761 = _1757 * 6.283185482025146484375;
        float _1763 = cos(_1761);
        float _1765 = _1759 * 0.15915493667125701904296875;
        float _1767 = _1757 * 6.283185482025146484375;
        float _1769 = sin(_1767);
        float _1771 = 1.0 / _1763;
        float _1773 = _1765 * 6.283185482025146484375;
        float _1775 = cos(_1773);
        float _1777 = _1769 * _1771;
        float _1779 = _1765 * 6.283185482025146484375;
        float _1781 = sin(_1779);
        float _1783 = _1775 * _1777;
        float _1785 = 1.0 / _1783;
        float _1787 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1789 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1787;
        float _1791 = 1.0 / _1789;
        float _1793 = _1781 * _1785;
        float _1795 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1797 = fma(_1693, _1793, _1795);
        float _1799 = _1797 * _1791;
        float _1801 = precise::clamp(_1799, 0.0, 1.0);
        float _1803 = -_1801;
        float _1805 = _1803 + 1.0;
        _1751 = _1771;
        _1753 = _1783;
        _1695 = _1805;
    }
    float _1807 = _1751;
    float _1809 = _1753;
    float _1811 = _1695;
    float _1813 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1815 = _1677 + _1813;
    float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1819 = _1679 + _1817;
    float _1821 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1823 = _1681 + _1821;
    float _1825 = _1815 * _1815;
    float _1827 = fma(_1819, _1819, _1825);
    float _1829 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1831 = fma(_1823, _1823, _1827);
    float _1833 = rsqrt(_1831);
    float _1835 = sqrt(_1831);
    float _1837 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1839 = _1819 * _1837;
    float _1841 = _1823 * _1837;
    float _1843 = _1839 * _1839;
    float _1845 = _1841 * _1841;
    float _1847 = _1843 + _1845;
    float _1849 = sqrt(_1847);
    bool _1851 = _1849 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1853 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1855 = _1849 + _1853;
    float _1857 = _1807;
    float _1859 = _1855;
    float _1861 = _1815;
    float _1863 = _1839;
    if (_1851)
    {
        float _1865 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1857 = _1865;
    }
    float _1867 = _1857;
    float _1869 = _1867;
    if (_1851)
    {
        float _1871 = _1855 * _1867;
        _1859 = _1871;
    }
    float _1873 = _1859;
    if (_1851)
    {
        float _1875 = rsqrt(_1847);
        _1869 = _1875;
    }
    float _1877 = _1869;
    float _1879 = _1877;
    if (_1851)
    {
        float _1881 = _1873 * 0.15915493667125701904296875;
        _1409 = _1881;
    }
    float _1883 = _1409;
    float _1885 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1887 = _1823;
    if (_1851)
    {
        float _1889 = _1883 * 6.283185482025146484375;
        float _1891 = sin(_1889);
        _1887 = _1891;
    }
    float _1893 = _1887;
    float _1895 = precise::max(0.0, _1885);
    float _1897 = _1809;
    float _1899 = _1895;
    if (_1851)
    {
        float _1901 = _1883 * 6.283185482025146484375;
        float _1903 = cos(_1901);
        _1897 = _1903;
    }
    float _1905 = _1897;
    float _1907 = -_1837;
    float _1909 = -_1895;
    float _1911 = fma(_1815, _1907, _1909);
    float _1913 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1851)
    {
        float _1915 = _1911 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1861 = _1915;
    }
    float _1917 = _1861;
    float _1919 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1913);
    float _1921 = _1893;
    float _1923 = _1917;
    if (_1851)
    {
        float _1925 = fma(_1893, _1917, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1921 = _1925;
    }
    float _1927 = _1921;
    float _1929 = _1927;
    if (!_1851)
    {
        _1923 = _1911;
    }
    float _1931 = _1923;
    float _1933 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1919);
    float _1935 = _1931;
    if (_1851)
    {
        float _1937 = _1877 * _1927;
        _1545 = _1937;
    }
    float _1939 = _1545;
    if (!_1851)
    {
        _1929 = _1843;
    }
    float _1941 = _1929;
    float _1943 = _1933 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1945 = _1941;
    float _1947 = _1905;
    if (_1851)
    {
        float _1949 = _1905 + (-1.0);
        _1899 = _1949;
    }
    float _1951 = _1899;
    float _1953 = _1951;
    if (_1851)
    {
        float _1955 = _1839 * _1939;
        _1863 = _1955;
    }
    float _1957 = _1863;
    if (_1851)
    {
        float _1959 = _1951 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1879 = _1959;
    }
    float _1961 = _1879;
    if (!_1851)
    {
        _1953 = _1841;
    }
    float _1963 = _1953;
    float _1965 = _1963;
    if (_1851)
    {
        float _1967 = _1841 * _1939;
        _1965 = _1967;
    }
    float _1969 = _1965;
    if (_1851)
    {
        float _1971 = _1957 * _1957;
        _1945 = _1971;
    }
    float _1973 = _1945;
    if (_1851)
    {
        float _1975 = fma(_1911, _1905, _1961);
        _1935 = _1975;
    }
    float _1977 = _1935;
    if (!_1851)
    {
        _1947 = _1845;
    }
    float _1979 = _1947;
    float _1981 = _1979;
    if (_1851)
    {
        float _1983 = _1969 * _1969;
        _1981 = _1983;
    }
    float _1985 = _1981;
    float _1987 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1989 = fma(_1977, _1977, _1973);
    float _1991 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1987);
    float _1993 = _1989 + _1985;
    float _1995 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1997 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1999 = fma(_1835, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1997);
    float _2001 = precise::clamp(_1999, 0.0, 1.0);
    float _2003 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1991);
    float _2005 = rsqrt(_1993);
    float _2007 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2009 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1995);
    float _2011 = -_2001;
    float _2013 = _2011 + 1.0;
    float _2015 = _2003 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2017 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2007);
    float _2019 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2009);
    float _2021 = abs(_2013);
    float _2023 = log2(_2021);
    float _2025 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2017);
    float _2027 = _2019 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2029 = _2015 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2031 = _2025 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2033 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2035 = -_2029;
    float _2037 = fma(_2035, _1829, 1.0);
    float _2039 = _2005 * _1957;
    float _2041 = _2005 * _1977;
    float _2043 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2033);
    float _2045 = _2005 * _1969;
    float _2047 = _2039 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2049 = log2(_2037);
    float _2051 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2043);
    float _2053 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2055 = -_2047;
    float _2057 = fma(_2041, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2055);
    float _2059 = _2023 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2061 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2051);
    float _2063 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2053);
    float _2065 = -_2045;
    float _2067 = fma(_2065, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2057);
    float _2069 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2071 = 1.0 / _2061;
    float _2073 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2063);
    float _2075 = fma(_2067, -0.5, 0.5);
    float _2077 = fma(_2067, 0.5, 0.5);
    float _2079 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2069);
    float _2081 = _2041 + 1.0;
    float _2083 = _2049 * 0.693147182464599609375;
    float _2085 = exp2(_2059);
    float _2087 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2079);
    float _2089 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2091 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2087);
    float _2093 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2073);
    float _2095 = sqrt(_2075);
    float _2097 = fma(_2077, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2099 = _2091 * _2071;
    float _2101 = fma(_2077, _2097, -0.212114393711090087890625);
    float _2103 = fma(_2099, 0.5, 0.5);
    float _2105 = -_2041;
    float _2107 = fma(_2085, _2081, _2105);
    float _2109 = fma(_2077, _2101, 1.570728778839111328125);
    float _2111 = _2093 * _2071;
    float _2113 = fma(_2107, 0.5, 0.5);
    float _2115 = fma(_2111, -0.5, 0.5);
    float _2117 = _2095 * 0.636619746685028076171875;
    float _2119 = -_2109;
    float _2121 = fma(_2117, _2119, 1.0);
    float3 _5858 = float3(_2103, _2115, _2089);
    float _2123 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5858, float3(0.0), isnan(_5858)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5858, float3(0.0), isnan(_5858)), level(0.0)).x;
    float3 _5869 = float3(_2103, _2115, _2089);
    float4 _2126 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5869, float3(0.0), isnan(_5869)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5869, float3(0.0), isnan(_5869)), level(0.0)).xyzw;
    float _2128 = _2126.x;
    float _2130 = _2126.y;
    float _2132 = _2126.z;
    float _2134 = _2126.w;
    float2 _5886 = float2(_2121, _2113);
    float3 _2138 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5886, float2(0.0), isnan(_5886)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5886, float2(0.0), isnan(_5886)), level(0.0)).xyz;
    float _2140 = _2138.x;
    float _2142 = _2138.y;
    float _2144 = _2138.z;
    float _2146 = _2027 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2148 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2150 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2152 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2146);
    float _2154 = fma(_2148, _2148, 1.0);
    float _2156 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2152);
    float _2158 = _2023 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2160 = rsqrt(_2154);
    bool _2162 = _1835 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2164 = isnan(_1835);
    bool _2166 = _2162 || _2164;
    bool _2168 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2170 = _2166 || _2168;
    out.m_74.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_74.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_74.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _2172 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2156);
    float _2174 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2176 = exp2(_2158);
    out.gl_Position.x = _2091;
    out.gl_Position.y = _2093;
    out.gl_Position.z = _2172;
    out.gl_Position.w = _2061;
    float _2178 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2180 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2182 = _2148 * _2160;
    float _2184 = _2061 * 0.5;
    float _2186 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2178);
    float _2188 = _2091 + _2061;
    float _2190 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2192 = _2182 * _2190;
    float _2194 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2196 = _2182 * _2194;
    float _2198 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2200 = _2182 * _2198;
    float _2202 = fma(_2093, -0.5, _2184);
    float _2204 = -_2176;
    float _2206 = _2204 + 1.0;
    float _2208 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2192);
    float _2210 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2196);
    float _2212 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2200);
    float _2214 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2216 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2180);
    float _2218 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2174);
    float _2220 = _2172 + _2061;
    out.m_76.x = _2208;
    out.m_76.y = _2210;
    out.m_76.z = _2212;
    float _2222 = _2188 * 0.5;
    float _2224 = _2220 * 0.5;
    float _2226 = _2093;
    float _2228 = _2172;
    float _2230 = _2091;
    float _2232 = _2186;
    float _2234 = _2222;
    if (!_2170)
    {
        _2226 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2236 = _2226;
    float _2238 = _2236;
    float _2240 = _2236;
    if (!_2170)
    {
        _2228 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2242 = _2228;
    out.m_78.x = _2222;
    out.m_78.y = _2202;
    out.m_78.z = _2224;
    out.m_78.w = _2061;
    float _2244 = _2242;
    float _2246 = _2242;
    if (!_2170)
    {
        _2230 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2248 = _2230;
    float _2250 = _2186 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2252 = _2216 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2254 = _2218 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2256 = _1749 * _1811;
    float _2258 = _2256;
    float _2260 = _2248;
    float _2262 = _2248;
    if (!_2170)
    {
        _2232 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2264 = _2232;
    out.m_80.x = _2250;
    out.m_80.y = _2252;
    out.m_80.z = _2254;
    float _2266 = _2256 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2268 = _2264;
    float _2270 = _2264;
    if (!_2170)
    {
        _2234 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2272 = _2234;
    float _2274 = _2272;
    float _2276 = _2272;
    if (!_2170)
    {
        _2258 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2278 = _2258;
    float _2280 = _2214 * _2123;
    float _2282 = -_2214;
    float _2284 = _2282 + 1.0;
    float _2286 = _2134 * _2280;
    float _2288 = _2144 * _2280;
    float _2290 = _2134 * _2284;
    float _2292 = fma(_2140, _2286, _2128);
    float _2294 = fma(_2142, _2286, _2130);
    float _2296 = fma(_2134, _2288, _2132);
    out.m_82.x = _2292;
    out.m_82.y = _2294;
    out.m_82.z = _2296;
    out.m_82.w = _2290;
    bool _2298 = !_2170;
    float _2300 = _2278;
    float _2302 = _2278;
    if (!_2298)
    {
        bool _2304 = _1835 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2306 = isnan(_1835);
        bool _2308 = _2304 || _2306;
        bool _2310 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2312 = _2308 || _2310;
        if (!_2312)
        {
            float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2316 = _1835 + _2314;
            float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2320 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2318;
            float _2322 = 1.0 / _2320;
            float _2324 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2326 = _2324 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2330 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2334 = _2332 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2338 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2342 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2344 = _2316 * _2322;
            float _2346 = precise::clamp(_2344, 0.0, 1.0);
            float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2350 = _2348 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2352 = fma(_2346, _2326, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2354 = fma(_2346, _2350, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2356 = fma(_2346, _2330, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2358 = fma(_2346, _2334, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2360 = fma(_2346, _2338, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2362 = fma(_2346, _2342, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2276 = _2352;
            _2270 = _2360;
            _2240 = _2354;
            _2262 = _2358;
            _2246 = _2356;
            _2302 = _2362;
            _2364 = true;
        }
        else
        {
            bool _2366 = _1835 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2368 = isnan(_1835);
            bool _2370 = _2366 || _2368;
            bool _2372 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2374 = _2370 || _2372;
            if (!_2374)
            {
                _2238 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2376 = _2238;
            _2240 = _2376;
            if (!_2374)
            {
                _2274 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2378 = _2274;
            _2276 = _2378;
            if (!_2374)
            {
                _2244 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2380 = _2244;
            _2246 = _2380;
            if (!_2374)
            {
                _2260 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2382 = _2260;
            _2262 = _2382;
            if (!_2374)
            {
                _2268 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2384 = _2268;
            _2270 = _2384;
            if (!_2374)
            {
                _2300 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2386 = _2300;
            bool _2388 = !_2374;
            _2302 = _2386;
            if (!_2388)
            {
                bool _2390 = _1835 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2392 = isnan(_1835);
                bool _2394 = _2390 || _2392;
                bool _2396 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2398 = _2394 || _2396;
                if (!_2398)
                {
                    float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2402 = _1835 + _2400;
                    float _2404 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2406 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2404;
                    float _2408 = 1.0 / _2406;
                    float _2410 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2412 = _2410 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2422 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2430 = _2402 * _2408;
                    float _2432 = precise::clamp(_2430, 0.0, 1.0);
                    float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2438 = fma(_2432, _2412, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2440 = fma(_2432, _2436, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2442 = fma(_2432, _2416, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2444 = fma(_2432, _2420, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2446 = fma(_2432, _2424, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2448 = fma(_2432, _2428, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2276 = _2438;
                    _2270 = _2446;
                    _2240 = _2440;
                    _2262 = _2444;
                    _2246 = _2442;
                    _2302 = _2448;
                    _2364 = true;
                }
                else
                {
                    _2276 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2270 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2240 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2262 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2246 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2302 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2364 = false;
    float _2450 = _2276;
    float _2452 = _2270;
    float _2454 = _2240;
    float _2456 = _2262;
    float _2458 = _2246;
    float _2460 = _2302;
    float _2462 = _2266 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2464 = fma(_2252, -0.5, 0.5);
    float _2466 = precise::clamp(_2464, 0.0, 1.0);
    float _2468 = -_2450;
    float _2470 = _2468 + _2452;
    float _2472 = -_2454;
    float _2474 = _2472 + _2456;
    out.m_47.x = _2462;
    float _2476 = -_2458;
    float _2478 = _2476 + _2460;
    float _2480 = fma(_2466, _2470, _2450);
    float _2482 = fma(_2466, _2474, _2454);
    bool _2484 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2486 = _2480 * 0.586610972881317138671875;
    float _2488 = fma(_2466, _2478, _2458);
    out.m_84.x = 0.0;
    bool _2490 = _1749 > 0.0;
    bool _2492 = isnan(_1749);
    bool _2494 = _2490 || _2492;
    bool _2496 = isnan(0.0);
    bool _2498 = _2494 || _2496;
    float _2500 = fma(_2482, 0.298911988735198974609375, _2486);
    bool _2502 = _1811 <= 0.0;
    bool _2504 = !_2498;
    bool _2506 = _2502 || _2504;
    float _2508 = fma(_2488, 0.114477999508380889892578125, _2500);
    float _2510 = -_2508;
    float _2512 = _2482 + _2510;
    float _2514 = fma(_2512, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2508);
    bool _2516 = !_2484;
    if (!_2516)
    {
        float _2518 = -_1677;
        float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2522 = -_1679;
        float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2526 = -_1681;
        float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2530 = _2520 * _2520;
        float _2532 = fma(_2524, _2524, _2530);
        float _2534 = fma(_2528, _2528, _2532);
        float _2536 = sqrt(_2534);
        float _2538 = rsqrt(_2534);
        float _2540 = -_2536;
        float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2544 = _2542 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2546 = precise::clamp(_2544, 0.0, 1.0);
        float _2548 = _2524 * _2538;
        float _2550 = _2520 * _2538;
        float _2552 = abs(_2546);
        float _2554 = log2(_2552);
        float _2556 = _2528 * _2538;
        float _2558 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2560 = _2252 * _2550;
        float _2562 = -_2550;
        float _2564 = -_2558;
        float _2566 = fma(_2562, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2564);
        float _2568 = fma(_2250, _2548, _2560);
        float _2570 = -_2556;
        float _2572 = fma(_2570, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2566);
        float _2574 = fma(_2254, _2556, _2568);
        float _2576 = precise::clamp(_2574, 0.0, 1.0);
        float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2580 = _2572 + _2578;
        float _2582 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2584 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2586 = precise::clamp(_2584, 0.0, 1.0);
        float _2588 = exp2(_2582);
        float _2590 = _2588 * _2586;
        float _2592 = _2576 * _2590;
        float _2594 = _2592 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        out.m_84.x = _2594;
    }
    out.m_86.x = _2514;
    if (!_2506)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2596 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2596;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

